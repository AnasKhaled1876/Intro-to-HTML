import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intro_to_html/intro_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intro_to_html/lesson_six_page.dart';
import 'firebase_options.dart';
import 'package:sizer/sizer.dart';

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
    return  Sizer(
        builder: (context, orientation, deviceType) =>  MaterialApp(
          theme: ThemeData.from(
            colorScheme: const ColorScheme.light(),
          ).copyWith(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              },
            ),
          ),
            home: IntroPage(),
          )
    );
  }
}