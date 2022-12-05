
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:islami_assignment_moamen/ThemeOfData.dart';
import 'package:flutter/material.dart';
import 'package:islami_assignment_moamen/home_screen/home_screen_tabs/ahadeth_tab.dart';

class HadethDetails extends StatelessWidget {

  static const String routeName = "HadethDetails";


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethDetailsArgs;

    return SafeArea(
      child: Stack(
        children:[
        Image.asset("assets/images/default_bg.png",
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
      Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 45),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xfffaf5ef),
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(25),
            ),
            border: Border.all(color: ThemeOfData.colorGold)
          ),
          child: ListView.builder(
              itemCount: args.content.length,
              itemBuilder: (_,index){
            return Text(args.content[index],style: Theme.of(context).textTheme.subtitle1,textAlign: TextAlign.center,);
          }),
        ),
      ),
      appBar: AppBar(
      title: Text(args.title,style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.center,),
      ),
      ),
      ],
      ),
    );
  }
}
