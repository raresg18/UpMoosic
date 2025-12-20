// mood_tracker_service.dart

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

import '../models/mood_entry.dart';      // Asigură-te că acest fișier există
import '../data/mood_data.dart';       // Asigură-te că acest fișier există și are culorile
import '../models/mood_model.dart';      // Asigură-te că acest fișier există

class MoodTrackerService {
  static const String _key = 'dailyMoods';

  static const String _lastJournalMoodKey = 'lastSelectedJournalMoodName';

// Salvează numele stării alese în Jurnal
  Future<void> saveLastSelectedJournalMood(String moodName) async {
    final prefs = await SharedPreferences.getInstance();
    // Asigură-te că folosești setString și cheia corectă.
    await prefs.setString(_lastJournalMoodKey, moodName);
  }

// Citește numele stării alese în Jurnal
  Future<String?> getLastSelectedJournalMood() async {
    final prefs = await SharedPreferences.getInstance();
    // Asigură-te că folosești getString și cheia corectă.
    return prefs.getString(_lastJournalMoodKey);
  }

  // O funcție ajutătoare pentru a obține toate intrările
  Future<List<MoodEntry>> _getAllMoodEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_key) ?? [];

    return jsonList.map((jsonString) {
      return MoodEntry.fromJson(jsonDecode(jsonString));
    }).toList();
  }

  /// 1. Salvează starea zilnică. Suprascrie starea din aceeași zi.
  Future<void> saveDailyMood(String moodName, {String? note}) async {
    final prefs = await SharedPreferences.getInstance();

    List<MoodEntry> allEntries = await _getAllMoodEntries();

    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);

    // Eliminăm înregistrarea veche de azi
    allEntries.removeWhere((entry) {
      final entryDateKey = DateTime(entry.date.year, entry.date.month, entry.date.day);
      return entryDateKey.isAtSameMomentAs(todayKey);
    });

    // Adăugăm noua înregistrare, inclusiv notița
    final newEntry = MoodEntry(moodName: moodName, date: today, note: note); // NOU
    allEntries.add(newEntry);

    // ... (restul logicii de salvare rămâne la fel)
    final jsonList = allEntries.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_key, jsonList);
  }

  /// 2. Returnează stările ca Mapă (DateTime -> MoodName) pentru Calendar.
  Future<Map<DateTime, String>> getMoodMap() async {
    final allEntries = await _getAllMoodEntries();
    final Map<DateTime, String> moodMap = {};

    for (var entry in allEntries) {
      // Normalizăm data (an-lună-zi) pentru a se potrivi cu logica TableCalendar
      final normalizedDate = DateTime(entry.date.year, entry.date.month, entry.date.day);
      moodMap[normalizedDate] = entry.moodName;
    }
    return moodMap;
  }

  /// 3. Verifică dacă starea de azi a fost deja înregistrată.
  Future<bool> hasTrackedToday() async {
    final allEntries = await _getAllMoodEntries();
    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);

    return allEntries.any((entry) {
      final entryDateKey = DateTime(entry.date.year, entry.date.month, entry.date.day);
      return entryDateKey.isAtSameMomentAs(todayKey);
    });
  }

  /// 4. Calculează starea dominantă și culoarea hibridă pentru săptămâna curentă (Ultimele 7 zile).
  Future<Map<String, dynamic>> getWeeklyAnalysis() async {
    final allEntries = await _getAllMoodEntries();
    final now = DateTime.now();

    // Definim intervalul: Ultimele 7 zile (inclusiv azi)
    final oneWeekAgo = now.subtract(const Duration(days: 7));

    final weeklyEntries = allEntries.where((entry) =>
        entry.date.isAfter(oneWeekAgo)
    ).toList();

    if (weeklyEntries.isEmpty) {
      return {'dominantMood': 'Niciun mood înregistrat', 'hybridColor': Colors.grey.shade400, 'entriesCount': 0};
    }

    // A. Numărăm frecvența fiecărui mood
    final Map<String, int> moodCounts = {};
    for (var entry in weeklyEntries) {
      moodCounts[entry.moodName] = (moodCounts[entry.moodName] ?? 0) + 1;
    }

    // B. Calculăm Culoarea Hibridă (Amestec RGB)
    int totalRed = 0;
    int totalGreen = 0;
    int totalBlue = 0;

    for (var entry in weeklyEntries) {
      // Căutăm MoodModel-ul pentru a obține culoarea
      final moodModel = MoodData.allMoodsListView.firstWhere(
            (m) => m.name == entry.moodName,
        // Fallback la 'Fericit' dacă numele nu e găsit
        orElse: () => MoodData.allMoodsListView.firstWhere((m) => m.name == 'Fericit'),
      );

      final color = moodModel.color;
      totalRed += color.red;
      totalGreen += color.green;
      totalBlue += color.blue;
    }

    // Calculăm media fiecărei componente RGB
    final int count = weeklyEntries.length;
    final int avgRed = totalRed ~/ count;
    final int avgGreen = totalGreen ~/ count;
    final int avgBlue = totalBlue ~/ count;

    // Creăm culoarea finală hibridă
    final hybridColor = Color.fromARGB(255, avgRed, avgGreen, avgBlue);

    // C. Determinăm Mood-ul Dominant (cel mai frecvent)
    final dominantMoodName = moodCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;


    return {
      'dominantMood': dominantMoodName,
      'hybridColor': hybridColor,
      'entriesCount': count,
    };



  }



}
