

import 'package:flutter/material.dart';
import 'package:islami_assignment_moamen/home_screen/home_screen_tabs/sura_details.dart';

class SuraDetails extends StatelessWidget {

  static const String routeName = "SuraDetails";


  @override
  Widget build(BuildContext context) {

    SuraDetailsArgs args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    return Stack(
      children:[
        Image.asset("assets/images/default_bg.png",
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Scaffold(
        appBar: AppBar(
          title: Text(args.suraName,style: Theme.of(context).textTheme.headline1,),
          centerTitle: true,
        ),
      ),
      ]
    );
  }

}


class SuraDetailsArgs{
  String suraName;
  SuraDetailsArgs(this.suraName);
}
