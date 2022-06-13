import 'package:flutter/material.dart';

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
            height: 30,
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
  List<String> headings = ["H1", "H2", "H3", "H4", "H5", "H6"];
  List<String> inputs = ["", "", "", "", "", ""];

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
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                HeadingsBox(headings[0]),
                DragTarget<String>(
                  onAccept: (data) => setState(() async {
                    inputs[0] = data;
                    await Future.delayed(const Duration(seconds: 2));
                  }),
                  builder: (context, _, __) => Container(
                    width: 70,
                    height: 40,
                    color: Colors.amber,
                    child: Text(
                      inputs[0],
                      style: const TextStyle(fontSize: 23.0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                HeadingsBox(headings[1]),
                DragTarget<String>(
                  onAccept: (data) => setState(() async {
                    inputs[1] = data;
                    await Future.delayed(const Duration(seconds: 2));
                  }),
                  builder: (context, _, __) => Container(
                    width: 70,
                    height: 40,
                    color: Colors.amber,
                    child: Text(
                      inputs[1],
                      style: const TextStyle(fontSize: 23.0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                HeadingsBox(headings[2]),
                DragTarget<String>(
                  onAccept: (data) => setState(() async {
                    inputs[2] = data;
                    await Future.delayed(const Duration(seconds: 2));
                  }),
                  builder: (context, _, __) => Container(
                    width: 70,
                    height: 40,
                    color: Colors.amber,
                    child: Text(
                      inputs[2],
                      style: const TextStyle(fontSize: 23.0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                HeadingsBox(headings[3]),
                DragTarget<String>(
                  onAccept: (data) => setState(() async {
                    inputs[3] = data;
                    await Future.delayed(const Duration(seconds: 2));
                  }),
                  builder: (context, _, __) => Container(
                    width: 70,
                    height: 40,
                    color: Colors.amber,
                    child: Text(
                      inputs[3],
                      style: const TextStyle(fontSize: 23.0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                HeadingsBox(headings[4]),
                DragTarget<String>(
                  onAccept: (data) => setState(() async {
                    inputs[4] = data;
                    await Future.delayed(const Duration(seconds: 2));
                  }),
                  builder: (context, _, __) => Container(
                    width: 70,
                    height: 40,
                    color: Colors.amber,
                    child: Text(
                      inputs[4],
                      style: const TextStyle(fontSize: 23.0),
                    ),
                  ),
                ),
              ],
            ),Row(
              children: <Widget>[
                HeadingsBox(headings[5]),
                DragTarget<String>(
                  onAccept: (data) => setState(() async {
                    inputs[5] = data;
                    await Future.delayed(const Duration(seconds: 2));
                  }),
                  builder: (context, _, __) => Container(
                    width: 70,
                    height: 40,
                    color: Colors.amber,
                    child: Text(
                      inputs[5],
                      style: const TextStyle(fontSize: 23.0),
                    ),
                  ),
                ),
              ],
            ),
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
      width: 40,
      color: Colors.blueGrey,
      height: 40,
      child: Text(
        heading,
        style: const TextStyle(
          fontSize: 30.0,
        ),
      ),
    );
  }
}
