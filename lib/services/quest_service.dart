// lib/services/quest_service.dart

import 'dart:convert';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/quest_model.dart';
import '../data/mood_data.dart';

class QuestService {
  static const String _storageKey = 'current_session_quest';

  // 🎯 Funcția de resetare
  static Future<void> resetQuest() async {
    final prefs = await SharedPreferences.getInstance();
    // Șterge cheia de stocare, forțând generarea unui Quest nou la următoarea apelare
    await prefs.remove(_storageKey);
  }



  // Logica principală: obține quest-ul stocat SAU generează unul nou
  static Future<QuestModel> getOrCreateSessionQuest(int moodId) async {
    final prefs = await SharedPreferences.getInstance();

    final moodModel = MoodData.getMoodModelById(moodId);
    final availableQuests = moodModel.questsKeys;

    final storedDataString = prefs.getString(_storageKey);

    if (storedDataString != null) {
      final storedData = jsonDecode(storedDataString);

      // Verifică dacă quest-ul stocat este pentru aceeași stare de spirit
      if (storedData['moodId'] == moodId) {
        final questIndex = storedData['questIndex'] as int;

        if (questIndex >= 0 && questIndex < availableQuests.length) {
          return availableQuests[questIndex]; // Returnează Quest-ul stocat (persistență în pagină)
        }
      }
    }

    // Generează și salvează noul quest
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