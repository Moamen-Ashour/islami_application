
import 'dart:math' as math;
import 'dart:math';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:islami_assignment_moamen/ThemeOfData.dart';

class sebha extends StatefulWidget {

  static const String routeName = "sebha";


  @override
  State<sebha> createState() => _sebhaState();
}

class _sebhaState extends State<sebha> with SingleTickerProviderStateMixin {

  int counter = 0;
  double angleValue = 0.0;

  List<String> Tasebhat = [
    "سبحان الله",
    "الحمدلله",
    "الله اكبر",
    "استغفر الله",
  ];

  String? _dropDownValue ;

  void _incrementCounter() {

    if(_dropDownValue!.isEmpty){
      counter=0;
      _dropDownValue = null;
    }
    if (_dropDownValue!.isNotEmpty && counter < 34) {
        counter++;
        angleValue++;
    }

    if (_dropDownValue!.isNotEmpty && counter == 33) {
      counter = 0;
      _dropDownValue = null;
    }
      setState(() {

      });
    // counter = 0;
  }


  void dropDownCallback(Object? selectionValue) {
    if(selectionValue is String){
      setState(() {
        _dropDownValue = selectionValue;
      });
    }
  }


  @override
  Widget build(BuildContext context) {

       return Column(
         children: [
           Stack(
             children: [

               Padding(
                 padding: const EdgeInsets.only(left: 45,bottom: 18.0),
                 child: Center(
                   child: Image.asset("assets/images/head_sebha_logo.png"),
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 68.0,horizontal: 85),
                 child: Center(
                     child: Transform.rotate(
                         angle: angleValue,
                         child: Image.asset("assets/images/body_sebha_logo.png")
                     )
                 ),
               ),

             ],
           ),

           Center(
             child: Text("${counter}"
               ,style: TextStyle(color: ThemeOfData.colorBlack,fontSize: 25),
             ),
           ),

          DropdownButton<String>(items: Tasebhat.map(buildMenuItem).toList(),
              value: _dropDownValue,
              onChanged: (value) => setState(()  => this._dropDownValue = value)
          ),
          
           ElevatedButton(onPressed: _incrementCounter ,
               child: Text(AppLocalizations.of(context)!.tasbeha,style: TextStyle(color: ThemeOfData.colorGold),),
           style: ElevatedButton.styleFrom(
             elevation: 0,
             backgroundColor: Colors.transparent,
    side: BorderSide(width: 2.0, color: ThemeOfData.colorGold,),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),

        ),
    )
           )
         ],
       );


     }

     DropdownMenuItem<String> buildMenuItem(String item)  => DropdownMenuItem(
         value: item,
         child: Text(item),

     );
}

