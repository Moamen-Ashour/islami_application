
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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



  final locales2 = [
    Locale('ar'),
    Locale('en'),
  ];


  updateLocale( Locale locale, BuildContext context){
    Navigator.of(context).pop();
    Get.updateLocale(locale);
  }


   showLocaleDialog(BuildContext context){


     final locales = [
       {'name':AppLocalizations.of(context)!.arabic},
       {'name':AppLocalizations.of(context)!.english},
       {'name':AppLocalizations.of(context)!.newlanguage},
       // {
       //   'name':'Hindi',
       //   'locale':Locale('hi','IN')
       // },
       // {
       //   'name':'German',
       //   'locale':Locale('de','DE')
       // }
     ];

     showDialog(context: context,
         builder: (_) => AlertDialog(
           title: Text(AppLocalizations.of(context)!.choose),
           content: Container(
             width: double.maxFinite,
             child: ListView.separated(
               shrinkWrap: true,
                 itemBuilder: (context,index)=> InkWell(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("${locales[index]['name']}"),
                   ),
                    onTap: () =>  updateLocale(locales2[index],context),
                 ),
                 separatorBuilder: (context,index) => Divider(
                   color: ThemeOfData.colorGold,
                 ), itemCount: 3),
           ),
         ));
   }




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
            title: Text(AppLocalizations.of(context)!.islami, style: Theme.of(context).textTheme.headline1,),
                actions:[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                    onTap: () {},
                    child: IconButton(
                      onPressed: () =>  showLocaleDialog(context),
                      icon: Icon(Icons.language,
                        size: 26.0,),
                    ),
                ),
                  )],
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
                BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_quran.png")), label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")), label: AppLocalizations.of(context)!.ahadeth),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_radio.png")), label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")), label: AppLocalizations.of(context)!.sebha),
              ],
            ),
      ),
      ]
    );
  }
}
