import 'package:flutter/material.dart';
import 'package:intro_to_html/first_lesson_page.dart';
import 'package:intro_to_html/second_lesson.dart';
import 'package:intro_to_html/third_lesson_page.dart';

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
            LessonTile("الدرس الأول", const Lesson()),
            const SizedBox(height: 20,),
            LessonTile("الدرس الثاني", const LessonTwoStudy()),
            const SizedBox(height: 20,),
            LessonTile("الدرس الثالث", const LessonThreeStudy()),
            const SizedBox(height: 20,),
            LessonTile("الدرس الرابع", const LessonsPage()),
            const SizedBox(height: 20,),
            LessonTile("الدرس الخامس", const LessonsPage()),
            const SizedBox(height: 20,),
            LessonTile("الدرس السادس", const LessonsPage()),
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey.withOpacity(0.6), minimumSize: const Size(100, 60)),
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