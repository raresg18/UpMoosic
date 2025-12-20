import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/data_service.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = const Locale('ro');

  Locale get locale => _locale;

  LanguageProvider() {
    _loadPreferredLanguage();
  }

  void _loadPreferredLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('languageCode');

    if (langCode != null && langCode.isNotEmpty) {
      _locale = Locale(langCode);
    }

    await DataService.load(_locale);
    notifyListeners();
  }

  void setLocale(Locale newLocale) async {
    if (_locale.languageCode != newLocale.languageCode) {
      _locale = newLocale;

      await DataService.load(_locale);
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('languageCode', newLocale.languageCode);
    }
  }
}