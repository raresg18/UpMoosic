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
  String get quote_happy_1 => 'Happiness depends upon ourselves.';

  @override
  String get quote_happy_2 =>
      'Happiness is not something readymade. It comes from your own actions.';

  @override
  String get quote_happy_3 => 'Being yourself is all that matters.';

  @override
  String get quote_happy_4 =>
      'Be the change that you wish to see in the world.';

  @override
  String get quote_happy_5 => 'A happy heart is a good medicine.';

  @override
  String get quote_sad_1 => 'Tears come from the heart, not from the brain.';

  @override
  String get quote_sad_2 =>
      'Every life has a measure of sadness, and sometimes it awakens us.';

  @override
  String get quote_sad_3 =>
      'Allowing yourself to be sad is just as important as allowing yourself to be happy.';

  @override
  String get quote_sad_4 => 'You cannot heal what you pretend doesn\'t exist.';

  @override
  String get quote_sad_5 => 'It\'s okay not to be okay.';

  @override
  String get quote_relaxed_1 => 'Breathe in the future, breathe out the past.';

  @override
  String get quote_relaxed_2 =>
      'The greatest weapon against stress is our ability to choose one thought over another.';

  @override
  String get quote_relaxed_3 => 'Calming the mind brings inner strength.';

  @override
  String get quote_relaxed_4 =>
      'Allow your mind to quiet and your heart to open.';

  @override
  String get quote_relaxed_5 => 'Be an island of calm in the middle of chaos.';

  @override
  String get quote_energetic_1 => 'Energy and persistence conquer all things.';

  @override
  String get quote_energetic_2 =>
      'Don\'t stop when you\'re tired, stop when you\'re done.';

  @override
  String get quote_energetic_3 => 'Every day is a new page. Make it energetic!';

  @override
  String get quote_energetic_4 =>
      'Success is not final; failure is not fatal: it is the courage to continue that counts.';

  @override
  String get quote_energetic_5 => 'The only limit is our imagination.';

  @override
  String get quote_motivated_1 =>
      'Motivation gets you started. Habit keeps you going.';

  @override
  String get quote_motivated_2 =>
      'A single person with a desire is an unstoppable force.';

  @override
  String get quote_motivated_3 =>
      'The secret of getting ahead is getting started.';

  @override
  String get quote_motivated_4 => 'Be so good they can\'t ignore you.';

  @override
  String get quote_motivated_5 => 'Every master was once a disaster.';

  @override
  String get quote_stressed_1 =>
      'You cannot control everything that happens. Control how you react.';

  @override
  String get quote_stressed_2 =>
      'Take a break. A tired mind cannot make good decisions.';

  @override
  String get quote_stressed_3 =>
      'Accept what is, let go of what was, and have faith in what will be.';

  @override
  String get quote_stressed_4 =>
      'You are not obligated to finish everything today.';

  @override
  String get quote_stressed_5 =>
      'Detachment from the outcome is the key to inner peace.';

  @override
  String get quote_nostalgic_1 => 'Memories are the treasure of the soul.';

  @override
  String get quote_nostalgic_2 =>
      'Remember that the past is a lesson, not a punishment.';

  @override
  String get quote_nostalgic_3 => 'Nostalgia is the pain of a past joy.';

  @override
  String get quote_nostalgic_4 =>
      'Time doesn\'t heal, but it helps reorganize memories.';

  @override
  String get quote_nostalgic_5 =>
      'Memories are the way we keep track of our lives.';

  @override
  String get quote_focused_1 => 'Focus on being productive, not busy.';

  @override
  String get quote_focused_2 =>
      'The key to success is to focus on goals, not obstacles.';

  @override
  String get quote_focused_3 => 'Where your attention goes, your energy flows.';

  @override
  String get quote_focused_4 => 'Choose not to be distracted.';

  @override
  String get quote_focused_5 =>
      'A steady mind in the midst of a storm brings clarity.';

  @override
  String get quest_happy_title_1 => 'Share the joy';

  @override
  String get quest_happy_desc_1 => 'Send a positive message to a loved one.';

  @override
  String get quest_happy_title_2 => 'Note down your gratitude';

  @override
  String get quest_happy_desc_2 =>
      'Write three things that went well for you today.';

  @override
  String get quest_sad_title_1 => 'Listen to your favorite song';

  @override
  String get quest_sad_desc_1 =>
      'Put on a song that reminds you of good times.';

  @override
  String get quest_sad_title_2 => 'Call a friend';

  @override
  String get quest_sad_desc_2 => 'Connection always helps.';

  @override
  String get quest_relaxed_title_1 => 'Drink a glass of water';

  @override
  String get quest_relaxed_desc_1 => 'Hydration helps calm the nervous system.';

  @override
  String get quest_relaxed_title_2 => 'Meditate for 5 minutes';

  @override
  String get quest_relaxed_desc_2 =>
      'Focus on your breath to re-anchor yourself.';

  @override
  String get quest_energetic_title_1 => 'Do a set of squats';

  @override
  String get quest_energetic_desc_1 => 'Get your blood flowing quickly.';

  @override
  String get quest_energetic_title_2 => 'Write a list of crazy ideas';

  @override
  String get quest_energetic_desc_2 =>
      'Use your energy for maximum creativity.';

  @override
  String get quest_motivated_title_1 => 'Set a micro-goal';

  @override
  String get quest_motivated_desc_1 =>
      'Choose a task you can finish in 15 minutes.';

  @override
  String get quest_motivated_title_2 => 'Reorganize your workspace';

  @override
  String get quest_motivated_desc_2 => 'A clean environment helps focus.';

  @override
  String get quest_stressed_title_1 => '5-minute breathing exercise';

  @override
  String get quest_stressed_desc_1 =>
      'Practice the 4-7-8 deep breathing technique.';

  @override
  String get quest_stressed_title_2 => 'Write down all your worries';

  @override
  String get quest_stressed_desc_2 =>
      'Move your thoughts from your head onto paper.';

  @override
  String get quest_nostalgic_title_1 => 'Flip through an old photo';

  @override
  String get quest_nostalgic_desc_1 =>
      'Relive a pleasant memory for a few minutes.';

  @override
  String get quest_nostalgic_title_2 => 'Write a letter (don\'t send it)';

  @override
  String get quest_nostalgic_desc_2 =>
      'Put your feelings about the past onto paper.';

  @override
  String get quest_focused_title_1 => 'Pomodoro Technique (25/5)';

  @override
  String get quest_focused_desc_1 =>
      'Work intensely for 25 minutes, take a 5-minute break.';

  @override
  String get quest_focused_title_2 => 'Turn off notifications';

  @override
  String get quest_focused_desc_2 =>
      'Eliminate all distractions for the next hour.';

  @override
  String get quest_happy_title_3 => 'Create a small piece of art';

  @override
  String get quest_happy_desc_3 =>
      'Draw or paint something that makes you smile.';

  @override
  String get quest_happy_title_4 => 'Movement for joy';

  @override
  String get quest_happy_desc_4 => 'Dance for 5 minutes to a fast song.';

  @override
  String get quest_happy_title_5 => 'Find a funny moment';

  @override
  String get quest_happy_desc_5 => 'Watch a funny clip or read a joke.';

  @override
  String get quest_sad_title_3 => 'Be kind to yourself';

  @override
  String get quest_sad_desc_3 => 'Allow yourself to cry if you need to.';

  @override
  String get quest_sad_title_4 => 'Pet an animal';

  @override
  String get quest_sad_desc_4 => 'Interacting with animals releases oxytocin.';

  @override
  String get quest_sad_title_5 => 'Make a hot cup of tea';

  @override
  String get quest_sad_desc_5 => 'Warm drinks help with emotional comfort.';

  @override
  String get quest_relaxed_title_3 => 'Visualize a calm place';

  @override
  String get quest_relaxed_desc_3 =>
      'Close your eyes and imagine a place where you feel safe.';

  @override
  String get quest_relaxed_title_4 => 'Don\'t read the news for an hour';

  @override
  String get quest_relaxed_desc_4 =>
      'A break from the information flow is essential.';

  @override
  String get quest_relaxed_title_5 => 'Light a scented candle';

  @override
  String get quest_relaxed_desc_5 => 'Use aromatherapy to soothe your senses.';

  @override
  String get quest_energetic_title_3 => 'Dance freely';

  @override
  String get quest_energetic_desc_3 =>
      'Put on some music and shake off the excess energy.';

  @override
  String get quest_energetic_title_4 => 'Sing loudly';

  @override
  String get quest_energetic_desc_4 => 'Use your voice to release energy.';

  @override
  String get quest_energetic_title_5 => 'Run or walk fast';

  @override
  String get quest_energetic_desc_5 => 'A short burst of outdoor movement.';

  @override
  String get quest_motivated_title_3 => 'Learn a new trick';

  @override
  String get quest_motivated_desc_3 =>
      'Watch a 5-minute tutorial and apply it.';

  @override
  String get quest_motivated_title_4 => 'Write a letter to your future self';

  @override
  String get quest_motivated_desc_4 =>
      'What advice would you give tomorrow\'s self?';

  @override
  String get quest_motivated_title_5 => 'Plan the next week';

  @override
  String get quest_motivated_desc_5 =>
      'Clear planning gives you a sense of control.';

  @override
  String get quest_stressed_title_3 => 'A walk without your phone';

  @override
  String get quest_stressed_desc_3 =>
      'Focus on what you see and hear around you.';

  @override
  String get quest_stressed_title_4 => 'Take a warm shower/bath';

  @override
  String get quest_stressed_desc_4 => 'Warm water relaxes tense muscles.';

  @override
  String get quest_stressed_title_5 => 'Stop and smell the coffee';

  @override
  String get quest_stressed_desc_5 =>
      'Take a break from work and enjoy a warm drink.';

  @override
  String get quest_nostalgic_title_3 => 'Call someone from childhood';

  @override
  String get quest_nostalgic_desc_3 =>
      'Reconnect with a person from your past.';

  @override
  String get quest_nostalgic_title_4 => 'Cook an old recipe';

  @override
  String get quest_nostalgic_desc_4 => 'Make a meal that reminds you of home.';

  @override
  String get quest_nostalgic_title_5 => 'Watch a favorite old movie';

  @override
  String get quest_nostalgic_desc_5 =>
      'Re-watch a cinematic production you miss.';

  @override
  String get quest_focused_title_3 => 'Hydrate completely';

  @override
  String get quest_focused_desc_3 =>
      'Drink a large glass of water. It aids cognitive function.';

  @override
  String get quest_focused_title_4 => 'Set a single goal for the next hour';

  @override
  String get quest_focused_desc_4 =>
      'Choose the most important task and ignore the rest.';

  @override
  String get quest_focused_title_5 => 'Go outside for 5 minutes';

  @override
  String get quest_focused_desc_5 =>
      'Refresh your mind with a breath of fresh air.';

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
}
