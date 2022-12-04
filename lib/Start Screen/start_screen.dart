

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:islami_assignment_moamen/ThemeOfData.dart';
import 'package:islami_assignment_moamen/home_screen/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';

class StartScreen extends StatefulWidget {

  static const String routeName = "Start";

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState(){
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color(0xffebd8bd),
      splashIconSize: 500,
      splash: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children:[
                Text(  AppLocalizations.of(context)!.welcome,style: TextStyle(fontSize: 20,color: ThemeOfData.colorBlack,fontWeight: FontWeight.bold),),
                Text(  AppLocalizations.of(context)!.islamiapp,style: TextStyle(fontSize: 30,color: ThemeOfData.colorBlack,fontWeight: FontWeight.bold),)]),
            ),
          ),
          SizedBox(height: 80,),
          Lottie.asset("assets/json/quran.json"),
        ],
      ), nextScreen: Home(),
    );
  }

  _navigateToHome()  async {
    await Future.delayed(Duration(seconds: 30),(){});
    Navigator.pushReplacementNamed(context, Home.routeName);
  }
}
