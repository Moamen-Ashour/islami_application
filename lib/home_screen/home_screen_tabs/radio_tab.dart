



import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_assignment_moamen/ThemeOfData.dart';

class radio extends StatefulWidget {

  static const String routeName = "radio";

  @override
  State<radio> createState() => _radioState();
}

class _radioState extends State<radio> {


  final audioPlayer = AudioPlayer();
  bool itsPlaying = false;
  Duration duration = Duration.zero;
  Duration postion = Duration.zero;


  @override
  void initState(){
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        itsPlaying = event == PlayerState.playing;
      });
    });


    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        postion = event;
      });
    });



  }

  bool nextAudio = false;
  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }

   String souraName(){
    if(itsPlaying && nextAudio == false){
       return AppLocalizations.of(context)!.elbaqra;
     }if(itsPlaying && nextAudio == true){
      return AppLocalizations.of(context)!.alemran;
    }
    return AppLocalizations.of(context)!.souraName;
   }

  String shiakName(){
    if(itsPlaying && nextAudio == false){
      return AppLocalizations.of(context)!.mesharyalafasy;
    }if(itsPlaying && nextAudio == true){
      return AppLocalizations.of(context)!.mesharyalafasy;
    }
    return AppLocalizations.of(context)!.shiakName;
  }

  @override
  Widget build(BuildContext context) {



    return Column(
      children: [
        ClipRRect(
          borderRadius:BorderRadius.circular(20),
          child: Image.asset("assets/images/radio_image.png",width: double.infinity,height: 200,fit: BoxFit.cover,),
        ),
        Text(souraName(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        Text(shiakName(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
        Slider(
            min : 0,
            max: duration.inSeconds.toDouble(),
            value: postion.inSeconds.toDouble(),
            onChanged: (value) async {
              final postion = Duration(seconds: value.toInt());
              await audioPlayer.seek(postion);


              await audioPlayer.resume();

        }),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatTime(postion)),
              Text(formatTime(duration - postion))
            ],
          ),
        ),
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: ThemeOfData.colorGold,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xfffaf5ef),
                foregroundColor: ThemeOfData.colorGold,
                child: IconButton(
                  icon: Icon(
                    itsPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  iconSize: 50,
                  onPressed: () async {
                    if(itsPlaying){
                      await audioPlayer.pause();
                    } else {
                await audioPlayer.resume();
                    }
                  },
                ),
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: ThemeOfData.colorGold,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xfffaf5ef),
                foregroundColor: ThemeOfData.colorGold,
                child:   IconButton(
                  icon: Icon(
                    Icons.skip_next,
                  ),
                  iconSize: 28,
                  onPressed: () async {
                    if(itsPlaying){
                      await audioPlayer.stop();
                      setAudio2();
                    }else{
                      await audioPlayer.stop();
                    }
                  },
                ),
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: ThemeOfData.colorGold,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xfffaf5ef),
                foregroundColor: ThemeOfData.colorGold,
                child:   IconButton(
                  icon: Icon(
                    Icons.stop,
                  ),
                  iconSize: 28,
                  onPressed: () async {
                    if(itsPlaying){
                      await audioPlayer.stop();
                    }else{
                      await audioPlayer.stop();
                    }
                  },
                ),
              ),
            ),
          ],
        ),

      ],

    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2,'0');

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
    if (duration.inHours > 0 ) hours,
      minutes,
      seconds
    ].join(':');
  }

  void setAudio() async{
    audioPlayer.setReleaseMode(ReleaseMode.stop);

   final player = AudioCache(prefix: 'assets/audio/');
   final url = await player.load('baqra.mp3');
   audioPlayer.setSourceUrl(url.path, );

  }

  void setAudio2() async{
    nextAudio = true;
    final player = AudioCache(prefix: 'assets/audio/');
    final url = await player.load('alemran.mp3');
    audioPlayer.setSourceUrl(url.path, );
  }

}
