// main.dart (Versiune Finală cu Suport pentru Plugin-uri Native)

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'l10n/app_localizations.dart';
import 'providers/quest_state.dart';

// 🎯 MARCAT CA ASYNC
void main() async {
  // 🎯 NOU: NECESAR PENTRU shared_preferences ȘI ALTE PLUGIN-URI
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => QuestState()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // CORECTAT: Ascultă tipul LanguageProvider
    final provider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UpMoosic',
      locale: provider.locale,

      supportedLocales: const [
        Locale('ro', ''),
        Locale('en', ''),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const HomePage(),
    );
  }
}