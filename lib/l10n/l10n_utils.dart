// lib/l10n_utils.dart

import 'package:flutter/widgets.dart';

// Asigură-te că importul către AppLocalizations este corect
import 'package:aupmoosic/l10n/app_localizations.dart';

// Definirea unui tip funcțional pentru a face codul mai lizibil
typedef QuoteGetter = String Function(AppLocalizations l10n);

// Harta de mapare: asociază cheia String (din mood_data) cu funcția de apel a getter-ului L10N
// Folosim o funcție statică care returnează harta pentru a menține referințele curate.
final Map<String, QuoteGetter> _quoteMap = {
  // --- HAPPY (Fericit) ---
  'quote_happy_1': (l10n) => l10n.quote_happy_1,
  'quote_happy_2': (l10n) => l10n.quote_happy_2,
  'quote_happy_3': (l10n) => l10n.quote_happy_3,
  'quote_happy_4': (l10n) => l10n.quote_happy_4,
  'quote_happy_5': (l10n) => l10n.quote_happy_5,

  // --- SAD (Trist) ---
  'quote_sad_1': (l10n) => l10n.quote_sad_1,
  'quote_sad_2': (l10n) => l10n.quote_sad_2,
  'quote_sad_3': (l10n) => l10n.quote_sad_3,
  'quote_sad_4': (l10n) => l10n.quote_sad_4,
  'quote_sad_5': (l10n) => l10n.quote_sad_5,

  // --- RELAXED (Relaxat) ---
  'quote_relaxed_1': (l10n) => l10n.quote_relaxed_1,
  'quote_relaxed_2': (l10n) => l10n.quote_relaxed_2,
  'quote_relaxed_3': (l10n) => l10n.quote_relaxed_3,
  'quote_relaxed_4': (l10n) => l10n.quote_relaxed_4,
  'quote_relaxed_5': (l10n) => l10n.quote_relaxed_5,

  // --- ENERGETIC (Energetic) ---
  'quote_energetic_1': (l10n) => l10n.quote_energetic_1,
  'quote_energetic_2': (l10n) => l10n.quote_energetic_2,
  'quote_energetic_3': (l10n) => l10n.quote_energetic_3,
  'quote_energetic_4': (l10n) => l10n.quote_energetic_4,
  'quote_energetic_5': (l10n) => l10n.quote_energetic_5,

  // --- MOTIVATED (Motivat) ---
  'quote_motivated_1': (l10n) => l10n.quote_motivated_1,
  'quote_motivated_2': (l10n) => l10n.quote_motivated_2,
  'quote_motivated_3': (l10n) => l10n.quote_motivated_3,
  'quote_motivated_4': (l10n) => l10n.quote_motivated_4,
  'quote_motivated_5': (l10n) => l10n.quote_motivated_5,

  // --- STRESSED (Stresat) ---
  'quote_stressed_1': (l10n) => l10n.quote_stressed_1,
  'quote_stressed_2': (l10n) => l10n.quote_stressed_2,
  'quote_stressed_3': (l10n) => l10n.quote_stressed_3,
  'quote_stressed_4': (l10n) => l10n.quote_stressed_4,
  'quote_stressed_5': (l10n) => l10n.quote_stressed_5,

  // --- NOSTALGIC (Nostalgic) ---
  'quote_nostalgic_1': (l10n) => l10n.quote_nostalgic_1,
  'quote_nostalgic_2': (l10n) => l10n.quote_nostalgic_2,
  'quote_nostalgic_3': (l10n) => l10n.quote_nostalgic_3,
  'quote_nostalgic_4': (l10n) => l10n.quote_nostalgic_4,
  'quote_nostalgic_5': (l10n) => l10n.quote_nostalgic_5,

  // --- FOCUSED (Focusat) ---
  'quote_focused_1': (l10n) => l10n.quote_focused_1,
  'quote_focused_2': (l10n) => l10n.quote_focused_2,
  'quote_focused_3': (l10n) => l10n.quote_focused_3,
  'quote_focused_4': (l10n) => l10n.quote_focused_4,
  'quote_focused_5': (l10n) => l10n.quote_focused_5,
};

// Extensia care oferă o metodă curată de traducere a citatului.
extension L10nQuoteExtension on AppLocalizations {
  /// Traduce cheia citatului (ex: 'quote_happy_1') folosind harta de mapare.
  /// Returnează cheia netradusă dacă nu este găsită.
  String getQuote(String key) {
    // Încearcă să găsească funcția de apel în hartă
    final quoteFunction = _quoteMap[key];

    // Dacă funcția este găsită, o apelează cu instanța curentă a localizării (this)
    if (quoteFunction != null) {
      return quoteFunction(this);
    }

    // Dacă cheia nu este în hartă (sau este null), returnează cheia netradusă
    return key;
  }
}