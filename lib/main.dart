import 'package:flutter/material.dart';
import 'package:islami_assignment_moamen/ThemeOfData.dart';
import 'package:islami_assignment_moamen/home_screen/home.dart';
import 'package:islami_assignment_moamen/home_screen/home_screen_tabs/sura_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    initialRoute: Home.routeName,
    routes: {
      Home.routeName : (_) => Home(),
      SuraDetails.routeName : (_) => SuraDetails(),
    },
    debugShowCheckedModeBanner: false,
    theme: ThemeOfData.LightTheme,
    darkTheme: ThemeOfData.DarkTheme,
    themeMode: ThemeMode.light,
  );
  }
}
