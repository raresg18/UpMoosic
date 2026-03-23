// lib/pages/quests_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // NECESAR PENTRU PROVIDER

import '../l10n/app_localizations.dart';
import '../l10n/l10n_extension.dart';
import '../data/mood_data.dart';
import '../models/quest_model.dart';
import '../models/user_quest.dart';
import '../providers/quest_state.dart';


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

    final selectedMoodModel = MoodData.getMoodModelById(mood);
    final moodColor = selectedMoodModel.color;

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
                '${l10n.currentMoodTitlePrefix} ${selectedMoodModel.emoji} ${translatedMoodName}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey.shade700),
              ),

              const SizedBox(height: 40),

              QuestCard(
                quest: selectedQuest,
                moodColor: moodColor,
                l10n: l10n,
              ),

              const SizedBox(height: 60),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        final questState = Provider.of<QuestState>(context, listen: false);

                        final acceptedQuest = UserQuest(
                          moodName: translatedMoodName,
                          questKey: selectedQuest.titleKey,
                          acceptedDate: DateTime.now(),
                        );

                        questState.addQuest(acceptedQuest);

                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(l10n.questAcceptedMessage),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      label: Text(l10n.doQuestButton),
                      style: buttonStyle.copyWith(
                        backgroundColor: WidgetStateProperty.all(_mainButtonColor),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 12)),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
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


class QuestCard extends StatelessWidget {
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