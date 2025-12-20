import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class DataService {
  static Map<String, String> _localizedStrings = {};

  static Future<void> load(Locale locale) async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/${locale.languageCode}.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
    } catch (e) {
      _localizedStrings = {};
    }
  }

  static String getString(String key) {
    return _localizedStrings[key] ?? key;
  }
}