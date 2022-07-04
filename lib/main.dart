import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'lib/langs/',
    apiKeyGoogle: '<Key>', // NOT YET TESTED
  );

  await Firebase.initializeApp();

  runApp(LocalizedApp(child: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: translator.delegates,
      locale: translator.locale,
      supportedLocales: translator.locals(),
      home: nav(),
    );
  }
}
