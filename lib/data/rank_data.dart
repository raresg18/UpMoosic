
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class RankData {
  static String getRankName(int points, AppLocalizations l10n) {
    if (points >= 2500) return "${l10n.rankLivingSymphony}";
    if (points >= 1000) return "${l10n.rankMoodComposer}";
    if (points >= 500) return "${l10n.rankRhythmExplorer}";
    if (points >= 200) return "${l10n.rankBalancedListener}";
    if (points >= 100) return "${l10n.rankBeginnerSpirit}";
    return "${l10n.rankShyNote} 🎹";
  }

  static Color getRankColor(int points) {
    if (points >= 2500) return Colors.amber.shade700;
    if (points >= 1000) return Colors.purple.shade400;
    if (points >= 500) return Colors.deepOrange.shade400;
    if (points >= 200) return Colors.blue.shade600;
    if (points >= 100) return Colors.green.shade600;
    return Colors.grey.shade500;
  }
}