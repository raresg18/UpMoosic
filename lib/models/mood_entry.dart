import 'package:hive/hive.dart';

// Această linie va fi roșie până rulăm comanda de generare (Pasul 3)
part 'mood_entry.g.dart';

@HiveType(typeId: 0) // Fiecare model trebuie să aibă un ID unic (0, 1, 2...)
class MoodEntry extends HiveObject {

  @HiveField(0)
  final String moodName;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final String? note;

  MoodEntry({
    required this.moodName,
    required this.date,
    this.note,
  });

}