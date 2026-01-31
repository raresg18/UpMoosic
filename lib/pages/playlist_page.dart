import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/l10n_extension.dart';
import '../data/mood_data.dart';
import '../models/song.dart';
import 'quests_page.dart';
import '../l10n/app_localizations.dart';
import '../services/quest_service.dart';

class PlaylistScreen extends StatelessWidget {
  final int mood;

  final Song song;
  final String quoteKey;

  const PlaylistScreen({
    super.key,
    required this.mood,
    required this.song,
    required this.quoteKey,
  });

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Nu s-a putut lansa $url');
    }
  }

  final Color _appBarColor = const Color(0xFF455A64);
  final Color _backgroundColor = const Color(0xFFF7F4F9);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final selectedMoodModel = MoodData.getMoodModelById(mood);
    final Color themePrimaryColor = Theme.of(context).colorScheme.primary;

    final String moodNameKey = selectedMoodModel.name;
    String translatedMoodName;
    switch (moodNameKey) {
      case 'Fericit': translatedMoodName = l10n.moodHappy; break;
      case 'Trist': translatedMoodName = l10n.moodSad; break;
      case 'Relaxat': translatedMoodName = l10n.moodRelaxed; break;
      case 'Energetic': translatedMoodName = l10n.moodEnergetic; break;
      case 'Motivat': translatedMoodName = l10n.moodMotivated; break;
      case 'Stresat': translatedMoodName = l10n.moodStressed; break;
      case 'Nostalgic': translatedMoodName = l10n.moodNostalgic; break;
      case 'Focusat': translatedMoodName = l10n.moodFocused; break;
      default: translatedMoodName = moodNameKey;
    }

    final Color buttonBackgroundColor = Colors.white;

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 3,
    );
    final String translatedQuote = l10n.dynamicString(quoteKey);

    return Scaffold(
      appBar: AppBar(
        title: Text(translatedMoodName),
        backgroundColor: _appBarColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: _backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '“$translatedQuote”',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              Text(
                l10n.luckySongPrompt,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 5),

              Column(
                children: [
                  Text(
                    song.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: selectedMoodModel.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    song.artist,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: selectedMoodModel.color.withOpacity(0.8),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              SizedBox(
                width: 250,
                child: ElevatedButton.icon(
                  onPressed: () => _launchUrl(song.youtubeUrl),
                  icon: const Icon(Icons.video_library),
                  label: Text(l10n.listenOnYoutube),
                  style: buttonStyle.copyWith(
                    backgroundColor: MaterialStateProperty.all(buttonBackgroundColor),
                    foregroundColor: MaterialStateProperty.all(themePrimaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: 250,
                child: ElevatedButton.icon(
                  onPressed: () => _launchUrl(song.spotifyUrl),
                  icon: const Icon(Icons.headset),
                  label: Text(l10n.listenOnSpotify),
                  style: buttonStyle.copyWith(
                    backgroundColor: MaterialStateProperty.all(buttonBackgroundColor),
                    foregroundColor: MaterialStateProperty.all(themePrimaryColor),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: 250,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    final persistentQuest = await QuestService.getOrCreateSessionQuest(mood);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestsPage(mood: mood, selectedQuest: persistentQuest),
                      ),
                    );
                  },
                  icon: const Icon(Icons.task_alt),
                  label: Text(l10n.questButtonLabel),
                  style: buttonStyle.copyWith(
                    backgroundColor: MaterialStateProperty.all(buttonBackgroundColor),
                    foregroundColor: MaterialStateProperty.all(themePrimaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}