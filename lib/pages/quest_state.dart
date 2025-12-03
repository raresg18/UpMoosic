// lib/models/quest_state.dart

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart'; // NOU
import '../l10n/app_localizations.dart';

import 'user_quest.dart';

class QuestState extends ChangeNotifier {
  // Cheile de stocare
  final String _activeKey = 'active_quests';
  final String _completedKey = 'completed_quests'; // 🎯 NOUA CHEIE

  final List<UserQuest> _activeQuests = [];
  final List<UserQuest> _completedQuests = []; // 🎯 NOUA LISTĂ

  bool _isLoading = true;

  List<UserQuest> get activeQuests => _activeQuests;
  List<UserQuest> get completedQuests => _completedQuests; // 🎯 NOU GETTER
  bool get isLoading => _isLoading;

  QuestState() {
    loadQuests();
  }

  // =================================================================
  // FUNCTII DE PERSISTENTA
  // =================================================================

  Future<void> _saveQuests() async {
    final prefs = await SharedPreferences.getInstance();

    // 1. Salvare Quest-uri Active
    final activeJsonList = _activeQuests.map((quest) => quest.toJson()).toList();
    await prefs.setString(_activeKey, jsonEncode(activeJsonList));

    // 2. Salvare Quest-uri Finalizate (NEW)
    final completedJsonList = _completedQuests.map((quest) => quest.toJson()).toList();
    await prefs.setString(_completedKey, jsonEncode(completedJsonList));
  }

  Future<void> loadQuests() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoading = true;
    notifyListeners();

    try {
      // 1. Încărcare Quest-uri Active
      _loadList(prefs.getString(_activeKey), _activeQuests);

      // 2. Încărcare Quest-uri Finalizate (NEW)
      _loadList(prefs.getString(_completedKey), _completedQuests);

    } catch (e) {
      if (kDebugMode) {
        print("Eroare la încărcarea quest-urilor: $e");
      }
      _activeQuests.clear();
      _completedQuests.clear();
    }

    _isLoading = false;
    notifyListeners();
  }

  // Funcție helper pentru încărcarea unei liste generice
  void _loadList(String? jsonString, List<UserQuest> targetList) {
    targetList.clear();
    if (jsonString != null && jsonString.isNotEmpty) {
      final List<dynamic> jsonList = jsonDecode(jsonString) as List<dynamic>;
      for (var json in jsonList) {
        targetList.add(UserQuest.fromJson(json as Map<String, dynamic>));
      }
    }
  }

  // =================================================================
  // FUNCTII DE MODIFICARE
  // =================================================================

  @override
  void addQuest(UserQuest quest) {
    _activeQuests.add(quest);
    _saveQuests();
    notifyListeners();
  }

  @override
  void removeQuest(UserQuest quest) {
    _activeQuests.removeWhere((q) => q.questKey == quest.questKey);
    _saveQuests();
    notifyListeners();
  }

  Future<void> clearCompletedQuestsHistory() async {
    final prefs = await SharedPreferences.getInstance();

    // 1. Șterge lista de pe disc (folosim cheia corectă _completedKey)
    await prefs.remove(_completedKey);

    // 2. Golește lista din memorie imediat
    _completedQuests.clear();

    // 3. Notifică toți ascultătorii (UI-ul se va actualiza și va afișa lista goală)
    notifyListeners();
  }

  // 🎯 MODIFICAT: Mută quest-ul din lista activă în lista finalizată
  @override
  void completeQuest(UserQuest quest) {
    // 1. Creează o versiune a quest-ului cu data finalizării setată
    final completedQuest = quest.completeNow();

    // 2. Mută din activ în finalizat
    _activeQuests.removeWhere((q) => q.questKey == quest.questKey);
    _completedQuests.add(completedQuest);

    // TODO: AICI VEI ADĂUGA LOGICA DE PUNCTAJ ÎN VIITOR

    _saveQuests();
    notifyListeners();
  }
}