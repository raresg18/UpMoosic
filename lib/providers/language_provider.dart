// lib/pages/language_provider.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  // Locale implicită: Română
  Locale _locale = const Locale('ro');

  // Getter pentru a accesa Locale curentă din exterior
  Locale get locale => _locale;

  // Constructor: Încearcă să încarce preferința salvată la pornirea aplicației
  LanguageProvider() {
    _loadPreferredLanguage();
  }

  // Încarcă limba salvată din SharedPreferences
  void _loadPreferredLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('languageCode');

    // Dacă există o limbă salvată, o setăm și notificăm ascultătorii
    if (langCode != null && langCode.isNotEmpty && langCode != _locale.languageCode) {
      _locale = Locale(langCode);
      // Notificăm pentru a forța reconstrucția MyApp cu limba corectă
      notifyListeners();
    }
  }

  // Schimbă Locale curentă și salvează preferința
  void setLocale(Locale newLocale) async {
    if (_locale.languageCode != newLocale.languageCode) {
      _locale = newLocale;
      // Notificăm toți ascultătorii (inclusiv MaterialApp)
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('languageCode', newLocale.languageCode); // Salvează ('ro' sau 'en')
    }
  }

  // Metodă ajutătoare pentru a comuta rapid între RO și EN (opțional)
  void toggleLocale() {
    if (_locale.languageCode == 'ro') {
      setLocale(const Locale('en'));
    } else {
      setLocale(const Locale('ro'));
    }
  }
}