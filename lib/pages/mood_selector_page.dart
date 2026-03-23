import 'package:flutter/material.dart';
import 'dart:math';
import '../l10n/l10n_extension.dart';
import 'playlist_page.dart';
import '../data/mood_data.dart';
import '../models/mood_model.dart';
import '../models/song.dart';
import '../l10n/app_localizations.dart';
import '../services/quest_service.dart';

class MoodSelectorPage extends StatefulWidget {
  const MoodSelectorPage({super.key});

  @override
  State<MoodSelectorPage> createState() => _MoodSelectorPageState();
}

class _MoodSelectorPageState extends State<MoodSelectorPage> {
  String? _selectedMoodName;
  MoodModel? _selectedMoodModel;

  int? _lastMoodId;
  Song? _cachedSong;
  String? _cachedQuoteKey;

  void _onMoodSelected(MoodModel mood) {
    setState(() {
      _selectedMoodModel = mood;
      _selectedMoodName = mood.name;
    });
  }

  void _navigateToPlaylist() async {
    final l10n = AppLocalizations.of(context)!;

    if (_selectedMoodModel != null) {
      final int currentMoodId = _selectedMoodModel!.id;
      final random = Random();

      if (_lastMoodId != currentMoodId) {
        await QuestService.resetQuest();

        final songList = _selectedMoodModel!.playlist;
        _cachedSong = songList[random.nextInt(songList.length)];

        final quotes = _selectedMoodModel!.quotesKeys;
        _cachedQuoteKey = quotes[random.nextInt(quotes.length)];

        _lastMoodId = currentMoodId;
      }
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaylistScreen(
              mood: currentMoodId,
              song: _cachedSong!,
              quoteKey: _cachedQuoteKey!,
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.selectMoodError),
        ),
      );
    }
  }

  String getTranslatedMoodName(AppLocalizations l10n, String moodNameKey) {
    switch (moodNameKey) {
      case 'Fericit': return l10n.moodHappy;
      case 'Trist': return l10n.moodSad;
      case 'Relaxat': return l10n.moodRelaxed;
      case 'Energetic': return l10n.moodEnergetic;
      case 'Motivat': return l10n.moodMotivated;
      case 'Stresat': return l10n.moodStressed;
      case 'Nostalgic': return l10n.moodNostalgic;
      case 'Focusat': return l10n.moodFocused;
      default: return moodNameKey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      appBar: AppBar(
        title: Text(
          l10n.selectMoodQuestion,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Color(0xFF1C2D41)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1C2D41)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12.0,
                runSpacing: 12.0,
                children: MoodData.allMoodsListView.map((moodModel) {
                  final isSelected = moodModel.name == _selectedMoodName;

                  return MoodChip(
                    moodName: getTranslatedMoodName(l10n, moodModel.name),
                    emoji: moodModel.emoji,
                    isSelected: isSelected,
                    onTap: () => _onMoodSelected(moodModel),
                  );
                }).toList(),
              ),
              const Spacer(),
              OutlinedButton.icon(
                onPressed: () async {
                  final random = Random();
                  final randomMood = MoodData.allMoodsListView[
                  random.nextInt(MoodData.allMoodsListView.length)
                  ];
                  await QuestService.resetQuest();
                  final song = randomMood.playlist[random.nextInt(randomMood.playlist.length)];
                  final quoteKey = randomMood.quotesKeys[random.nextInt(randomMood.quotesKeys.length)];
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlaylistScreen(
                          mood: randomMood.id,
                          song: song,
                          quoteKey: quoteKey,
                        ),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.casino_rounded),
                label: Text(l10n.dynamicString('surprise_me_button')),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF4A4E69),
                  side: const BorderSide(color: Color(0xFF4A4E69), width: 1.5),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _selectedMoodModel != null ? _navigateToPlaylist : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A4E69),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  l10n.suggestSongButton,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class MoodChip extends StatelessWidget {
  final String moodName;
  final String emoji;
  final bool isSelected;
  final VoidCallback onTap;

  const MoodChip({
    super.key,
    required this.moodName,
    required this.emoji,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF9A8C98) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? const Color(0xFF4A4E69) : Colors.grey.shade300,
            width: 1.5,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: const Color(0xFF9A8C98).withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 8),
            Text(
              moodName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : const Color(0xFF4A4E69),
              ),
            ),
          ],
        ),
      ),
    );
  }
}