import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_html/lessons_page.dart';
import 'package:sizer/sizer.dart';
import 'home_page.dart';
import 'main_page.dart';

class LessonSixStudy extends StatelessWidget {
  const LessonSixStudy({Key? key}) : super(key: key);

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
          icon: const Icon(Icons.arrow_back,size: 35,),
        ),
        title: Row(
          children: [
            SizedBox(
              width: 21.w,
            ),
            const Text("الدرس السادس"),
            SizedBox(
              width: 11.w,
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
                icon: const Icon(Icons.home, size: 35,),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الفقرات",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 22.sp,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900]),
              ),
            ),
            Text(
              " كود <p> .... </p> هو كود مزدوج له بداية <p> وله نهاية </p> يستخدم لكتابة اللفقرات داخل صفحة الويب ",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "طريقة كتابة كود الفقرة",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 20.sp,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900]),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "<p>\nالفقرة\n</p>",
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LessonSixActivity()));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, minimumSize: Size(80.w, 8.h)),
              child: Text(
                "النشاط",
                style: TextStyle(fontSize: 20.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LessonSixActivity extends StatefulWidget {
  const LessonSixActivity({Key? key}) : super(key: key);

  @override
  State<LessonSixActivity> createState() => _LessonSixActivityState();
}

class _LessonSixActivityState extends State<LessonSixActivity> {
  String answer1 = "";
  String answer2 = "";
  bool finished = false;

  bool checkAnswersEmpty() {
    if (answer1 != "" && answer2 != "") {
      emptyAllAnswers();
      return true;
    }
    return false;
  }

  void emptyAllAnswers(){
    answer1="";
    answer2="";
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
          icon: const Icon(Icons.arrow_back, size: 35,),
        ),
        title: Row(
          children: [
            SizedBox(
              width: 26.w,
            ),
            const Text("النشاط"),
            SizedBox(
              width: 22.w,
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
                icon: const Icon(Icons.home, size: 35,),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    DragTarget<String>(
                      onAccept: (data) => setState(
                        () {
                          answer2 = data;
                          if (answer1 == "فقرة" && answer2 == "مزدوج") {
                            finished = true;
                            playCorrectSound();
                          } else if (checkAnswersEmpty()) {
                            playWrongSound();
                          } else {
                            finished = false;
                          }
                        },
                      ),
                      builder: (context, _, __) => SizedBox(
                        width: 26.w,
                        height: 4.h,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            answer2,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "..................",
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.red[900]),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "كود <p>ــــــ<p> هو كود ",
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900]),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    DragTarget<String>(
                      onAccept: (data) => setState(
                        () {
                          answer1 = data;
                          if (answer1 == "فقرة" && answer2 == "مزدوج") {
                            finished = true;
                            playCorrectSound();
                          } else if (checkAnswersEmpty()) {
                            playWrongSound();
                          } else {
                            finished = false;
                          }
                        },
                      ),
                      builder: (context, _, __) => SizedBox(
                        width: 28.w,
                        height: 4.h,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            answer1,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "..................",
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.red[900]),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "وله نهاية <p/> يستخدم لإضافة",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 13.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const DraggableItemLevelSix(item: "عنوان رئيسي"),
                SizedBox(width: 10.w),
                const DraggableItemLevelSix(item: "مزدوج"),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const DraggableItemLevelSix(item: "مفرد"),
                SizedBox(width: 10.w),
                const DraggableItemLevelSix(item: "فقرة"),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            if (finished)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    HomePage.checkLevel(6);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LessonsPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black, minimumSize: Size(80.w, 8.h)),
                  child: Text(
                    "التالي",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class DraggableItemLevelSix extends StatelessWidget {
  final String item;

  const DraggableItemLevelSix({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: item,
      feedback: MatchItemLevelSIx(
        item: item,
      ),
      childWhenDragging: null,
      child: MatchItemLevelSIx(
        item: item,
      ),
    );
  }
}

class MatchItemLevelSIx extends StatelessWidget {
  final String item;

  const MatchItemLevelSIx({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      width: 32.w,
      height: 6.h,
      child: Center(
        child: Text(
          item,
          style: TextStyle(
              fontSize: 15.sp,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
