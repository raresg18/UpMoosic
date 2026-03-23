import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';

import '../l10n/app_localizations.dart';
import '../data/mood_data.dart';
import '../l10n/l10n_extension.dart';
import '../services/mood_tracker_service.dart';
import '../models/mood_entry.dart';

extension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final MoodTrackerService _trackerService = MoodTrackerService();

  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  String? _selectedMoodName;
  bool _hasTrackedToday = false;
  Map<DateTime, String> _moodMap = {};

  final TextEditingController _noteController = TextEditingController();
  String? _selectedDayNote;

  Color _weeklyColor = Colors.grey;
  String _dominantMood = 'loading';
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

  Color _getColorForMood(String moodName) {
    final mood = MoodData.getMoodModelByName(moodName);
    return mood.color;
  }

  String _getLocalizedMoodName(BuildContext context, String baseName) {
    final l10n = AppLocalizations.of(context)!;
    switch (baseName) {
      case 'Fericit':
      case 'Happy':
        return l10n.moodHappy;
      case 'Trist':
      case 'Sad':
        return l10n.moodSad;
      case 'Relaxat':
      case 'Relaxed':
        return l10n.moodRelaxed;
      case 'Energetic':
        return l10n.moodEnergetic;
      case 'Motivat':
      case 'Motivated':
        return l10n.moodMotivated;
      case 'Stresat':
      case 'Stressed':
        return l10n.moodStressed;
      case 'Nostalgic':
        return l10n.moodNostalgic;
      case 'Focusat':
      case 'Focused':
        return l10n.moodFocused;
      default:
        return baseName;
    }
  }

  MoodEntry? _getEntryForDay(DateTime day) {
    return _trackerService.getDailyMood(day);
  }

  Future<void> _loadInitialData() async {
    final allEntries = _trackerService.getAllMoodEntries();

    final Map<DateTime, String> newMoodMap = {};
    for (var entry in allEntries) {
      final dateKey = DateTime(entry.date.year, entry.date.month, entry.date.day);
      newMoodMap[dateKey] = entry.moodName;
    }

    final today = DateTime.now();
    final todayEntry = _trackerService.getDailyMood(today);
    final tracked = todayEntry != null;

    final analysis = await _trackerService.getWeeklyAnalysis();

    final selectedEntry = _getEntryForDay(_selectedDay);

    final normalizedSelectedDay = DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);
    final savedMoodForSelectedDay = newMoodMap[normalizedSelectedDay];

    setState(() {
      _hasTrackedToday = tracked;
      _moodMap = newMoodMap;
      _selectedMoodName = savedMoodForSelectedDay;
      _selectedDayNote = selectedEntry?.note;

      if (isSameDay(_selectedDay, today)) {
        _noteController.text = selectedEntry?.note ?? '';
      } else {
        _noteController.text = '';
      }

      if (analysis.isNotEmpty) {
        _weeklyColor = (analysis['hybridColor'] as Color?) ?? Colors.grey;
        _dominantMood = (analysis['dominantMood'] as String?) ?? 'loading';
        _entriesCount = (analysis['entriesCount'] as int?) ?? 0;
      } else {
        _weeklyColor = Colors.grey;
        _dominantMood = 'loading';
        _entriesCount = 0;
      }
    });
  }

  void _onMoodSelected(String moodName) {
    setState(() {
      _selectedMoodName = moodName;
    });
  }

  Future<void> _saveMood() async {
    final l10n = AppLocalizations.of(context)!;
    final todayNormalized = DateTime.now();
    final normalizedSelectedDay = DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);
    final noteText = _noteController.text.trim();

    if (!_selectedMoodName.isNullOrEmpty && isSameDay(normalizedSelectedDay, todayNormalized)) {
      final newEntry = MoodEntry(
        moodName: _selectedMoodName!,
        date: DateTime.now(),
        note: noteText.isNotEmpty ? noteText : null,
      );

      await _trackerService.saveDailyMood(newEntry);

      final String message = !_hasTrackedToday ? l10n.saveSuccess : l10n.updateSuccess;

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }

      await _loadInitialData();
    } else if (isSameDay(normalizedSelectedDay, todayNormalized) && _selectedMoodName.isNullOrEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.selectMoodError), backgroundColor: Colors.orange),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nu poți edita zilele din trecut."), backgroundColor: Colors.red),
      );
    }
  }

  Future<void> _deleteDay() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.dynamicString('journal_delete_title')),
        content: Text(l10n.dynamicString('journal_delete_confirm')),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.deleteNo),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.deleteYes),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _trackerService.deleteMood(_selectedDay);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.dynamicString('journal_delete_success'))),
        );
        await _loadInitialData();
      }
    }
  }

  Future<void> _exportJournal() async {
    final l10n = AppLocalizations.of(context)!;
    final allEntries = _trackerService.getAllMoodEntries();

    if (allEntries.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.dynamicString('journal_export_empty'))),
      );
      return;
    }

    allEntries.sort((a, b) => a.date.compareTo(b.date));

    final buffer = StringBuffer();
    buffer.writeln('📓 UpMoosic — ${l10n.dynamicString('journal_export_title')}');
    buffer.writeln('─────────────────────────────');

    for (final entry in allEntries) {
      final d = entry.date;
      buffer.writeln('📅 ${d.day}.${d.month}.${d.year}');
      final localMood = _getLocalizedMoodName(context, entry.moodName);
      buffer.writeln('   ${_getMoodEmoji(entry.moodName)} $localMood');
      if (entry.note != null && entry.note!.isNotEmpty) {
        buffer.writeln('   📝 ${entry.note}');
      }
      buffer.writeln();
    }

    final text = buffer.toString();
    await Clipboard.setData(ClipboardData(text: text));

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.dynamicString('journal_export_success')),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  String _getMoodEmoji(String moodName) {
    final model = MoodData.getMoodModelByName(moodName);
    return model.emoji;
  }

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
    final l10n = AppLocalizations.of(context)!;
    final allMoodsList = MoodData.allMoodsListView;
    final isTodaySelected = isSameDay(_selectedDay, DateTime.now());
    final normalizedSelectedDay = DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);
    final hasEntryForSelectedDay = _moodMap.containsKey(normalizedSelectedDay);

    String displayedDominantMood = _dominantMood;
    if (_dominantMood != 'loading') {
      displayedDominantMood = _getLocalizedMoodName(context, _dominantMood);
    } else {
      displayedDominantMood = l10n.analysisLoading ?? 'Loading...';
    }

    String? currentDisplayMoodName;
    if (_selectedMoodName != null) {
      currentDisplayMoodName = _getLocalizedMoodName(context, _selectedMoodName!);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.journalTitle),
        backgroundColor: Colors.blueGrey.shade700,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share_rounded),
            tooltip: l10n.dynamicString('journal_export_button'),
            onPressed: _exportJournal,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            if (isTodaySelected)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _hasTrackedToday && currentDisplayMoodName != null
                        ? l10n.todayMoodIs(currentDisplayMoodName)
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

                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: allMoodsList.map((moodModel) {
                      final isSelected = moodModel.name == _selectedMoodName;
                      final translatedName = _getLocalizedMoodName(context, moodModel.name);

                      return MoodChip(
                        displayMoodName: translatedName,
                        emoji: moodModel.emoji,
                        color: moodModel.color,
                        isSelected: isSelected,
                        onTap: () => _onMoodSelected(moodModel.name),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _noteController,
                    maxLines: 4,
                    maxLength: 500,
                    decoration: InputDecoration(
                      labelText: l10n.journalNoteLabel,
                      hintText: l10n.journalNoteHint,
                      border: const OutlineInputBorder(),
                      enabled: isTodaySelected,
                      fillColor: isTodaySelected ? Colors.white : Colors.grey.shade100,
                      filled: true,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton.icon(
                    onPressed: _selectedMoodName != null ? _saveMood : null,
                    icon: const Icon(Icons.check_circle_outline),
                    label: Text(_hasTrackedToday ? l10n.saveMoodButton : l10n.saveMoodButton),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: hasEntryForSelectedDay
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Starea din ${_selectedDay.day}.${_selectedDay.month}.${_selectedDay.year}:',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      currentDisplayMoodName ?? l10n.selectMoodError,
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
                          _selectedDayNote!,
                          style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.black54),
                        ),
                      ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: _deleteDay,
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      label: Text(
                        l10n.dynamicString('journal_delete_button'),
                        style: const TextStyle(color: Colors.red),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        minimumSize: const Size(double.infinity, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                )
                    : Text(
                  "Nu există date pentru această zi.",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
                ),
              ),

            const Divider(),
            const SizedBox(height: 20),

            Text(
              l10n.analysisTitle ?? 'Weekly Analysis',
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
                      Text(
                        l10n.weeklyColorLabel ?? 'Culoare Hibridă',
                        style: TextStyle(
                            fontSize: 16,
                            color: _weeklyColor.withOpacity(0.9),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${l10n.analysisDominantLabel} $displayedDominantMood",
                        style: const TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      Text(
                        "${l10n.analysisEntriesLabel} $_entriesCount",
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

class MoodChip extends StatelessWidget {
  final String displayMoodName;
  final String emoji;
  final bool isSelected;
  final VoidCallback onTap;
  final Color color;

  const MoodChip({
    super.key,
    required this.displayMoodName,
    required this.emoji,
    required this.isSelected,
    required this.onTap,
    required this.color,
  });

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
              displayMoodName,
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