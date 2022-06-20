import 'package:flutter/material.dart';
import 'package:intro_to_html/lesson_six_page.dart';
import 'package:sizer/sizer.dart';
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
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Row(
          children: [
            SizedBox(width: 21.w,),
            const Text("الدرس الخامس"),
            SizedBox(width: 15.w,),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainPage()));
                },
                icon: const Icon(Icons.home),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.h),
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
                    primary: Colors.black, minimumSize: Size(80.w, 8.h)),
                child: Text(
                  "النشاط",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
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
            SizedBox(width: 5.w),
            DraggableItem(item: headingsNo[i + 1]),
            SizedBox(width: 5.w),
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
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Row(
          children: [
            SizedBox(width: 21.w,),
            const Text("النشاط"),
            SizedBox(width: 31.w,),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainPage()));
                },
                icon: const Icon(Icons.home),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 0.5.h),
        child: Column(
          children: <Widget>[
            SizedBox(height: 5.h,),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "قم بترتيب العناويين التالية حسب الترتيب تنازلي ( من الخط الكبير للصغير):",
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 4.h,),
            Container(
              color: Colors.blue.withOpacity(0.3),
              width: 50.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[0]),
                      SizedBox(
                        width: 10.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[0] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetLevelSix(input: inputs[0]),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[1]),
                      SizedBox(
                        width: 10.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[1] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetLevelSix(input: inputs[1]),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[2]),
                      SizedBox(
                        width: 10.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[2] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetLevelSix(input: inputs[2]),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[3]),
                      SizedBox(
                        width: 10.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[3] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetLevelSix(input: inputs[3]),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[4]),
                      SizedBox(
                        width: 10.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[4] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetLevelSix(input: inputs[4]),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[5]),
                      SizedBox(
                        width: 10.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[5] = data;
                          if (check()) {
                            finished = true;
                          }
                        }),
                        builder: (context, _, __) => DragTargetLevelSix(input: inputs[5]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Column(
              children: fillRows(),
            ),
            SizedBox(height: 5.h),
            if (finished)
              ElevatedButton(
                onPressed: () {
                  HomePage.checkLevel(5);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LessonSixStudy()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: Size(80.w, 8.h)),
                child: Text(
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

class DragTargetLevelSix extends StatelessWidget {
  const DragTargetLevelSix({
    Key? key,
    required this.input,
  }) : super(key: key);

  final String input;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.w,
      height: 5.h,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          input,
          style: TextStyle(fontSize: 20.0.sp),
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
      width: 15.w,
      height: 5.h,
      child: Center(
        child: Text(
          heading,
          style: TextStyle(
            fontSize: 22.0.sp,
          ),
        ),
      ),
    );
  }
}
