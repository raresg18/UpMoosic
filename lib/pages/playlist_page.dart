// lib/pages/playlist_page.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
import 'l10n_utils.dart';
// Asigură-te că aceste importuri sunt corecte în directorul tău:
import 'mood_data.dart';
import 'song.dart';
import 'quests_page.dart';
import 'quest_model.dart';
import '../l10n/app_localizations.dart';

class PlaylistScreen extends StatelessWidget {
  final int mood;

  const PlaylistScreen({super.key, required this.mood});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Nu s-a putut lansa $url');
    }
  }

  // Culorile de bază
  final Color _appBarColor = const Color(0xFF455A64);
  final Color _backgroundColor = const Color(0xFFF7F4F9);




  @override
  Widget build(BuildContext context) {
    // Obține instanța localizării
    final l10n = AppLocalizations.of(context)!;

    final selectedMoodModel = MoodData.getMoodModelById(mood);

    // Definirea culorii temei (pentru butoane)
    final Color themePrimaryColor = Theme.of(context).colorScheme.primary;

    // --- Traducerea numelui stării de spirit ---
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

    // --- Logica de Randomizare ---
    final random = Random();

    // 1. Citatul
    final int quoteIndex = random.nextInt(selectedMoodModel.quotesKeys.length);
    final String quoteKey = selectedMoodModel.quotesKeys[quoteIndex];
    final String translatedQuote = l10n.getQuote(quoteKey);

    // 2. Melodia
    final List<Song> songList = selectedMoodModel.playlist;
    final int songIndex = random.nextInt(songList.length);
    final Song selectedSong = songList[songIndex]; // 💡 Melodia aleasă

    // 3. Quest-ul
    final List<QuestModel> questList = selectedMoodModel.questsKeys;
    final QuestModel selectedQuest = questList.isNotEmpty
        ? questList[random.nextInt(questList.length)]
        : const QuestModel(titleKey: "quest_none_title", descriptionKey: "quest_none_desc", emoji: "");
    // ---------------------------------


    return Scaffold(
      appBar: AppBar(
        // Titlul barei (numele stării tradus)
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

              // Citatul
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

              // Melodia Aleasă (Titlu)
              Text(
                l10n.luckySongPrompt, // "Melodia ta norocoasă:"
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 5),

              // 🟢 CORECȚIA: AFIȘEAZĂ TITLUL ȘI ARTISTUL PE RÂNDURI SEPARATE
              Column(
                children: [
                  // TITLUL MELODIEI
                  Text(
                    selectedSong.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: selectedMoodModel.color,
                    ),
                  ),
                  const SizedBox(height: 4), // Spațiere mică între titlu și artist
                  // ARTISTUL
                  Text(
                    selectedSong.artist,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: selectedMoodModel.color.withOpacity(0.8), // Artistul e puțin mai estompat
                    ),
                  ),
                ],
              ),
              // -----------------------------------------------------------

              const SizedBox(height: 60),

              // 1. Buton YouTube
              SizedBox(
                width: 250,
                child: ElevatedButton.icon(
                  onPressed: () => _launchUrl(selectedSong.youtubeUrl),
                  icon: const Icon(Icons.video_library),
                  label: Text(l10n.listenOnYoutube),
                  style: buttonStyle.copyWith(
                    backgroundColor: MaterialStateProperty.all(buttonBackgroundColor),
                    foregroundColor: MaterialStateProperty.all(themePrimaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 2. Buton Spotify
              SizedBox(
                width: 250,
                child: ElevatedButton.icon(
                  onPressed: () => _launchUrl(selectedSong.spotifyUrl),
                  icon: const Icon(Icons.headset),
                  label: Text(l10n.listenOnSpotify),
                  style: buttonStyle.copyWith(
                    backgroundColor: MaterialStateProperty.all(buttonBackgroundColor),
                    foregroundColor: MaterialStateProperty.all(themePrimaryColor),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 3. Butonul QUEST
              SizedBox(
                width: 250,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestsPage(mood: mood, selectedQuest: selectedQuest),
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