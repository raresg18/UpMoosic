// lib/pages/statistics_page.dart

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../l10n/app_localizations.dart';
import '../services/mood_tracker_service.dart';
import '../models/mood_entry.dart';
import '../data/mood_data.dart';
import '../models/mood_model.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final MoodTrackerService _trackerService = MoodTrackerService();
  Map<String, int> _moodCounts = {};
  int _totalEntries = 0;

  @override
  void initState() {
    super.initState();
    _calculateStats();
  }

  void _calculateStats() {
    final List<MoodEntry> allEntries = _trackerService.getAllMoodEntries();
    final Map<String, int> counts = {};

    for (var entry in allEntries) {
      counts[entry.moodName] = (counts[entry.moodName] ?? 0) + 1;
    }

    setState(() {
      _moodCounts = counts;
      _totalEntries = allEntries.length;
    });
  }

  String _getTranslatedMoodName(BuildContext context, String storedMoodName) {
    final l10n = AppLocalizations.of(context)!;

    final moodModel = MoodData.allMoods.firstWhere(
          (m) => m.name == storedMoodName,
      orElse: () => MoodData.allMoods[0],
    );

    switch (moodModel.type) {
      case Mood.happy: return l10n.moodHappy;
      case Mood.sad: return l10n.moodSad;
      case Mood.relaxed: return l10n.moodRelaxed;
      case Mood.energetic: return l10n.moodEnergetic;
      case Mood.motivated: return l10n.moodMotivated;
      case Mood.stressed: return l10n.moodStressed;
      case Mood.nostalgic: return l10n.moodNostalgic;
      case Mood.focused: return l10n.moodFocused;
      default: return storedMoodName;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.statisticsTitle),
        backgroundColor: Colors.blueGrey.shade700,
        foregroundColor: Colors.white,
      ),
      body: _totalEntries == 0
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bar_chart, size: 80, color: Colors.grey),
            const SizedBox(height: 10),
            Text(l10n.noDataStats, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      )
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      l10n.moodDistribution,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      height: 250,
                      child: PieChart(
                        PieChartData(
                          sections: _generateSections(),
                          centerSpaceRadius: 40,
                          sectionsSpace: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("${l10n.totalEntries} $_totalEntries", style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            ..._moodCounts.entries.map((entry) {
              final moodName = entry.key;
              final count = entry.value;
              final percentage = (count / _totalEntries * 100).toStringAsFixed(1);

              final moodModel = MoodData.allMoods.firstWhere(
                    (m) => m.name == moodName,
                orElse: () => MoodData.allMoods[0],
              );

              final translatedName = _getTranslatedMoodName(context, moodName);

              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: moodModel.color,
                    child: Text(moodModel.emoji, style: const TextStyle(fontSize: 20)),
                  ),
                  title: Text(
                    translatedName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "$count ($percentage%)",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _generateSections() {
    return _moodCounts.entries.map((entry) {
      final moodModel = MoodData.allMoods.firstWhere(
            (m) => m.name == entry.key,
        orElse: () => MoodData.allMoods[0],
      );

      final isLarge = entry.value / _totalEntries > 0.5;

      return PieChartSectionData(
        color: moodModel.color,
        value: entry.value.toDouble(),
        title: '${entry.value}',
        radius: isLarge ? 60 : 50,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [Shadow(color: Colors.black45, blurRadius: 2)],
        ),
      );
    }).toList();
  }
}