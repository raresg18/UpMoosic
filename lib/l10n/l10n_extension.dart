// lib/l10n/l10n_extension.dart

import 'app_localizations.dart';

extension DynamicLocalizations on AppLocalizations {

  String dynamicString(String key) {

    // O singură hartă care include TOATE citatele și cheile de misiuni
    final Map<String, String> translationMap = {
      // ----------------------------------------------------
      // Citate Fericit (Toate referințele la getter-e sunt acum snake_case)
      'quote_happy_1': quote_happy_1,
      'quote_happy_2': quote_happy_2,
      'quote_happy_3': quote_happy_3,
      'quote_happy_4': quote_happy_4,
      'quote_happy_5': quote_happy_5,

      // Citate Trist
      'quote_sad_1': quote_sad_1,
      'quote_sad_2': quote_sad_2,
      'quote_sad_3': quote_sad_3,
      'quote_sad_4': quote_sad_4,
      'quote_sad_5': quote_sad_5,

      // Citate Relaxat
      'quote_relaxed_1': quote_relaxed_1,
      'quote_relaxed_2': quote_relaxed_2,
      'quote_relaxed_3': quote_relaxed_3,
      'quote_relaxed_4': quote_relaxed_4,
      'quote_relaxed_5': quote_relaxed_5,

      // Citate Energetic
      'quote_energetic_1': quote_energetic_1,
      'quote_energetic_2': quote_energetic_2,
      'quote_energetic_3': quote_energetic_3,
      'quote_energetic_4': quote_energetic_4,
      'quote_energetic_5': quote_energetic_5,

      // Citate Motivat
      'quote_motivated_1': quote_motivated_1,
      'quote_motivated_2': quote_motivated_2,
      'quote_motivated_3': quote_motivated_3,
      'quote_motivated_4': quote_motivated_4,
      'quote_motivated_5': quote_motivated_5,

      // Citate Stresat
      'quote_stressed_1': quote_stressed_1,
      'quote_stressed_2': quote_stressed_2,
      'quote_stressed_3': quote_stressed_3,
      'quote_stressed_4': quote_stressed_4,
      'quote_stressed_5': quote_stressed_5,

      // Citate Nostalgic
      'quote_nostalgic_1': quote_nostalgic_1,
      'quote_nostalgic_2': quote_nostalgic_2,
      'quote_nostalgic_3': quote_nostalgic_3,
      'quote_nostalgic_4': quote_nostalgic_4,
      'quote_nostalgic_5': quote_nostalgic_5,

      // Citate Focusat
      'quote_focused_1': quote_focused_1,
      'quote_focused_2': quote_focused_2,
      'quote_focused_3': quote_focused_3,
      'quote_focused_4': quote_focused_4,
      'quote_focused_5': quote_focused_5,
      // ----------------------------------------------------


      // ----------------------------------------------------
      // Misiuni Fericit
      'quest_happy_title_1': quest_happy_title_1,
      'quest_happy_desc_1': quest_happy_desc_1,
      'quest_happy_title_2': quest_happy_title_2,
      'quest_happy_desc_2': quest_happy_desc_2,
      'quest_happy_title_3': quest_happy_title_3,
      'quest_happy_desc_3': quest_happy_desc_3,
      'quest_happy_title_4': quest_happy_title_4,
      'quest_happy_desc_4': quest_happy_desc_4,
      'quest_happy_title_5': quest_happy_title_5,
      'quest_happy_desc_5': quest_happy_desc_5,
      'quest_happy_title_6': quest_happy_title_6,
      'quest_happy_desc_6': quest_happy_desc_6,
      'quest_happy_title_7': quest_happy_title_7,
      'quest_happy_desc_7': quest_happy_desc_7,
      'quest_happy_title_8': quest_happy_title_8,
      'quest_happy_desc_8': quest_happy_desc_8,
      'quest_happy_title_9': quest_happy_title_9,
      'quest_happy_desc_9': quest_happy_desc_9,
      'quest_happy_title_10': quest_happy_title_10,
      'quest_happy_desc_10': quest_happy_desc_10,



      // Misiuni Trist
      'quest_sad_title_1': quest_sad_title_1,
      'quest_sad_desc_1': quest_sad_desc_1,
      'quest_sad_title_2': quest_sad_title_2,
      'quest_sad_desc_2': quest_sad_desc_2,
      'quest_sad_title_3': quest_sad_title_3,
      'quest_sad_desc_3': quest_sad_desc_3,
      'quest_sad_title_4': quest_sad_title_4,
      'quest_sad_desc_4': quest_sad_desc_4,
      'quest_sad_title_5': quest_sad_title_5,
      'quest_sad_desc_5': quest_sad_desc_5,

      // Misiuni Relaxat
      'quest_sad_title_1': quest_sad_title_1,
      'quest_sad_desc_1': quest_sad_desc_1,
      'quest_sad_title_2': quest_sad_title_2,
      'quest_sad_desc_2': quest_sad_desc_2,
      'quest_sad_title_3': quest_sad_title_3,
      'quest_sad_desc_3': quest_sad_desc_3,
      'quest_sad_title_4': quest_sad_title_4,
      'quest_sad_desc_4': quest_sad_desc_4,
      'quest_sad_title_5': quest_sad_title_5,
      'quest_sad_desc_5': quest_sad_desc_5,
      'quest_sad_title_6': quest_sad_title_6,
      'quest_sad_desc_6': quest_sad_desc_6,
      'quest_sad_title_7': quest_sad_title_7,
      'quest_sad_desc_7': quest_sad_desc_7,
      'quest_sad_title_8': quest_sad_title_8,
      'quest_sad_desc_8': quest_sad_desc_8,
      'quest_sad_title_9': quest_sad_title_9,
      'quest_sad_desc_9': quest_sad_desc_9,
      'quest_sad_title_10': quest_sad_title_10,
      'quest_sad_desc_10': quest_sad_desc_10,
      'quest_sad_title_11': quest_sad_title_11,
      'quest_sad_desc_11': quest_sad_desc_11,
      'quest_sad_title_12': quest_sad_title_12,
      'quest_sad_desc_12': quest_sad_desc_12,
      'quest_sad_title_13': quest_sad_title_13,
      'quest_sad_desc_13': quest_sad_desc_13,
      'quest_sad_title_14': quest_sad_title_14,
      'quest_sad_desc_14': quest_sad_desc_14,
      'quest_sad_title_15': quest_sad_title_15,
      'quest_sad_desc_15': quest_sad_desc_15,


      // Misiuni Energetic
      'quest_energetic_title_1': quest_energetic_title_1,
      'quest_energetic_desc_1': quest_energetic_desc_1,
      'quest_energetic_title_2': quest_energetic_title_2,
      'quest_energetic_desc_2': quest_energetic_desc_2,
      'quest_energetic_title_3': quest_energetic_title_3,
      'quest_energetic_desc_3': quest_energetic_desc_3,
      'quest_energetic_title_4': quest_energetic_title_4,
      'quest_energetic_desc_4': quest_energetic_desc_4,
      'quest_energetic_title_5': quest_energetic_title_5,
      'quest_energetic_desc_5': quest_energetic_desc_5,
      'quest_energetic_title_6': quest_energetic_title_6,
      'quest_energetic_desc_6': quest_energetic_desc_6,
      'quest_energetic_title_7': quest_energetic_title_7,
      'quest_energetic_desc_7': quest_energetic_desc_7,
      'quest_energetic_title_8': quest_energetic_title_8,
      'quest_energetic_desc_8': quest_energetic_desc_8,
      'quest_energetic_title_9': quest_energetic_title_9,
      'quest_energetic_desc_9': quest_energetic_desc_9,
      'quest_energetic_title_10': quest_energetic_title_10,
      'quest_energetic_desc_10': quest_energetic_desc_10,
      'quest_energetic_title_11': quest_energetic_title_11,
      'quest_energetic_desc_11': quest_energetic_desc_11,
      'quest_energetic_title_12': quest_energetic_title_12,
      'quest_energetic_desc_12': quest_energetic_desc_12,
      'quest_energetic_title_13': quest_energetic_title_13,
      'quest_energetic_desc_13': quest_energetic_desc_13,
      'quest_energetic_title_14': quest_energetic_title_14,
      'quest_energetic_desc_14': quest_energetic_desc_14,
      'quest_energetic_title_15': quest_energetic_title_15,
      'quest_energetic_desc_15': quest_energetic_desc_15,

      // Misiuni Motivat
      'quest_motivated_title_1': quest_motivated_title_1,
      'quest_motivated_desc_1': quest_motivated_desc_1,
      'quest_motivated_title_2': quest_motivated_title_2,
      'quest_motivated_desc_2': quest_motivated_desc_2,
      'quest_motivated_title_3': quest_motivated_title_3,
      'quest_motivated_desc_3': quest_motivated_desc_3,
      'quest_motivated_title_4': quest_motivated_title_4,
      'quest_motivated_desc_4': quest_motivated_desc_4,
      'quest_motivated_title_5': quest_motivated_title_5,
      'quest_motivated_desc_5': quest_motivated_desc_5,
      'quest_motivated_title_6': quest_motivated_title_6,
      'quest_motivated_desc_6': quest_motivated_desc_6,
      'quest_motivated_title_7': quest_motivated_title_7,
      'quest_motivated_desc_7': quest_motivated_desc_7,
      'quest_motivated_title_8': quest_motivated_title_8,
      'quest_motivated_desc_8': quest_motivated_desc_8,
      'quest_motivated_title_9': quest_motivated_title_9,
      'quest_motivated_desc_9': quest_motivated_desc_9,
      'quest_motivated_title_10': quest_motivated_title_10,
      'quest_motivated_desc_10': quest_motivated_desc_10,
      'quest_motivated_title_11': quest_motivated_title_11,
      'quest_motivated_desc_11': quest_motivated_desc_11,
      'quest_motivated_title_12': quest_motivated_title_12,
      'quest_motivated_desc_12': quest_motivated_desc_12,
      'quest_motivated_title_13': quest_motivated_title_13,
      'quest_motivated_desc_13': quest_motivated_desc_13,
      'quest_motivated_title_14': quest_motivated_title_14,
      'quest_motivated_desc_14': quest_motivated_desc_14,
      'quest_motivated_title_15': quest_motivated_title_15,
      'quest_motivated_desc_15': quest_motivated_desc_15,


      // Misiuni Stresat
      'quest_stressed_title_1': quest_stressed_title_1,
      'quest_stressed_desc_1': quest_stressed_desc_1,
      'quest_stressed_title_2': quest_stressed_title_2,
      'quest_stressed_desc_2': quest_stressed_desc_2,
      'quest_stressed_title_3': quest_stressed_title_3,
      'quest_stressed_desc_3': quest_stressed_desc_3,
      'quest_stressed_title_4': quest_stressed_title_4,
      'quest_stressed_desc_4': quest_stressed_desc_4,
      'quest_stressed_title_5': quest_stressed_title_5,
      'quest_stressed_desc_5': quest_stressed_desc_5,
      'quest_stressed_title_6': quest_stressed_title_6,
      'quest_stressed_desc_6': quest_stressed_desc_6,
      'quest_stressed_title_7': quest_stressed_title_7,
      'quest_stressed_desc_7': quest_stressed_desc_7,
      'quest_stressed_title_8': quest_stressed_title_8,
      'quest_stressed_desc_8': quest_stressed_desc_8,
      'quest_stressed_title_9': quest_stressed_title_9,
      'quest_stressed_desc_9': quest_stressed_desc_9,
      'quest_stressed_title_10': quest_stressed_title_10,
      'quest_stressed_desc_10': quest_stressed_desc_10,
      'quest_stressed_title_11': quest_stressed_title_11,
      'quest_stressed_desc_11': quest_stressed_desc_11,
      'quest_stressed_title_12': quest_stressed_title_12,
      'quest_stressed_desc_12': quest_stressed_desc_12,
      'quest_stressed_title_13': quest_stressed_title_13,
      'quest_stressed_desc_13': quest_stressed_desc_13,
      'quest_stressed_title_14': quest_stressed_title_14,
      'quest_stressed_desc_14': quest_stressed_desc_14,
      'quest_stressed_title_15': quest_stressed_title_15,
      'quest_stressed_desc_15': quest_stressed_desc_15,


      // Misiuni Nostalgic
      'quest_nostalgic_title_1': quest_nostalgic_title_1,
      'quest_nostalgic_desc_1': quest_nostalgic_desc_1,
      'quest_nostalgic_title_2': quest_nostalgic_title_2,
      'quest_nostalgic_desc_2': quest_nostalgic_desc_2,
      'quest_nostalgic_title_3': quest_nostalgic_title_3,
      'quest_nostalgic_desc_3': quest_nostalgic_desc_3,
      'quest_nostalgic_title_4': quest_nostalgic_title_4,
      'quest_nostalgic_desc_4': quest_nostalgic_desc_4,
      'quest_nostalgic_title_5': quest_nostalgic_title_5,
      'quest_nostalgic_desc_5': quest_nostalgic_desc_5,
      'quest_nostalgic_title_6': quest_nostalgic_title_6,
      'quest_nostalgic_desc_6': quest_nostalgic_desc_6,
      'quest_nostalgic_title_7': quest_nostalgic_title_7,
      'quest_nostalgic_desc_7': quest_nostalgic_desc_7,
      'quest_nostalgic_title_8': quest_nostalgic_title_8,
      'quest_nostalgic_desc_8': quest_nostalgic_desc_8,
      'quest_nostalgic_title_9': quest_nostalgic_title_9,
      'quest_nostalgic_desc_9': quest_nostalgic_desc_9,
      'quest_nostalgic_title_10': quest_nostalgic_title_10,
      'quest_nostalgic_desc_10': quest_nostalgic_desc_10,
      'quest_nostalgic_title_11': quest_nostalgic_title_11,
      'quest_nostalgic_desc_11': quest_nostalgic_desc_11,
      'quest_nostalgic_title_12': quest_nostalgic_title_12,
      'quest_nostalgic_desc_12': quest_nostalgic_desc_12,
      'quest_nostalgic_title_13': quest_nostalgic_title_13,
      'quest_nostalgic_desc_13': quest_nostalgic_desc_13,
      'quest_nostalgic_title_14': quest_nostalgic_title_14,
      'quest_nostalgic_desc_14': quest_nostalgic_desc_14,
      'quest_nostalgic_title_15': quest_nostalgic_title_15,
      'quest_nostalgic_desc_15': quest_nostalgic_desc_15,


      // Misiuni Focusat
      'quest_focused_title_1': quest_focused_title_1,
      'quest_focused_desc_1': quest_focused_desc_1,
      'quest_focused_title_2': quest_focused_title_2,
      'quest_focused_desc_2': quest_focused_desc_2,
      'quest_focused_title_3': quest_focused_title_3,
      'quest_focused_desc_3': quest_focused_desc_3,
      'quest_focused_title_4': quest_focused_title_4,
      'quest_focused_desc_4': quest_focused_desc_4,
      'quest_focused_title_5': quest_focused_title_5,
      'quest_focused_desc_5': quest_focused_desc_5,
      'quest_focused_title_6': quest_focused_title_6,
      'quest_focused_desc_6': quest_focused_desc_6,
      'quest_focused_title_7': quest_focused_title_7,
      'quest_focused_desc_7': quest_focused_desc_7,
      'quest_focused_title_8': quest_focused_title_8,
      'quest_focused_desc_8': quest_focused_desc_8,
      'quest_focused_title_9': quest_focused_title_9,
      'quest_focused_desc_9': quest_focused_desc_9,
      'quest_focused_title_10': quest_focused_title_10,
      'quest_focused_desc_10': quest_focused_desc_10,
      'quest_focused_title_11': quest_focused_title_11,
      'quest_focused_desc_11': quest_focused_desc_11,
      'quest_focused_title_12': quest_focused_title_12,
      'quest_focused_desc_12': quest_focused_desc_12,
      'quest_focused_title_13': quest_focused_title_13,
      'quest_focused_desc_13': quest_focused_desc_13,
      'quest_focused_title_14': quest_focused_title_14,
      'quest_focused_desc_14': quest_focused_desc_14,
      'quest_focused_title_15': quest_focused_title_15,
      'quest_focused_desc_15': quest_focused_desc_15,

      // ----------------------------------------------------

      /*// Chei de Fallback (Dacă le-ai definit în ARB cu underscore)
      'quest_none_title': quest_none_title, // Presupunem că folosește underscore
      'quest_none_desc': quest_none_desc, // Presupunem că folosește underscore*/

      // Acum trebuie să fii atent și la cheile care nu aveau underscore:
      'questButtonLabel': questButtonLabel, // Aici nu ai underscore, probabil e camelCase
      'luckySongPrompt': luckySongPrompt,
      'selectMoodError': selectMoodError,

      // ... și orice altă cheie de UI care nu folosea underscore în ARB.
    };

    // Returnează valoarea tradusă sau o eroare vizibilă în caz că nu găsește cheia
    return translationMap[key] ?? 'L10N_KEY_NOT_FOUND: $key';
  }
}