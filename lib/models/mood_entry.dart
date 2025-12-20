import 'package:flutter/material.dart'; // Nu e neapărat necesar aici, dar e bine să fie

class MoodEntry {
  final String moodName;
  final DateTime date;
  final String? note; // NOU: Notiță opțională

  MoodEntry({required this.moodName, required this.date, this.note}); // Adaugă 'note' la constructor

  // Ne ajută să salvăm obiectul ca format Map/JSON.
  // Adaugă 'note' la serializare.
  Map<String, dynamic> toJson() => {
    'moodName': moodName,
    'date': date.toIso8601String(),
    'note': note, // Adaugă notița aici
  };

  // Ne ajută să recreăm obiectul MoodEntry din string-ul JSON salvat.
  // Adaugă 'note' la deserializare, cu o valoare implicită dacă lipsește (pentru compatibilitatea datelor vechi).
  factory MoodEntry.fromJson(Map<String, dynamic> json) => MoodEntry(
    moodName: json['moodName'] as String,
    date: DateTime.parse(json['date'] as String),
    // Folosim operatorul ?? pentru a asigura o valoare implicită dacă 'note' lipsește
    note: json['note'] as String?,
  );
}