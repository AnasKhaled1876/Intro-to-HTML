import 'package:flutter/material.dart';

import 'first_lesson_page.dart';
import 'home_page.dart';

class LessonTwoStudy extends StatefulWidget {
  const LessonTwoStudy({Key? key}) : super(key: key);

  @override
  State<LessonTwoStudy> createState() => _LessonTwoStudyState();
}

class _LessonTwoStudyState extends State<LessonTwoStudy> {
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
        title: const Text("الدرس الثاني"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const SizedBox(
            height: 70,
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "ما هو شكل صفحة الHTML",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 26.0,
                  color: Colors.redAccent),
              textDirection: TextDirection.rtl,
            ),
          ),
          Center(
            child: SizedBox(
              width: 350,
              height: 300,
              child: Image.asset("assets/lesson2.png"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LessonTwoActivity()));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, minimumSize: const Size(300, 60)),
              child: const Text(
                "النشاط",
                style: TextStyle(fontSize: 24),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LessonTwoActivity extends StatefulWidget {
  const LessonTwoActivity({Key? key}) : super(key: key);

  @override
  State<LessonTwoActivity> createState() => _LessonTwoActivityState();
}

class _LessonTwoActivityState extends State<LessonTwoActivity> {
  List<String> headings = ["1", "2", "3", "4", "5", "6", "7", "8"];
  List<String> headingsNo = [
    "<HTML>",
    "<head>",
    "<title>",
    "</title>",
    "</head>",
    "<body>",
    "</body>",
    "</HTML>"
  ];
  List<String> inputs = ["", "", "", "", "", "", "", ""];
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
    for (int i = 0; i < headingsNo.length; i += 2) {
      myChoices.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DraggableItem(item: headingsNo[i]),
            const SizedBox(width: 30.0),
            DraggableItem(item: headingsNo[i + 1]),
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
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("الدرس الثاني"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.blue.withOpacity(0.3),
            width: 195,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    HeadingsBox(headings[0]),
                    const SizedBox(width: 30,),
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
                    const SizedBox(width: 30,),
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
                    const SizedBox(width: 30,),
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
                    const SizedBox(width: 30,),
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
                    const SizedBox(width: 30,),
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
                    const SizedBox(width: 30,),
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
                Row(
                  children: <Widget>[
                    HeadingsBox(headings[6]),
                    const SizedBox(width: 30,),
                    DragTarget<String>(
                      onAccept: (data) => setState(() {
                        inputs[6] = data;
                        if (check()) {
                          finished = true;
                        }
                      }),
                      builder: (context, _, __) => Container(
                        width: 90,
                        height: 40,
                        child: Text(
                          inputs[6],
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    HeadingsBox(headings[7]),
                    const SizedBox(width: 30,),
                    DragTarget<String>(
                      onAccept: (data) => setState(() {
                        inputs[7] = data;
                        if (check()) {
                          finished = true;
                        }
                      }),
                      builder: (context, _, __) => Container(
                        width: 90,
                        height: 40,
                        child: Text(
                          inputs[7],
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Column(
            children: fillRows(),
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
        ],
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