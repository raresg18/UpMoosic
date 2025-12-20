class UserQuest {
  final String moodName;
  final String questKey;
  final DateTime acceptedDate;
  final DateTime? completedDate;

  UserQuest({
    required this.moodName,
    required this.questKey,
    required this.acceptedDate,
    this.completedDate,
  });

  String get displayStatus {
    final date = completedDate ?? acceptedDate;
    return "${date.day}.${date.month}.${date.year}";
  }

  Map<String, dynamic> toMap() {
    return {
      'moodName': moodName,
      'questKey': questKey,
      'acceptedDate': acceptedDate.toIso8601String(),
      'completedDate': completedDate?.toIso8601String(),
    };
  }

  factory UserQuest.fromMap(Map<String, dynamic> map) {
    return UserQuest(
      moodName: map['moodName'],
      questKey: map['questKey'],
      acceptedDate: DateTime.parse(map['acceptedDate']),
      completedDate: map['completedDate'] != null ? DateTime.parse(map['completedDate']) : null,
    );
  }
}