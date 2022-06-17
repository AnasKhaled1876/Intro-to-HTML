import 'package:flutter/material.dart';
import 'package:intro_to_html/first_lesson_page.dart';
import 'package:intro_to_html/lesson_four_page.dart';
import 'package:intro_to_html/lesson_six_page.dart';
import 'package:intro_to_html/second_lesson.dart';
import 'package:intro_to_html/third_lesson_page.dart';

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
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20,),
            LessonTile("نشاط الدرس الأول", const LessonOneActivity()),
            const SizedBox(height: 20,),
            LessonTile("نشاط الدرس الثاني", const LessonTwoActivity()),
            const SizedBox(height: 20,),
            LessonTile("نشاط الدرس الثالث", const LessonThreeActivity()),
            const SizedBox(height: 20,),
            LessonTile("نشاط الدرس الرابع", const LessonFourActivity()),
            const SizedBox(height: 20,),
            LessonTile("نشاط الدرس الخامس", const LessonFiveActivity()),
            const SizedBox(height: 20,),
            LessonTile("نشاط الدرس السادس", const LessonSixActivity()),
          ],
        ),
      ),
    );
  }
}
