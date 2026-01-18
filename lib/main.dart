import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'providers/language_provider.dart';
import 'providers/quest_state.dart';
import 'pages/home_page.dart';
import 'l10n/app_localizations.dart';
import 'models/mood_entry.dart';
import 'services/data_service.dart';
import 'services/notification_service.dart'; // 🔔 IMPORT NOU

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Inițializare Hive
  await Hive.initFlutter();
  Hive.registerAdapter(MoodEntryAdapter());

  // 2. Deschidem cutiile de date
  await Hive.openBox<MoodEntry>('journal_box');
  await Hive.openBox('settings'); // ⚠️ OBLIGATORIU pentru a salva ora notificării

  // 3. Inițializăm Sistemul de Notificări (Cere permisiuni, setează timezones)
  await NotificationService().init();

  // 4. Încărcăm datele vechi (JSON)
  await DataService.load(const Locale('ro'));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => QuestState()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UpMoosic',
      locale: provider.locale,
      supportedLocales: const [
        Locale('ro', ''),
        Locale('en', ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const HomePage(),
    );
  }
}