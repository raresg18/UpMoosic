// lib/pages/language_selector_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../l10n/app_localizations.dart';

class LanguageSelectorPage extends StatelessWidget {
  const LanguageSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    final l10n = AppLocalizations.of(context)!;

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 3,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );

    final languages = [
      {'name': 'Română', 'locale': const Locale('ro')},
      {'name': 'English', 'locale': const Locale('en')},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.selectLanguageButton),
        backgroundColor: Colors.blueGrey.shade700,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...languages.map((lang) {
              return Column(
                children: [
                  ElevatedButton.icon(
                    style: buttonStyle,
                    icon: const Icon(Icons.language),
                    label: Text(
                      lang['name'] as String,
                    ),
                    onPressed: () {
                      languageProvider.setLocale(lang['locale'] as Locale);

                    },
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}