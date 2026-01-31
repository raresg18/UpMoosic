// lib/models/mood_model.dart

import 'package:flutter/material.dart';
import 'song.dart';
import 'quest_model.dart';

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

class MoodModel {
  final int id;
  final Mood type;
  final String name;
  final String emoji;
  final Color color;

  final List<Song> playlist;

  final List<String> quotesKeys;

  final List<QuestModel> questsKeys;

  const MoodModel({
    required this.id,
    required this.type,
    required this.name,
    required this.emoji,
    required this.color,
    required this.playlist,
    required this.quotesKeys,
    required this.questsKeys,
  });
}