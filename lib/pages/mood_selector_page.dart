import 'package:aupmoosic/pages/playlist_page.dart';
import 'package:flutter/material.dart';

class MoodSelectorPage extends StatefulWidget {
  const MoodSelectorPage({super.key});

  @override
  State<MoodSelectorPage> createState() => _MoodSelectorPageState();
}

class _MoodSelectorPageState extends State<MoodSelectorPage> {
  String? _selectedMood;

  final Map<String, String> moodToEmoji = {
    'Fericit': '😊',
    'Trist': '😢',
    'Relaxat': '🧘‍♂️',
    'Energetic': '🚀',
    'Motivat': '🎯',
    'Stresat': '😠',
    'Nostalgic': '💭',
    'Focusat': '🔥',
  };

  final Map<String, int> moodToNumber = {
    'Fericit': 1,
    'Trist': 2,
    'Relaxat': 3,
    'Energetic': 4,
    'Motivat': 5,
    'Stresat': 6,
    'Nostalgic': 7,
    'Focusat': 8,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: const Text('Alege mood-ul tău'),
        backgroundColor: Colors.purple.shade100,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Mood icons pe un singur rând scrollabil
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: moodToEmoji.entries.map((entry) {
                  final mood = entry.key;
                  final emoji = entry.value;
                  final isSelected = mood == _selectedMood;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedMood = mood;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.deepPurple.shade200 : Colors.deepPurple.shade50,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected ? Colors.deepPurple : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            emoji,
                            style: const TextStyle(fontSize: 30),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            mood,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 40),
            // Text Stare:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Stare:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Text(
                  _selectedMood != null ? moodToEmoji[_selectedMood]! : '',
                  style: const TextStyle(fontSize: 28),
                ),
              ],
            ),
            const Spacer(),
            // Buton Sugerează o piesă
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                // Each mood represents a number
                onPressed: () {
                  if (_selectedMood != null) {
                    int moodNumber = moodToNumber[_selectedMood]!;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlaylistScreen(mood: moodNumber),
                      ),
                    );
                  } else {
                    // Afișează un mesaj dacă nu e selectat niciun mood
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Te rog selectează un mood înainte!')),
                    );
                  }
                },
                child: const Text('Sugerează o piesă'),
              ),

            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
