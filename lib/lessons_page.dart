import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_html/first_lesson_page.dart';
import 'package:intro_to_html/lesson_five_page.dart';
import 'package:intro_to_html/lesson_four_page.dart';
import 'package:intro_to_html/lesson_six_page.dart';
import 'package:intro_to_html/second_lesson.dart';
import 'package:intro_to_html/third_lesson_page.dart';
import 'package:sizer/sizer.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({Key? key}) : super(key: key);

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("دروسك"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.h),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 3.h,),
            LessonTile("الدرس الأول", const LessonOneStudy()),
            SizedBox(height: 3.h,),
            LessonTile("الدرس الثاني", const LessonTwoStudy()),
            SizedBox(height: 3.h,),
            LessonTile("الدرس الثالث", const LessonThreeStudy()),
            SizedBox(height: 3.h,),
            LessonTile("الدرس الرابع", const LessonFourStudy()),
            SizedBox(height: 3.h,),
            LessonTile("الدرس الخامس", const LessonFiveStudy()),
            SizedBox(height: 3.h,),
            LessonTile("الدرس السادس", const LessonSixStudy()),
          ],
        ),
      ),
    );
  }
}

class LessonTile extends StatelessWidget {
  LessonTile(this.lessonNumber, this.widget);

  String lessonNumber;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey.withOpacity(0.6),
          minimumSize: Size(80.w, 6.h)),
      child: ListTile(
        title: Text(
          lessonNumber,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),
        ),
      ),
    );
  }
}