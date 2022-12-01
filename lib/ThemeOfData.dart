


import 'package:flutter/material.dart';

class ThemeOfData{

  static const Color colorBlack = Color.fromRGBO(36, 36, 36, 1.0);

  static const Color colorGold = Color.fromRGBO(183, 147, 95, 1.0);


  static ThemeData LightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        foregroundColor: Colors.black,
      ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
         color: colorBlack,
        fontWeight: FontWeight.bold
      )
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:  colorGold,
      selectedItemColor: colorBlack,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed
    )


    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //    selectedItemColor: Colors.black,
    //     unselectedItemColor: Colors.white,
    //     // backgroundColor: colorGold,
    //   ),
  );


  static ThemeData DarkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        foregroundColor: Colors.white,
      )
  );

}
