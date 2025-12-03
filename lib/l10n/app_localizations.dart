import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ro.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ro')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'UpMoosic'**
  String get appName;

  /// No description provided for @selectMoodPrompt.
  ///
  /// In en, this message translates to:
  /// **'Select today\'s mood:'**
  String get selectMoodPrompt;

  /// No description provided for @emotionalJournalButton.
  ///
  /// In en, this message translates to:
  /// **'Emotional Journal'**
  String get emotionalJournalButton;

  /// No description provided for @selectMoodQuestion.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling today?'**
  String get selectMoodQuestion;

  /// No description provided for @selectMoodError.
  ///
  /// In en, this message translates to:
  /// **'Please select a mood first!'**
  String get selectMoodError;

  /// No description provided for @saveMoodButton.
  ///
  /// In en, this message translates to:
  /// **'Save daily mood'**
  String get saveMoodButton;

  /// No description provided for @selectLanguageButton.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguageButton;

  /// No description provided for @suggestSongButton.
  ///
  /// In en, this message translates to:
  /// **'Suggest a song'**
  String get suggestSongButton;

  /// No description provided for @selectMoodMessage.
  ///
  /// In en, this message translates to:
  /// **'Please select a mood before continuing.'**
  String get selectMoodMessage;

  /// No description provided for @questFinished.
  ///
  /// In en, this message translates to:
  /// **'I finished! / Close'**
  String get questFinished;

  /// No description provided for @questMissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Mission:'**
  String get questMissionTitle;

  /// No description provided for @musicRecommendationTitle.
  ///
  /// In en, this message translates to:
  /// **'Music Recommendation for {mood}'**
  String musicRecommendationTitle(Object mood);

  /// No description provided for @listenOnYoutube.
  ///
  /// In en, this message translates to:
  /// **'Listen on YouTube'**
  String get listenOnYoutube;

  /// No description provided for @listenOnSpotify.
  ///
  /// In en, this message translates to:
  /// **'Listen on Spotify'**
  String get listenOnSpotify;

  /// No description provided for @luckySongPrompt.
  ///
  /// In en, this message translates to:
  /// **'Your lucky song:'**
  String get luckySongPrompt;

  /// No description provided for @questButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Quest'**
  String get questButtonLabel;

  /// No description provided for @journalTitle.
  ///
  /// In en, this message translates to:
  /// **'Emotional Journal & Mood Calendar 🗓️'**
  String get journalTitle;

  /// No description provided for @dailyNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes for Journal (optional)'**
  String get dailyNoteLabel;

  /// No description provided for @todayMoodIs.
  ///
  /// In en, this message translates to:
  /// **'Today\'s mood is: {mood}! (You can update)'**
  String todayMoodIs(Object mood);

  /// No description provided for @selectTodayMood.
  ///
  /// In en, this message translates to:
  /// **'Select today\'s mood:'**
  String get selectTodayMood;

  /// No description provided for @journalNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Journal Notes (optional)'**
  String get journalNoteLabel;

  /// No description provided for @journalNoteHint.
  ///
  /// In en, this message translates to:
  /// **'What happened today?'**
  String get journalNoteHint;

  /// No description provided for @buttonUpdateMood.
  ///
  /// In en, this message translates to:
  /// **'Update Daily Mood'**
  String get buttonUpdateMood;

  /// No description provided for @buttonSaveMood.
  ///
  /// In en, this message translates to:
  /// **'Save Daily Mood'**
  String get buttonSaveMood;

  /// No description provided for @saveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Today\'s mood and note have been saved!'**
  String get saveSuccess;

  /// No description provided for @updateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Today\'s mood and note have been updated!'**
  String get updateSuccess;

  /// No description provided for @saveNoMood.
  ///
  /// In en, this message translates to:
  /// **'Select a mood before saving.'**
  String get saveNoMood;

  /// No description provided for @savePastDateError.
  ///
  /// In en, this message translates to:
  /// **'You can only save the mood for the current day.'**
  String get savePastDateError;

  /// No description provided for @notSelected.
  ///
  /// In en, this message translates to:
  /// **'Not Selected'**
  String get notSelected;

  /// No description provided for @pastDayMoodWas.
  ///
  /// In en, this message translates to:
  /// **'The mood on {day}/{month}/{year} was:'**
  String pastDayMoodWas(Object day, Object month, Object year);

  /// No description provided for @pastNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Note: \"{note}\"'**
  String pastNoteLabel(Object note);

  /// No description provided for @noRecordForDay.
  ///
  /// In en, this message translates to:
  /// **'No entry found for {day}/{month}/{year}.'**
  String noRecordForDay(Object day, Object month, Object year);

  /// No description provided for @weeklyAnalysisTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly Analysis (Last 7 days):'**
  String get weeklyAnalysisTitle;

  /// No description provided for @analysisTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly Analysis (Last 7 days):'**
  String get analysisTitle;

  /// No description provided for @analysisLoading.
  ///
  /// In en, this message translates to:
  /// **'Calculating...'**
  String get analysisLoading;

  /// No description provided for @weeklyColorLabel.
  ///
  /// In en, this message translates to:
  /// **'Week\'s Color: Hybrid'**
  String get weeklyColorLabel;

  /// No description provided for @dominantMoodLabel.
  ///
  /// In en, this message translates to:
  /// **'Dominant Mood: {mood}'**
  String dominantMoodLabel(Object mood);

  /// No description provided for @entriesCountLabel.
  ///
  /// In en, this message translates to:
  /// **'Entries this period: {count}'**
  String entriesCountLabel(Object count);

  /// No description provided for @moodHappy.
  ///
  /// In en, this message translates to:
  /// **'Happy'**
  String get moodHappy;

  /// No description provided for @moodSad.
  ///
  /// In en, this message translates to:
  /// **'Sad'**
  String get moodSad;

  /// No description provided for @moodRelaxed.
  ///
  /// In en, this message translates to:
  /// **'Relaxed'**
  String get moodRelaxed;

  /// No description provided for @moodEnergetic.
  ///
  /// In en, this message translates to:
  /// **'Energetic'**
  String get moodEnergetic;

  /// No description provided for @moodMotivated.
  ///
  /// In en, this message translates to:
  /// **'Motivated'**
  String get moodMotivated;

  /// No description provided for @moodStressed.
  ///
  /// In en, this message translates to:
  /// **'Stressed'**
  String get moodStressed;

  /// No description provided for @moodNostalgic.
  ///
  /// In en, this message translates to:
  /// **'Nostalgic'**
  String get moodNostalgic;

  /// No description provided for @moodFocused.
  ///
  /// In en, this message translates to:
  /// **'Focused'**
  String get moodFocused;

  /// No description provided for @quote_happy_1.
  ///
  /// In en, this message translates to:
  /// **'Happiness depends upon ourselves.'**
  String get quote_happy_1;

  /// No description provided for @quote_happy_2.
  ///
  /// In en, this message translates to:
  /// **'Happiness is not something readymade. It comes from your own actions.'**
  String get quote_happy_2;

  /// No description provided for @quote_happy_3.
  ///
  /// In en, this message translates to:
  /// **'Being yourself is all that matters.'**
  String get quote_happy_3;

  /// No description provided for @quote_happy_4.
  ///
  /// In en, this message translates to:
  /// **'Be the change that you wish to see in the world.'**
  String get quote_happy_4;

  /// No description provided for @quote_happy_5.
  ///
  /// In en, this message translates to:
  /// **'A happy heart is a good medicine.'**
  String get quote_happy_5;

  /// No description provided for @quote_sad_1.
  ///
  /// In en, this message translates to:
  /// **'Tears come from the heart, not from the brain.'**
  String get quote_sad_1;

  /// No description provided for @quote_sad_2.
  ///
  /// In en, this message translates to:
  /// **'Every life has a measure of sadness, and sometimes it awakens us.'**
  String get quote_sad_2;

  /// No description provided for @quote_sad_3.
  ///
  /// In en, this message translates to:
  /// **'Allowing yourself to be sad is just as important as allowing yourself to be happy.'**
  String get quote_sad_3;

  /// No description provided for @quote_sad_4.
  ///
  /// In en, this message translates to:
  /// **'You cannot heal what you pretend doesn\'t exist.'**
  String get quote_sad_4;

  /// No description provided for @quote_sad_5.
  ///
  /// In en, this message translates to:
  /// **'It\'s okay not to be okay.'**
  String get quote_sad_5;

  /// No description provided for @quote_relaxed_1.
  ///
  /// In en, this message translates to:
  /// **'Breathe in the future, breathe out the past.'**
  String get quote_relaxed_1;

  /// No description provided for @quote_relaxed_2.
  ///
  /// In en, this message translates to:
  /// **'The greatest weapon against stress is our ability to choose one thought over another.'**
  String get quote_relaxed_2;

  /// No description provided for @quote_relaxed_3.
  ///
  /// In en, this message translates to:
  /// **'Calming the mind brings inner strength.'**
  String get quote_relaxed_3;

  /// No description provided for @quote_relaxed_4.
  ///
  /// In en, this message translates to:
  /// **'Allow your mind to quiet and your heart to open.'**
  String get quote_relaxed_4;

  /// No description provided for @quote_relaxed_5.
  ///
  /// In en, this message translates to:
  /// **'Be an island of calm in the middle of chaos.'**
  String get quote_relaxed_5;

  /// No description provided for @quote_energetic_1.
  ///
  /// In en, this message translates to:
  /// **'Energy and persistence conquer all things.'**
  String get quote_energetic_1;

  /// No description provided for @quote_energetic_2.
  ///
  /// In en, this message translates to:
  /// **'Don\'t stop when you\'re tired, stop when you\'re done.'**
  String get quote_energetic_2;

  /// No description provided for @quote_energetic_3.
  ///
  /// In en, this message translates to:
  /// **'Every day is a new page. Make it energetic!'**
  String get quote_energetic_3;

  /// No description provided for @quote_energetic_4.
  ///
  /// In en, this message translates to:
  /// **'Success is not final; failure is not fatal: it is the courage to continue that counts.'**
  String get quote_energetic_4;

  /// No description provided for @quote_energetic_5.
  ///
  /// In en, this message translates to:
  /// **'The only limit is our imagination.'**
  String get quote_energetic_5;

  /// No description provided for @quote_motivated_1.
  ///
  /// In en, this message translates to:
  /// **'Motivation gets you started. Habit keeps you going.'**
  String get quote_motivated_1;

  /// No description provided for @quote_motivated_2.
  ///
  /// In en, this message translates to:
  /// **'A single person with a desire is an unstoppable force.'**
  String get quote_motivated_2;

  /// No description provided for @quote_motivated_3.
  ///
  /// In en, this message translates to:
  /// **'The secret of getting ahead is getting started.'**
  String get quote_motivated_3;

  /// No description provided for @quote_motivated_4.
  ///
  /// In en, this message translates to:
  /// **'Be so good they can\'t ignore you.'**
  String get quote_motivated_4;

  /// No description provided for @quote_motivated_5.
  ///
  /// In en, this message translates to:
  /// **'Every master was once a disaster.'**
  String get quote_motivated_5;

  /// No description provided for @quote_stressed_1.
  ///
  /// In en, this message translates to:
  /// **'You cannot control everything that happens. Control how you react.'**
  String get quote_stressed_1;

  /// No description provided for @quote_stressed_2.
  ///
  /// In en, this message translates to:
  /// **'Take a break. A tired mind cannot make good decisions.'**
  String get quote_stressed_2;

  /// No description provided for @quote_stressed_3.
  ///
  /// In en, this message translates to:
  /// **'Accept what is, let go of what was, and have faith in what will be.'**
  String get quote_stressed_3;

  /// No description provided for @quote_stressed_4.
  ///
  /// In en, this message translates to:
  /// **'You are not obligated to finish everything today.'**
  String get quote_stressed_4;

  /// No description provided for @quote_stressed_5.
  ///
  /// In en, this message translates to:
  /// **'Detachment from the outcome is the key to inner peace.'**
  String get quote_stressed_5;

  /// No description provided for @quote_nostalgic_1.
  ///
  /// In en, this message translates to:
  /// **'Memories are the treasure of the soul.'**
  String get quote_nostalgic_1;

  /// No description provided for @quote_nostalgic_2.
  ///
  /// In en, this message translates to:
  /// **'Remember that the past is a lesson, not a punishment.'**
  String get quote_nostalgic_2;

  /// No description provided for @quote_nostalgic_3.
  ///
  /// In en, this message translates to:
  /// **'Nostalgia is the pain of a past joy.'**
  String get quote_nostalgic_3;

  /// No description provided for @quote_nostalgic_4.
  ///
  /// In en, this message translates to:
  /// **'Time doesn\'t heal, but it helps reorganize memories.'**
  String get quote_nostalgic_4;

  /// No description provided for @quote_nostalgic_5.
  ///
  /// In en, this message translates to:
  /// **'Memories are the way we keep track of our lives.'**
  String get quote_nostalgic_5;

  /// No description provided for @quote_focused_1.
  ///
  /// In en, this message translates to:
  /// **'Focus on being productive, not busy.'**
  String get quote_focused_1;

  /// No description provided for @quote_focused_2.
  ///
  /// In en, this message translates to:
  /// **'The key to success is to focus on goals, not obstacles.'**
  String get quote_focused_2;

  /// No description provided for @quote_focused_3.
  ///
  /// In en, this message translates to:
  /// **'Where your attention goes, your energy flows.'**
  String get quote_focused_3;

  /// No description provided for @quote_focused_4.
  ///
  /// In en, this message translates to:
  /// **'Choose not to be distracted.'**
  String get quote_focused_4;

  /// No description provided for @quote_focused_5.
  ///
  /// In en, this message translates to:
  /// **'A steady mind in the midst of a storm brings clarity.'**
  String get quote_focused_5;

  /// No description provided for @quest_happy_title_1.
  ///
  /// In en, this message translates to:
  /// **'Share the joy'**
  String get quest_happy_title_1;

  /// No description provided for @quest_happy_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Send a positive message to a loved one.'**
  String get quest_happy_desc_1;

  /// No description provided for @quest_happy_title_2.
  ///
  /// In en, this message translates to:
  /// **'Note down what you are grateful for'**
  String get quest_happy_title_2;

  /// No description provided for @quest_happy_desc_2.
  ///
  /// In en, this message translates to:
  /// **'Write three things that went well for you today.'**
  String get quest_happy_desc_2;

  /// No description provided for @quest_happy_title_3.
  ///
  /// In en, this message translates to:
  /// **'Create a small piece of art'**
  String get quest_happy_title_3;

  /// No description provided for @quest_happy_desc_3.
  ///
  /// In en, this message translates to:
  /// **'Draw or paint something that makes you smile.'**
  String get quest_happy_desc_3;

  /// No description provided for @quest_happy_title_4.
  ///
  /// In en, this message translates to:
  /// **'Movement for joy'**
  String get quest_happy_title_4;

  /// No description provided for @quest_happy_desc_4.
  ///
  /// In en, this message translates to:
  /// **'Dance for 5 minutes to a fast song.'**
  String get quest_happy_desc_4;

  /// No description provided for @quest_happy_title_5.
  ///
  /// In en, this message translates to:
  /// **'Find a funny moment'**
  String get quest_happy_title_5;

  /// No description provided for @quest_happy_desc_5.
  ///
  /// In en, this message translates to:
  /// **'Watch a funny clip or read a joke.'**
  String get quest_happy_desc_5;

  /// No description provided for @quest_happy_title_6.
  ///
  /// In en, this message translates to:
  /// **'Send a kind word'**
  String get quest_happy_title_6;

  /// No description provided for @quest_happy_desc_6.
  ///
  /// In en, this message translates to:
  /// **'Tell someone what you like about them or what you appreciate.'**
  String get quest_happy_desc_6;

  /// No description provided for @quest_happy_title_7.
  ///
  /// In en, this message translates to:
  /// **'Listen to the song that makes you happy'**
  String get quest_happy_title_7;

  /// No description provided for @quest_happy_desc_7.
  ///
  /// In en, this message translates to:
  /// **'Play the song that instantly makes you smile.'**
  String get quest_happy_desc_7;

  /// No description provided for @quest_happy_title_8.
  ///
  /// In en, this message translates to:
  /// **'Offer a smile to a stranger'**
  String get quest_happy_title_8;

  /// No description provided for @quest_happy_desc_8.
  ///
  /// In en, this message translates to:
  /// **'Intentionally smile at someone you don\'t know.'**
  String get quest_happy_desc_8;

  /// No description provided for @quest_happy_title_9.
  ///
  /// In en, this message translates to:
  /// **'Journal one reason'**
  String get quest_happy_title_9;

  /// No description provided for @quest_happy_desc_9.
  ///
  /// In en, this message translates to:
  /// **'Write down the happiest part of your day.'**
  String get quest_happy_desc_9;

  /// No description provided for @quest_happy_title_10.
  ///
  /// In en, this message translates to:
  /// **'Give a \'High Five\''**
  String get quest_happy_title_10;

  /// No description provided for @quest_happy_desc_10.
  ///
  /// In en, this message translates to:
  /// **'Ask someone for a \'high five\' or hug a loved one.'**
  String get quest_happy_desc_10;

  /// No description provided for @quest_sad_title_1.
  ///
  /// In en, this message translates to:
  /// **'Listen to your favorite song'**
  String get quest_sad_title_1;

  /// No description provided for @quest_sad_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Put on a song that reminds you of good times.'**
  String get quest_sad_desc_1;

  /// No description provided for @quest_sad_title_2.
  ///
  /// In en, this message translates to:
  /// **'Call a friend'**
  String get quest_sad_title_2;

  /// No description provided for @quest_sad_desc_2.
  ///
  /// In en, this message translates to:
  /// **'Connection always helps.'**
  String get quest_sad_desc_2;

  /// No description provided for @quest_sad_title_3.
  ///
  /// In en, this message translates to:
  /// **'Be kind to yourself'**
  String get quest_sad_title_3;

  /// No description provided for @quest_sad_desc_3.
  ///
  /// In en, this message translates to:
  /// **'Allow yourself to cry if you need to.'**
  String get quest_sad_desc_3;

  /// No description provided for @quest_sad_title_4.
  ///
  /// In en, this message translates to:
  /// **'Pet an animal'**
  String get quest_sad_title_4;

  /// No description provided for @quest_sad_desc_4.
  ///
  /// In en, this message translates to:
  /// **'Interacting with animals releases oxytocin.'**
  String get quest_sad_desc_4;

  /// No description provided for @quest_sad_title_5.
  ///
  /// In en, this message translates to:
  /// **'Make a hot cup of tea'**
  String get quest_sad_title_5;

  /// No description provided for @quest_sad_desc_5.
  ///
  /// In en, this message translates to:
  /// **'Warm drinks help with emotional comfort.'**
  String get quest_sad_desc_5;

  /// No description provided for @quest_sad_title_6.
  ///
  /// In en, this message translates to:
  /// **'The 5-minute rule'**
  String get quest_sad_title_6;

  /// No description provided for @quest_sad_desc_6.
  ///
  /// In en, this message translates to:
  /// **'Allow yourself to be sad for only 5 minutes. Then, change your focus.'**
  String get quest_sad_desc_6;

  /// No description provided for @quest_sad_title_7.
  ///
  /// In en, this message translates to:
  /// **'Note 3 things from today'**
  String get quest_sad_title_7;

  /// No description provided for @quest_sad_desc_7.
  ///
  /// In en, this message translates to:
  /// **'Write down three things, no matter how small, that you are grateful for.'**
  String get quest_sad_desc_7;

  /// No description provided for @quest_sad_title_8.
  ///
  /// In en, this message translates to:
  /// **'Handle one small thing'**
  String get quest_sad_title_8;

  /// No description provided for @quest_sad_desc_8.
  ///
  /// In en, this message translates to:
  /// **'Clean up one small area (e.g., drawer, table). A small victory helps.'**
  String get quest_sad_desc_8;

  /// No description provided for @quest_sad_title_9.
  ///
  /// In en, this message translates to:
  /// **'Embrace yourself'**
  String get quest_sad_title_9;

  /// No description provided for @quest_sad_desc_9.
  ///
  /// In en, this message translates to:
  /// **'Take a warm bath or wrap yourself in a soft blanket.'**
  String get quest_sad_desc_9;

  /// No description provided for @quest_sad_title_10.
  ///
  /// In en, this message translates to:
  /// **'Listen to a Podcast'**
  String get quest_sad_title_10;

  /// No description provided for @quest_sad_desc_10.
  ///
  /// In en, this message translates to:
  /// **'Listen to an episode of a motivational or funny podcast.'**
  String get quest_sad_desc_10;

  /// No description provided for @quest_sad_title_11.
  ///
  /// In en, this message translates to:
  /// **'Take a short walk'**
  String get quest_sad_title_11;

  /// No description provided for @quest_sad_desc_11.
  ///
  /// In en, this message translates to:
  /// **'Go outside for 10 minutes. A change of scenery helps.'**
  String get quest_sad_desc_11;

  /// No description provided for @quest_sad_title_12.
  ///
  /// In en, this message translates to:
  /// **'Note your feeling'**
  String get quest_sad_title_12;

  /// No description provided for @quest_sad_desc_12.
  ///
  /// In en, this message translates to:
  /// **'Describe exactly what you feel. Naming it helps you process it.'**
  String get quest_sad_desc_12;

  /// No description provided for @quest_sad_title_13.
  ///
  /// In en, this message translates to:
  /// **'No Social Media'**
  String get quest_sad_title_13;

  /// No description provided for @quest_sad_desc_13.
  ///
  /// In en, this message translates to:
  /// **'Take a 30-minute break from social media.'**
  String get quest_sad_desc_13;

  /// No description provided for @quest_sad_title_14.
  ///
  /// In en, this message translates to:
  /// **'Eat a healthy snack'**
  String get quest_sad_title_14;

  /// No description provided for @quest_sad_desc_14.
  ///
  /// In en, this message translates to:
  /// **'Eat a piece of fruit or something nutritious. Take care of your body.'**
  String get quest_sad_desc_14;

  /// No description provided for @quest_sad_title_15.
  ///
  /// In en, this message translates to:
  /// **'Help someone'**
  String get quest_sad_title_15;

  /// No description provided for @quest_sad_desc_15.
  ///
  /// In en, this message translates to:
  /// **'Send a message to a friend asking how they feel.'**
  String get quest_sad_desc_15;

  /// No description provided for @quest_relaxed_title_1.
  ///
  /// In en, this message translates to:
  /// **'Drink a glass of water'**
  String get quest_relaxed_title_1;

  /// No description provided for @quest_relaxed_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Hydration helps calm the nervous system.'**
  String get quest_relaxed_desc_1;

  /// No description provided for @quest_relaxed_title_2.
  ///
  /// In en, this message translates to:
  /// **'Meditate for 5 minutes'**
  String get quest_relaxed_title_2;

  /// No description provided for @quest_relaxed_desc_2.
  ///
  /// In en, this message translates to:
  /// **'Focus on your breath to re-anchor yourself.'**
  String get quest_relaxed_desc_2;

  /// No description provided for @quest_relaxed_title_3.
  ///
  /// In en, this message translates to:
  /// **'Visualize a calm place'**
  String get quest_relaxed_title_3;

  /// No description provided for @quest_relaxed_desc_3.
  ///
  /// In en, this message translates to:
  /// **'Close your eyes and imagine a place where you feel safe.'**
  String get quest_relaxed_desc_3;

  /// No description provided for @quest_relaxed_title_4.
  ///
  /// In en, this message translates to:
  /// **'Don\'t read the news for an hour'**
  String get quest_relaxed_title_4;

  /// No description provided for @quest_relaxed_desc_4.
  ///
  /// In en, this message translates to:
  /// **'A break from the information flow is essential.'**
  String get quest_relaxed_desc_4;

  /// No description provided for @quest_relaxed_title_5.
  ///
  /// In en, this message translates to:
  /// **'Light a scented candle'**
  String get quest_relaxed_title_5;

  /// No description provided for @quest_relaxed_desc_5.
  ///
  /// In en, this message translates to:
  /// **'Use aromatherapy to soothe your senses.'**
  String get quest_relaxed_desc_5;

  /// No description provided for @quest_relaxed_title_6.
  ///
  /// In en, this message translates to:
  /// **'No screens'**
  String get quest_relaxed_title_6;

  /// No description provided for @quest_relaxed_desc_6.
  ///
  /// In en, this message translates to:
  /// **'Spend 30 minutes without looking at your phone, TV, or monitor.'**
  String get quest_relaxed_desc_6;

  /// No description provided for @quest_relaxed_title_7.
  ///
  /// In en, this message translates to:
  /// **'Listen to nature sounds'**
  String get quest_relaxed_title_7;

  /// No description provided for @quest_relaxed_desc_7.
  ///
  /// In en, this message translates to:
  /// **'Put on a recording of rain, waves, or a forest.'**
  String get quest_relaxed_desc_7;

  /// No description provided for @quest_relaxed_title_8.
  ///
  /// In en, this message translates to:
  /// **'Quick facial massage'**
  String get quest_relaxed_title_8;

  /// No description provided for @quest_relaxed_desc_8.
  ///
  /// In en, this message translates to:
  /// **'Massage your temples and forehead for 2 minutes.'**
  String get quest_relaxed_desc_8;

  /// No description provided for @quest_relaxed_title_9.
  ///
  /// In en, this message translates to:
  /// **'Total silence'**
  String get quest_relaxed_title_9;

  /// No description provided for @quest_relaxed_desc_9.
  ///
  /// In en, this message translates to:
  /// **'Sit in complete silence for 5 minutes, focusing on your breathing.'**
  String get quest_relaxed_desc_9;

  /// No description provided for @quest_relaxed_title_10.
  ///
  /// In en, this message translates to:
  /// **'Drink a warm beverage'**
  String get quest_relaxed_title_10;

  /// No description provided for @quest_relaxed_desc_10.
  ///
  /// In en, this message translates to:
  /// **'Make yourself a tea or hot chocolate, savoring every sip.'**
  String get quest_relaxed_desc_10;

  /// No description provided for @quest_relaxed_title_11.
  ///
  /// In en, this message translates to:
  /// **'Change position'**
  String get quest_relaxed_title_11;

  /// No description provided for @quest_relaxed_desc_11.
  ///
  /// In en, this message translates to:
  /// **'Lie down on the floor (on a mat) for 10 minutes. The change in perspective relaxes you.'**
  String get quest_relaxed_desc_11;

  /// No description provided for @quest_relaxed_title_12.
  ///
  /// In en, this message translates to:
  /// **'Look out the window'**
  String get quest_relaxed_title_12;

  /// No description provided for @quest_relaxed_desc_12.
  ///
  /// In en, this message translates to:
  /// **'Observe the landscape or the sky for 5 minutes without other thoughts.'**
  String get quest_relaxed_desc_12;

  /// No description provided for @quest_relaxed_title_13.
  ///
  /// In en, this message translates to:
  /// **'Gentle stretching'**
  String get quest_relaxed_title_13;

  /// No description provided for @quest_relaxed_desc_13.
  ///
  /// In en, this message translates to:
  /// **'Do a series of simple stretches for your neck, shoulders, and back.'**
  String get quest_relaxed_desc_13;

  /// No description provided for @quest_relaxed_title_14.
  ///
  /// In en, this message translates to:
  /// **'Visit a beautiful place online'**
  String get quest_relaxed_title_14;

  /// No description provided for @quest_relaxed_desc_14.
  ///
  /// In en, this message translates to:
  /// **'Look for images or clips of a place in the world that fascinates you.'**
  String get quest_relaxed_desc_14;

  /// No description provided for @quest_relaxed_title_15.
  ///
  /// In en, this message translates to:
  /// **'Think of a pleasant memory'**
  String get quest_relaxed_title_15;

  /// No description provided for @quest_relaxed_desc_15.
  ///
  /// In en, this message translates to:
  /// **'Revisit a happy moment from the past, recalling the details.'**
  String get quest_relaxed_desc_15;

  /// No description provided for @quest_energetic_title_1.
  ///
  /// In en, this message translates to:
  /// **'Do a set of squats'**
  String get quest_energetic_title_1;

  /// No description provided for @quest_energetic_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Get your blood flowing quickly.'**
  String get quest_energetic_desc_1;

  /// No description provided for @quest_energetic_title_2.
  ///
  /// In en, this message translates to:
  /// **'Write a list of crazy ideas'**
  String get quest_energetic_title_2;

  /// No description provided for @quest_energetic_desc_2.
  ///
  /// In en, this message translates to:
  /// **'Use your energy for maximum creativity.'**
  String get quest_energetic_desc_2;

  /// No description provided for @quest_energetic_title_3.
  ///
  /// In en, this message translates to:
  /// **'Dance freely'**
  String get quest_energetic_title_3;

  /// No description provided for @quest_energetic_desc_3.
  ///
  /// In en, this message translates to:
  /// **'Put on some music and shake off the excess energy.'**
  String get quest_energetic_desc_3;

  /// No description provided for @quest_energetic_title_4.
  ///
  /// In en, this message translates to:
  /// **'Sing loudly'**
  String get quest_energetic_title_4;

  /// No description provided for @quest_energetic_desc_4.
  ///
  /// In en, this message translates to:
  /// **'Use your voice to release energy.'**
  String get quest_energetic_desc_4;

  /// No description provided for @quest_energetic_title_5.
  ///
  /// In en, this message translates to:
  /// **'Run or walk fast'**
  String get quest_energetic_title_5;

  /// No description provided for @quest_energetic_desc_5.
  ///
  /// In en, this message translates to:
  /// **'A short burst of outdoor movement.'**
  String get quest_energetic_desc_5;

  /// No description provided for @quest_energetic_title_6.
  ///
  /// In en, this message translates to:
  /// **'Learn something new in 5 min'**
  String get quest_energetic_title_6;

  /// No description provided for @quest_energetic_desc_6.
  ///
  /// In en, this message translates to:
  /// **'Use the energy to look up a new fact or a foreign word.'**
  String get quest_energetic_desc_6;

  /// No description provided for @quest_energetic_title_7.
  ///
  /// In en, this message translates to:
  /// **'Quick DIY project'**
  String get quest_energetic_title_7;

  /// No description provided for @quest_energetic_desc_7.
  ///
  /// In en, this message translates to:
  /// **'Take on a small repair or creation project that lasts a maximum of 30 minutes.'**
  String get quest_energetic_desc_7;

  /// No description provided for @quest_energetic_title_8.
  ///
  /// In en, this message translates to:
  /// **'Tidy up the inbox'**
  String get quest_energetic_title_8;

  /// No description provided for @quest_energetic_desc_8.
  ///
  /// In en, this message translates to:
  /// **'Delete or archive 10 unnecessary emails.'**
  String get quest_energetic_desc_8;

  /// No description provided for @quest_energetic_title_9.
  ///
  /// In en, this message translates to:
  /// **'Targeted walk'**
  String get quest_energetic_title_9;

  /// No description provided for @quest_energetic_desc_9.
  ///
  /// In en, this message translates to:
  /// **'Walk quickly to a fixed point (a tree, a building) and back.'**
  String get quest_energetic_desc_9;

  /// No description provided for @quest_energetic_title_10.
  ///
  /// In en, this message translates to:
  /// **'Cook something new'**
  String get quest_energetic_title_10;

  /// No description provided for @quest_energetic_desc_10.
  ///
  /// In en, this message translates to:
  /// **'Channel the energy into the kitchen and try a simple recipe.'**
  String get quest_energetic_desc_10;

  /// No description provided for @quest_energetic_title_11.
  ///
  /// In en, this message translates to:
  /// **'Note 3 wild ideas'**
  String get quest_energetic_title_11;

  /// No description provided for @quest_energetic_desc_11.
  ///
  /// In en, this message translates to:
  /// **'Quickly write down 3 unconventional ideas or concepts you could explore.'**
  String get quest_energetic_desc_11;

  /// No description provided for @quest_energetic_title_12.
  ///
  /// In en, this message translates to:
  /// **'Short HIIT workout'**
  String get quest_energetic_title_12;

  /// No description provided for @quest_energetic_desc_12.
  ///
  /// In en, this message translates to:
  /// **'Do a short (5-10 minute) high-intensity interval training session.'**
  String get quest_energetic_desc_12;

  /// No description provided for @quest_energetic_title_13.
  ///
  /// In en, this message translates to:
  /// **'Call an old friend'**
  String get quest_energetic_title_13;

  /// No description provided for @quest_energetic_desc_13.
  ///
  /// In en, this message translates to:
  /// **'Use your eloquence to catch up with a loved one.'**
  String get quest_energetic_desc_13;

  /// No description provided for @quest_energetic_title_14.
  ///
  /// In en, this message translates to:
  /// **'Organize your files'**
  String get quest_energetic_title_14;

  /// No description provided for @quest_energetic_desc_14.
  ///
  /// In en, this message translates to:
  /// **'Reorder or delete files on your computer desktop.'**
  String get quest_energetic_desc_14;

  /// No description provided for @quest_energetic_title_15.
  ///
  /// In en, this message translates to:
  /// **'Express yourself artistically'**
  String get quest_energetic_title_15;

  /// No description provided for @quest_energetic_desc_15.
  ///
  /// In en, this message translates to:
  /// **'Write a short poem, haiku, or quick poetry.'**
  String get quest_energetic_desc_15;

  /// No description provided for @quest_motivated_title_1.
  ///
  /// In en, this message translates to:
  /// **'Set a micro-goal'**
  String get quest_motivated_title_1;

  /// No description provided for @quest_motivated_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Choose a task you can finish in 15 minutes.'**
  String get quest_motivated_desc_1;

  /// No description provided for @quest_motivated_title_2.
  ///
  /// In en, this message translates to:
  /// **'Reorganize your workspace'**
  String get quest_motivated_title_2;

  /// No description provided for @quest_motivated_desc_2.
  ///
  /// In en, this message translates to:
  /// **'A clean environment helps concentration.'**
  String get quest_motivated_desc_2;

  /// No description provided for @quest_motivated_title_3.
  ///
  /// In en, this message translates to:
  /// **'Learn a new trick'**
  String get quest_motivated_title_3;

  /// No description provided for @quest_motivated_desc_3.
  ///
  /// In en, this message translates to:
  /// **'Watch a 5-minute tutorial and apply it.'**
  String get quest_motivated_desc_3;

  /// No description provided for @quest_motivated_title_4.
  ///
  /// In en, this message translates to:
  /// **'Write a letter to your future self'**
  String get quest_motivated_title_4;

  /// No description provided for @quest_motivated_desc_4.
  ///
  /// In en, this message translates to:
  /// **'What advice would you give tomorrow\'s self?'**
  String get quest_motivated_desc_4;

  /// No description provided for @quest_motivated_title_5.
  ///
  /// In en, this message translates to:
  /// **'Plan the next week'**
  String get quest_motivated_title_5;

  /// No description provided for @quest_motivated_desc_5.
  ///
  /// In en, this message translates to:
  /// **'Clear planning gives you a sense of control.'**
  String get quest_motivated_desc_5;

  /// No description provided for @quest_motivated_title_6.
  ///
  /// In en, this message translates to:
  /// **'Visualize success'**
  String get quest_motivated_title_6;

  /// No description provided for @quest_motivated_desc_6.
  ///
  /// In en, this message translates to:
  /// **'Close your eyes and imagine the desired outcome of your work.'**
  String get quest_motivated_desc_6;

  /// No description provided for @quest_motivated_title_7.
  ///
  /// In en, this message translates to:
  /// **'Read an inspirational quote'**
  String get quest_motivated_title_7;

  /// No description provided for @quest_motivated_desc_7.
  ///
  /// In en, this message translates to:
  /// **'Find a phrase that motivates you and write it on a post-it.'**
  String get quest_motivated_desc_7;

  /// No description provided for @quest_motivated_title_8.
  ///
  /// In en, this message translates to:
  /// **'Make a 3-2-1 Plan'**
  String get quest_motivated_title_8;

  /// No description provided for @quest_motivated_desc_8.
  ///
  /// In en, this message translates to:
  /// **'Name 3 big, 2 medium, 1 small tasks you will do today.'**
  String get quest_motivated_desc_8;

  /// No description provided for @quest_motivated_title_9.
  ///
  /// In en, this message translates to:
  /// **'Learn a new word'**
  String get quest_motivated_title_9;

  /// No description provided for @quest_motivated_desc_9.
  ///
  /// In en, this message translates to:
  /// **'Expand your vocabulary. Knowledge empowers you.'**
  String get quest_motivated_desc_9;

  /// No description provided for @quest_motivated_title_10.
  ///
  /// In en, this message translates to:
  /// **'Recharge your physical battery'**
  String get quest_motivated_title_10;

  /// No description provided for @quest_motivated_desc_10.
  ///
  /// In en, this message translates to:
  /// **'Do 10 squats or 10 push-ups to wake up your body.'**
  String get quest_motivated_desc_10;

  /// No description provided for @quest_motivated_title_11.
  ///
  /// In en, this message translates to:
  /// **'Change your desktop background'**
  String get quest_motivated_title_11;

  /// No description provided for @quest_motivated_desc_11.
  ///
  /// In en, this message translates to:
  /// **'Choose an image that inspires you and reminds you of a goal.'**
  String get quest_motivated_desc_11;

  /// No description provided for @quest_motivated_title_12.
  ///
  /// In en, this message translates to:
  /// **'Eliminate a distraction'**
  String get quest_motivated_title_12;

  /// No description provided for @quest_motivated_desc_12.
  ///
  /// In en, this message translates to:
  /// **'Identify the biggest distraction around you and remove it for 30 minutes.'**
  String get quest_motivated_desc_12;

  /// No description provided for @quest_motivated_title_13.
  ///
  /// In en, this message translates to:
  /// **'Be a Mentor'**
  String get quest_motivated_title_13;

  /// No description provided for @quest_motivated_desc_13.
  ///
  /// In en, this message translates to:
  /// **'Offer a solution or advice to someone who has a problem.'**
  String get quest_motivated_desc_13;

  /// No description provided for @quest_motivated_title_14.
  ///
  /// In en, this message translates to:
  /// **'Prioritize what NOT to do'**
  String get quest_motivated_title_14;

  /// No description provided for @quest_motivated_desc_14.
  ///
  /// In en, this message translates to:
  /// **'Write down 3 things you will *not* do today to focus on what is important.'**
  String get quest_motivated_desc_14;

  /// No description provided for @quest_motivated_title_15.
  ///
  /// In en, this message translates to:
  /// **'Small Action Step'**
  String get quest_motivated_title_15;

  /// No description provided for @quest_motivated_desc_15.
  ///
  /// In en, this message translates to:
  /// **'Take the first (smallest) step of a large task you have been putting off.'**
  String get quest_motivated_desc_15;

  /// No description provided for @quest_stressed_title_1.
  ///
  /// In en, this message translates to:
  /// **'5-minute breathing exercise'**
  String get quest_stressed_title_1;

  /// No description provided for @quest_stressed_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Practice the 4-7-8 deep breathing technique.'**
  String get quest_stressed_desc_1;

  /// No description provided for @quest_stressed_title_2.
  ///
  /// In en, this message translates to:
  /// **'Write down all your worries'**
  String get quest_stressed_title_2;

  /// No description provided for @quest_stressed_desc_2.
  ///
  /// In en, this message translates to:
  /// **'Move your thoughts from your head onto paper.'**
  String get quest_stressed_desc_2;

  /// No description provided for @quest_stressed_title_6.
  ///
  /// In en, this message translates to:
  /// **'4-7-8 Breathing'**
  String get quest_stressed_title_6;

  /// No description provided for @quest_stressed_desc_6.
  ///
  /// In en, this message translates to:
  /// **'Inhale for 4 seconds, hold for 7, exhale for 8. Repeat 4 times.'**
  String get quest_stressed_desc_6;

  /// No description provided for @quest_stressed_title_7.
  ///
  /// In en, this message translates to:
  /// **'Task shattering'**
  String get quest_stressed_title_7;

  /// No description provided for @quest_stressed_desc_7.
  ///
  /// In en, this message translates to:
  /// **'Take the biggest stressful task and break it down into 3 small steps.'**
  String get quest_stressed_desc_7;

  /// No description provided for @quest_stressed_title_8.
  ///
  /// In en, this message translates to:
  /// **'Go outside barefoot for 5 minutes'**
  String get quest_stressed_title_8;

  /// No description provided for @quest_stressed_desc_8.
  ///
  /// In en, this message translates to:
  /// **'Touch the ground, grass, or rug with your feet. It helps with grounding.'**
  String get quest_stressed_desc_8;

  /// No description provided for @quest_stressed_title_9.
  ///
  /// In en, this message translates to:
  /// **'Be mindful of your jaw'**
  String get quest_stressed_title_9;

  /// No description provided for @quest_stressed_desc_9.
  ///
  /// In en, this message translates to:
  /// **'Intentionally relax your jaw and shoulders. Physical de-tensioning helps.'**
  String get quest_stressed_desc_9;

  /// No description provided for @quest_stressed_title_10.
  ///
  /// In en, this message translates to:
  /// **'Listen to White Noise'**
  String get quest_stressed_title_10;

  /// No description provided for @quest_stressed_desc_10.
  ///
  /// In en, this message translates to:
  /// **'Put on a track of white noise or ambient sounds to block your thoughts.'**
  String get quest_stressed_desc_10;

  /// No description provided for @quest_stressed_title_11.
  ///
  /// In en, this message translates to:
  /// **'Make a \'Dump\' List'**
  String get quest_stressed_title_11;

  /// No description provided for @quest_stressed_desc_11.
  ///
  /// In en, this message translates to:
  /// **'Write down all the things you have to do on a sheet of paper, and then tear it up.'**
  String get quest_stressed_desc_11;

  /// No description provided for @quest_stressed_title_12.
  ///
  /// In en, this message translates to:
  /// **'Take a cold water break'**
  String get quest_stressed_title_12;

  /// No description provided for @quest_stressed_desc_12.
  ///
  /// In en, this message translates to:
  /// **'Put cold water on your wrists or the back of your neck. Vagus nerve stimulation helps calm you.'**
  String get quest_stressed_desc_12;

  /// No description provided for @quest_stressed_title_13.
  ///
  /// In en, this message translates to:
  /// **'Reduce blue light'**
  String get quest_stressed_title_13;

  /// No description provided for @quest_stressed_desc_13.
  ///
  /// In en, this message translates to:
  /// **'If it\'s evening, use blue light filters or use warm lighting.'**
  String get quest_stressed_desc_13;

  /// No description provided for @quest_stressed_title_14.
  ///
  /// In en, this message translates to:
  /// **'Allow yourself to delay a decision'**
  String get quest_stressed_title_14;

  /// No description provided for @quest_stressed_desc_14.
  ///
  /// In en, this message translates to:
  /// **'Stress does not help with good decisions. Postpone a small decision until tomorrow.'**
  String get quest_stressed_desc_14;

  /// No description provided for @quest_stressed_title_15.
  ///
  /// In en, this message translates to:
  /// **'Ask for Help (Delegate)'**
  String get quest_stressed_title_15;

  /// No description provided for @quest_stressed_desc_15.
  ///
  /// In en, this message translates to:
  /// **'If possible, ask someone to take over a minor task from you.'**
  String get quest_stressed_desc_15;

  /// No description provided for @quest_stressed_title_3.
  ///
  /// In en, this message translates to:
  /// **'A walk without your phone'**
  String get quest_stressed_title_3;

  /// No description provided for @quest_stressed_desc_3.
  ///
  /// In en, this message translates to:
  /// **'Focus on what you see and hear around you.'**
  String get quest_stressed_desc_3;

  /// No description provided for @quest_stressed_title_4.
  ///
  /// In en, this message translates to:
  /// **'Take a warm shower/bath'**
  String get quest_stressed_title_4;

  /// No description provided for @quest_stressed_desc_4.
  ///
  /// In en, this message translates to:
  /// **'Warm water relaxes tense muscles.'**
  String get quest_stressed_desc_4;

  /// No description provided for @quest_stressed_title_5.
  ///
  /// In en, this message translates to:
  /// **'Stop and smell the coffee'**
  String get quest_stressed_title_5;

  /// No description provided for @quest_stressed_desc_5.
  ///
  /// In en, this message translates to:
  /// **'Take a break from work and enjoy a warm drink.'**
  String get quest_stressed_desc_5;

  /// No description provided for @quest_nostalgic_title_1.
  ///
  /// In en, this message translates to:
  /// **'Flip through an old photo'**
  String get quest_nostalgic_title_1;

  /// No description provided for @quest_nostalgic_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Relive a pleasant memory for a few minutes.'**
  String get quest_nostalgic_desc_1;

  /// No description provided for @quest_nostalgic_title_2.
  ///
  /// In en, this message translates to:
  /// **'Write a letter (don\'t send it)'**
  String get quest_nostalgic_title_2;

  /// No description provided for @quest_nostalgic_desc_2.
  ///
  /// In en, this message translates to:
  /// **'Put your feelings about the past down on paper.'**
  String get quest_nostalgic_desc_2;

  /// No description provided for @quest_nostalgic_title_3.
  ///
  /// In en, this message translates to:
  /// **'Call someone from childhood'**
  String get quest_nostalgic_title_3;

  /// No description provided for @quest_nostalgic_desc_3.
  ///
  /// In en, this message translates to:
  /// **'Reconnect with a person from your past.'**
  String get quest_nostalgic_desc_3;

  /// No description provided for @quest_nostalgic_title_4.
  ///
  /// In en, this message translates to:
  /// **'Cook an old recipe'**
  String get quest_nostalgic_title_4;

  /// No description provided for @quest_nostalgic_desc_4.
  ///
  /// In en, this message translates to:
  /// **'Make a meal that reminds you of home.'**
  String get quest_nostalgic_desc_4;

  /// No description provided for @quest_nostalgic_title_5.
  ///
  /// In en, this message translates to:
  /// **'Watch a favorite old movie'**
  String get quest_nostalgic_title_5;

  /// No description provided for @quest_nostalgic_desc_5.
  ///
  /// In en, this message translates to:
  /// **'Re-watch a cinematic production you miss.'**
  String get quest_nostalgic_desc_5;

  /// No description provided for @quest_nostalgic_title_6.
  ///
  /// In en, this message translates to:
  /// **'Rediscover an old object'**
  String get quest_nostalgic_title_6;

  /// No description provided for @quest_nostalgic_desc_6.
  ///
  /// In en, this message translates to:
  /// **'Look for an object from your childhood that reminds you of a story.'**
  String get quest_nostalgic_desc_6;

  /// No description provided for @quest_nostalgic_title_7.
  ///
  /// In en, this message translates to:
  /// **'Write an anecdote'**
  String get quest_nostalgic_title_7;

  /// No description provided for @quest_nostalgic_desc_7.
  ///
  /// In en, this message translates to:
  /// **'Quickly write down the funniest or most memorable incident from your past.'**
  String get quest_nostalgic_desc_7;

  /// No description provided for @quest_nostalgic_title_8.
  ///
  /// In en, this message translates to:
  /// **'Listen to a full album'**
  String get quest_nostalgic_title_8;

  /// No description provided for @quest_nostalgic_desc_8.
  ///
  /// In en, this message translates to:
  /// **'Put on a music album that you used to listen to non-stop during a certain period.'**
  String get quest_nostalgic_desc_8;

  /// No description provided for @quest_nostalgic_title_9.
  ///
  /// In en, this message translates to:
  /// **'Visit a cherished place'**
  String get quest_nostalgic_title_9;

  /// No description provided for @quest_nostalgic_desc_9.
  ///
  /// In en, this message translates to:
  /// **'Go to or think about a place (school, park, old house) that is dear to you.'**
  String get quest_nostalgic_desc_9;

  /// No description provided for @quest_nostalgic_title_10.
  ///
  /// In en, this message translates to:
  /// **'Relearn an old game'**
  String get quest_nostalgic_title_10;

  /// No description provided for @quest_nostalgic_desc_10.
  ///
  /// In en, this message translates to:
  /// **'Play a board game or a classic video game you had forgotten.'**
  String get quest_nostalgic_desc_10;

  /// No description provided for @quest_nostalgic_title_11.
  ///
  /// In en, this message translates to:
  /// **'Make a memory collage'**
  String get quest_nostalgic_title_11;

  /// No description provided for @quest_nostalgic_desc_11.
  ///
  /// In en, this message translates to:
  /// **'Gather a few old photos and create a small physical or digital collection.'**
  String get quest_nostalgic_desc_11;

  /// No description provided for @quest_nostalgic_title_12.
  ///
  /// In en, this message translates to:
  /// **'Create a time capsule'**
  String get quest_nostalgic_title_12;

  /// No description provided for @quest_nostalgic_desc_12.
  ///
  /// In en, this message translates to:
  /// **'Write a list of 5 things you are doing now and hide it for the future.'**
  String get quest_nostalgic_desc_12;

  /// No description provided for @quest_nostalgic_title_13.
  ///
  /// In en, this message translates to:
  /// **'Talk to a family member'**
  String get quest_nostalgic_title_13;

  /// No description provided for @quest_nostalgic_desc_13.
  ///
  /// In en, this message translates to:
  /// **'Call an older person (parent, grandparent) and listen to a story from the past.'**
  String get quest_nostalgic_desc_13;

  /// No description provided for @quest_nostalgic_title_14.
  ///
  /// In en, this message translates to:
  /// **'Take a nostalgic walk'**
  String get quest_nostalgic_title_14;

  /// No description provided for @quest_nostalgic_desc_14.
  ///
  /// In en, this message translates to:
  /// **'Walk a route you frequently took in the past (to school, home).'**
  String get quest_nostalgic_desc_14;

  /// No description provided for @quest_nostalgic_title_15.
  ///
  /// In en, this message translates to:
  /// **'Think of a lesson learned'**
  String get quest_nostalgic_title_15;

  /// No description provided for @quest_nostalgic_desc_15.
  ///
  /// In en, this message translates to:
  /// **'What is the most valuable lesson you learned from your past? Write it down.'**
  String get quest_nostalgic_desc_15;

  /// No description provided for @quest_focused_title_1.
  ///
  /// In en, this message translates to:
  /// **'Pomodoro Technique (25/5)'**
  String get quest_focused_title_1;

  /// No description provided for @quest_focused_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Work intensely for 25 minutes, take a 5-minute break.'**
  String get quest_focused_desc_1;

  /// No description provided for @quest_focused_title_2.
  ///
  /// In en, this message translates to:
  /// **'Disable notifications'**
  String get quest_focused_title_2;

  /// No description provided for @quest_focused_desc_2.
  ///
  /// In en, this message translates to:
  /// **'Eliminate all distractions for the next hour.'**
  String get quest_focused_desc_2;

  /// No description provided for @quest_focused_title_3.
  ///
  /// In en, this message translates to:
  /// **'Hydrate completely'**
  String get quest_focused_title_3;

  /// No description provided for @quest_focused_desc_3.
  ///
  /// In en, this message translates to:
  /// **'Drink a large glass of water. It aids cognitive function.'**
  String get quest_focused_desc_3;

  /// No description provided for @quest_focused_title_4.
  ///
  /// In en, this message translates to:
  /// **'Set a single goal for the next hour'**
  String get quest_focused_title_4;

  /// No description provided for @quest_focused_desc_4.
  ///
  /// In en, this message translates to:
  /// **'Choose the most important task and ignore the rest.'**
  String get quest_focused_desc_4;

  /// No description provided for @quest_focused_title_5.
  ///
  /// In en, this message translates to:
  /// **'Go outside for 5 minutes'**
  String get quest_focused_title_5;

  /// No description provided for @quest_focused_desc_5.
  ///
  /// In en, this message translates to:
  /// **'Refresh your mind with a breath of fresh air.'**
  String get quest_focused_desc_5;

  /// No description provided for @quest_focused_title_6.
  ///
  /// In en, this message translates to:
  /// **'Clean the desktop'**
  String get quest_focused_title_6;

  /// No description provided for @quest_focused_desc_6.
  ///
  /// In en, this message translates to:
  /// **'Hide or delete all unnecessary files from the screen.'**
  String get quest_focused_desc_6;

  /// No description provided for @quest_focused_title_7.
  ///
  /// In en, this message translates to:
  /// **'Single window'**
  String get quest_focused_title_7;

  /// No description provided for @quest_focused_desc_7.
  ///
  /// In en, this message translates to:
  /// **'Close all tabs and windows, leaving only the required application.'**
  String get quest_focused_desc_7;

  /// No description provided for @quest_focused_title_8.
  ///
  /// In en, this message translates to:
  /// **'Listen to background music'**
  String get quest_focused_title_8;

  /// No description provided for @quest_focused_desc_8.
  ///
  /// In en, this message translates to:
  /// **'Put on instrumental music or ambient sounds designed for concentration.'**
  String get quest_focused_desc_8;

  /// No description provided for @quest_focused_title_9.
  ///
  /// In en, this message translates to:
  /// **'Eat a brain snack'**
  String get quest_focused_title_9;

  /// No description provided for @quest_focused_desc_9.
  ///
  /// In en, this message translates to:
  /// **'Consume a handful of nuts or a piece of dark chocolate.'**
  String get quest_focused_desc_9;

  /// No description provided for @quest_focused_title_10.
  ///
  /// In en, this message translates to:
  /// **'The 5-minute method'**
  String get quest_focused_title_10;

  /// No description provided for @quest_focused_desc_10.
  ///
  /// In en, this message translates to:
  /// **'Work on a task you have been putting off for 5 minutes. The start is often the hardest part.'**
  String get quest_focused_desc_10;

  /// No description provided for @quest_focused_title_11.
  ///
  /// In en, this message translates to:
  /// **'Change the light source'**
  String get quest_focused_title_11;

  /// No description provided for @quest_focused_desc_11.
  ///
  /// In en, this message translates to:
  /// **'Make sure the light is optimal (natural or warm) for the work area.'**
  String get quest_focused_desc_11;

  /// No description provided for @quest_focused_title_12.
  ///
  /// In en, this message translates to:
  /// **'Set a reward'**
  String get quest_focused_title_12;

  /// No description provided for @quest_focused_desc_12.
  ///
  /// In en, this message translates to:
  /// **'Set a small reward that you receive after finishing the task.'**
  String get quest_focused_desc_12;

  /// No description provided for @quest_focused_title_13.
  ///
  /// In en, this message translates to:
  /// **'2-minute break'**
  String get quest_focused_title_13;

  /// No description provided for @quest_focused_desc_13.
  ///
  /// In en, this message translates to:
  /// **'Take a 2-minute break where you stand up, stretch, and move your gaze away from the screen.'**
  String get quest_focused_desc_13;

  /// No description provided for @quest_focused_title_14.
  ///
  /// In en, this message translates to:
  /// **'Write \'Why?\''**
  String get quest_focused_title_14;

  /// No description provided for @quest_focused_desc_14.
  ///
  /// In en, this message translates to:
  /// **'Remind yourself why you are doing this work. Clarity of purpose brings focus.'**
  String get quest_focused_desc_14;

  /// No description provided for @quest_focused_title_15.
  ///
  /// In en, this message translates to:
  /// **'Use airplane mode'**
  String get quest_focused_title_15;

  /// No description provided for @quest_focused_desc_15.
  ///
  /// In en, this message translates to:
  /// **'Activate airplane mode on your phone for a specific period of time.'**
  String get quest_focused_desc_15;

  /// No description provided for @accountTitle.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get accountTitle;

  /// No description provided for @accountPageWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to your profile page!'**
  String get accountPageWelcome;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @doQuestButton.
  ///
  /// In en, this message translates to:
  /// **'Accept Quest'**
  String get doQuestButton;

  /// No description provided for @closeButton.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeButton;

  /// No description provided for @activeQuestsTitle.
  ///
  /// In en, this message translates to:
  /// **'Active Quests'**
  String get activeQuestsTitle;

  /// No description provided for @noActiveQuests.
  ///
  /// In en, this message translates to:
  /// **'You have no active quests. Choose one from the main screen!'**
  String get noActiveQuests;

  /// No description provided for @mood.
  ///
  /// In en, this message translates to:
  /// **'Mood'**
  String get mood;

  /// No description provided for @questAcceptedMessage.
  ///
  /// In en, this message translates to:
  /// **'Quest Accepted'**
  String get questAcceptedMessage;

  /// No description provided for @cancelQuestButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel Quest'**
  String get cancelQuestButton;

  /// No description provided for @completeQuestButton.
  ///
  /// In en, this message translates to:
  /// **'Mark as Complete'**
  String get completeQuestButton;

  /// No description provided for @completedQuestsTitle.
  ///
  /// In en, this message translates to:
  /// **'Completed Quests History'**
  String get completedQuestsTitle;

  /// No description provided for @noCompletedQuests.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t completed any quests yet.'**
  String get noCompletedQuests;

  /// No description provided for @userScoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Quest Points: {score}'**
  String userScoreLabel(Object score);

  /// No description provided for @deleteHistoryButton.
  ///
  /// In en, this message translates to:
  /// **'Delete Quests History'**
  String get deleteHistoryButton;

  /// No description provided for @deleteConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Deletion'**
  String get deleteConfirmationTitle;

  /// No description provided for @deleteConfirmationMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to permanently delete ALL completed quests?'**
  String get deleteConfirmationMessage;

  /// No description provided for @deleteYes.
  ///
  /// In en, this message translates to:
  /// **'Yes, Delete'**
  String get deleteYes;

  /// No description provided for @deleteNo.
  ///
  /// In en, this message translates to:
  /// **'No, Cancel'**
  String get deleteNo;

  /// No description provided for @exitAppButton.
  ///
  /// In en, this message translates to:
  /// **'Exit Application'**
  String get exitAppButton;

  /// No description provided for @currentMoodTitlePrefix.
  ///
  /// In en, this message translates to:
  /// **'Your mood:'**
  String get currentMoodTitlePrefix;

  /// No description provided for @developmentInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'App in Development'**
  String get developmentInfoTitle;

  /// No description provided for @developmentInfoMessage.
  ///
  /// In en, this message translates to:
  /// **'With your help and patience, this application can grow. Thank you for your understanding!'**
  String get developmentInfoMessage;

  /// No description provided for @okButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okButtonLabel;

  /// No description provided for @accountHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Quest History'**
  String get accountHistoryTitle;

  /// No description provided for @noQuestsCompleted.
  ///
  /// In en, this message translates to:
  /// **'No Quests completed yet.'**
  String get noQuestsCompleted;

  /// No description provided for @questsCompletedLabel.
  ///
  /// In en, this message translates to:
  /// **'You have completed {count} Quests.'**
  String questsCompletedLabel(Object count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ro'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ro':
      return AppLocalizationsRo();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
