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
  String get quest_happy_title_2 => 'Note down what you are grateful for';

  @override
  String get quest_happy_desc_2 =>
      'Write three things that went well for you today.';

  @override
  String get quest_happy_title_3 => 'Create a small piece of art';

  @override
  String get quest_happy_desc_3 =>
      'Draw or paint something that makes you smile.';

  @override
  String get quest_happy_title_4 => 'Movement for joy';

  @override
  String get quest_happy_desc_4 => 'Dance for 5 minutes to an upbeat song.';

  @override
  String get quest_happy_title_5 => 'Look for a funny moment';

  @override
  String get quest_happy_desc_5 => 'Watch a funny video clip or read a joke.';

  @override
  String get quest_happy_title_6 => 'Send a kind word';

  @override
  String get quest_happy_desc_6 =>
      'Tell someone what you like about them or what you appreciate.';

  @override
  String get quest_happy_title_7 => 'Listen to the song that makes you happy';

  @override
  String get quest_happy_desc_7 =>
      'Play the song that instantly makes you smile.';

  @override
  String get quest_happy_title_8 => 'Offer a smile to a stranger';

  @override
  String get quest_happy_desc_8 =>
      'Intentionally smile at someone you don\'t know.';

  @override
  String get quest_happy_title_9 => 'Journal one reason';

  @override
  String get quest_happy_desc_9 => 'Write down the happiest part of your day.';

  @override
  String get quest_happy_title_10 => 'Give a \'High Five\'';

  @override
  String get quest_happy_desc_10 =>
      'Ask someone for a \'high five\' or hug a loved one.';

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
  String get quest_sad_title_3 => 'Be gentle with yourself';

  @override
  String get quest_sad_desc_3 => 'Allow yourself to cry if you feel the need.';

  @override
  String get quest_sad_title_4 => 'Pet an animal';

  @override
  String get quest_sad_desc_4 => 'Interacting with animals releases oxytocin.';

  @override
  String get quest_sad_title_5 => 'Make a warm tea';

  @override
  String get quest_sad_desc_5 => 'Warm drinks help with emotional comfort.';

  @override
  String get quest_sad_title_6 => 'The 5-minute rule';

  @override
  String get quest_sad_desc_6 =>
      'Allow yourself to be sad for only 5 minutes. Then, change your focus.';

  @override
  String get quest_sad_title_7 => 'Note 3 things from today';

  @override
  String get quest_sad_desc_7 =>
      'Write down three things, no matter how small, that you are grateful for.';

  @override
  String get quest_sad_title_8 => 'Handle one small thing';

  @override
  String get quest_sad_desc_8 =>
      'Clean up one small area (e.g., drawer, table). A small victory helps.';

  @override
  String get quest_sad_title_9 => 'Embrace yourself';

  @override
  String get quest_sad_desc_9 =>
      'Take a warm bath or wrap yourself in a soft blanket.';

  @override
  String get quest_sad_title_10 => 'Listen to a Podcast';

  @override
  String get quest_sad_desc_10 =>
      'Listen to an episode of a motivational or funny podcast.';

  @override
  String get quest_sad_title_11 => 'Take a short walk';

  @override
  String get quest_sad_desc_11 =>
      'Go outside for 10 minutes. A change of scenery helps.';

  @override
  String get quest_sad_title_12 => 'Note your feeling';

  @override
  String get quest_sad_desc_12 =>
      'Describe exactly what you feel. Naming it helps you process it.';

  @override
  String get quest_sad_title_13 => 'No Social Media';

  @override
  String get quest_sad_desc_13 => 'Take a 30-minute break from social media.';

  @override
  String get quest_sad_title_14 => 'Eat a healthy snack';

  @override
  String get quest_sad_desc_14 =>
      'Eat a piece of fruit or something nutritious. Take care of your body.';

  @override
  String get quest_sad_title_15 => 'Help someone';

  @override
  String get quest_sad_desc_15 =>
      'Send a message to a friend asking how they feel.';

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
  String get quest_relaxed_title_3 => 'Visualize a calm Place';

  @override
  String get quest_relaxed_desc_3 =>
      'Close your eyes and imagine a place where you feel safe.';

  @override
  String get quest_relaxed_title_4 => 'Avoid Reading News for One Hour';

  @override
  String get quest_relaxed_desc_4 =>
      'Taking a break from the information flow is essential.';

  @override
  String get quest_relaxed_title_5 => 'Light a Scented Candle';

  @override
  String get quest_relaxed_desc_5 => 'Use aromatherapy to soothe your senses.';

  @override
  String get quest_relaxed_title_6 => 'No screens';

  @override
  String get quest_relaxed_desc_6 =>
      'Spend 30 minutes without looking at your phone, TV, or monitor.';

  @override
  String get quest_relaxed_title_7 => 'Listen to nature sounds';

  @override
  String get quest_relaxed_desc_7 =>
      'Put on a recording of rain, waves, or a forest.';

  @override
  String get quest_relaxed_title_8 => 'Quick facial massage';

  @override
  String get quest_relaxed_desc_8 =>
      'Massage your temples and forehead for 2 minutes.';

  @override
  String get quest_relaxed_title_9 => 'Total silence';

  @override
  String get quest_relaxed_desc_9 =>
      'Sit in complete silence for 5 minutes, focusing on your breathing.';

  @override
  String get quest_relaxed_title_10 => 'Drink a warm beverage';

  @override
  String get quest_relaxed_desc_10 =>
      'Make yourself a tea or hot chocolate, savoring every sip.';

  @override
  String get quest_relaxed_title_11 => 'Change position';

  @override
  String get quest_relaxed_desc_11 =>
      'Lie down on the floor (on a mat) for 10 minutes. The change in perspective relaxes you.';

  @override
  String get quest_relaxed_title_12 => 'Look out the window';

  @override
  String get quest_relaxed_desc_12 =>
      'Observe the landscape or the sky for 5 minutes without other thoughts.';

  @override
  String get quest_relaxed_title_13 => 'Gentle stretching';

  @override
  String get quest_relaxed_desc_13 =>
      'Do a series of simple stretches for your neck, shoulders, and back.';

  @override
  String get quest_relaxed_title_14 => 'Visit a beautiful place online';

  @override
  String get quest_relaxed_desc_14 =>
      'Look for images or clips of a place in the world that fascinates you.';

  @override
  String get quest_relaxed_title_15 => 'Think of a pleasant memory';

  @override
  String get quest_relaxed_desc_15 =>
      'Revisit a happy moment from the past, recalling the details.';

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
  String get quest_energetic_title_3 => 'Dance freely';

  @override
  String get quest_energetic_desc_3 =>
      'Put on some music and let your body release the excess energy.';

  @override
  String get quest_energetic_title_4 => 'Sing out loud';

  @override
  String get quest_energetic_desc_4 => 'Use your voice to release energy.';

  @override
  String get quest_energetic_title_5 => 'Run or walk fast';

  @override
  String get quest_energetic_desc_5 => 'A short burst of movement outdoors.';

  @override
  String get quest_energetic_title_6 => 'Learn something new in 5 min';

  @override
  String get quest_energetic_desc_6 =>
      'Use the energy to look up a new fact or a foreign word.';

  @override
  String get quest_energetic_title_7 => 'Quick DIY project';

  @override
  String get quest_energetic_desc_7 =>
      'Take on a small repair or creation project that lasts a maximum of 30 minutes.';

  @override
  String get quest_energetic_title_8 => 'Tidy up the inbox';

  @override
  String get quest_energetic_desc_8 =>
      'Delete or archive 10 unnecessary emails.';

  @override
  String get quest_energetic_title_9 => 'Targeted walk';

  @override
  String get quest_energetic_desc_9 =>
      'Walk quickly to a fixed point (a tree, a building) and back.';

  @override
  String get quest_energetic_title_10 => 'Cook something new';

  @override
  String get quest_energetic_desc_10 =>
      'Channel the energy into the kitchen and try a simple recipe.';

  @override
  String get quest_energetic_title_11 => 'Note 3 wild ideas';

  @override
  String get quest_energetic_desc_11 =>
      'Quickly write down 3 unconventional ideas or concepts you could explore.';

  @override
  String get quest_energetic_title_12 => 'Short HIIT workout';

  @override
  String get quest_energetic_desc_12 =>
      'Do a short (5-10 minute) high-intensity interval training session.';

  @override
  String get quest_energetic_title_13 => 'Call an old friend';

  @override
  String get quest_energetic_desc_13 =>
      'Use your eloquence to catch up with a loved one.';

  @override
  String get quest_energetic_title_14 => 'Organize your files';

  @override
  String get quest_energetic_desc_14 =>
      'Reorder or delete files on your computer desktop.';

  @override
  String get quest_energetic_title_15 => 'Express yourself artistically';

  @override
  String get quest_energetic_desc_15 =>
      'Write a short poem, haiku, or quick poetry.';

  @override
  String get quest_motivated_title_1 => 'Set a micro-goal';

  @override
  String get quest_motivated_desc_1 =>
      'Choose a task you can finish in 15 minutes.';

  @override
  String get quest_motivated_title_2 => 'Reorganize your workspace';

  @override
  String get quest_motivated_desc_2 =>
      'A clean environment helps concentration.';

  @override
  String get quest_motivated_title_3 => 'Learn a new trick';

  @override
  String get quest_motivated_desc_3 =>
      'Watch a 5-minute tutorial and apply it.';

  @override
  String get quest_motivated_title_4 => 'Write a letter to your future self';

  @override
  String get quest_motivated_desc_4 =>
      'What advice would you give tomorrow\'s you?';

  @override
  String get quest_motivated_title_5 => 'Plan the next week';

  @override
  String get quest_motivated_desc_5 =>
      'Clear planning gives you a sense of control.';

  @override
  String get quest_motivated_title_6 => 'Visualize success';

  @override
  String get quest_motivated_desc_6 =>
      'Close your eyes and imagine the desired outcome of your work.';

  @override
  String get quest_motivated_title_7 => 'Read an inspirational quote';

  @override
  String get quest_motivated_desc_7 =>
      'Find a phrase that motivates you and write it on a post-it.';

  @override
  String get quest_motivated_title_8 => 'Make a 3-2-1 Plan';

  @override
  String get quest_motivated_desc_8 =>
      'Name 3 big, 2 medium, 1 small tasks you will do today.';

  @override
  String get quest_motivated_title_9 => 'Learn a new word';

  @override
  String get quest_motivated_desc_9 =>
      'Expand your vocabulary. Knowledge empowers you.';

  @override
  String get quest_motivated_title_10 => 'Recharge your physical battery';

  @override
  String get quest_motivated_desc_10 =>
      'Do 10 squats or 10 push-ups to wake up your body.';

  @override
  String get quest_motivated_title_11 => 'Change your desktop background';

  @override
  String get quest_motivated_desc_11 =>
      'Choose an image that inspires you and reminds you of a goal.';

  @override
  String get quest_motivated_title_12 => 'Eliminate a distraction';

  @override
  String get quest_motivated_desc_12 =>
      'Identify the biggest distraction around you and remove it for 30 minutes.';

  @override
  String get quest_motivated_title_13 => 'Be a Mentor';

  @override
  String get quest_motivated_desc_13 =>
      'Offer a solution or advice to someone who has a problem.';

  @override
  String get quest_motivated_title_14 => 'Prioritize what NOT to do';

  @override
  String get quest_motivated_desc_14 =>
      'Write down 3 things you will *not* do today to focus on what is important.';

  @override
  String get quest_motivated_title_15 => 'Small Action Step';

  @override
  String get quest_motivated_desc_15 =>
      'Take the first (smallest) step of a large task you have been putting off.';

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
  String get quest_stressed_title_6 => '4-7-8 Breathing';

  @override
  String get quest_stressed_desc_6 =>
      'Inhale for 4 seconds, hold for 7, exhale for 8. Repeat 4 times.';

  @override
  String get quest_stressed_title_7 => 'Task shattering';

  @override
  String get quest_stressed_desc_7 =>
      'Take the biggest stressful task and break it down into 3 small steps.';

  @override
  String get quest_stressed_title_8 => 'Go outside barefoot for 5 minutes';

  @override
  String get quest_stressed_desc_8 =>
      'Touch the ground, grass, or rug with your feet. It helps with grounding.';

  @override
  String get quest_stressed_title_9 => 'Be mindful of your jaw';

  @override
  String get quest_stressed_desc_9 =>
      'Intentionally relax your jaw and shoulders. Physical de-tensioning helps.';

  @override
  String get quest_stressed_title_10 => 'Listen to White Noise';

  @override
  String get quest_stressed_desc_10 =>
      'Put on a track of white noise or ambient sounds to block your thoughts.';

  @override
  String get quest_stressed_title_11 => 'Make a \'Dump\' List';

  @override
  String get quest_stressed_desc_11 =>
      'Write down all the things you have to do on a sheet of paper, and then tear it up.';

  @override
  String get quest_stressed_title_12 => 'Take a cold water break';

  @override
  String get quest_stressed_desc_12 =>
      'Put cold water on your wrists or the back of your neck. Vagus nerve stimulation helps calm you.';

  @override
  String get quest_stressed_title_13 => 'Reduce blue light';

  @override
  String get quest_stressed_desc_13 =>
      'If it\'s evening, use blue light filters or use warm lighting.';

  @override
  String get quest_stressed_title_14 => 'Allow yourself to delay a decision';

  @override
  String get quest_stressed_desc_14 =>
      'Stress does not help with good decisions. Postpone a small decision until tomorrow.';

  @override
  String get quest_stressed_title_15 => 'Ask for Help (Delegate)';

  @override
  String get quest_stressed_desc_15 =>
      'If possible, ask someone to take over a minor task from you.';

  @override
  String get quest_stressed_title_3 => 'Take a short walk';

  @override
  String get quest_stressed_desc_3 =>
      'Go outside for 10 minutes. A change of scenery helps calm you.';

  @override
  String get quest_stressed_title_4 => 'Take a warm shower';

  @override
  String get quest_stressed_desc_4 =>
      'Use the warm water to relax your muscles.';

  @override
  String get quest_stressed_title_5 => 'Sip a warm drink';

  @override
  String get quest_stressed_desc_5 =>
      'Make yourself a calming herbal tea or a warm drink.';

  @override
  String get quest_nostalgic_title_1 => 'Flip through an old photo';

  @override
  String get quest_nostalgic_desc_1 =>
      'Relive a pleasant memory for a few minutes.';

  @override
  String get quest_nostalgic_title_2 => 'Write a letter (don\'t send it)';

  @override
  String get quest_nostalgic_desc_2 =>
      'Put your feelings about the past down on paper.';

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
  String get quest_nostalgic_title_6 => 'Rediscover an old object';

  @override
  String get quest_nostalgic_desc_6 =>
      'Look for an object from your childhood that reminds you of a story.';

  @override
  String get quest_nostalgic_title_7 => 'Write an anecdote';

  @override
  String get quest_nostalgic_desc_7 =>
      'Quickly write down the funniest or most memorable incident from your past.';

  @override
  String get quest_nostalgic_title_8 => 'Listen to a full album';

  @override
  String get quest_nostalgic_desc_8 =>
      'Put on a music album that you used to listen to non-stop during a certain period.';

  @override
  String get quest_nostalgic_title_9 => 'Visit a cherished place';

  @override
  String get quest_nostalgic_desc_9 =>
      'Go to or think about a place (school, park, old house) that is dear to you.';

  @override
  String get quest_nostalgic_title_10 => 'Relearn an old game';

  @override
  String get quest_nostalgic_desc_10 =>
      'Play a board game or a classic video game you had forgotten.';

  @override
  String get quest_nostalgic_title_11 => 'Make a memory collage';

  @override
  String get quest_nostalgic_desc_11 =>
      'Gather a few old photos and create a small physical or digital collection.';

  @override
  String get quest_nostalgic_title_12 => 'Create a time capsule';

  @override
  String get quest_nostalgic_desc_12 =>
      'Write a list of 5 things you are doing now and hide it for the future.';

  @override
  String get quest_nostalgic_title_13 => 'Talk to a family member';

  @override
  String get quest_nostalgic_desc_13 =>
      'Call an older person (parent, grandparent) and listen to a story from the past.';

  @override
  String get quest_nostalgic_title_14 => 'Take a nostalgic walk';

  @override
  String get quest_nostalgic_desc_14 =>
      'Walk a route you frequently took in the past (to school, home).';

  @override
  String get quest_nostalgic_title_15 => 'Think of a lesson learned';

  @override
  String get quest_nostalgic_desc_15 =>
      'What is the most valuable lesson you learned from your past? Write it down.';

  @override
  String get quest_focused_title_1 => 'Pomodoro Technique (25/5)';

  @override
  String get quest_focused_desc_1 =>
      'Work intensely for 25 minutes, take a 5-minute break.';

  @override
  String get quest_focused_title_2 => 'Disable notifications';

  @override
  String get quest_focused_desc_2 =>
      'Eliminate all distractions for the next hour.';

  @override
  String get quest_focused_title_3 => 'Hydrate completely';

  @override
  String get quest_focused_desc_3 =>
      'Drink a large glass of water. It aids cognitive function.';

  @override
  String get quest_focused_title_4 => 'Fix one single goal for the next hour';

  @override
  String get quest_focused_desc_4 =>
      'Choose the most important task and ignore the rest.';

  @override
  String get quest_focused_title_5 => 'Go out for 5 minutes of fresh air';

  @override
  String get quest_focused_desc_5 => 'Refresh your mind with a breath of air.';

  @override
  String get quest_focused_title_6 => 'Clean the desktop';

  @override
  String get quest_focused_desc_6 =>
      'Hide or delete all unnecessary files from the screen.';

  @override
  String get quest_focused_title_7 => 'Single window';

  @override
  String get quest_focused_desc_7 =>
      'Close all tabs and windows, leaving only the required application.';

  @override
  String get quest_focused_title_8 => 'Listen to background music';

  @override
  String get quest_focused_desc_8 =>
      'Put on instrumental music or ambient sounds designed for concentration.';

  @override
  String get quest_focused_title_9 => 'Eat a brain snack';

  @override
  String get quest_focused_desc_9 =>
      'Consume a handful of nuts or a piece of dark chocolate.';

  @override
  String get quest_focused_title_10 => 'The 5-minute method';

  @override
  String get quest_focused_desc_10 =>
      'Work on a task you have been putting off for 5 minutes. The start is often the hardest part.';

  @override
  String get quest_focused_title_11 => 'Change the light source';

  @override
  String get quest_focused_desc_11 =>
      'Make sure the light is optimal (natural or warm) for the work area.';

  @override
  String get quest_focused_title_12 => 'Set a reward';

  @override
  String get quest_focused_desc_12 =>
      'Set a small reward that you receive after finishing the task.';

  @override
  String get quest_focused_title_13 => '2-minute break';

  @override
  String get quest_focused_desc_13 =>
      'Take a 2-minute break where you stand up, stretch, and move your gaze away from the screen.';

  @override
  String get quest_focused_title_14 => 'Write \'Why?\'';

  @override
  String get quest_focused_desc_14 =>
      'Remind yourself why you are doing this work. Clarity of purpose brings focus.';

  @override
  String get quest_focused_title_15 => 'Use airplane mode';

  @override
  String get quest_focused_desc_15 =>
      'Activate airplane mode on your phone for a specific period of time.';

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
}
