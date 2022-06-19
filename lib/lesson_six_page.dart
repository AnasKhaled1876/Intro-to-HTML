import 'package:flutter/material.dart';
import 'package:intro_to_html/lessons_page.dart';

import 'first_lesson_page.dart';
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MainPage()));
          },
          icon: const Icon(Icons.home),
        ),
        title: const Text("الدرس السادس"),
      ),
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: Image.asset("assets/lesson6.png"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LessonSixActivity()));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, minimumSize: const Size(300, 60)),
              child: const Text(
                "النشاط",
                style: TextStyle(fontSize: 20),
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
  String answer = "";
  bool finished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          icon: const Icon(Icons.home),
        ),
        title: const Text("الدرس السادس"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "كود <p>...<p> هو كود مزدوج له بداية <p> ",
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 23.0, color: Colors.red[900]),
                  ),
                ),
              ],
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
                          answer = data;
                          if (answer == "فقرة") {
                            finished = true;
                          }
                          else
                            {
                              finished=false;
                            }
                        },
                      ),
                      builder: (context, _, __) => SizedBox(
                        width: 100,
                        height: 30,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            answer,
                            softWrap: true,
                            style: const TextStyle(fontSize: 20.0,),
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
                  child: Text("وله نهاية <p/> يستخدم لاإضافة" ,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.red[900],fontSize: 23.0),),
                ),
              ],
            ),
            const SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                DraggableItem(item: "عنوان رئيسي"),
                SizedBox(width: 30.0),
                DraggableItem(item: "قائمة"),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                DraggableItem(item: "صورة"),
                SizedBox(width: 30.0),
                DraggableItem(item: "فقرة"),
              ],
            ),
            const SizedBox(height: 60.0),
            if (finished)
              const Center(
                child: Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Colors.green,
                ),
              ),
            const SizedBox(
              height: 20,
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
                      primary: Colors.black, minimumSize: const Size(300, 60)),
                  child: const Text(
                    "التالي",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
