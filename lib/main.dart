import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intro_to_html/first_lesson_page.dart';
import 'package:intro_to_html/home_page.dart';
import 'package:intro_to_html/intro_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intro_to_html/lesson_five_page.dart';
import 'package:intro_to_html/lesson_four_page.dart';
import 'package:intro_to_html/second_lesson.dart';
import 'package:intro_to_html/third_lesson_page.dart';
import 'firebase_options.dart';

// ...


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  void init()async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    init();
    Intl.defaultLocale = 'ar';
    return const MaterialApp(

      home: LessonFiveStudy(),
    );
  }
}