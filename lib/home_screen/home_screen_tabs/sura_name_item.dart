

import 'package:flutter/material.dart';
import 'package:islami_assignment_moamen/home_screen/home_screen_tabs/sura_details.dart';

class SuraNameItem extends StatelessWidget {

  static const String routeName = "SuraNameItem";
int Index;
  String SuraName;

  SuraNameItem(this.SuraName,this.Index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetails.routeName, arguments: SuraDetailsArgs(SuraName,Index));
      },
      child: Center(
        child: Text(SuraName,style: Theme.of(context).textTheme.headline1?.copyWith(
          fontSize: 25
        ),),
      ),
    );
  }
}
