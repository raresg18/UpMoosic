import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ro.dart';


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

  /// No description provided for @statusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// No description provided for @statusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get statusActive;

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

  /// No description provided for @analysisDominantLabel.
  ///
  /// In en, this message translates to:
  /// **'Dominant:'**
  String get analysisDominantLabel;

  /// No description provided for @analysisEntriesLabel.
  ///
  /// In en, this message translates to:
  /// **'Entries:'**
  String get analysisEntriesLabel;

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

  /// No description provided for @questStatusAccepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted on {date}'**
  String questStatusAccepted(Object date);

  /// No description provided for @questStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed on {date}'**
  String questStatusCompleted(Object date);

  /// No description provided for @rankShyNote.
  ///
  /// In en, this message translates to:
  /// **'Shy Note'**
  String get rankShyNote;

  /// No description provided for @rankBeginnerSpirit.
  ///
  /// In en, this message translates to:
  /// **'Beginner Spirit'**
  String get rankBeginnerSpirit;

  /// No description provided for @rankBalancedListener.
  ///
  /// In en, this message translates to:
  /// **'Balanced Listener'**
  String get rankBalancedListener;

  /// No description provided for @rankRhythmExplorer.
  ///
  /// In en, this message translates to:
  /// **'Rhythm Explorer'**
  String get rankRhythmExplorer;

  /// No description provided for @rankMoodComposer.
  ///
  /// In en, this message translates to:
  /// **'Mood Composer'**
  String get rankMoodComposer;

  /// No description provided for @rankLivingSymphony.
  ///
  /// In en, this message translates to:
  /// **'Living Symphony'**
  String get rankLivingSymphony;

  /// No description provided for @statisticsTitle.
  ///
  /// In en, this message translates to:
  /// **'Mood Statistics'**
  String get statisticsTitle;

  /// No description provided for @noDataStats.
  ///
  /// In en, this message translates to:
  /// **'Not enough data for the chart.'**
  String get noDataStats;

  /// No description provided for @moodDistribution.
  ///
  /// In en, this message translates to:
  /// **'Mood Distribution'**
  String get moodDistribution;

  /// No description provided for @totalEntries.
  ///
  /// In en, this message translates to:
  /// **'Total entries:'**
  String get totalEntries;
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
