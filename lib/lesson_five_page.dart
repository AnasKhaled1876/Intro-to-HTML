import 'package:flutter/material.dart';
import 'package:intro_to_html/lesson_six_page.dart';
import 'package:intro_to_html/lessons_page.dart';

import 'first_lesson_page.dart';
import 'home_page.dart';
import 'main_page.dart';

class LessonFiveStudy extends StatefulWidget {
  const LessonFiveStudy({Key? key}) : super(key: key);

  @override
  State<LessonFiveStudy> createState() => _LessonFiveStudyState();
}

class _LessonFiveStudyState extends State<LessonFiveStudy> {
  bool firstPress = false;

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
        title: const Text("الدرس الخامس"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            if (!firstPress)
              Expanded(
                flex: 9,
                child: Center(
                  child: Image.asset("assets/lesson5_1.png"),
                ),
              )
            else
              Expanded(
                flex: 9,
                child: Center(
                  child: Image.asset("assets/lesson5_2.png"),
                ),
              ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  if (firstPress) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LessonFiveActivity()));
                  } else {
                    setState(() {
                      firstPress = true;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: const Size(300, 60)),
                child: const Text(
                  "النشاط",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LessonFiveActivity extends StatefulWidget {
  const LessonFiveActivity({Key? key}) : super(key: key);

  @override
  State<LessonFiveActivity> createState() => _LessonFiveActivityState();
}

class _LessonFiveActivityState extends State<LessonFiveActivity> {

  List<String> headings = ["1", "2", "3", "4", "5", "6"];
  List<String> headingsNo = [
    "H1",
    "H2",
    "H3",
    "H4",
    "H5",
    "H6"
  ];
  List<String> inputs = ["", "", "", "", "", ""];
  bool finished = false;

  bool check() {
    for (int i = 0; i < headingsNo.length; i++) {
      if (inputs[i] != headingsNo[i]) {
        return false;
      }
    }
    return true;
  }
  List<Widget> fillRows() {
    List<Widget> myChoices = [];
    for (int i = 0; i < headingsNo.length; i += 3) {
      myChoices.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DraggableItem(item: headingsNo[i]),
            const SizedBox(width: 25.0),
            DraggableItem(item: headingsNo[i + 1]),
            const SizedBox(width: 25.0),
            DraggableItem(item: headingsNo[i + 2]),
          ],
        ),
      );
    }
    return myChoices;
  }

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
        title: const Text("النشاط"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "قم بترتيب العناويين التالية حسب الترتيب تنازلي ( من الخط الكبير للصغير):",
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40,),
            Container(
              color: Colors.blue.withOpacity(0.3),
              width: 195,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[0]),
                      const SizedBox(
                        width: 30,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[0] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => Container(
                          width: 90,
                          height: 40,
                          child: Text(
                            inputs[0],
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[1]),
                      const SizedBox(
                        width: 30,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[1] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => Container(
                          width: 90,
                          height: 40,
                          child: Text(
                            inputs[1],
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[2]),
                      const SizedBox(
                        width: 30,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[2] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => Container(
                          width: 90,
                          height: 40,
                          child: Text(
                            inputs[2],
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[3]),
                      const SizedBox(
                        width: 30,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[3] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => Container(
                          width: 90,
                          height: 40,
                          child: Text(
                            inputs[3],
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[4]),
                      const SizedBox(
                        width: 30,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[4] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => Container(
                          width: 90,
                          height: 40,
                          child: Text(
                            inputs[4],
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[5]),
                      const SizedBox(
                        width: 30,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[5] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => Container(
                          width: 90,
                          height: 40,
                          child: Text(
                            inputs[5],
                            style: const TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: fillRows(),
            ),
            const SizedBox(height: 20.0),
            if (finished)
              const Center(
                child: Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Colors.green,
                ),
              ),
            if (finished)
              ElevatedButton(
                onPressed: () {
                  HomePage.checkLevel(5);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LessonSixStudy()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: const Size(300, 40)),
                child: const Text(
                  "التالي",
                  style: TextStyle(fontSize: 20),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class HeadingsBox extends StatelessWidget {
  final String heading;

  const HeadingsBox(this.heading, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(9),
        ),
      ),
      width: 70,
      height: 40,
      child: Center(
        child: Text(
          heading,
          style: const TextStyle(
            fontSize: 27.0,
          ),
        ),
      ),
    );
  }
}
