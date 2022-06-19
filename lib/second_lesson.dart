import 'package:flutter/material.dart';
import 'package:intro_to_html/third_lesson_page.dart';
import 'package:sizer/sizer.dart';

import 'first_lesson_page.dart';
import 'home_page.dart';
import 'main_page.dart';

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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          icon: const Icon(Icons.home),
        ),
        title: const Text("الدرس الثاني"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
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
             SizedBox(width: 13.w),
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          icon: const Icon(Icons.home),
        ),
        title: const Text("النشاط"),
      ),
      body: Container(
        margin: EdgeInsets.all(2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "قم بترتيب الاكواد التالية حسب الترتيب الصحيح للبنية الهيكلية لغة HTML",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900]),
              ),
            ),
            Container(
              color: Colors.blue.withOpacity(0.3),
              width: 55.w,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[0]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[0] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[0],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[1]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[1] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[1],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[2]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[2] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[2],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[3]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[3] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[3],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[4]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[4] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[4],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[5]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[5] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[5],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[6]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[6] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[6],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[7]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[7] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[7],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Column(
              children: fillRows(),
            ),
            SizedBox(height: 2.h),
            if (finished)
              ElevatedButton(
                onPressed: () {
                  HomePage.checkLevel(2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LessonThreeStudy()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: const Size(300, 40)),
                child:  Text(
                  "التالي",
                  style: TextStyle(fontSize: 20.sp),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class DragTargetContainer extends StatelessWidget {
  const DragTargetContainer({
    Key? key,
    required this.input,
  }) : super(key: key);

  final String input;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.w,
      height: 5.h,
      child: Align(
        child: Text(
          input,
          style: TextStyle(fontSize: 18.sp),
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
      height: 37,
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
// if (finished)
// const Center(
// child: Icon(
// Icons.check_circle,
// size: 50,
// color: Colors.green,
// ),
// ),
