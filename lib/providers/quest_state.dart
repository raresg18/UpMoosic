import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_quest.dart';

class QuestState extends ChangeNotifier {
  List<UserQuest> _activeQuests = [];
  List<UserQuest> _completedQuests = [];
  int _totalScore = 0;
  final String _boxName = 'quests_storage';

  List<UserQuest> get activeQuests => _activeQuests;
  List<UserQuest> get completedQuests => _completedQuests;
  int get totalScore => _totalScore;

  QuestState() {
    _loadData();
  }

  Future<void> _loadData() async {
    final box = await Hive.openBox(_boxName);
    _totalScore = box.get('score', defaultValue: 0);

    final activeList = box.get('active', defaultValue: []);
    if (activeList is List) {
      _activeQuests = activeList.map((e) => UserQuest.fromMap(Map<String, dynamic>.from(e))).toList();
    }

    final completedList = box.get('completed', defaultValue: []);
    if (completedList is List) {
      _completedQuests = completedList.map((e) => UserQuest.fromMap(Map<String, dynamic>.from(e))).toList();
    }
    notifyListeners();
  }

  Future<void> _saveData() async {
    final box = await Hive.openBox(_boxName);
    await box.put('score', _totalScore);
    await box.put('active', _activeQuests.map((e) => e.toMap()).toList());
    await box.put('completed', _completedQuests.map((e) => e.toMap()).toList());
    notifyListeners();
  }

  void addQuest(UserQuest quest) {
    if (!_activeQuests.any((q) => q.questKey == quest.questKey)) {
      _activeQuests.add(quest);
      _saveData();
    }
  }

  void removeQuest(UserQuest quest) {
    _activeQuests.removeWhere((q) => q.questKey == quest.questKey);
    _saveData();
  }

  void completeQuest(UserQuest quest) {
    _activeQuests.removeWhere((q) => q.questKey == quest.questKey);

    final completed = UserQuest(
      moodName: quest.moodName,
      questKey: quest.questKey,
      acceptedDate: quest.acceptedDate,
      completedDate: DateTime.now(),
    );

    _completedQuests.add(completed);

    _totalScore += 100;

    _saveData();
  }

  void clearCompletedQuestsHistory() {
    _completedQuests.clear();
    _saveData();
  }
}