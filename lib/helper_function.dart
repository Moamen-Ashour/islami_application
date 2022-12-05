


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customErrorScreen(){


  return ErrorWidget.builder = ((details) {

    return Material(
         child: Container(
           color: Colors.black87,
           child: ListView(
             children: [
               Image.asset("assets/images/error.png"),
               const SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(details.exception.toString(),
                   style: TextStyle(color: Colors.white,fontSize: 18),
                   textAlign: TextAlign.center,

                 ),
               )
             ],
           ),
         ),
    );
  });

}