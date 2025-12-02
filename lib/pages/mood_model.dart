// lib/models/mood_model.dart

import 'package:flutter/material.dart';
import 'song.dart';
import 'quest_model.dart';

// 🎯 ENUMUL NECESAR PENTRU TIPUL DE STARE
enum Mood {
  happy,
  sad,
  relaxed,
  energetic,
  motivated,
  stressed,
  nostalgic,
  focused,
}

/// Defineste un model care contine toate datele necesare pentru o stare
class MoodModel {
  final int id;
  // 🎯 NOU: Adaugă tipul Mood (enum)
  final Mood type;
  final String name;
  final String emoji;
  final Color color;

  final List<Song> playlist;

  // Utilizează 'quotesKeys'
  final List<String> quotesKeys;

  // 🎯 Utilizează 'questsKeys' (FOSTUL 'quests')
  final List<QuestModel> questsKeys;

  // Constructorul final
  const MoodModel({
    required this.id,
    required this.type, // 🎯 NOU: OBLIGATORIU
    required this.name,
    required this.emoji,
    required this.color,
    required this.playlist,
    required this.quotesKeys,
    required this.questsKeys,   // 🎯 OBLIGATORIU: Am reținut 'questsKeys'
  });
}