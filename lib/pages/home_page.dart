// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'language_selector_page.dart';
import 'mood_selector_page.dart';
import 'journal_page.dart';
import '../l10n/app_localizations.dart'; // 🎯 Import localizare
import 'account_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Obține localizarea (se reconstruiește la schimbarea limbii)
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("UpMoosic"), // Lăsăm numele fix
        backgroundColor: Colors.blueGrey.shade700,
        foregroundColor: Colors.white,

        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            iconSize: 30,
            // 🎯 MODIFICAREA ESENȚIALĂ AICI: Activează navigarea
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // Asigură-te că AccountPage este importat
                  builder: (context) => const AccountPage(),
                ),
              );
            },
            // Dacă ai rezolvat erorile L10N, poți reactiva tooltip-ul:
            // tooltip: l10n.account,
          ),
          const SizedBox(width: 8),
        ],

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Buton 1: Selectează Limba
            ElevatedButton.icon(
              icon: const Icon(Icons.language),
              label: Text(l10n.selectLanguageButton), // 🎯 Folosește l10n
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LanguageSelectorPage()),
                );
              },
            ),
            const SizedBox(height: 20),

            // Buton 2: Sugerează o piesă (Mood Selector)
            ElevatedButton.icon(
              icon: const Icon(Icons.music_note),
              label: Text(l10n.suggestSongButton), // 🎯 Folosește l10n
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MoodSelectorPage()),
                );
              },
            ),
            const SizedBox(height: 20),

            // Buton 3: Jurnal Emoțional
            ElevatedButton.icon(
              icon: const Icon(Icons.calendar_today),
              label: Text(l10n.emotionalJournalButton), // 🎯 Folosește l10n
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const JournalPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}