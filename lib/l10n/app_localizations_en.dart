// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'UpMoosic';

  @override
  String get selectMoodPrompt => 'Select today\'s mood:';

  @override
  String get emotionalJournalButton => 'Emotional Journal';

  @override
  String get selectMoodQuestion => 'How are you feeling today?';

  @override
  String get selectMoodError => 'Please select a mood first!';

  @override
  String get saveMoodButton => 'Save daily mood';

  @override
  String get selectLanguageButton => 'Select Language';

  @override
  String get suggestSongButton => 'Suggest a song';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusActive => 'Active';

  @override
  String get selectMoodMessage => 'Please select a mood before continuing.';

  @override
  String get questFinished => 'I finished! / Close';

  @override
  String get questMissionTitle => 'Your Mission:';

  @override
  String musicRecommendationTitle(Object mood) {
    return 'Music Recommendation for $mood';
  }

  @override
  String get listenOnYoutube => 'Listen on YouTube';

  @override
  String get listenOnSpotify => 'Listen on Spotify';

  @override
  String get luckySongPrompt => 'Your lucky song:';

  @override
  String get questButtonLabel => 'Quest';

  @override
  String get journalTitle => 'Emotional Journal & Mood Calendar 🗓️';

  @override
  String get dailyNoteLabel => 'Notes for Journal (optional)';

  @override
  String todayMoodIs(Object mood) {
    return 'Today\'s mood is: $mood! (You can update)';
  }

  @override
  String get selectTodayMood => 'Select today\'s mood:';

  @override
  String get journalNoteLabel => 'Journal Notes (optional)';

  @override
  String get journalNoteHint => 'What happened today?';

  @override
  String get buttonUpdateMood => 'Update Daily Mood';

  @override
  String get buttonSaveMood => 'Save Daily Mood';

  @override
  String get analysisDominantLabel => 'Dominant:';

  @override
  String get analysisEntriesLabel => 'Entries:';

  @override
  String get saveSuccess => 'Today\'s mood and note have been saved!';

  @override
  String get updateSuccess => 'Today\'s mood and note have been updated!';

  @override
  String get saveNoMood => 'Select a mood before saving.';

  @override
  String get savePastDateError =>
      'You can only save the mood for the current day.';

  @override
  String get notSelected => 'Not Selected';

  @override
  String pastDayMoodWas(Object day, Object month, Object year) {
    return 'The mood on $day/$month/$year was:';
  }

  @override
  String pastNoteLabel(Object note) {
    return 'Note: \"$note\"';
  }

  @override
  String noRecordForDay(Object day, Object month, Object year) {
    return 'No entry found for $day/$month/$year.';
  }

  @override
  String get weeklyAnalysisTitle => 'Weekly Analysis (Last 7 days):';

  @override
  String get analysisTitle => 'Weekly Analysis (Last 7 days):';

  @override
  String get analysisLoading => 'Calculating...';

  @override
  String get weeklyColorLabel => 'Week\'s Color: Hybrid';

  @override
  String dominantMoodLabel(Object mood) {
    return 'Dominant Mood: $mood';
  }

  @override
  String entriesCountLabel(Object count) {
    return 'Entries this period: $count';
  }

  @override
  String get moodHappy => 'Happy';

  @override
  String get moodSad => 'Sad';

  @override
  String get moodRelaxed => 'Relaxed';

  @override
  String get moodEnergetic => 'Energetic';

  @override
  String get moodMotivated => 'Motivated';

  @override
  String get moodStressed => 'Stressed';

  @override
  String get moodNostalgic => 'Nostalgic';

  @override
  String get moodFocused => 'Focused';

  @override
  String get accountTitle => 'My Profile';

  @override
  String get accountPageWelcome => 'Welcome to your profile page!';

  @override
  String get account => 'Account';

  @override
  String get doQuestButton => 'Accept Quest';

  @override
  String get closeButton => 'Close';

  @override
  String get activeQuestsTitle => 'Active Quests';

  @override
  String get noActiveQuests =>
      'You have no active quests. Choose one from the main screen!';

  @override
  String get mood => 'Mood';

  @override
  String get questAcceptedMessage => 'Quest Accepted';

  @override
  String get cancelQuestButton => 'Cancel Quest';

  @override
  String get completeQuestButton => 'Mark as Complete';

  @override
  String get completedQuestsTitle => 'Completed Quests History';

  @override
  String get noCompletedQuests => 'You haven\'t completed any quests yet.';

  @override
  String userScoreLabel(Object score) {
    return 'Quest Points: $score';
  }

  @override
  String get deleteHistoryButton => 'Delete Quests History';

  @override
  String get deleteConfirmationTitle => 'Confirm Deletion';

  @override
  String get deleteConfirmationMessage =>
      'Are you sure you want to permanently delete ALL completed quests?';

  @override
  String get deleteYes => 'Yes, Delete';

  @override
  String get deleteNo => 'No, Cancel';

  @override
  String get exitAppButton => 'Exit Application';

  @override
  String get currentMoodTitlePrefix => 'Your mood:';

  @override
  String get developmentInfoTitle => 'App in Development';

  @override
  String get developmentInfoMessage =>
      'With your help and patience, this application can grow. Thank you for your understanding!';

  @override
  String get okButtonLabel => 'OK';

  @override
  String get accountHistoryTitle => 'Quest History';

  @override
  String get noQuestsCompleted => 'No Quests completed yet.';

  @override
  String questsCompletedLabel(Object count) {
    return 'You have completed $count Quests.';
  }

  @override
  String questStatusAccepted(Object date) {
    return 'Accepted on $date';
  }

  @override
  String questStatusCompleted(Object date) {
    return 'Completed on $date';
  }

  @override
  String get rankShyNote => 'Shy Note';

  @override
  String get rankBeginnerSpirit => 'Beginner Spirit';

  @override
  String get rankBalancedListener => 'Balanced Listener';

  @override
  String get rankRhythmExplorer => 'Rhythm Explorer';

  @override
  String get rankMoodComposer => 'Mood Composer';

  @override
  String get rankLivingSymphony => 'Living Symphony';
}
