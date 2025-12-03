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
  String get quest_happy_title_6 => 'Trimite o vorbă bună';

  @override
  String get quest_happy_desc_6 =>
      'Spune-i cuiva ce îți place la el sau ce apreciezi.';

  @override
  String get quest_happy_title_7 => 'Ascultă melodia care te face fericit';

  @override
  String get quest_happy_desc_7 =>
      'Pune melodia care te face instantaneu să zâmbești.';

  @override
  String get quest_happy_title_8 => 'Oferă un zâmbet străinului';

  @override
  String get quest_happy_desc_8 =>
      'Zâmbește intenționat unei persoane pe care nu o cunoști.';

  @override
  String get quest_happy_title_9 => 'Scrie în Jurnal un motiv';

  @override
  String get quest_happy_desc_9 =>
      'Notează cea mai fericită parte a zilei tale.';

  @override
  String get quest_happy_title_10 => 'Dă un \'High Five\'';

  @override
  String get quest_happy_desc_10 =>
      'Cere-i cuiva un \'high five\' sau îmbrățișează o persoană dragă.';

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
  String get quest_sad_title_6 => 'Regula celor 5 minute';

  @override
  String get quest_sad_desc_6 =>
      'Permite-ți să fii trist doar 5 minute. Apoi, schimbă focusul.';

  @override
  String get quest_sad_title_7 => 'Notează 3 lucruri de azi';

  @override
  String get quest_sad_desc_7 =>
      'Scrie trei lucruri, oricât de mici, pentru care ești recunoscător.';

  @override
  String get quest_sad_title_8 => 'Ocupă-te de un lucru mic';

  @override
  String get quest_sad_desc_8 =>
      'Fă curat într-o singură zonă mică (ex: sertar, masă). O mică victorie ajută.';

  @override
  String get quest_sad_title_9 => 'Îmbrățișează-te pe tine';

  @override
  String get quest_sad_desc_9 =>
      'Fă o baie caldă sau înfășoară-te într-o pătură moale.';

  @override
  String get quest_sad_title_10 => 'Ascultă un Podcast';

  @override
  String get quest_sad_desc_10 =>
      'Ascultă un episod dintr-un podcast motivant sau amuzant.';

  @override
  String get quest_sad_title_11 => 'Fă o plimbare scurtă';

  @override
  String get quest_sad_desc_11 =>
      'Ieși afară 10 minute. Schimbarea de peisaj ajută.';

  @override
  String get quest_sad_title_12 => 'Notează-ți sentimentul';

  @override
  String get quest_sad_desc_12 =>
      'Descrie ce simți exact. Faptul că îl numești te ajută să îl procesezi.';

  @override
  String get quest_sad_title_13 => 'Fără Social Media';

  @override
  String get quest_sad_desc_13 =>
      'Ia o pauză de 30 de minute de la rețelele sociale.';

  @override
  String get quest_sad_title_14 => 'Mănâncă o gustare sănătoasă';

  @override
  String get quest_sad_desc_14 =>
      'Mănâncă o bucată de fruct sau ceva nutritiv. Ai grijă de corpul tău.';

  @override
  String get quest_sad_title_15 => 'Ajută pe cineva';

  @override
  String get quest_sad_desc_15 =>
      'Trimite un mesaj unui prieten întrebându-l cum se simte.';

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
  String get quest_relaxed_title_6 => 'Fără ecrane';

  @override
  String get quest_relaxed_desc_6 =>
      'Petrece 30 de minute fără a te uita la telefon, TV sau monitor.';

  @override
  String get quest_relaxed_title_7 => 'Ascultă sunete din natură';

  @override
  String get quest_relaxed_desc_7 =>
      'Pune o înregistrare cu ploaie, valuri sau pădure.';

  @override
  String get quest_relaxed_title_8 => 'Masaj facial rapid';

  @override
  String get quest_relaxed_desc_8 =>
      'Masează-ți tâmplele și fruntea timp de 2 minute.';

  @override
  String get quest_relaxed_title_9 => 'Liniște totală';

  @override
  String get quest_relaxed_desc_9 =>
      'Stai în tăcere completă pentru 5 minute, concentrându-te pe respirație.';

  @override
  String get quest_relaxed_title_10 => 'Bea o băutură caldă';

  @override
  String get quest_relaxed_desc_10 =>
      'Prepară-ți un ceai sau o ciocolată caldă, savurând fiecare înghițitură.';

  @override
  String get quest_relaxed_title_11 => 'Schimbă poziția';

  @override
  String get quest_relaxed_desc_11 =>
      'Întinde-te pe jos (pe covor) pentru 10 minute. Schimbarea de perspectivă relaxează.';

  @override
  String get quest_relaxed_title_12 => 'Privește pe fereastră';

  @override
  String get quest_relaxed_desc_12 =>
      'Observă peisajul sau cerul timp de 5 minute fără alte gânduri.';

  @override
  String get quest_relaxed_title_13 => 'Întinde-te ușor';

  @override
  String get quest_relaxed_desc_13 =>
      'Fă o serie de întinderi simple pentru gât, umeri și spate.';

  @override
  String get quest_relaxed_title_14 => 'Vizitează un loc frumos online';

  @override
  String get quest_relaxed_desc_14 =>
      'Caută imagini sau clipuri cu un loc din lume care te fascinează.';

  @override
  String get quest_relaxed_title_15 => 'Gândește-te la o amintire plăcută';

  @override
  String get quest_relaxed_desc_15 =>
      'Revino la un moment fericit din trecut, reamintindu-ți detaliile.';

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
  String get quest_energetic_title_6 => 'Învață ceva nou în 5 min';

  @override
  String get quest_energetic_desc_6 =>
      'Folosește energia pentru a căuta un fapt nou sau un cuvânt străin.';

  @override
  String get quest_energetic_title_7 => 'Proiect DIY rapid';

  @override
  String get quest_energetic_desc_7 =>
      'Ocupă-te de un mic proiect de reparații sau creație care durează maxim 30 de minute.';

  @override
  String get quest_energetic_title_8 => 'Fă ordine în inbox';

  @override
  String get quest_energetic_desc_8 =>
      'Șterge sau arhivează 10 e-mailuri care nu mai sunt necesare.';

  @override
  String get quest_energetic_title_9 => 'Plimbare cu țintă';

  @override
  String get quest_energetic_desc_9 =>
      'Mergi repede până la un punct fix (un copac, o clădire) și înapoi.';

  @override
  String get quest_energetic_title_10 => 'Gătește ceva nou';

  @override
  String get quest_energetic_desc_10 =>
      'Canalizează energia în bucătărie și încearcă o rețetă simplă.';

  @override
  String get quest_energetic_title_11 => 'Notează 3 idei trăsnite';

  @override
  String get quest_energetic_desc_11 =>
      'Scrie rapid 3 idei sau concepte neconvenționale pe care le-ai putea explora.';

  @override
  String get quest_energetic_title_12 => 'Antrenament scurt HIIT';

  @override
  String get quest_energetic_desc_12 =>
      'Fă un antrenament scurt (5-10 minute) de intensitate ridicată.';

  @override
  String get quest_energetic_title_13 => 'Sună un prieten vechi';

  @override
  String get quest_energetic_desc_13 =>
      'Folosește-ți elocvența pentru a recupera timpul pierdut cu o persoană dragă.';

  @override
  String get quest_energetic_title_14 => 'Organizează-ți fișierele';

  @override
  String get quest_energetic_desc_14 =>
      'Reordonează sau șterge fișierele de pe desktopul computerului.';

  @override
  String get quest_energetic_title_15 => 'Exprimă-te artistic';

  @override
  String get quest_energetic_desc_15 =>
      'Scrie un poem scurt, un haiku sau o poezie rapidă.';

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
  String get quest_motivated_title_6 => 'Vizualizează succesul';

  @override
  String get quest_motivated_desc_6 =>
      'Închide ochii și imaginează-ți rezultatul dorit al muncii tale.';

  @override
  String get quest_motivated_title_7 => 'Citește un citat inspirațional';

  @override
  String get quest_motivated_desc_7 =>
      'Găsește o frază care te motivează și scrie-o pe un post-it.';

  @override
  String get quest_motivated_title_8 => 'Fă un Plan 3-2-1';

  @override
  String get quest_motivated_desc_8 =>
      'Numește 3 sarcini mari, 2 medii, 1 mică pe care le vei face azi.';

  @override
  String get quest_motivated_title_9 => 'Învață un cuvânt nou';

  @override
  String get quest_motivated_desc_9 =>
      'Extinde-ți vocabularul. Cunoașterea îți dă putere.';

  @override
  String get quest_motivated_title_10 => 'Reîncarcă-ți bateria fizică';

  @override
  String get quest_motivated_desc_10 =>
      'Fă 10 genuflexiuni sau 10 flotări pentru a-ți trezi corpul.';

  @override
  String get quest_motivated_title_11 => 'Schimbă fundalul de pe desktop';

  @override
  String get quest_motivated_desc_11 =>
      'Alege o imagine care te inspiră și te duce cu gândul la un obiectiv.';

  @override
  String get quest_motivated_title_12 => 'Elimină o distragere';

  @override
  String get quest_motivated_desc_12 =>
      'Identifică cea mai mare distragere din jurul tău și elimin-o pentru 30 de minute.';

  @override
  String get quest_motivated_title_13 => 'Fii mentor';

  @override
  String get quest_motivated_desc_13 =>
      'Oferă o soluție sau un sfat cuiva care are o problemă.';

  @override
  String get quest_motivated_title_14 => 'Prioritizează ce NU faci';

  @override
  String get quest_motivated_desc_14 =>
      'Scrie pe o listă 3 lucruri pe care *nu* le vei face azi pentru a te concentra pe ce e important.';

  @override
  String get quest_motivated_title_15 => 'Mic Pas de Acțiune';

  @override
  String get quest_motivated_desc_15 =>
      'Fă primul (cel mai mic) pas dintr-o sarcină mare pe care ai amânat-o.';

  @override
  String get quest_stressed_title_1 => 'Exercițiu de respirație de 5 minute';

  @override
  String get quest_stressed_desc_1 =>
      'Practică tehnica de respirație profundă 4-7-8.';

  @override
  String get quest_stressed_title_2 => 'Notează-ți toate grijile';

  @override
  String get quest_stressed_desc_2 =>
      'Mută-ți gândurile din cap pe o foaie de hârtie.';

  @override
  String get quest_stressed_title_6 => 'Respirația 4-7-8';

  @override
  String get quest_stressed_desc_6 =>
      'Inspiră 4 secunde, ține 7, expiră 8. Repetă de 4 ori.';

  @override
  String get quest_stressed_title_7 => 'Măruntirea sarcinii';

  @override
  String get quest_stressed_desc_7 =>
      'Ia cea mai mare sarcină stresantă și sparge-o în 3 pași mici.';

  @override
  String get quest_stressed_title_8 => 'Ieși 5 minute desculț/ă';

  @override
  String get quest_stressed_desc_8 =>
      'Atinge pământul, iarba sau covorul cu picioarele. Ajută la împământare.';

  @override
  String get quest_stressed_title_9 => 'Fii conștient de maxilar';

  @override
  String get quest_stressed_desc_9 =>
      'Relaxeză-ți intenționat maxilarul și umerii. Detensionarea fizică ajută.';

  @override
  String get quest_stressed_title_10 => 'Ascultă White Noise';

  @override
  String get quest_stressed_desc_10 =>
      'Pune o pistă de zgomot alb sau sunete ambientale pentru a-ți bloca gândurile.';

  @override
  String get quest_stressed_title_11 => 'Fă o listă de \'Dezvăluiri\'';

  @override
  String get quest_stressed_desc_11 =>
      'Scrie pe o foaie toate lucrurile pe care le ai de făcut și apoi rupe-o.';

  @override
  String get quest_stressed_title_12 => 'Ia o pauză de apă rece';

  @override
  String get quest_stressed_desc_12 =>
      'Pune-ți apă rece pe încheieturi sau pe ceafă. Stimularea nervului vag ajută la calmare.';

  @override
  String get quest_stressed_title_13 => 'Redu lumina albastră';

  @override
  String get quest_stressed_desc_13 =>
      'Dacă este seară, folosește filtre de lumină albastră sau folosește lumini calde.';

  @override
  String get quest_stressed_title_14 => 'Dă-ți voie să amâni o decizie';

  @override
  String get quest_stressed_desc_14 =>
      'Stresul nu ajută la decizii bune. Amână o decizie mică pentru mâine.';

  @override
  String get quest_stressed_title_15 => 'Cere Ajutor (Delegă)';

  @override
  String get quest_stressed_desc_15 =>
      'Dacă este posibil, cere cuiva să preia o sarcină minoră de la tine.';

  @override
  String get quest_stressed_title_3 => 'Fă o plimbare scurtă';

  @override
  String get quest_stressed_desc_3 =>
      'Ieși 10 minute la aer. O schimbare de peisaj te ajută să te calmezi.';

  @override
  String get quest_stressed_title_4 => 'Fă un duș cald';

  @override
  String get quest_stressed_desc_4 =>
      'Folosește apa caldă pentru a-ți relaxa mușchii.';

  @override
  String get quest_stressed_title_5 => 'Savurează o băutură caldă';

  @override
  String get quest_stressed_desc_5 =>
      'Fă-ți un ceai din plante calmant sau o băutură caldă.';

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
  String get quest_nostalgic_title_6 => 'Redescoperă un obiect vechi';

  @override
  String get quest_nostalgic_desc_6 =>
      'Caută un obiect din copilărie care îți aduce aminte de o poveste.';

  @override
  String get quest_nostalgic_title_7 => 'Scrie o anecdotă';

  @override
  String get quest_nostalgic_desc_7 =>
      'Notează rapid cea mai amuzantă sau memorabilă întâmplare din trecutul tău.';

  @override
  String get quest_nostalgic_title_8 => 'Ascultă un album complet';

  @override
  String get quest_nostalgic_desc_8 =>
      'Pune un album de muzică pe care îl ascultai non-stop într-o anumită perioadă.';

  @override
  String get quest_nostalgic_title_9 => 'Vizitează un loc drag';

  @override
  String get quest_nostalgic_desc_9 =>
      'Mergi sau gândește-te la un loc (școală, parc, casă veche) care îți este drag.';

  @override
  String get quest_nostalgic_title_10 => 'Reînvață un joc vechi';

  @override
  String get quest_nostalgic_desc_10 =>
      'Joacă un joc de societate sau un joc video clasic pe care l-ai uitat.';

  @override
  String get quest_nostalgic_title_11 => 'Fă un colaj de amintiri';

  @override
  String get quest_nostalgic_desc_11 =>
      'Adună câteva poze vechi și creează o mică colecție fizică sau digitală.';

  @override
  String get quest_nostalgic_title_12 => 'Creează o capsulă a timpului';

  @override
  String get quest_nostalgic_desc_12 =>
      'Scrie o listă cu 5 lucruri pe care le faci acum și ascunde-o pentru viitor.';

  @override
  String get quest_nostalgic_title_13 => 'Vorbește cu un membru al familiei';

  @override
  String get quest_nostalgic_desc_13 =>
      'Sună pe cineva mai în vârstă (părinte, bunic) și ascultă o poveste din trecut.';

  @override
  String get quest_nostalgic_title_14 => 'Fă o plimbare nostalgică';

  @override
  String get quest_nostalgic_desc_14 =>
      'Mergi pe un traseu pe care îl făceai des în trecut (spre școală, spre casă).';

  @override
  String get quest_nostalgic_title_15 => 'Gândește-te la o lecție învățată';

  @override
  String get quest_nostalgic_desc_15 =>
      'Care este cea mai valoroasă lecție pe care ai învățat-o din trecutul tău? Notează.';

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
  String get quest_focused_title_6 => 'Curăță desktop-ul';

  @override
  String get quest_focused_desc_6 =>
      'Ascunde sau șterge toate fișierele inutile de pe ecran.';

  @override
  String get quest_focused_title_7 => 'O singură fereastră';

  @override
  String get quest_focused_desc_7 =>
      'Închide toate tab-urile și ferestrele, lăsând doar aplicația de care ai nevoie.';

  @override
  String get quest_focused_title_8 => 'Ascultă muzică de fundal';

  @override
  String get quest_focused_desc_8 =>
      'Pune muzică instrumentală sau sunete ambientale concepute pentru concentrare.';

  @override
  String get quest_focused_title_9 => 'Mănâncă o gustare pentru creier';

  @override
  String get quest_focused_desc_9 =>
      'Consumă o mână de nuci sau o bucată de ciocolată neagră.';

  @override
  String get quest_focused_title_10 => 'Metoda 5-minute';

  @override
  String get quest_focused_desc_10 =>
      'Lucrează la o sarcină pe care o amâni de 5 minute. Adesea, începutul e cel mai greu.';

  @override
  String get quest_focused_title_11 => 'Schimbă sursa de lumină';

  @override
  String get quest_focused_desc_11 =>
      'Asigură-te că lumina este optimă (naturală sau caldă) pentru zona de lucru.';

  @override
  String get quest_focused_title_12 => 'Stabilește o recompensă';

  @override
  String get quest_focused_desc_12 =>
      'Stabilește o mică recompensă pe care o primești după ce termini sarcina.';

  @override
  String get quest_focused_title_13 => 'Pauză de 2 minute';

  @override
  String get quest_focused_desc_13 =>
      'Fă o pauză de 2 minute în care te ridici, te întinzi și îți muți privirea de la ecran.';

  @override
  String get quest_focused_title_14 => 'Scrie \'De ce?\'';

  @override
  String get quest_focused_desc_14 =>
      'Reamintește-ți de ce faci această muncă. Claritatea scopului aduce focus.';

  @override
  String get quest_focused_title_15 => 'Folosește modul avion';

  @override
  String get quest_focused_desc_15 =>
      'Activează modul avion pe telefon pentru o perioadă specifică de timp.';

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
}
