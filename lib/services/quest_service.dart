// lib/services/quest_service.dart

import 'dart:convert';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/quest_model.dart';
import '../data/mood_data.dart';

class QuestService {
  static const String _storageKey = 'current_session_quest';

  static Future<void> resetQuest() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }

  static Future<QuestModel> getOrCreateSessionQuest(int moodId) async {
    final prefs = await SharedPreferences.getInstance();

    final moodModel = MoodData.getMoodModelById(moodId);
    final availableQuests = moodModel.questsKeys;

    final storedDataString = prefs.getString(_storageKey);

    if (storedDataString != null) {
      final storedData = jsonDecode(storedDataString);

      if (storedData['moodId'] == moodId) {
        final questIndex = storedData['questIndex'] as int;

        if (questIndex >= 0 && questIndex < availableQuests.length) {
          return availableQuests[questIndex];
        }
      }
    }

    final randomIndex = Random().nextInt(availableQuests.length);
    final newQuest = availableQuests[randomIndex];

    final newQuestData = {
      'moodId': moodId,
      'questIndex': randomIndex,
    };
    await prefs.setString(_storageKey, jsonEncode(newQuestData));

    return newQuest;
  }
}