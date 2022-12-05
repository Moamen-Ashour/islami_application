

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:islami_assignment_moamen/ThemeOfData.dart';
import 'package:islami_assignment_moamen/home_screen/home_screen_tabs/ahadeth_details.dart';

class ahadeth extends StatefulWidget {

  static const String routeName = "ahadeth";

  @override
  State<ahadeth> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<ahadeth> {
  List<HadethDetailsArgs> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if(ahadethList.isEmpty)
      loadHadethFiles();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/hadeth_logo.png"),
          Divider(
            color: ThemeOfData.colorGold,
            thickness: 2,
          ),
          Text(
            AppLocalizations.of(context)!.ahadeth,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Colors.indigo, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: ThemeOfData.colorGold,
            thickness: 2,
          ),
          ahadethList.isEmpty?Center(child: CircularProgressIndicator()):Expanded(
            child: ListView.separated(
                itemBuilder: (c,index){
                  return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, HadethDetails.routeName,arguments: ahadethList[index]);
                      },
                      child: Text(ahadethList[index].title,style: Theme.of(context).textTheme.subtitle1,textAlign: TextAlign.center,));
                }, itemCount: ahadethList.length,
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: ThemeOfData.colorGold,
              ) ,
            ),
          )
        ],
      ),
    );
  }



  void loadHadethFiles() async {
    String hadethFile = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadeth = hadethFile.trim().split("#\r\n");
    for (int i = 0; i < ahadeth.length; i++) {
      String hadeth = ahadeth[i];
      List<String> hadethLines = hadeth.trim().split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethDetailsArgs hadethDetails = HadethDetailsArgs(title, hadethLines);
      ahadethList.add(hadethDetails);
    }

    setState(() {

    });
  }
}

class HadethDetailsArgs{
  String title;
  List<String> content;
  HadethDetailsArgs(this.title,this.content);
}



