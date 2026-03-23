// lib/data/mood_data.dart

import 'package:flutter/material.dart';
import 'dart:collection';
import '../models/mood_model.dart';
import '../models/song.dart';
import '../models/quest_model.dart';

import 'playlist.dart';

class MoodData {

  static final List<MoodModel> allMoods = [
    MoodModel(
      id: 1,
      type: Mood.happy,
      name: 'Fericit',
      emoji: '😊',
      color: const Color(0xFFFFCC00),
      quotesKeys: [
        "quote_happy_1", "quote_happy_2", "quote_happy_3", "quote_happy_4", "quote_happy_5",
      ],
      playlist: playlistHappy,
      questsKeys: [
        QuestModel(titleKey: "quest_happy_title_1", descriptionKey: "quest_happy_desc_1", emoji: '💌'),
        QuestModel(titleKey: "quest_happy_title_2", descriptionKey: "quest_happy_desc_2", emoji: '📝'),
        QuestModel(titleKey: "quest_happy_title_3", descriptionKey: "quest_happy_desc_3", emoji: '🎨'),
        QuestModel(titleKey: "quest_happy_title_4", descriptionKey: "quest_happy_desc_4", emoji: '🤸'),
        QuestModel(titleKey: "quest_happy_title_5", descriptionKey: "quest_happy_desc_5", emoji: '😂'),
        QuestModel(titleKey: "quest_happy_title_6", descriptionKey: "quest_happy_desc_6", emoji: '🤩'),
        QuestModel(titleKey: "quest_happy_title_7", descriptionKey: "quest_happy_desc_7", emoji: '🎶'),
        QuestModel(titleKey: "quest_happy_title_8", descriptionKey: "quest_happy_desc_8", emoji: '😄'),
        QuestModel(titleKey: "quest_happy_title_9", descriptionKey: "quest_happy_desc_9", emoji: '✍️'),
        QuestModel(titleKey: "quest_happy_title_10", descriptionKey: "quest_happy_desc_10", emoji: '🙌'),
      ],
    ),
    MoodModel(
      id: 2,
      type: Mood.sad,
      name: 'Trist',
      emoji: '😢',
      color: const Color(0xFF0077B6),
      quotesKeys: [
        "quote_sad_1", "quote_sad_2", "quote_sad_3", "quote_sad_4", "quote_sad_5",
      ],
      playlist: playlistSad,
      questsKeys: [
        QuestModel(titleKey: "quest_sad_title_1", descriptionKey: "quest_sad_desc_1", emoji: '🎧'),
        QuestModel(titleKey: "quest_sad_title_2", descriptionKey: "quest_sad_desc_2", emoji: '📞'),
        QuestModel(titleKey: "quest_sad_title_3", descriptionKey: "quest_sad_desc_3", emoji: '💧'),
        QuestModel(titleKey: "quest_sad_title_4", descriptionKey: "quest_sad_desc_4", emoji: '🐈'),
        QuestModel(titleKey: "quest_sad_title_5", descriptionKey: "quest_sad_desc_5", emoji: '🌱'),
        QuestModel(titleKey: "quest_sad_title_6", descriptionKey: "quest_sad_desc_6", emoji: '⏱️'),
        QuestModel(titleKey: "quest_sad_title_7", descriptionKey: "quest_sad_desc_7", emoji: '🙏'),
        QuestModel(titleKey: "quest_sad_title_8", descriptionKey: "quest_sad_desc_8", emoji: '🧹'),
        QuestModel(titleKey: "quest_sad_title_9", descriptionKey: "quest_sad_desc_9", emoji: '🤗'),
        QuestModel(titleKey: "quest_sad_title_10", descriptionKey: "quest_sad_desc_10", emoji: '🎙️'),
        QuestModel(titleKey: "quest_sad_title_11", descriptionKey: "quest_sad_desc_11", emoji: '🚶'),
        QuestModel(titleKey: "quest_sad_title_12", descriptionKey: "quest_sad_desc_12", emoji: '✍️'),
        QuestModel(titleKey: "quest_sad_title_13", descriptionKey: "quest_sad_desc_13", emoji: '📴'),
        QuestModel(titleKey: "quest_sad_title_14", descriptionKey: "quest_sad_desc_14", emoji: '🍎'),
        QuestModel(titleKey: "quest_sad_title_15", descriptionKey: "quest_sad_desc_15", emoji: '🫂'),
      ],
    ),
    MoodModel(
      id: 3,
      type: Mood.relaxed,
      name: 'Relaxat',
      emoji: '🧘‍♂️',
      color: const Color(0xFF38B000),
      quotesKeys: [
        "quote_relaxed_1", "quote_relaxed_2", "quote_relaxed_3", "quote_relaxed_4", "quote_relaxed_5",
      ],
      playlist: playlistRelaxed,
      questsKeys: [
        QuestModel(titleKey: "quest_relaxed_title_1", descriptionKey: "quest_relaxed_desc_1", emoji: '💧'),
        QuestModel(titleKey: "quest_relaxed_title_2", descriptionKey: "quest_relaxed_desc_2", emoji: '🧘'),
        QuestModel(titleKey: "quest_relaxed_title_3", descriptionKey: "quest_relaxed_desc_3", emoji: '☁️'),
        QuestModel(titleKey: "quest_relaxed_title_4", descriptionKey: "quest_relaxed_desc_4", emoji: '📚'),
        QuestModel(titleKey: "quest_relaxed_title_5", descriptionKey: "quest_relaxed_desc_5", emoji: '🕯️'),
        QuestModel(titleKey: "quest_relaxed_title_6", descriptionKey: "quest_relaxed_desc_6", emoji: '📵'),
        QuestModel(titleKey: "quest_relaxed_title_7", descriptionKey: "quest_relaxed_desc_7", emoji: '🌧️'),
        QuestModel(titleKey: "quest_relaxed_title_8", descriptionKey: "quest_relaxed_desc_8", emoji: '💆'),
        QuestModel(titleKey: "quest_relaxed_title_9", descriptionKey: "quest_relaxed_desc_9", emoji: '🔇'),
        QuestModel(titleKey: "quest_relaxed_title_10", descriptionKey: "quest_relaxed_desc_10", emoji: '☕'),
        QuestModel(titleKey: "quest_relaxed_title_11", descriptionKey: "quest_relaxed_desc_11", emoji: '🛏️'),
        QuestModel(titleKey: "quest_relaxed_title_12", descriptionKey: "quest_relaxed_desc_12", emoji: '🖼️'),
        QuestModel(titleKey: "quest_relaxed_title_13", descriptionKey: "quest_relaxed_desc_13", emoji: '🤸'),
        QuestModel(titleKey: "quest_relaxed_title_14", descriptionKey: "quest_relaxed_desc_14", emoji: '🏝️'),
        QuestModel(titleKey: "quest_relaxed_title_15", descriptionKey: "quest_relaxed_desc_15", emoji: '😊'),
      ],
    ),
    MoodModel(
      id: 4,
      type: Mood.energetic,
      name: 'Energic',
      emoji: '🚀',
      color: const Color(0xFFFF5A00),
      quotesKeys: [
        "quote_energetic_1", "quote_energetic_2", "quote_energetic_3", "quote_energetic_4", "quote_energetic_5",
      ],
      playlist: playlistEnergetic,
      questsKeys: [
        QuestModel(titleKey: "quest_energetic_title_1", descriptionKey: "quest_energetic_desc_1", emoji: '🏋️'),
        QuestModel(titleKey: "quest_energetic_title_2", descriptionKey: "quest_energetic_desc_2", emoji: '🧠'),
        QuestModel(titleKey: "quest_energetic_title_3", descriptionKey: "quest_energetic_desc_3", emoji: '💃'),
        QuestModel(titleKey: "quest_energetic_title_4", descriptionKey: "quest_energetic_desc_4", emoji: '🎤'),
        QuestModel(titleKey: "quest_energetic_title_5", descriptionKey: "quest_energetic_desc_5", emoji: '🏃'),
        QuestModel(titleKey: "quest_energetic_title_6", descriptionKey: "quest_energetic_desc_6", emoji: '💡'),
        QuestModel(titleKey: "quest_energetic_title_7", descriptionKey: "quest_energetic_desc_7", emoji: '🔨'),
        QuestModel(titleKey: "quest_energetic_title_8", descriptionKey: "quest_energetic_desc_8", emoji: '📧'),
        QuestModel(titleKey: "quest_energetic_title_9", descriptionKey: "quest_energetic_desc_9", emoji: '📍'),
        QuestModel(titleKey: "quest_energetic_title_10", descriptionKey: "quest_energetic_desc_10", emoji: '🍳'),
        QuestModel(titleKey: "quest_energetic_title_11", descriptionKey: "quest_energetic_desc_11", emoji: '📝'),
        QuestModel(titleKey: "quest_energetic_title_12", descriptionKey: "quest_energetic_desc_12", emoji: '⏱️'),
        QuestModel(titleKey: "quest_energetic_title_13", descriptionKey: "quest_energetic_desc_13", emoji: '📞'),
        QuestModel(titleKey: "quest_energetic_title_14", descriptionKey: "quest_energetic_desc_14", emoji: '📂'),
        QuestModel(titleKey: "quest_energetic_title_15", descriptionKey: "quest_energetic_desc_15", emoji: '🎨'),
      ],
    ),
    MoodModel(
      id: 5,
      type: Mood.motivated,
      name: 'Motivat',
      emoji: '🎯',
      color: const Color(0xFFCC0000),
      quotesKeys: [
        "quote_motivated_1", "quote_motivated_2", "quote_motivated_3", "quote_motivated_4", "quote_motivated_5",
      ],
      playlist: playlistMotivated,
      questsKeys: [
        QuestModel(titleKey: "quest_motivated_title_1", descriptionKey: "quest_motivated_desc_1", emoji: '⏱️'),
        QuestModel(titleKey: "quest_motivated_title_2", descriptionKey: "quest_motivated_desc_2", emoji: '🧹'),
        QuestModel(titleKey: "quest_motivated_title_3", descriptionKey: "quest_motivated_desc_3", emoji: '💡'),
        QuestModel(titleKey: "quest_motivated_title_4", descriptionKey: "quest_motivated_desc_4", emoji: '👤'),
        QuestModel(titleKey: "quest_motivated_title_5", descriptionKey: "quest_motivated_desc_5", emoji: '📅'),
        QuestModel(titleKey: "quest_motivated_title_6", descriptionKey: "quest_motivated_desc_6", emoji: '🔮'),
        QuestModel(titleKey: "quest_motivated_title_7", descriptionKey: "quest_motivated_desc_7", emoji: '💬'),
        QuestModel(titleKey: "quest_motivated_title_8", descriptionKey: "quest_motivated_desc_8", emoji: '📝'),
        QuestModel(titleKey: "quest_motivated_title_9", descriptionKey: "quest_motivated_desc_9", emoji: '📖'),
        QuestModel(titleKey: "quest_motivated_title_10", descriptionKey: "quest_motivated_desc_10", emoji: '💪'),
        QuestModel(titleKey: "quest_motivated_title_11", descriptionKey: "quest_motivated_desc_11", emoji: '🖼️'),
        QuestModel(titleKey: "quest_motivated_title_12", descriptionKey: "quest_motivated_desc_12", emoji: '❌'),
        QuestModel(titleKey: "quest_motivated_title_13", descriptionKey: "quest_motivated_desc_13", emoji: '🤝'),
        QuestModel(titleKey: "quest_motivated_title_14", descriptionKey: "quest_motivated_desc_14", emoji: '🚫'),
        QuestModel(titleKey: "quest_motivated_title_15", descriptionKey: "quest_motivated_desc_15", emoji: '👣'),
      ],
    ),
    MoodModel(
      id: 6,
      type: Mood.stressed,
      name: 'Stresat',
      emoji: '😠',
      color: const Color(0xFF6A0DAD),
      quotesKeys: [
        "quote_stressed_1", "quote_stressed_2", "quote_stressed_3", "quote_stressed_4", "quote_stressed_5",
      ],
      playlist: playlistStressed,
      questsKeys: [
        QuestModel(titleKey: "quest_stressed_title_1", descriptionKey: "quest_stressed_desc_1", emoji: '🧘'),
        QuestModel(titleKey: "quest_stressed_title_2", descriptionKey: "quest_stressed_desc_2", emoji: '✍️'),
        QuestModel(titleKey: "quest_stressed_title_3", descriptionKey: "quest_stressed_desc_3", emoji: '🚶'),
        QuestModel(titleKey: "quest_stressed_title_4", descriptionKey: "quest_stressed_desc_4", emoji: '🚿'),
        QuestModel(titleKey: "quest_stressed_title_5", descriptionKey: "quest_stressed_desc_5", emoji: '☕'),
        QuestModel(titleKey: "quest_stressed_title_6", descriptionKey: "quest_stressed_desc_6", emoji: '😮‍💨'),
        QuestModel(titleKey: "quest_stressed_title_7", descriptionKey: "quest_stressed_desc_7", emoji: '🔪'),
        QuestModel(titleKey: "quest_stressed_title_8", descriptionKey: "quest_stressed_desc_8", emoji: '🦶'),
        QuestModel(titleKey: "quest_stressed_title_9", descriptionKey: "quest_stressed_desc_9", emoji: '😌'),
        QuestModel(titleKey: "quest_stressed_title_10", descriptionKey: "quest_stressed_desc_10", emoji: '🔊'),
        QuestModel(titleKey: "quest_stressed_title_11", descriptionKey: "quest_stressed_desc_11", emoji: '🗑️'),
        QuestModel(titleKey: "quest_stressed_title_12", descriptionKey: "quest_stressed_desc_12", emoji: '🧊'),
        QuestModel(titleKey: "quest_stressed_title_13", descriptionKey: "quest_stressed_desc_13", emoji: '🌙'),
        QuestModel(titleKey: "quest_stressed_title_14", descriptionKey: "quest_stressed_desc_14", emoji: '⏸️'),
        QuestModel(titleKey: "quest_stressed_title_15", descriptionKey: "quest_stressed_desc_15", emoji: '🙋'),
      ],
    ),
    MoodModel(
      id: 7,
      type: Mood.nostalgic,
      name: 'Nostalgic',
      emoji: '💭',
      color: const Color(0xFFAA8855),
      quotesKeys: [
        "quote_nostalgic_1", "quote_nostalgic_2", "quote_nostalgic_3", "quote_nostalgic_4", "quote_nostalgic_5",
      ],
      playlist: playlistNostalgic,
      questsKeys: [
        QuestModel(titleKey: "quest_nostalgic_title_1", descriptionKey: "quest_nostalgic_desc_1", emoji: '📸'),
        QuestModel(titleKey: "quest_nostalgic_title_2", descriptionKey: "quest_nostalgic_desc_2", emoji: '✉️'),
        QuestModel(titleKey: "quest_nostalgic_title_3", descriptionKey: "quest_nostalgic_desc_3", emoji: '👵'),
        QuestModel(titleKey: "quest_nostalgic_title_4", descriptionKey: "quest_nostalgic_desc_4", emoji: '🍽️'),
        QuestModel(titleKey: "quest_nostalgic_title_5", descriptionKey: "quest_nostalgic_desc_5", emoji: '🎬'),
        QuestModel(titleKey: "quest_nostalgic_title_6", descriptionKey: "quest_nostalgic_desc_6", emoji: '🕰️'),
        QuestModel(titleKey: "quest_nostalgic_title_7", descriptionKey: "quest_nostalgic_desc_7", emoji: '😂'),
        QuestModel(titleKey: "quest_nostalgic_title_8", descriptionKey: "quest_nostalgic_desc_8", emoji: '💿'),
        QuestModel(titleKey: "quest_nostalgic_title_9", descriptionKey: "quest_nostalgic_desc_9", emoji: '🏡'),
        QuestModel(titleKey: "quest_nostalgic_title_10", descriptionKey: "quest_nostalgic_desc_10", emoji: '🎮'),
        QuestModel(titleKey: "quest_nostalgic_title_11", descriptionKey: "quest_nostalgic_desc_11", emoji: '🖼️'),
        QuestModel(titleKey: "quest_nostalgic_title_12", descriptionKey: "quest_nostalgic_desc_12", emoji: '📦'),
        QuestModel(titleKey: "quest_nostalgic_title_13", descriptionKey: "quest_nostalgic_desc_13", emoji: '👪'),
        QuestModel(titleKey: "quest_nostalgic_title_14", descriptionKey: "quest_nostalgic_desc_14", emoji: '👣'),
        QuestModel(titleKey: "quest_nostalgic_title_15", descriptionKey: "quest_nostalgic_desc_15", emoji: '🧠'),
      ],
    ),
    MoodModel(
      id: 8,
      type: Mood.focused,
      name: 'Focusat',
      emoji: '🔥',
      color: const Color(0xFF00ADB5),
      quotesKeys: [
        'quote_focused_1', "quote_focused_2", "quote_focused_3", "quote_focused_4", "quote_focused_5",
      ],
      playlist: playlistFocused,
      questsKeys: [
        QuestModel(titleKey: "quest_focused_title_1", descriptionKey: "quest_focused_desc_1", emoji: '🍅'),
        QuestModel(titleKey: "quest_focused_title_2", descriptionKey: "quest_focused_desc_2", emoji: '🔕'),
        QuestModel(titleKey: "quest_focused_title_3", descriptionKey: "quest_focused_desc_3", emoji: '💧'),
        QuestModel(titleKey: "quest_focused_title_4", descriptionKey: "quest_focused_desc_4", emoji: '🎯'),
        QuestModel(titleKey: "quest_focused_title_5", descriptionKey: "quest_focused_desc_5", emoji: '🌱'),
        QuestModel(titleKey: "quest_focused_title_6", descriptionKey: "quest_focused_desc_6", emoji: '🖥️'),
        QuestModel(titleKey: "quest_focused_title_7", descriptionKey: "quest_focused_desc_7", emoji: '💻'),
        QuestModel(titleKey: "quest_focused_title_8", descriptionKey: "quest_focused_desc_8", emoji: '🎶'),
        QuestModel(titleKey: "quest_focused_title_9", descriptionKey: "quest_focused_desc_9", emoji: '🧠'),
        QuestModel(titleKey: "quest_focused_title_10", descriptionKey: "quest_focused_desc_10", emoji: '🚀'),
        QuestModel(titleKey: "quest_focused_title_11", descriptionKey: "quest_focused_desc_11", emoji: '💡'),
        QuestModel(titleKey: "quest_focused_title_12", descriptionKey: "quest_focused_desc_12", emoji: '🏆'),
        QuestModel(titleKey: "quest_focused_title_13", descriptionKey: "quest_focused_desc_13", emoji: '🤸'),
        QuestModel(titleKey: "quest_focused_title_14", descriptionKey: "quest_focused_desc_14", emoji: '🤔'),
        QuestModel(titleKey: "quest_focused_title_15", descriptionKey: "quest_focused_desc_15", emoji: '✈️'),
      ],
    ),
  ];

  static final Map<int, MoodModel> _moodMapById = { for (var mood in allMoods) mood.id : mood };

  static final UnmodifiableListView<MoodModel> allMoodsListView = UnmodifiableListView(allMoods);

  static MoodModel getMoodModelById(int id) {
    try {
      return _moodMapById[id] ?? allMoods.firstWhere((mood) => mood.id == 1);
    } catch (e) {
      return allMoods.firstWhere((m) => m.name == 'Fericit');
    }
  }

  static MoodModel getMoodModelByName(String moodName) {
    return allMoodsListView.firstWhere(
          (mood) => mood.name == moodName,
      orElse: () => allMoodsListView.firstWhere((m) => m.name == 'Fericit'),
    );
  }
}