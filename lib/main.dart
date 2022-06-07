import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intro_to_html/home_page.dart';
import 'package:intro_to_html/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'ar';
    return const MaterialApp(

      home: IntroPage(),
    );
  }
}