import 'package:flutter/material.dart';
import 'dart:io';
import 'statistics_page.dart';
import 'language_selector_page.dart';
import 'mood_selector_page.dart';
import 'journal_page.dart';
import '../l10n/app_localizations.dart';
import 'account_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Definim un stil comun pentru butoanele mari (opțional, pentru consistență perfectă)
    // Dar momentan le lăsăm cum ai cerut, doar aliniate.

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
            const SizedBox(height: 18),

            // 📊 Buton 4: Statistici (Acum arată la fel ca Jurnalul, dar e Teal)
            ElevatedButton.icon(
              icon: const Icon(Icons.pie_chart),
              label: Text(l10n.statisticsTitle),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade600, // Culoare distinctă
                foregroundColor: Colors.white,         // Text alb
                // Am scos dimensiunile fixe și fontul custom
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StatisticsPage()),
                );
              },
            ),

            const SizedBox(height: 16),

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
          ],
        ),
      ),
    );
  }
}