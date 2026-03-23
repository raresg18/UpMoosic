import 'package:flutter/material.dart';
import 'dart:math';
import '../l10n/l10n_extension.dart';
import 'statistics_page.dart';
import 'mood_selector_page.dart';
import 'playlist_page.dart';
import 'journal_page.dart';
import '../l10n/app_localizations.dart';
import '../data/mood_data.dart';
import '../models/song.dart';
import '../services/mood_tracker_service.dart';
import '../services/quest_service.dart';
import 'account_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MoodTrackerService _trackerService = MoodTrackerService();
  int _streak = 0;

  @override
  void initState() {
    super.initState();
    _loadStreak();
  }

  void _loadStreak() {
    setState(() {
      _streak = _trackerService.getStreak();
    });
  }

  String _getGreetingEmoji() {
    final hour = DateTime.now().hour;
    if (hour < 12) return '🌅';
    if (hour < 18) return '☀️';
    return '🌙';
  }

  String _getGreetingText(AppLocalizations l10n) {
    final hour = DateTime.now().hour;
    if (hour < 12) return l10n.dynamicString('greeting_morning');
    if (hour < 18) return l10n.dynamicString('greeting_afternoon');
    return l10n.dynamicString('greeting_evening');
  }

  String _getFormattedDate() {
    final now = DateTime.now();
    const months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return '${days[now.weekday - 1]}, ${months[now.month]} ${now.day}';
  }

  Future<void> _surpriseMe(AppLocalizations l10n) async {
    final random = Random();
    final randomMood = MoodData.allMoodsListView[
    random.nextInt(MoodData.allMoodsListView.length)
    ];
    await QuestService.resetQuest();
    final Song song = randomMood.playlist[random.nextInt(randomMood.playlist.length)];
    final String quoteKey = randomMood.quotesKeys[random.nextInt(randomMood.quotesKeys.length)];
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PlaylistScreen(
            mood: randomMood.id,
            song: song,
            quoteKey: quoteKey,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("UpMoosic"),
        backgroundColor: Colors.blueGrey.shade700,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            iconSize: 30,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),
              ).then((_) => _loadStreak());
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [

          // ── Branding + Greeting Header ─────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blueGrey.shade700,
                  Colors.blueGrey.shade500,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.shade200,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.music_note_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.dynamicString('home_tagline'),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            _getGreetingEmoji(),
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${_getGreetingText(l10n)}  ·  ${_getFormattedDate()}',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withOpacity(0.85),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ── Streak Badge ───────────────────────────────
                if (_streak > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('🔥', style: TextStyle(fontSize: 14)),
                        const SizedBox(width: 4),
                        Text(
                          '$_streak',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          // ── Buttons ────────────────────────────────────────────
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.music_note),
                    label: Text(l10n.suggestSongButton),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const MoodSelectorPage()),
                      ).then((_) => _loadStreak());
                    },
                  ),
                  const SizedBox(height: 14),



                  ElevatedButton.icon(
                    icon: const Icon(Icons.pie_chart),
                    label: Text(l10n.statisticsTitle),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade600,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const StatisticsPage()),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  ElevatedButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: Text(l10n.emotionalJournalButton),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const JournalPage()),
                      ).then((_) => _loadStreak());
                    },
                  ),
                  const SizedBox(height: 18),

                  // ── Surprise Me button ─────────────────────────
                  ElevatedButton.icon(
                    icon: const Icon(Icons.casino_rounded),
                    label: Text(l10n.dynamicString('surprise_me_button')),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade400,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _surpriseMe(l10n),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}