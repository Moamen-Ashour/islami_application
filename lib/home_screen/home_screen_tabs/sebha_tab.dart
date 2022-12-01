

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:islami_assignment_moamen/ThemeOfData.dart';

class sebha extends StatefulWidget  {

  static const String routeName = "sebha";

  @override
  State<sebha> createState() => _sebhaState();


}

class _sebhaState extends State<sebha> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 22),
      vsync: this,
    )..repeat(reverse: false);
    late final Animation<double> _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }


    return Column(
      children: [
        Center(
          child: Image.asset("assets/images/head_sebha_logo.png"),
        )
        ,

        RotationTransition(alignment: Alignment.topLeft,
        turns: _animation,
        child: Image.asset("assets/images/body_sebha_logo.png"))
        ,
        Center(
          child: Text("عدد التسبيحات"
          ,style: TextStyle(color: ThemeOfData.colorBlack,fontSize: 25),),
        )
      ],
    );
  }
}
