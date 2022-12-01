import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islami_assignment_moamen/App_translate.dart';
import 'package:islami_assignment_moamen/ThemeOfData.dart';
import 'package:islami_assignment_moamen/home_screen/home.dart';
import 'package:islami_assignment_moamen/home_screen/home_screen_tabs/sura_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool status = false;


  @override
  Widget build(BuildContext context) {
  return GetMaterialApp(
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      Locale('en',),
      Locale('ar',),
    ],
    initialRoute: Home.routeName,
    routes: {
      Home.routeName : (_) => Home(),
      SuraDetails.routeName : (_) => SuraDetails(),
    },
    translations: AppTranslation(),
    locale: Get.deviceLocale,
    debugShowCheckedModeBanner: false,
    theme: ThemeOfData.LightTheme,
    darkTheme: ThemeOfData.DarkTheme,
    themeMode: ThemeMode.light,
  );
  }
}
