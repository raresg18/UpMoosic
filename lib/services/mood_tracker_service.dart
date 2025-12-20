import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/mood_entry.dart';
import '../data/mood_data.dart';

class MoodTrackerService {
  static const String _boxName = 'journal_box';

  Box<MoodEntry> get _box => Hive.box<MoodEntry>(_boxName);

  Future<void> saveDailyMood(MoodEntry entry) async {
    final String key = _getDateKey(entry.date);
    await _box.put(key, entry);
  }



  MoodEntry? getDailyMood(DateTime date) {
    final String key = _getDateKey(date);

    return _box.get(key);
  }

  List<MoodEntry> getAllMoodEntries() {
    return _box.values.toList();
  }

  bool hasTrackedToday() {
    final todayKey = _getDateKey(DateTime.now());
    return _box.containsKey(todayKey);
  }

  Future<void> deleteMood(DateTime date) async {
    final String key = _getDateKey(date);
    await _box.delete(key);
  }
  String _getDateKey(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }


  Future<Map<String, dynamic>> getWeeklyAnalysis() async {
    final now = DateTime.now();
    final allEntries = _box.values.toList();

    final weeklyEntries = allEntries.where((entry) {
      final difference = now.difference(entry.date).inDays;
      return difference >= 0 && difference < 7;
    }).toList();

    if (weeklyEntries.isEmpty) {
      return {};
    }

    final Map<String, int> moodCounts = {};
    for (var entry in weeklyEntries) {
      moodCounts[entry.moodName] = (moodCounts[entry.moodName] ?? 0) + 1;
    }

    String dominantMood = '';
    int maxCount = 0;
    moodCounts.forEach((mood, count) {
      if (count > maxCount) {
        maxCount = count;
        dominantMood = mood;
      }
    });

    int totalRed = 0;
    int totalGreen = 0;
    int totalBlue = 0;

    for (var entry in weeklyEntries) {
      final moodModel = MoodData.allMoodsListView.firstWhere(
            (m) => m.name == entry.moodName,
        orElse: () => MoodData.allMoodsListView[0],
      );

      final color = moodModel.color;
      totalRed += color.red;
      totalGreen += color.green;
      totalBlue += color.blue;
    }

    final int count = weeklyEntries.length;
    if (count == 0) return {};

    final avgRed = totalRed ~/ count;
    final avgGreen = totalGreen ~/ count;
    final avgBlue = totalBlue ~/ count;

    final hybridColor = Color.fromARGB(255, avgRed, avgGreen, avgBlue);

    return {
      'dominantMood': dominantMood,
      'hybridColor': hybridColor,
      'entriesCount': count,
    };
  }
}