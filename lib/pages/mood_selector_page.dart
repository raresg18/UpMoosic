// lib/pages/mood_selector_page.dart

import 'package:flutter/material.dart';
import 'playlist_page.dart';
// Importuri NOUĂ pentru arhitectura îmbunătățită
import 'mood_data.dart';
import 'mood_model.dart';
// 🎯 Importul necesar pentru localizare
import '../l10n/app_localizations.dart';

class MoodSelectorPage extends StatefulWidget {
  const MoodSelectorPage({super.key});

  @override
  State<MoodSelectorPage> createState() => _MoodSelectorPageState();
}

class _MoodSelectorPageState extends State<MoodSelectorPage> {
  // Vom stoca numele stării selectate și referința la MoodModel
  String? _selectedMoodName;
  MoodModel? _selectedMoodModel;

  void _onMoodSelected(MoodModel mood) {
    setState(() {
      _selectedMoodModel = mood;
      _selectedMoodName = mood.name;
    });
  }

  void _navigateToPlaylist() {
    // 🎯 Obține l10n aici pentru SnackBar
    final l10n = AppLocalizations.of(context)!;

    if (_selectedMoodModel != null) {
      // Trimitem ID-ul, deoarece PlaylistScreen așteaptă un int
      int moodId = _selectedMoodModel!.id;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlaylistScreen(mood: moodId),
        ),
      );
    } else {
      // 🎯 Mesajul de eroare tradus
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.selectMoodError),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  // 🎯 Funcție ajutătoare pentru a mapa numele fix la cheia de localizare tradusă
  String getTranslatedMoodName(AppLocalizations l10n, String moodNameKey) {
    switch (moodNameKey) {
    // ⚠️ Cheile din mood_data.dart trebuie să fie EXACT așa (Fericit, Trist, etc.)
      case 'Fericit': return l10n.moodHappy;
      case 'Trist': return l10n.moodSad;
      case 'Relaxat': return l10n.moodRelaxed;
      case 'Energetic': return l10n.moodEnergetic; // <-- NOU
      case 'Motivat': return l10n.moodMotivated;   // <-- NOU
      case 'Stresat': return l10n.moodStressed;    // <-- NOU
      case 'Nostalgic': return l10n.moodNostalgic; // <-- NOU
      case 'Focusat': return l10n.moodFocused;     // <-- NOU
      default: return moodNameKey; // Fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    // 🎯 Obține instanța localizării
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8), // Background-ul tău
      appBar: AppBar(
        // 🎯 Titlul tradus
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
              // Păstrăm layout-ul tău centrat cu Wrap
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12.0,
                runSpacing: 12.0,
                // Iterăm prin noua listă de MoodModel-uri
                children: MoodData.allMoodsListView.map((moodModel) {
                  final isSelected = moodModel.name == _selectedMoodName;

                  return MoodChip(
                    // 🎯 Trimitem numele tradus
                    moodName: getTranslatedMoodName(l10n, moodModel.name),
                    emoji: moodModel.emoji,
                    isSelected: isSelected,
                    onTap: () => _onMoodSelected(moodModel), // Trimitem MoodModel
                  );
                }).toList(),
              ),
              const Spacer(),
              // Butonul Sugerează o piesă
              ElevatedButton(
                // Butonul devine inactiv dacă nu e selectat niciun mood
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
                  l10n.suggestSongButton, // 🎯 Textul butonului tradus
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

// Widgetul MoodChip (păstrat din template-ul tău)
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
              // moodName este deja tradus
              moodName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                // Culorile din template-ul tău
                color: isSelected ? Colors.white : const Color(0xFF4A4E69),
              ),
            ),
          ],
        ),
      ),
    );
  }
}