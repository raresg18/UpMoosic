// lib/models/mood_model.dart (sau unde ai salvat acest fișier)

import 'package:flutter/material.dart';
import 'song.dart';
import 'quest_model.dart'; // Folosește acum titleKey și descriptionKey

/// Defineste un model care contine toate datele necesare pentru o stare
class MoodModel {
  final int id;
  final String name; // Numele fix (Fericit, Trist) - folosit pentru mapare L10N
  final String emoji;
  final Color color;

  final List<Song> playlist;

  // 🎯 SCHIMBARE CRUCIALĂ: Stochează cheile de localizare (ex: "quote_happy_1")
  final List<String> quotesKeys; // Schimbat din 'quotes'

  // 🎯 SCHIMBARE CRUCIALĂ: Stochează modelele de misiuni care folosesc deja chei
  final List<QuestModel> questsKeys; // Schimbat din 'quests'

  const MoodModel({
    required this.id,
    required this.name,
    required this.emoji,
    required this.color,
    required this.playlist,
    required this.quotesKeys,   // NOU: Folosește 'quotesKeys'
    required this.questsKeys,   // NOU: Folosește 'questsKeys'
  });
}