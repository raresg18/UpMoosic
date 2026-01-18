import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'dart:io'; // Import necesar pentru Platform.isAndroid etc.

class NotificationService {
  // Singleton pattern
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // 1. Inițializăm Timezone (CRITIC pentru notificări programate)
    tz.initializeTimeZones();

    // 2. Setări Android
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    // 3. Setări iOS
    const DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        debugPrint("Notificare apăsată: ${response.payload}");
      },
    );
  }

  // 🎯 Funcție pentru a cere permisiuni
  Future<bool> requestPermissions() async {
    // 🖥️ PE WINDOWS: Returnăm TRUE (mințim că e ok).
    // De ce? Ca să rămână butonul din setări "Aprins" (verde).
    // Dacă returnăm false, butonul se stinge singur și dă eroare.
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      return true;
    }

    bool? isGranted = false;

    // 🤖 Logica Android
    if (Platform.isAndroid) {
      final androidImplementation = flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

      if (androidImplementation != null) {
        isGranted = await androidImplementation.requestNotificationsPermission();
      }
    }
    // 🍎 Logica iOS (folosim else if pentru claritate)
    else if (Platform.isIOS) {
      final iosImplementation = flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>();

      if (iosImplementation != null) {
        isGranted = await iosImplementation.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
      }
    }

    return isGranted ?? false;
  }

  Future<void> scheduleDailyNotification(
      int hour, int minute, String title, String body, String channelId, String channelName) async {

    // 🛑 STOP: Pe Windows ieșim din funcție AICI.
    // Nu apelăm 'zonedSchedule' ca să nu primim erori.
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      debugPrint("🖥️ Windows detectat: Notificarea nu a fost programată (comportament corect).");
      return;
    }

    // Codul care rulează DOAR pe Android și iOS
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0, // ID unic
      title,
      body,
      _nextInstanceOfTime(hour, minute),
      NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          channelName,
          channelDescription: 'Canal pentru notificări zilnice',
          importance: Importance.max,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    debugPrint("🔔 Notificare programată zilnic la $hour:$minute");
  }

  Future<void> cancelNotifications() async {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      return;
    }

    await flutterLocalNotificationsPlugin.cancelAll();
    debugPrint("🔕 Toate notificările au fost anulate.");
  }

  tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}