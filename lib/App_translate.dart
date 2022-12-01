

import 'package:get/get.dart';

class AppTranslation extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>{
    'en':{
      "islami": "Islami",
      "ahadeth": "Ahadeth",
      "radio":"Radio",
      "quran":"Quran",
      "sebha":"Sebha",
      "Choose Your Language":"Choose Your Language"
    },
    'ar':{
      "islami": "اسلامي",
      "ahadeth": "احاديث",
      "radio":"راديو",
      "quran":"قرآن",
      "sebha":"سبحه",
      "Choose Your Language":"اختر لغتك"
    }
  };

}