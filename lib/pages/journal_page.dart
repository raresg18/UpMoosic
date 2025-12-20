// journal_page.dart (Codul Complet cu L10N)

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../l10n/app_localizations.dart';
import '../data/mood_data.dart';
import '../services/mood_tracker_service.dart';
import '../models/mood_entry.dart';
import '../models/mood_model.dart';


// Extensie ajutătoare (helper)
extension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

// Helper function pentru a normaliza datele
int getHashCode(DateTime key) {
  return key.year * 10000 + key.month * 100 + key.day;
}

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final MoodTrackerService _trackerService = MoodTrackerService();

  // Starea pentru Calendar
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  // Starea pentru Tracking & Analiză
  String? _selectedMoodName;
  bool _hasTrackedToday = false;
  Map<DateTime, String> _moodMap = {}; // Hartă pentru Calendar (Dată -> Nume Stare)

  // Starea pentru Notițe
  final TextEditingController _noteController = TextEditingController();
  String? _selectedDayNote;

  // Starea pentru Analiza Săptămânală
  Color _weeklyColor = Colors.grey;
  String _dominantMood = 'loading'; // Rămâne 'loading' pentru a fi tradus în build
  int _entriesCount = 0;


  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedDay = DateTime(now.year, now.month, now.day);
    _focusedDay = _selectedDay;

    _loadInitialData();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  // Helper pentru a găsi culoarea dintr-un MoodName
  Color _getColorForMood(String moodName) {
    final mood = MoodData.getMoodModelByName(moodName);
    return mood.color;
  }

  // Găsește întreaga MoodEntry pentru o zi normalizată (an, lună, zi)
  Future<MoodEntry?> _getEntryForDay(DateTime day) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList('dailyMoods') ?? [];
    final fullEntries = jsonList.map((jsonString) => MoodEntry.fromJson(jsonDecode(jsonString))).toList();

    final normalizedDay = DateTime(day.year, day.month, day.day);

    try {
      return fullEntries.firstWhere((entry) {
        final entryDateKey = DateTime(entry.date.year, entry.date.month, entry.date.day);
        return entryDateKey.isAtSameMomentAs(normalizedDay);
      });
    } catch (e) {
      return null;
    }
  }


  Future<void> _loadInitialData() async {
    final tracked = await _trackerService.hasTrackedToday();
    final moodMap = await _trackerService.getMoodMap();
    final analysis = await _trackerService.getWeeklyAnalysis();

    final normalizedSelectedDay = DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);
    final selectedEntry = await _getEntryForDay(_selectedDay);

    String? determinedMoodName;
    final savedMoodForSelectedDay = moodMap[normalizedSelectedDay];

    if (savedMoodForSelectedDay != null) {
      determinedMoodName = savedMoodForSelectedDay;
    }
    else {
      determinedMoodName = null;
    }

    setState(() {
      _hasTrackedToday = tracked;
      _moodMap = moodMap;

      // Aplicăm starea determinată
      _selectedMoodName = determinedMoodName;

      // Notița se setează din Entry-ul complet
      _selectedDayNote = selectedEntry?.note;

      final isTodaySelected = isSameDay(_selectedDay, DateTime.now());
      // Dacă este ziua curentă, populăm controller-ul
      if (isTodaySelected) {
        _noteController.text = selectedEntry?.note ?? '';
      } else {
        _noteController.text = ''; // Curățăm câmpul pentru zilele din trecut
      }

      // Analiza Săptămânală
      _weeklyColor = analysis['hybridColor'] as Color;
      // 'loading' va fi tradus în build
      _dominantMood = analysis['dominantMood'] as String? ?? 'loading';
      _entriesCount = analysis['entriesCount'] as int;
    });
  }

  void _onMoodSelected(String moodName) {
    final isTodaySelected = isSameDay(_selectedDay, DateTime.now());

    setState(() {
      _selectedMoodName = moodName;
    });

    if (isTodaySelected) {
      _trackerService.saveLastSelectedJournalMood(moodName);
    }
  }

  Future<void> _saveMood() async {
    final l10n = AppLocalizations.of(context)!; // Obținem l10n aici
    final todayNormalized = DateTime.now();
    final today = DateTime(todayNormalized.year, todayNormalized.month, todayNormalized.day);
    final normalizedSelectedDay = DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);
    final noteText = _noteController.text.trim();

    if (!_selectedMoodName.isNullOrEmpty && normalizedSelectedDay.isAtSameMomentAs(today)) {

      await _trackerService.saveDailyMood(_selectedMoodName!, note: noteText);

      // 🎯 FOLOSIM L10N PENTRU SNACKBAR
      final String message = !_hasTrackedToday ? l10n.saveSuccess : l10n.updateSuccess;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

      await _loadInitialData();
    } else if (normalizedSelectedDay.isAtSameMomentAs(today) && _selectedMoodName.isNullOrEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        // 🎯 FOLOSIM L10N
        SnackBar(content: Text(l10n.saveNoMood), backgroundColor: Colors.orange),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        // 🎯 FOLOSIM L10N
        SnackBar(content: Text(l10n.savePastDateError), backgroundColor: Colors.red),
      );
    }
  }

  // Funcție care decide ce widget mic să afișeze sub o anumită dată
  List<Widget> _getEventsForDay(DateTime day) {
    final normalizedDay = DateTime(day.year, day.month, day.day);
    final moodName = _moodMap[normalizedDay];

    if (moodName != null) {
      final moodColor = _getColorForMood(moodName);
      return [
        Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: moodColor,
            shape: BoxShape.circle,
          ),
          margin: const EdgeInsets.only(top: 1.0),
        ),
      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; // 🎯 Instanța l10n
    final allMoodsList = MoodData.allMoodsListView;

    final isTodaySelected = isSameDay(_selectedDay, DateTime.now());

    final normalizedSelectedDay = DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);
    final hasEntryForSelectedDay = _moodMap.containsKey(normalizedSelectedDay);

    // 🎯 Traducem mood-ul dominant dacă este 'loading'
    final String displayedDominantMood = _dominantMood == 'loading'
        ? l10n.analysisLoading
        : _dominantMood;


    return Scaffold(
      appBar: AppBar(
        // 🎯 Titlu AppBar
        title: Text(l10n.journalTitle),
        backgroundColor: Colors.blueGrey.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 1. Calendarul de Stări
            TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) async {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    _noteController.text = '';
                  });
                  await _loadInitialData();
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() => _calendarFormat = format);
                }
              },
              onPageChanged: (focusedDay) => _focusedDay = focusedDay,
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, events) {
                  final markers = _getEventsForDay(day);
                  if (markers.isNotEmpty) {
                    return Positioned(
                      right: 4,
                      bottom: 4,
                      child: Row(children: markers),
                    );
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 20),


            // 2. Zona de Tracking Zilnic (Vizibilă doar pentru ziua de azi)
            if (isTodaySelected)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 🎯 Mesajul de stare
                    _hasTrackedToday && _selectedMoodName != null
                        ? l10n.todayMoodIs(_selectedMoodName!)
                        : l10n.selectTodayMood,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: (_hasTrackedToday && _selectedMoodName != null)
                          ? _getColorForMood(_selectedMoodName!)
                          : Colors.blueGrey.shade700,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Selecția Stării
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: allMoodsList.map((moodModel) {
                      final isSelected = moodModel.name == _selectedMoodName;
                      return MoodChip(
                        moodName: moodModel.name,
                        emoji: moodModel.emoji,
                        color: moodModel.color,
                        isSelected: isSelected,
                        onTap: () => _onMoodSelected(moodModel.name),
                        l10n: l10n, // 🎯 TRIMITE L10N CĂTRE CHIP PENTRU TRADUCERE
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),

                  // Câmpul de Notițe de Jurnal (Editabil doar azi)
                  TextFormField(
                    controller: _noteController,
                    maxLines: 4,
                    maxLength: 500,
                    decoration: InputDecoration(
                      // 🎯 Label și Hint
                      labelText: l10n.journalNoteLabel,
                      hintText: l10n.journalNoteHint,
                      border: const OutlineInputBorder(),
                      enabled: isTodaySelected,
                      fillColor: isTodaySelected ? Colors.white : Colors.grey.shade100,
                      filled: true,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Butonul de Salvare/Actualizare (Vizibil doar azi)
                  ElevatedButton.icon(
                    onPressed: _selectedMoodName != null ? _saveMood : null,
                    icon: const Icon(Icons.check_circle_outline),
                    // 🎯 Label Buton
                    label: Text(_hasTrackedToday ? l10n.buttonUpdateMood : l10n.buttonSaveMood),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              )
            else
            // Afișează starea și notița pentru data selectată, dacă există
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: hasEntryForSelectedDay
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 🎯 Mesaj pentru ziua din trecut
                      l10n.pastDayMoodWas(_selectedDay.day, _selectedDay.month, _selectedDay.year),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      // 🎯 Numele stării selectate
                      '${_selectedMoodName ?? l10n.notSelected}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _getColorForMood(_selectedMoodName ?? 'Fericit'),
                      ),
                    ),
                    if (_selectedDayNote != null && _selectedDayNote!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          // 🎯 Etichetă notiță
                          l10n.pastNoteLabel(_selectedDayNote!),
                          style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black54),
                        ),
                      ),
                  ],
                )
                    : Text(
                  // 🎯 Mesaj fără înregistrare
                  l10n.noRecordForDay(_selectedDay.day, _selectedDay.month, _selectedDay.year),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
                ),
              ),

            const Divider(),
            const SizedBox(height: 20),

            // 3. Secțiunea Analiză Săptămânală
            // 🎯 Titlu analiză
            Text(
              l10n.analysisTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _weeklyColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _weeklyColor, width: 2),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: _weeklyColor,
                    radius: 20,
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🎯 Culoarea Săptămânii
                      Text(
                        l10n.weeklyColorLabel,
                        style: TextStyle(
                            fontSize: 16,
                            color: _weeklyColor.withOpacity(0.9),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // 🎯 Mood Dominant
                      Text(
                        l10n.dominantMoodLabel(displayedDominantMood),
                        style: const TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      // 🎯 Număr Înregistrări
                      Text(
                        l10n.entriesCountLabel(_entriesCount),
                        style: const TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =================================================================
// 🎯 MODIFICĂRI ÎN MOODCHIP (Pentru a afișa numele stării tradus)
// =================================================================

class MoodChip extends StatelessWidget {
  final String moodName; // Aceasta este cheia (ex: 'Fericit')
  final String emoji;
  final bool isSelected;
  final VoidCallback onTap;
  final Color color;
  final AppLocalizations l10n; // 🎯 NOU: Primește instanța localizării

  const MoodChip({
    super.key,
    required this.moodName,
    required this.emoji,
    required this.isSelected,
    required this.onTap,
    required this.color,
    required this.l10n, // 🎯 Adaugă în constructor
  });

  // Helper pentru a traduce numele stării (folosind camelCase)
  String get _translatedMoodName {
    switch (moodName) {
      case 'Fericit': return l10n.moodHappy;
      case 'Trist': return l10n.moodSad;
      case 'Relaxat': return l10n.moodRelaxed;
      case 'Energetic': return l10n.moodEnergetic;
      case 'Motivat': return l10n.moodMotivated;
      case 'Stresat': return l10n.moodStressed;
      case 'Nostalgic': return l10n.moodNostalgic;
      case 'Focusat': return l10n.moodFocused;
      default: return moodName; // Fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.7) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey.shade300,
            width: 1.5,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: color.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 8),
            Text(
              _translatedMoodName, // 🎯 AFIȘEAZĂ NUMELE TRADUS
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}