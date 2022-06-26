import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_html/lesson_five_page.dart';
import 'package:intro_to_html/lessons_page.dart';
import 'package:sizer/sizer.dart';

import 'home_page.dart';
import 'main_page.dart';

class LessonFourStudy extends StatelessWidget {
  const LessonFourStudy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, size: 35),
        ),
        title: Row(
          children: [
            SizedBox(
              width: 17.w,
            ),
            Text("الدرس الرابع", style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold)),
            SizedBox(
              width: 13.w,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                icon: const Icon(Icons.home, size: 35),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              height: 7.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "مكونات الكود \"tag\"",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900]),
              ),
            ),
            RichText(
              textDirection: TextDirection.rtl,
              text: TextSpan(
                text: "لتوضيح مكونات الكود البرمجي  tag  لاحظ معي هذا المثال ",
                style: TextStyle(color: Colors.black, fontSize: 15.sp),
                children: <TextSpan>[
                  TextSpan(
                    text: " < Body Bgcolor = \" red \" > ",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                  TextSpan(
                    text:
                        " بعد هذا المثال يتضح الكود يتكون من ثلاث عناصر وهي : \n 1-الامر tag يخبر المتصفح عن العمل الذي يجب القيام به. \n  2- الخاصية attribute تحدد الكيفية التي يتم بها أداء هذا العمل. \n 3- القيمة value تعبر عن الخاصية وتحدد شكل الاداء. ",
                    style: TextStyle(fontSize: 15.sp, letterSpacing: 1.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LessonFourActivity(game: false,)));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, minimumSize: Size(80.w, 8.h)),
              child: Text(
                "النشاط",
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            SizedBox(
              height: 9.h,
            )
          ],
        ),
      ),
    );
  }
}

class LessonFourActivity extends StatefulWidget {
  const LessonFourActivity({Key? key, required this.game}) : super(key: key);
  final bool game;
  @override
  State<LessonFourActivity> createState() => _LessonFourActivityState();
}

class _LessonFourActivityState extends State<LessonFourActivity> {
  List<bool> checkBoxValues = [false, false, false, false];
  bool finished = false;

  void checkAndSetRestFalse(int except) {
    for (int i = 0; i < checkBoxValues.length; i++) {
      if (i == except) {
        continue;
      }
      checkBoxValues[i] = false;
    }
  }


  void playCorrectSound() {
    final assetsAudioPlayer = AssetsAudioPlayer();

    assetsAudioPlayer.open(
      Audio("assets/correct.wav"),
    );
    assetsAudioPlayer.play();
  }

  void playWrongSound() {
    final assetsAudioPlayer2 = AssetsAudioPlayer();

    assetsAudioPlayer2.open(
      Audio("assets/wrong.wav"),
    );
    assetsAudioPlayer2.play();
  }
  void setFinished() {
    if (checkBoxValues[2] == true) {
      playCorrectSound();
      finished = true;
    } else {
      playWrongSound();
      finished = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, size: 35),
        ),
        title: Row(
          children: [
            SizedBox(
              width: 21.w,
            ),
            Text("النشاط", style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold)),
            SizedBox(
              width: 17.w,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                icon: const Icon(Icons.home, size: 35),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(1.w),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 4.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "أمامك بعض المشكلات يرجى ملاحظتها جيدا واختيار الإجابة الصحيحة بين المشكلات التالية:",
                textDirection: TextDirection.rtl,
                style:
                    TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              width: double.infinity,
              color: Colors.deepOrangeAccent,
              child: Center(
                child: Text(
                  "قام احد المبرمجين المبتدئين بكتابة كود العنوان في رأيك كيف قام بكتابته",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: <Widget>[
                Container(
                  color: Colors.deepOrangeAccent.withOpacity(0.6),
                  height: 15.h,
                  width: 24.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "< h2 color\n \"blue\" >",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(
                        value: checkBoxValues[0],
                        onChanged: (val) {
                          checkBoxValues[0] = val!;
                          setState(() {
                            checkBoxValues[0] = val;
                            checkAndSetRestFalse(0);
                            setFinished();
                          });
                        },
                        activeColor: Colors.grey,
                        checkColor: Colors.black,
                        shape: const CircleBorder(),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.deepOrangeAccent.withOpacity(0.6),
                  height: 15.h,
                  width: 24.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "      < h2\n color blue>",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(
                        value: checkBoxValues[1],
                        onChanged: (val) {
                          checkBoxValues[1] = val!;
                          setState(() {
                            checkBoxValues[1] = val;
                            checkAndSetRestFalse(1);
                            setFinished();
                          });
                        },
                        activeColor: Colors.grey,
                        checkColor: Colors.black,
                        shape: const CircleBorder(),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.deepOrangeAccent.withOpacity(0.6),
                  height: 15.h,
                  width: 24.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "< h2 color\n = \"blue\" >",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(
                        value: checkBoxValues[2],
                        onChanged: (val) {
                          checkBoxValues[2] = val!;
                          setState(() {
                            checkBoxValues[2] = val;
                            checkAndSetRestFalse(2);
                            setFinished();
                          });
                        },
                        activeColor: Colors.grey,
                        checkColor: Colors.black,
                        shape: const CircleBorder(),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.deepOrangeAccent.withOpacity(0.6),
                  height: 15.h,
                  width: 24.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "< h2 color\n = blue >",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(
                        value: checkBoxValues[3],
                        onChanged: (val) {
                          checkBoxValues[3] = val!;
                          setState(() {
                            checkBoxValues[3] = val;
                            checkAndSetRestFalse(3);
                            setFinished();
                          });
                        },
                        activeColor: Colors.grey,
                        checkColor: Colors.black,
                        shape: const CircleBorder(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            if (finished && !widget.game)
              ElevatedButton(
                onPressed: () {
                  HomePage.checkLevel(4);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LessonFiveStudy()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: Size(80.w, 8.h)),
                child: Text(
                  "التالي",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
