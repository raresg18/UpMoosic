// lib/data/mood_data.dart

import 'package:flutter/material.dart';
import '../models/mood_model.dart';
import 'dart:collection';
import '../models/song.dart';
import '../models/quest_model.dart';

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
      playlist: [
        Song(title: 'Happy', artist: 'Pharrell Williams', youtubeUrl: 'https://www.youtube.com/watch?v=ZbZSe6N_BXs', spotifyUrl: 'https://open.spotify.com/track/6tFJ9IzPbaMbbFez22jV8C'),
        Song(title: 'Lovely Day', artist: 'Bill Withers', youtubeUrl: 'https://www.youtube.com/watch?v=bEeaS6fuUoA', spotifyUrl: 'https://open.spotify.com/playlist/37i9dQZF1DX0BxnsTjXn7v?si=f56e9c91f17349910'),
        Song(title: 'Walking on Sunshine', artist: 'Katrina & The Waves', youtubeUrl: 'https://www.youtube.com/watch?v=iPUmE-tne5U', spotifyUrl: 'http://googleusercontent.com/spotify.com/happy/3'),
        Song(title: 'Good Vibrations', artist: 'The Beach Boys', youtubeUrl: 'https://www.youtube.com/watch?v=apBWI6xrbLY', spotifyUrl: 'http://googleusercontent.com/spotify.com/happy/4'),
        Song(title: 'Don\'t Stop Me Now', artist: 'Queen', youtubeUrl: 'https://www.youtube.com/watch?v=HgzGwKwLmgM', spotifyUrl: 'http://googleusercontent.com/spotify.com/happy/5'),
      ],
      questsKeys: [
        QuestModel(titleKey: "quest_happy_title_1", descriptionKey: "quest_happy_desc_1", emoji: '💌'),
        QuestModel(titleKey: "quest_happy_title_2", descriptionKey: "quest_happy_desc_2", emoji: '📝'),
        QuestModel(titleKey: "quest_happy_title_3", descriptionKey: "quest_happy_desc_3", emoji: '🎨'),
        QuestModel(titleKey: "quest_happy_title_4", descriptionKey: "quest_happy_desc_4", emoji: '🤸'),
        QuestModel(titleKey: "quest_happy_title_5", descriptionKey: "quest_happy_desc_5", emoji: '😂'),
        QuestModel(titleKey: "quest_happy_title_6", descriptionKey: "quest_happy_desc_6", emoji: '🤩'), // 🥳 sau 🎉
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
      playlist: [
        Song(title: 'Someone Like You', artist: 'Adele', youtubeUrl: 'https://www.youtube.com/watch?v=hLQl3WQQoQ0', spotifyUrl: 'https://open.spotify.com/track/1vAe6IFwpIf4N6gkrGmvYh'),
        Song(title: 'Fix You', artist: 'Coldplay', youtubeUrl: 'https://www.youtube.com/watch?v=k4V3Mo61fJM', spotifyUrl: 'https://open.spotify.com/track/0kRgsFh5yHfKpDg7R52Ogw'),
        Song(title: 'Hurt', artist: 'Johnny Cash', youtubeUrl: 'https://www.youtube.com/watch?v=8AHCfZTRGiI&list=RD8AHCfZTRGiI&start_radio=1', spotifyUrl: 'http://googleusercontent.com/spotify.com/sad/3'),
        Song(title: 'Yesterday', artist: 'The Beatles', youtubeUrl: 'https://www.youtube.com/watch?v=fCV9oqtwyVA', spotifyUrl: 'http://googleusercontent.com/spotify.com/sad/4'),
        Song(title: 'Everybody Hurts', artist: 'R.E.M.', youtubeUrl: 'https://www.youtube.com/watch?v=5rOiW_xY-kc', spotifyUrl: 'http://googleusercontent.com/spotify.com/sad/5'),
      ],
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
      playlist: [
        Song(title: 'Weightless', artist: 'Marconi Union', youtubeUrl: 'https://www.youtube.com/watch?v=qYnA9wWFHLI', spotifyUrl: 'LINK_SP_RELAX_1'),
        Song(title: 'A Head Full of Dreams', artist: 'Coldplay', youtubeUrl: 'https://www.youtube.com/watch?v=vGZMvV9KBp8', spotifyUrl: 'LINK_SP_RELAX_2'),
        Song(title: 'Clair de Lune', artist: 'Claude Debussy', youtubeUrl: 'https://www.youtube.com/watch?v=WNcsUNKlAKw', spotifyUrl: 'http://googleusercontent.com/spotify.com/relaxed/3'),
        Song(title: 'Orinoco Flow', artist: 'Enya', youtubeUrl: 'https://www.youtube.com/watch?v=LTrk4X9ACtw', spotifyUrl: 'http://googleusercontent.com/spotify.com/relaxed/4'),
        Song(title: 'River Flows in You', artist: 'Yiruma', youtubeUrl: 'https://www.youtube.com/watch?v=7maJOI3QMu0', spotifyUrl: 'http://googleusercontent.com/spotify.com/relaxed/5'),
      ],
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
      type: Mood.energetic, // 🎯 FIX: Adăugat 'type'
      name: 'Energic',
      emoji: '🚀',
      color: const Color(0xFFFF5A00), // Portocaliu
      quotesKeys: [
        "quote_energetic_1", "quote_energetic_2", "quote_energetic_3", "quote_energetic_4", "quote_energetic_5",
      ],
      playlist: [
        Song(title: 'Eye of the Tiger', artist: 'Survivor', youtubeUrl: 'https://www.youtube.com/watch?v=btPJPFnesV4', spotifyUrl: 'LINK_SP_ENERG_1'),
        Song(title: 'Levels', artist: 'Avicii', youtubeUrl: 'https://www.youtube.com/watch?v=_ovdm2yX4MA', spotifyUrl: 'LINK_SP_ENERG_2'),
        Song(title: 'September', artist: 'Earth, Wind & Fire', youtubeUrl: 'https://www.youtube.com/watch?v=Gs069dRs6Dg', spotifyUrl: 'http://googleusercontent.com/spotify.com/energetic/3'),
        Song(title: 'Mr. Brightside', artist: 'The Killers', youtubeUrl: 'https://www.youtube.com/watch?v=gGdGFhI2VFM', spotifyUrl: 'http://googleusercontent.com/spotify.com/energetic/4'),
        Song(title: 'Wake Me Up', artist: 'Avicii', youtubeUrl: 'https://www.youtube.com/watch?v=IcrbM1l_BoI', spotifyUrl: 'http://googleusercontent.com/spotify.com/energetic/5'),
      ],
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
      type: Mood.motivated, // 🎯 FIX: Adăugat 'type'
      name: 'Motivat',
      emoji: '🎯',
      color: const Color(0xFFCC0000), // Roșu Pur
      quotesKeys: [
        "quote_motivated_1", "quote_motivated_2", "quote_motivated_3", "quote_motivated_4", "quote_motivated_5",
      ],
      playlist: [
        Song(title: 'Lose Yourself', artist: 'Eminem', youtubeUrl: 'https://www.youtube.com/watch?v=7YuAzR2XVAM', spotifyUrl: 'LINK_SP_MOTIV_1'),
        Song(title: 'Don\'t Stop Me Now', artist: 'Queen', youtubeUrl: 'https://www.youtube.com/watch?v=HgzGwKwLmgM', spotifyUrl: 'LINK_SP_MOTIV_2'),
        Song(title: 'The Champion', artist: 'Carrie Underwood ft. Ludacris', youtubeUrl: 'https://www.youtube.com/watch?v=bx23r_uV-R8', spotifyUrl: 'http://googleusercontent.com/spotify.com/motivated/3'),
        Song(title: 'Stronger', artist: 'Kanye West', youtubeUrl: 'https://www.youtube.com/watch?v=PsO6htFY8rs', spotifyUrl: 'http://googleusercontent.com/spotify.com/motivated/4'),
        Song(title: 'Remember the Name', artist: 'Fort Minor', youtubeUrl: 'https://www.youtube.com/watch?v=W-L_p5p-SNo', spotifyUrl: 'http://googleusercontent.com/spotify.com/motivated/5'),
      ],
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
      type: Mood.stressed, // 🎯 FIX: Adăugat 'type'
      name: 'Stresat',
      emoji: '😠',
      color: const Color(0xFF6A0DAD), // Violet/Purpuriu
      quotesKeys: [
        "quote_stressed_1", "quote_stressed_2", "quote_stressed_3", "quote_stressed_4", "quote_stressed_5",
      ],
      playlist: [
        Song(title: 'Clair de Lune', artist: 'Debussy', youtubeUrl: 'https://www.youtube.com/watch?v=WNcsUNKlAKw', spotifyUrl: 'LINK_SP_STRES_1'),
        Song(title: 'Watermark', artist: 'Enya', youtubeUrl: 'https://www.youtube.com/watch?v=bPCdsa7hS7M', spotifyUrl: 'LINK_SP_STRES_2'),
        Song(title: 'Gymnopédie No. 1', artist: 'Erik Satie', youtubeUrl: 'https://www.youtube.com/watch?v=2r1fQo69g-8', spotifyUrl: 'http://googleusercontent.com/spotify.com/stressed/3'),
        Song(title: 'Adagio for Strings', artist: 'Samuel Barber', youtubeUrl: 'https://www.youtube.com/watch?v=KylMqXzLhB0', spotifyUrl: 'http://googleusercontent.com/spotify.com/stressed/4'),
        Song(title: 'Spiegel im Spiegel', artist: 'Arvo Pärt', youtubeUrl: 'https://www.youtube.com/watch?v=TJ6wJ-JtV0E', spotifyUrl: 'http://googleusercontent.com/spotify.com/stressed/5'),
      ],
      questsKeys: [
        QuestModel(titleKey: "quest_stressed_title_1", descriptionKey: "quest_stressed_desc_1", emoji: '🧘'),
        QuestModel(titleKey: "quest_stressed_title_2", descriptionKey: "quest_stressed_desc_2", emoji: '✍️'),
        QuestModel(titleKey: "quest_stressed_title_3", descriptionKey: "quest_stressed_desc_3", emoji: '🚶'),
        QuestModel(titleKey: "quest_stressed_title_4", descriptionKey: "quest_stressed_desc_4", emoji: '🚿'),
        QuestModel(titleKey: "quest_stressed_title_5", descriptionKey: "quest_stressed_desc_5", emoji: '☕'),
        QuestModel(titleKey: "quest_stressed_title_6", descriptionKey: "quest_stressed_desc_6", emoji: '😮‍💨'), // Simbol de respirație
        QuestModel(titleKey: "quest_stressed_title_7", descriptionKey: "quest_stressed_desc_7", emoji: '🔪'), // Simbol pentru a tăia/sparge
        QuestModel(titleKey: "quest_stressed_title_8", descriptionKey: "quest_stressed_desc_8", emoji: '🦶'), // Simbol pentru picioare
        QuestModel(titleKey: "quest_stressed_title_9", descriptionKey: "quest_stressed_desc_9", emoji: '😌'), // Față relaxată
        QuestModel(titleKey: "quest_stressed_title_10", descriptionKey: "quest_stressed_desc_10", emoji: '🔊'), // Simbol de sunet
        QuestModel(titleKey: "quest_stressed_title_11", descriptionKey: "quest_stressed_desc_11", emoji: '🗑️'), // Simbol de coș de gunoi
        QuestModel(titleKey: "quest_stressed_title_12", descriptionKey: "quest_stressed_desc_12", emoji: '🧊'), // Simbol de gheață/rece
        QuestModel(titleKey: "quest_stressed_title_13", descriptionKey: "quest_stressed_desc_13", emoji: ' dimmed'), // Simbol de lumină slabă
        QuestModel(titleKey: "quest_stressed_title_14", descriptionKey: "quest_stressed_desc_14", emoji: '⏸️'), // Simbol de pauză
        QuestModel(titleKey: "quest_stressed_title_15", descriptionKey: "quest_stressed_desc_15", emoji: '🙋'),
      ],
    ),
    MoodModel(
      id: 7,
      type: Mood.nostalgic, // 🎯 FIX: Adăugat 'type'
      name: 'Nostalgic',
      emoji: '💭',
      color: const Color(0xFFAA8855), // Maro Cenușiu
      quotesKeys: [
        "quote_nostalgic_1", "quote_nostalgic_2", "quote_nostalgic_3", "quote_nostalgic_4", "quote_nostalgic_5",
      ],
      playlist: [
        Song(title: 'Yesterday', artist: 'The Beatles', youtubeUrl: 'https://www.youtube.com/watch?v=fCV9oqtwyVA', spotifyUrl: 'LINK_SP_NOST_1'),
        Song(title: 'What a Wonderful World', artist: 'Louis Armstrong', youtubeUrl: 'https://www.youtube.com/watch?v=rBrd_3VMC3c', spotifyUrl: 'LINK_SP_NOST_2'),
        Song(title: 'Bohemian Rhapsody', artist: 'Queen', youtubeUrl: 'https://www.youtube.com/watch?v=fJ9rUzIMcZQ', spotifyUrl: 'http://googleusercontent.com/spotify.com/nostalgic/3'),
        Song(title: 'Take On Me', artist: 'a-ha', youtubeUrl: 'https://www.youtube.com/watch?v=djV11Xbc914', spotifyUrl: 'http://googleusercontent.com/spotify.com/nostalgic/4'),
        Song(title: 'Africa', artist: 'Toto', youtubeUrl: 'https://www.youtube.com/watch?v=FTQBiNCMVIs', spotifyUrl: 'http://googleusercontent.com/spotify.com/nostalgic/5'),
      ],
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
      type: Mood.focused, // 🎯 FIX: Adăugat 'type'
      name: 'Focusat',
      emoji: '🔥',
      color: const Color(0xFF00ADB5), // Cyan
      quotesKeys: [
        'quote_focused_1', "quote_focused_2", "quote_focused_3", "quote_focused_4", "quote_focused_5",
      ],
      playlist: [
        Song(title: 'Ambient 1: Music for Airports', artist: 'Brian Eno', youtubeUrl: 'https://www.youtube.com/watch?v=U9_EqGb-AdU', spotifyUrl: 'LINK_SP_FOCUS_1'),
        Song(title: 'Run', artist: 'Ludovico Einaudi', youtubeUrl: 'https://www.youtube.com/watch?v=LFva21HWk8g', spotifyUrl: 'LINK_SP_FOCUS_2'),
        Song(title: 'Experience', artist: 'Ludovico Einaudi', youtubeUrl: 'https://www.youtube.com/watch?v=h7i4vO14BHE', spotifyUrl: 'http://googleusercontent.com/spotify.com/focused/3'),
        Song(title: 'Limitless', artist: '808 Study', youtubeUrl: 'https://www.youtube.com/watch?v=2e6iR8F0T1o', spotifyUrl: 'http://googleusercontent.com/spotify.com/focused/4'),
        Song(title: 'Nuvole Bianche', artist: 'Ludovico Einaudi', youtubeUrl: 'https://www.youtube.com/watch?v=FZ2L2Qp-Z9M', spotifyUrl: 'http://googleusercontent.com/spotify.com/focused/5'),
      ],
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

  // Map-ul pentru căutare rapidă după ID (Utilizat de PlaylistScreen)
  static final Map<int, MoodModel> _moodMapById = { for (var mood in allMoods) mood.id : mood };

  // Lista imutabilă (pentru interfețe)
  static final UnmodifiableListView<MoodModel> allMoodsListView = UnmodifiableListView(allMoods);

  // Funcție helper STATICĂ pentru a găsi un mood după ID
  static MoodModel getMoodModelById(int id) {
    try {
      // Dacă ID-ul nu există, returnează starea cu ID=1 (Fericit)
      return _moodMapById[id] ?? allMoods.firstWhere((mood) => mood.id == 1);
    } catch (e) {
      // Fallback
      return allMoods.firstWhere((m) => m.name == 'Fericit');
    }
  }

  // Funcție helper STATICĂ pentru a găsi un MoodModel pe baza numelui
  static MoodModel getMoodModelByName(String moodName) {
    return allMoodsListView.firstWhere(
          (mood) => mood.name == moodName,
      orElse: () => allMoodsListView.firstWhere((m) => m.name == 'Fericit'),
    );
  }
}