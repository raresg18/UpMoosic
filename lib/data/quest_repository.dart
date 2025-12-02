// lib/data/quest_repository.dart

import 'dart:math';
import '../pages/mood_model.dart';
import '../pages/quest_item.dart';

class QuestRepository {

  // 🎯 Map-ul static care stochează toate quest-urile
  static final Map<Mood, List<QuestItem>> _questDatabase = {
    // -----------------------------------------------------
    // 1. HAPPY
    // -----------------------------------------------------
    Mood.happy: [
      QuestItem(
        title: "Dăruiește un compliment sincer",
        description: "Spune-i cuiva ce apreciezi la el/ea.",
      ),
      QuestItem(
        title: "Notează 3 motive de recunoștință",
        description: "Scrie trei lucruri care ți-au mers bine azi.",
      ),
      QuestItem(
        title: "Ascultă o piesă 'guilty pleasure'",
        description: "Pune o melodie pe care o iubești, dar nu o recunoști.",
      ),
      // Adaugă Quest-ul 4, Quest-ul 5, Quest-ul 6, etc. direct aici
    ],

    // -----------------------------------------------------
    // 2. SAD
    // -----------------------------------------------------
    Mood.sad: [
      QuestItem(
        title: "Fă o plimbare scurtă (10 minute)",
        description: "O schimbare de peisaj poate ajuta. Nu lua telefonul.",
      ),
      QuestItem(
        title: "Bea o cană de ceai cald",
        description: "Hidratarea și căldura oferă confort emoțional.",
      ),
      // Adaugă aici mai multe quest-uri pentru starea Sad
    ],

    // -----------------------------------------------------
    // 3. RELAXED
    // -----------------------------------------------------
    Mood.relaxed: [
      QuestItem(
        title: "Fă un exercițiu de respirație 4-7-8",
        description: "Inspiră 4 secunde, ține 7, expiră 8. Repetă de 5 ori.",
      ),
      // ... și tot așa pentru celelalte Mood-uri
    ],
    // -----------------------------------------------------
    // 4. ENERGETIC, 5. MOTIVATED, etc.
    // -----------------------------------------------------
    // ... Completează restul stărilor de spirit
  };

  // 🎯 Funcția de Retrieve (Recuperare)
  static QuestItem getRandomQuest(Mood mood) {
    final quests = _questDatabase[mood];

    if (quests == null || quests.isEmpty) {
      // Returnează un quest implicit în caz de eroare
      return QuestItem(title: "Default Quest", description: "O misiune implicită.");
    }

    // Alege un quest aleatoriu din lista Map-ului
    final randomIndex = Random().nextInt(quests.length);
    return quests[randomIndex];
  }

  // 🎯 Funcție utilitară pentru a verifica dacă un mood are quest-uri
  static bool hasQuests(Mood mood) {
    final quests = _questDatabase[mood];
    return quests != null && quests.isNotEmpty;
  }
}