// lib/pages/quests_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // NECESAR PENTRU PROVIDER

import '../l10n/app_localizations.dart';
import '../l10n/l10n_extension.dart';
import 'mood_data.dart';
import 'quest_model.dart';

// 🎯 IMPORTURI CORECTATE PENTRU STATE MANAGEMENT
import 'user_quest.dart';
import 'quest_state.dart';


class QuestsPage extends StatelessWidget {
  final int mood;
  final QuestModel selectedQuest;

  const QuestsPage({
    super.key,
    required this.mood,
    required this.selectedQuest,
  });

  final Color _appBarColor = const Color(0xFF455A64);
  final Color _backgroundColor = const Color(0xFFF7F4F9);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final selectedMoodModel = getMoodModelById(mood);
    final moodColor = selectedMoodModel.color;

    // Traducem numele stării de spirit pentru a-l afișa (în snake_case)
    String translatedMoodName;
    switch (selectedMoodModel.name) {
      case 'Fericit': translatedMoodName = l10n.moodHappy; break;
      case 'Trist': translatedMoodName = l10n.moodSad; break;
      case 'Relaxat': translatedMoodName = l10n.moodRelaxed; break;
      case 'Energetic': translatedMoodName = l10n.moodEnergetic; break;
      case 'Motivat': translatedMoodName = l10n.moodMotivated; break;
      case 'Stresat': translatedMoodName = l10n.moodStressed; break;
      case 'Nostalgic': translatedMoodName = l10n.moodNostalgic; break;
      case 'Focusat': translatedMoodName = l10n.moodFocused; break;
      default: translatedMoodName = selectedMoodModel.name;
    }

    // Stilul Butoanelor (general)
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 3,
    );
    final Color _mainButtonColor = moodColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.questMissionTitle),
        backgroundColor: _appBarColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: _backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Text(
                'Starea ta: ${selectedMoodModel.emoji} ${translatedMoodName}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
              ),

              const SizedBox(height: 40),

              // Cardul Misiunii
              QuestCard(
                quest: selectedQuest,
                moodColor: moodColor,
                l10n: l10n,
              ),

              const SizedBox(height: 60),

              // Rândul cu cele două butoane de acțiune
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 1. Butonul "Acceptă Misiunea"
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // 1. Accesăm QuestState fără să ascultăm modificările (listen: false)
                        final questState = Provider.of<QuestState>(context, listen: false);

                        // 2. Creăm obiectul UserQuest
                        final acceptedQuest = UserQuest(
                          // Folosim selectedMoodModel.name pentru că trebuie să fie cheia
                          // din .arb (Fericit, Trist, etc.) sau numele complet
                          moodName: translatedMoodName, // Folosim numele TRADUS pentru afișare mai ușoară
                          questKey: selectedQuest.titleKey,
                          acceptedDate: DateTime.now(),
                        );

                        // 3. ADĂUGĂM QUEST-UL ÎN STATE MANAGER
                        questState.addQuest(acceptedQuest);

                        // 4. Închide pagina actuală (QuestPage)
                        Navigator.pop(context);

                        // 5. (Opțional) Afișează un Snackbar de confirmare pe pagina anterioară
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(l10n.questAcceptedMessage), // 🎯 NOUĂ CHEIE ARB
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      label: Text(l10n.doQuestButton),
                      style: buttonStyle.copyWith(
                        backgroundColor: MaterialStateProperty.all(_mainButtonColor),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  // 2. Butonul "Închide" (Close)
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context); // Doar închide pagina
                      },
                      icon: const Icon(Icons.close),
                      label: Text(l10n.closeButton),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _appBarColor,
                        side: BorderSide(color: _appBarColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =================================================================
// WIDGETUL QUEST CARD (Rămâne neschimbat)
// =================================================================

class QuestCard extends StatelessWidget {
// ... (Clasa QuestCard rămâne la fel)
  final QuestModel quest;
  final Color moodColor;
  final AppLocalizations l10n;

  const QuestCard({
    super.key,
    required this.quest,
    required this.moodColor,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final translatedTitle = l10n.dynamicString(quest.titleKey);
    final translatedDescription = l10n.dynamicString(quest.descriptionKey);

    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: moodColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: moodColor.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            quest.emoji,
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.questMissionTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: moodColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            translatedTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Divider(height: 30),
          Text(
            translatedDescription,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}