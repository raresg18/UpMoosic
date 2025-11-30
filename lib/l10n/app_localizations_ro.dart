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
  String get journalNoteLabel => 'Journal Notes (optional)';

  @override
  String get journalNoteHint => 'Ce s-a întâmplat astăzi?';

  @override
  String get buttonUpdateMood => 'Actualizează starea zilnică';

  @override
  String get buttonSaveMood => 'Salvează starea zilnică';

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
  String get quote_happy_1 => 'Fericirea depinde de noi înșine.';

  @override
  String get quote_happy_2 =>
      'Fericirea nu este ceva gata făcut. Ea vine din propriile tale acțiuni.';

  @override
  String get quote_happy_3 => 'Să fii tu însuți e tot ce contează.';

  @override
  String get quote_happy_4 => 'Fii schimbarea pe care vrei să o vezi în lume.';

  @override
  String get quote_happy_5 => 'O inimă fericită este un trup sănătos.';

  @override
  String get quote_sad_1 => 'Lacrimile vin din inimă, nu din creier.';

  @override
  String get quote_sad_2 =>
      'Fiecare viață are o măsură de tristețe, iar uneori aceasta ne trezește.';

  @override
  String get quote_sad_3 =>
      'Să te lași să fii trist e la fel de important ca să te lași să fii fericit.';

  @override
  String get quote_sad_4 =>
      'Nu poți vindeca nimic din ceea ce pretinzi că nu există.';

  @override
  String get quote_sad_5 => 'Este în regulă să nu fii bine.';

  @override
  String get quote_relaxed_1 => 'Respiră viitorul, expiră trecutul.';

  @override
  String get quote_relaxed_2 =>
      'Cea mai mare armă împotriva stresului este capacitatea noastră de a alege un gând în locul altuia.';

  @override
  String get quote_relaxed_3 => 'Calmarea minții aduce puterea interioară.';

  @override
  String get quote_relaxed_4 =>
      'Lasă-ți mintea să se calmeze și inima să se deschidă.';

  @override
  String get quote_relaxed_5 => 'Fii o insulă de calm în mijlocul haosului.';

  @override
  String get quote_energetic_1 =>
      'Energiea și persistența cuceresc toate lucrurile.';

  @override
  String get quote_energetic_2 =>
      'Nu te opri când ești obosit, oprește-te când ai terminat.';

  @override
  String get quote_energetic_3 =>
      'Fiecare zi este o pagină nouă. Fă-o energică!';

  @override
  String get quote_energetic_4 =>
      'Succesul nu este final; eșecul nu este fatal: curajul de a continua contează.';

  @override
  String get quote_energetic_5 => 'Limita este doar imaginația noastră.';

  @override
  String get quote_motivated_1 =>
      'Motivația te face să începi. Obiceiul te face să continui.';

  @override
  String get quote_motivated_2 =>
      'O singură persoană cu o dorință este o forță de neoprit.';

  @override
  String get quote_motivated_3 => 'Secretul de a avansa este să începi.';

  @override
  String get quote_motivated_4 => 'Fii atât de bun încât nu te pot ignora.';

  @override
  String get quote_motivated_5 => 'Fiecare maestru a fost cândva un dezastru.';

  @override
  String get quote_stressed_1 =>
      'Nu poți controla tot ce se întâmplă. Controlează cum reacționezi.';

  @override
  String get quote_stressed_2 =>
      'Ia o pauză. O minte obosită nu poate lua decizii bune.';

  @override
  String get quote_stressed_3 =>
      'Acceptă ceea ce este, lasă să plece ceea ce a fost și ai încredere în ce va fi.';

  @override
  String get quote_stressed_4 => 'Nu ești obligat să termini totul azi.';

  @override
  String get quote_stressed_5 =>
      'Detașarea de rezultat este cheia păcii interioare.';

  @override
  String get quote_nostalgic_1 => 'Amintirile sunt comoara sufletului.';

  @override
  String get quote_nostalgic_2 =>
      'Adu-ți aminte că trecutul este o lecție, nu o pedeapsă.';

  @override
  String get quote_nostalgic_3 =>
      'Nostalgia este durerea unei bucurii trecute.';

  @override
  String get quote_nostalgic_4 =>
      'Timpul nu vindecă, dar ajută la reorganizarea amintirilor.';

  @override
  String get quote_nostalgic_5 =>
      'Amintirile sunt modul în care îți poți ține minte viața.';

  @override
  String get quote_focused_1 => 'Concentrează-te pe a fi productiv, nu ocupat.';

  @override
  String get quote_focused_2 =>
      'Cheia succesului este să te concentrezi pe obiective, nu pe obstacole.';

  @override
  String get quote_focused_3 =>
      'Unde se duce atenția ta, acolo se duce energia ta.';

  @override
  String get quote_focused_4 => 'Alege să nu fii distras.';

  @override
  String get quote_focused_5 =>
      'O minte neclintită în mijlocul furtunii aduce claritate.';

  @override
  String get quest_happy_title_1 => 'Împărtășește bucuria';

  @override
  String get quest_happy_desc_1 => 'Trimite un mesaj pozitiv cuiva drag.';

  @override
  String get quest_happy_title_2 => 'Notează de ce ești recunoscător';

  @override
  String get quest_happy_desc_2 =>
      'Scrie trei lucruri care ți-au mers bine astăzi.';

  @override
  String get quest_sad_title_1 => 'Ascultă melodia ta preferată';

  @override
  String get quest_sad_desc_1 =>
      'Pune o piesă care îți aduce aminte de momente bune.';

  @override
  String get quest_sad_title_2 => 'Sună un prieten';

  @override
  String get quest_sad_desc_2 => 'Conexiunea ajută întotdeauna.';

  @override
  String get quest_relaxed_title_1 => 'Bea un pahar de apă';

  @override
  String get quest_relaxed_desc_1 =>
      'Hidratarea ajută la calmarea sistemului nervos.';

  @override
  String get quest_relaxed_title_2 => 'Meditează 5 minute';

  @override
  String get quest_relaxed_desc_2 =>
      'Concentrează-te pe respirație pentru a te reancora.';

  @override
  String get quest_energetic_title_1 => 'Fă o serie de genuflexiuni';

  @override
  String get quest_energetic_desc_1 => 'Pune-ți sângele în mișcare rapid.';

  @override
  String get quest_energetic_title_2 => 'Scrie o listă de idei nebune';

  @override
  String get quest_energetic_desc_2 =>
      'Folosește-ți energia pentru creativitate maximă.';

  @override
  String get quest_motivated_title_1 => 'Stabilește un micro-obiectiv';

  @override
  String get quest_motivated_desc_1 =>
      'Alege o sarcină pe care o poți termina în 15 minute.';

  @override
  String get quest_motivated_title_2 => 'Reorganizează spațiul de lucru';

  @override
  String get quest_motivated_desc_2 => 'Un mediu curat ajută la concentrare.';

  @override
  String get quest_stressed_title_1 => 'Respirație de 5 minute';

  @override
  String get quest_stressed_desc_1 =>
      'Practică tehnica de respirație profundă 4-7-8.';

  @override
  String get quest_stressed_title_2 => 'Scrie-ți toate grijile';

  @override
  String get quest_stressed_desc_2 => 'Mută-ți gândurile din cap pe hârtie.';

  @override
  String get quest_nostalgic_title_1 => 'Răsfoiește o poză veche';

  @override
  String get quest_nostalgic_desc_1 =>
      'Retrăiește o amintire plăcută pentru câteva minute.';

  @override
  String get quest_nostalgic_title_2 => 'Scrie o scrisoare (nu o trimite)';

  @override
  String get quest_nostalgic_desc_2 =>
      'Pune-ți pe hârtie sentimentele despre trecut.';

  @override
  String get quest_focused_title_1 => 'Tehnica Pomodoro (25/5)';

  @override
  String get quest_focused_desc_1 =>
      'Lucrează 25 de minute intens, ia o pauză de 5 minute.';

  @override
  String get quest_focused_title_2 => 'Dezactivează notificările';

  @override
  String get quest_focused_desc_2 =>
      'Elimină orice distragere pentru următoarea oră.';

  @override
  String get quest_happy_title_3 => 'Fă o mică operă de artă';

  @override
  String get quest_happy_desc_3 =>
      'Desenează sau pictează ceva care te face să zâmbești.';

  @override
  String get quest_happy_title_4 => 'Mișcare pentru bucurie';

  @override
  String get quest_happy_desc_4 =>
      'Dansează timp de 5 minute pe o melodie rapidă.';

  @override
  String get quest_happy_title_5 => 'Caută un moment amuzant';

  @override
  String get quest_happy_desc_5 =>
      'Uită-te la un clip amuzant sau citește o glumă.';

  @override
  String get quest_sad_title_3 => 'Fii blând cu tine';

  @override
  String get quest_sad_desc_3 => 'Permite-ți să plângi dacă simți nevoia.';

  @override
  String get quest_sad_title_4 => 'Mângâie un animal de companie';

  @override
  String get quest_sad_desc_4 =>
      'Interacțiunea cu animalele eliberează oxitocină.';

  @override
  String get quest_sad_title_5 => 'Fă un ceai cald';

  @override
  String get quest_sad_desc_5 =>
      'Băuturile calde ajută la confortul emoțional.';

  @override
  String get quest_relaxed_title_3 => 'Vizualizează un loc liniștit';

  @override
  String get quest_relaxed_desc_3 =>
      'Închide ochii și imaginează-ți un loc unde te simți în siguranță.';

  @override
  String get quest_relaxed_title_4 => 'Nu citi știri timp de o oră';

  @override
  String get quest_relaxed_desc_4 =>
      'O pauză de la fluxul de informații este esențială.';

  @override
  String get quest_relaxed_title_5 => 'Aprinde o lumânare parfumată';

  @override
  String get quest_relaxed_desc_5 =>
      'Folosește aromaterapia pentru a calma simțurile.';

  @override
  String get quest_energetic_title_3 => 'Dansează liber';

  @override
  String get quest_energetic_desc_3 =>
      'Pune muzică și eliberează-ți corpul de energie în exces.';

  @override
  String get quest_energetic_title_4 => 'Cântă tare';

  @override
  String get quest_energetic_desc_4 =>
      'Folosește-ți vocea pentru a elibera energie.';

  @override
  String get quest_energetic_title_5 => 'Aleargă sau mergi rapid';

  @override
  String get quest_energetic_desc_5 =>
      'O scurtă explozie de mișcare în aer liber.';

  @override
  String get quest_motivated_title_3 => 'Învață un truc nou';

  @override
  String get quest_motivated_desc_3 =>
      'Uită-te la un tutorial de 5 minute și aplică-l.';

  @override
  String get quest_motivated_title_4 => 'Scrie o scrisoare viitorului tău sine';

  @override
  String get quest_motivated_desc_4 => 'Ce sfaturi i-ai da celui de mâine?';

  @override
  String get quest_motivated_title_5 => 'Planifică următoarea săptămână';

  @override
  String get quest_motivated_desc_5 =>
      'O planificare clară îți dă un sentiment de control.';

  @override
  String get quest_stressed_title_3 => 'O plimbare fără telefon';

  @override
  String get quest_stressed_desc_3 =>
      'Concentrează-te pe ce vezi și ce auzi în jur.';

  @override
  String get quest_stressed_title_4 => 'Duș/Baie caldă';

  @override
  String get quest_stressed_desc_4 => 'Apa caldă relaxează mușchii încordați.';

  @override
  String get quest_stressed_title_5 => 'Oprește-te și miroase cafeaua';

  @override
  String get quest_stressed_desc_5 =>
      'Oprește-te din muncă și savurează o băutură caldă.';

  @override
  String get quest_nostalgic_title_3 => 'Sună pe cineva din copilărie';

  @override
  String get quest_nostalgic_desc_3 =>
      'Reconectează-te cu o persoană din trecutul tău.';

  @override
  String get quest_nostalgic_title_4 => 'Gătește o rețetă veche';

  @override
  String get quest_nostalgic_desc_4 =>
      'Fă o mâncare care îți aduce aminte de casă.';

  @override
  String get quest_nostalgic_title_5 => 'Vizionează un film vechi preferat';

  @override
  String get quest_nostalgic_desc_5 =>
      'Revedeți o producție cinematografică de care îți este dor.';

  @override
  String get quest_focused_title_3 => 'Hidratează-te complet';

  @override
  String get quest_focused_desc_3 =>
      'Bea un pahar mare de apă. Ajută la funcția cognitivă.';

  @override
  String get quest_focused_title_4 =>
      'Fixează un singur obiectiv pentru următoarea oră';

  @override
  String get quest_focused_desc_4 =>
      'Alege sarcina cea mai importantă și ignoră restul.';

  @override
  String get quest_focused_title_5 => 'Ieși 5 minute la aer curat';

  @override
  String get quest_focused_desc_5 =>
      'Reîmprospătează-ți mintea cu o gură de aer.';

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
}
