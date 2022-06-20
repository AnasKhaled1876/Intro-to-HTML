import 'package:flutter/material.dart';
import 'package:intro_to_html/first_lesson_page.dart';
import 'package:intro_to_html/lesson_four_page.dart';
import 'package:intro_to_html/lesson_six_page.dart';
import 'package:intro_to_html/second_lesson.dart';
import 'package:intro_to_html/third_lesson_page.dart';
import 'package:sizer/sizer.dart';

import 'lesson_five_page.dart';
import 'lessons_page.dart';

class EducativeGames extends StatefulWidget {
  const EducativeGames({Key? key}) : super(key: key);

  @override
  State<EducativeGames> createState() => _EducativeGamesState();
}

class _EducativeGamesState extends State<EducativeGames> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent.withOpacity(0.8),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("دروسك"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.h),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 3.h,),
            LessonTile("نشاط الدرس الأول", const LessonOneActivity()),
            SizedBox(height: 3.h,),
            LessonTile("نشاط الدرس الثاني", const LessonTwoActivity()),
            SizedBox(height: 3.h,),
            LessonTile("نشاط الدرس الثالث", const LessonThreeActivity()),
            SizedBox(height: 3.h,),
            LessonTile("نشاط الدرس الرابع", const LessonFourActivity()),
            SizedBox(height: 3.h,),
            LessonTile("نشاط الدرس الخامس", const LessonFiveActivity()),
            SizedBox(height: 3.h,),
            LessonTile("نشاط الدرس السادس", const LessonSixActivity()),
          ],
        ),
      ),
    );
  }
}
