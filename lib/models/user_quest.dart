// lib/models/user_quest.dart

class UserQuest {
  final String moodName;
  final String questKey;
  final DateTime acceptedDate;
  // 🎯 NOU: Data la care quest-ul a fost finalizat
  final DateTime? completedDate;

  // 🎯 NOU: Adăugăm completedDate în constructor
  UserQuest({
    required this.moodName,
    required this.questKey,
    required this.acceptedDate,
    this.completedDate, // Poate fi null
  });

  String get displayStatus {
    if (completedDate != null) {
      return 'Finalizat pe ${completedDate!.day}.${completedDate!.month}.${completedDate!.year}';
    }
    return 'Acceptat pe ${acceptedDate.day}.${acceptedDate.month}.${acceptedDate.year}';
  }

  // 🎯 NOU: Metodă pentru a crea o copie a quest-ului, marcându-l ca finalizat
  UserQuest completeNow() {
    return UserQuest(
      moodName: moodName,
      questKey: questKey,
      acceptedDate: acceptedDate,
      completedDate: DateTime.now(), // Setează data finalizării
    );
  }

  // Modificarea toJson pentru a include completedDate
  Map<String, dynamic> toJson() => {
    'moodName': moodName,
    'questKey': questKey,
    'acceptedDate': acceptedDate.toIso8601String(),
    'completedDate': completedDate?.toIso8601String(), // Salvează doar dacă nu e null
  };

  // Modificarea fromJson pentru a parsa completedDate
  factory UserQuest.fromJson(Map<String, dynamic> json) {
    return UserQuest(
      moodName: json['moodName'] as String,
      questKey: json['questKey'] as String,
      acceptedDate: DateTime.parse(json['acceptedDate'] as String),
      // Parseză completedDate; dacă e null sau lipsește, rămâne null
      completedDate: json['completedDate'] != null
          ? DateTime.parse(json['completedDate'] as String)
          : null,
    );
  }
}