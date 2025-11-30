import 'package:flutter/material.dart';
import 'dart:io'; // 🎯 NOU: Import necesar pentru funcția exit()

import 'language_selector_page.dart';
import 'mood_selector_page.dart';
import 'journal_page.dart';
import '../l10n/app_localizations.dart'; // Import localizare
import 'account_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Obține localizarea
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("UpMoosic"),
        backgroundColor: Colors.blueGrey.shade700,
        foregroundColor: Colors.white,

        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            iconSize: 30,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountPage(),
                ),
              );
            },
            // Dacă ai rezolvat erorile L10N, poți reactiva acest tooltip:
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
              label: Text(l10n.selectLanguageButton),
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
              label: Text(l10n.suggestSongButton),
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
              label: Text(l10n.emotionalJournalButton),
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
            const SizedBox(height: 40),

            // 🎯 BUTON NOU: IEȘIRE DIN APLICAȚIE
            ElevatedButton.icon(
              icon: const Icon(Icons.exit_to_app),
              label: Text(l10n.exitAppButton),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // Verifică dacă aplicația rulează pe mobil/desktop (nu pe web)
                if (Platform.isAndroid || Platform.isIOS || Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
                  exit(0); // Ieșire forțată din aplicație
                } else {
                  // Pe web, funcția exit() nu este suportată
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Funcția de ieșire nu este suportată pe Web/Chrome.')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}