

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_assignment_moamen/ThemeOfData.dart';
import 'package:islami_assignment_moamen/home_screen/home_screen_tabs/sura_details.dart';

class SuraDetails extends StatefulWidget {

  static const String routeName = "SuraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> ayat = [];

  void loadTxTFiles(int index) async {
    String txtfile = await rootBundle.loadString('assets/files/${index+1}.txt');
    List<String> Ayat = txtfile.split("\n");
    ayat= Ayat;
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {

    SuraDetailsArgs args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;

   if(ayat.isEmpty){
     loadTxTFiles(args.index);
   }
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
          body: Container(
            child: Column(
              children: [
                ayat.isEmpty?Center(child: CircularProgressIndicator()):Expanded(
                  child: ListView.separated(
                      separatorBuilder: (c,index) => Divider(
                        color: ThemeOfData.colorGold,
                        indent: 50,
                        endIndent: 50,
                      ),
                      itemBuilder: (c,index){
                    return Text(ayat[index],style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: ThemeOfData.colorBlack
                    ),textAlign: TextAlign.center,);
                  }, itemCount: ayat.length,),
                )
              ],
            ),
          ),
      ),
      ]
    );
  }
}


class SuraDetailsArgs{
  int index;
  String suraName;
  SuraDetailsArgs(this.suraName,this.index);
}
