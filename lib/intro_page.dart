import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intro_to_html/home_page.dart';
import 'package:sizer/sizer.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool welcomed = false;


  void animateAfterWait(){
    Timer(const Duration(seconds: 2), () {
      setState((){
        welcomed=true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    animateAfterWait();
    return Scaffold(
        body: AnimatedCrossFade(
      firstChild: Center(child: Image.asset("assets/intro-pic.png")),
      duration: const Duration(seconds: 1),
      secondChild: const IntroWidget(),
      crossFadeState: welcomed ? CrossFadeState.showSecond :CrossFadeState.showFirst,
    ));
  }
}

class IntroWidget extends StatelessWidget {
  const IntroWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.h,
        ),
        Image.asset("assets/Welcome.png"),
        SizedBox(
          height: 5.h,
        ),
        Text(
          "مرحبا بك يا صديقي سنتعلم سويا آساسيات برمجة الويب \n  \t\t\t\t\t\t\t\t\t\t\t لبدء التعلم اضغط على زر الدخول ",
          style: TextStyle(
              fontSize: 13.0.sp,
              color: Colors.redAccent,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 6.h,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.black, minimumSize: Size(30.h, 2.w)),
          child: Text(
            "دخول",
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
      ],
    );
  }
}
