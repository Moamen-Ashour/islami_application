

import 'package:flutter/material.dart';
import 'package:islami_assignment_moamen/ThemeOfData.dart';
import 'package:lottie/lottie.dart';

class StartScreen extends StatelessWidget {

  static const String routeName = "Start";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children:[
        Image.asset("assets/images/default_bg.png",
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
      Scaffold(
        body: Center(
          child: ListView(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Center(child: Text("Islamic Application",style: TextStyle(fontSize: 20, color: ThemeOfData.colorGold,),)),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_5tvcbbnr.json'),
                ),
              )
            ],
          ),
        ),
      )]
      ),
    );
  }
}
