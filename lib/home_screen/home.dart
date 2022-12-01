

import 'package:flutter/material.dart';
import 'package:islami_assignment_moamen/ThemeOfData.dart';
import 'package:islami_assignment_moamen/home_screen/home_screen_tabs/ahadeth_tab.dart';
import 'package:islami_assignment_moamen/home_screen/home_screen_tabs/quran_tab.dart';
import 'package:islami_assignment_moamen/home_screen/home_screen_tabs/radio_tab.dart';
import 'package:islami_assignment_moamen/home_screen/home_screen_tabs/sebha_tab.dart';

class Home extends StatefulWidget {

  static const String routeName = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   int CurrentIndex = 0;

   List<Widget> HomeTabs = [
     quran(),
     ahadeth(),
     radio(),
     sebha()
   ];

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Image.asset("assets/images/default_bg.png",
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          Scaffold(
            body: HomeTabs[CurrentIndex],
            appBar: AppBar(
            title: Text("Islame", style: Theme.of(context).textTheme.headline1,),
        ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                CurrentIndex = index;
                setState(() {

                });
              }
              ,
              currentIndex: CurrentIndex,
              items: [
                BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_quran.png")), label: "Quran"),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")), label: "Hadeth"),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_radio.png")), label: "Radio"),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")), label: "Sebha"),
              ],
            ),
      ),
      ]
    );
  }
}
