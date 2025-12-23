// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appName => 'UpMoosic';

  @override
  String get selectMoodPrompt => 'Selectează starea de astăzi:';

  @override
  String get emotionalJournalButton => 'Jurnal Emoțional';

  @override
  String get selectMoodQuestion => 'Cum te simți azi?';

  @override
  String get selectMoodError => 'Te rog selectează un mood înainte!';

  @override
  String get saveMoodButton => 'Salvează starea zilnică';

  @override
  String get selectLanguageButton => 'Selectează Limba';

  @override
  String get suggestSongButton => 'Sugerează o piesă';

  @override
  String get statusCompleted => 'Finalizat';

  @override
  String get statusActive => 'Activ';

  @override
  String get selectMoodMessage =>
      'Te rog selectează o stare de spirit înainte de a continua.';

  @override
  String get questFinished => 'Am finalizat! / Închide';

  @override
  String get questMissionTitle => 'Misiunea Ta:';

  @override
  String musicRecommendationTitle(Object mood) {
    return 'Recomandare Muzicală pentru $mood';
  }

  @override
  String get listenOnYoutube => 'Ascultă pe YouTube';

  @override
  String get listenOnSpotify => 'Ascultă pe Spotify';

  @override
  String get luckySongPrompt => 'Melodia ta norocoasă:';

  @override
  String get questButtonLabel => 'Quest';

  @override
  String get journalTitle => 'Jurnal Emoțional & Calendar de Stări 🗓️';

  @override
  String get dailyNoteLabel => 'Notițe pentru Jurnal (opțional)';

  @override
  String todayMoodIs(Object mood) {
    return 'Starea de astăzi este: $mood! (Poți actualiza)';
  }

  @override
  String get selectTodayMood => 'Selectează starea de astăzi:';

  @override
  String get journalNoteLabel => 'Notițe Jurnal (opțional)';

  @override
  String get journalNoteHint => 'Ce s-a întâmplat astăzi?';

  @override
  String get buttonUpdateMood => 'Actualizează starea zilnică';

  @override
  String get buttonSaveMood => 'Salvează starea zilnică';

  @override
  String get analysisDominantLabel => 'Dominant:';

  @override
  String get analysisEntriesLabel => 'Intrări:';

  @override
  String get saveSuccess => 'Starea și notița de astăzi au fost salvate!';

  @override
  String get updateSuccess => 'Starea și notița de astăzi au fost actualizate!';

  @override
  String get saveNoMood => 'Selectează o stare înainte de a salva.';

  @override
  String get savePastDateError => 'Poți salva starea doar pentru ziua curentă.';

  @override
  String get notSelected => 'Neselectată';

  @override
  String pastDayMoodWas(Object day, Object month, Object year) {
    return 'Starea pe $day/$month/$year a fost:';
  }

  @override
  String pastNoteLabel(Object note) {
    return 'Notiță: \"$note\"';
  }

  @override
  String noRecordForDay(Object day, Object month, Object year) {
    return 'Nu există înregistrare pentru $day/$month/$year.';
  }

  @override
  String get weeklyAnalysisTitle => 'Analiza Săptămânală (Ultimele 7 zile):';

  @override
  String get analysisTitle => 'Analiza Săptămânală (Ultimele 7 zile):';

  @override
  String get analysisLoading => 'Se calculează...';

  @override
  String get weeklyColorLabel => 'Culoarea Săptămânii: Hibrid';

  @override
  String dominantMoodLabel(Object mood) {
    return 'Mood Dominant: $mood';
  }

  @override
  String entriesCountLabel(Object count) {
    return 'Înregistrări în această perioadă: $count';
  }

  @override
  String get moodHappy => 'Fericit';

  @override
  String get moodSad => 'Trist';

  @override
  String get moodRelaxed => 'Relaxat';

  @override
  String get moodEnergetic => 'Energic';

  @override
  String get moodMotivated => 'Motivat';

  @override
  String get moodStressed => 'Stresat';

  @override
  String get moodNostalgic => 'Nostalgic';

  @override
  String get moodFocused => 'Focusat';

  @override
  String get accountTitle => 'Profilul Meu';

  @override
  String get accountPageWelcome => 'Bine ai venit pe pagina de profil!';

  @override
  String get account => 'Cont';

  @override
  String get doQuestButton => 'Acceptă Misiunea';

  @override
  String get closeButton => 'Închide';

  @override
  String get activeQuestsTitle => 'Misiuni Active';

  @override
  String get noActiveQuests =>
      'Nu ai misiuni active. Alege una din ecranul principal!';

  @override
  String get mood => 'Stare';

  @override
  String get questAcceptedMessage => 'Quest Acceptat';

  @override
  String get cancelQuestButton => 'Anulează Misiunea';

  @override
  String get completeQuestButton => 'Marchează ca Finalizat';

  @override
  String get completedQuestsTitle => 'Istoric Misiuni Finalizate';

  @override
  String get noCompletedQuests => 'Nu ai finalizat încă nicio misiune.';

  @override
  String userScoreLabel(Object score) {
    return 'Puncte din Quest: $score';
  }

  @override
  String get deleteHistoryButton => 'Șterge Istoric Quest-uri';

  @override
  String get deleteConfirmationTitle => 'Confirmă Ștergerea';

  @override
  String get deleteConfirmationMessage =>
      'Ești sigur că vrei să ștergi definitiv TOATE quest-urile finalizate?';

  @override
  String get deleteYes => 'Da, Șterge';

  @override
  String get deleteNo => 'Nu, Anulează';

  @override
  String get exitAppButton => 'Ieșire din Aplicație';

  @override
  String get currentMoodTitlePrefix => 'Starea ta:';

  @override
  String get developmentInfoTitle => 'Aplicație în Dezvoltare';

  @override
  String get developmentInfoMessage =>
      'Cu ajutorul și răbdarea ta, această aplicație poate crește. Mulțumim pentru înțelegere!';

  @override
  String get okButtonLabel => 'OK';

  @override
  String get accountHistoryTitle => 'Istoricul Quest-urilor';

  @override
  String get noQuestsCompleted => 'Nu ai finalizat încă niciun Quest.';

  @override
  String questsCompletedLabel(Object count) {
    return 'Ai finalizat $count Quest-uri.';
  }

  @override
  String questStatusAccepted(Object date) {
    return 'Acceptat pe $date';
  }

  @override
  String questStatusCompleted(Object date) {
    return 'Finalizat pe $date';
  }

  @override
  String get rankShyNote => 'Notă Timidă';

  @override
  String get rankBeginnerSpirit => 'Spirit Începător';

  @override
  String get rankBalancedListener => 'Ascultător în Echilibru';

  @override
  String get rankRhythmExplorer => 'Explorator de Ritmuri';

  @override
  String get rankMoodComposer => 'Compozitor de Stări';

  @override
  String get rankLivingSymphony => 'Simfonie Vie';

  @override
  String get statisticsTitle => 'Statistici Stare';

  @override
  String get noDataStats => 'Nu există suficiente date pentru grafic.';

  @override
  String get moodDistribution => 'Distribuția Stărilor';

  @override
  String get totalEntries => 'Total intrări:';
}
