import 'package:flutter/material.dart';
import 'package:intro_to_html/home_page.dart';
import 'package:sizer/sizer.dart';

import 'lesson_four_page.dart';
import 'main_page.dart';

class LessonThreeStudy extends StatelessWidget {
  const LessonThreeStudy({Key? key}) : super(key: key);

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
            const Text("الدرس الثالث"),
            SizedBox(width: 19.w,),
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
        margin: EdgeInsets.symmetric(horizontal: 2.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "انواع أكواد HTML",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    color: Colors.red[900],
                    fontSize: 23.0.sp,
                    decoration: TextDecoration.underline),
              ),
            ),
            Center(
              child: Image.asset("assets/lesson3.png"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LessonThreeActivity()));
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, minimumSize:  Size(80.w, 7.h)),
              child: Text(
                "النشاط",
                style: TextStyle(fontSize: 20.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LessonThreeActivity extends StatefulWidget {
  const LessonThreeActivity({Key? key}) : super(key: key);

  @override
  State<LessonThreeActivity> createState() => _LessonThreeActivityState();
}

class _LessonThreeActivityState extends State<LessonThreeActivity> {
  List<String> headings = [
    "كود مفرد",
    "<tag>",
    "كود مزدوج",
    "ليس له نهاية",
    "<tag>\n</tag>",
    "يوجد له نهاية",
  ];
  List<String> answers = [
    "كود مفرد",
    "<tag>",
    "ليس له نهاية",
    "كود مزدوج",
    "<tag>\n</tag>",
    "يوجد له نهاية",
  ];
  List<String> inputs = ["", "", "", "", "", ""];
  bool finished = false;

  bool check() {
    for (int i = 0; i < answers.length; i++) {
      if (inputs[i] != answers[i]) {
        return false;
      }
    }
    return true;
  }

  List<Widget> fillRows() {
    List<Widget> myChoices = [];
    for (int i = 0; i < headings.length; i += 3) {
      if(i==3) {
        myChoices.add( SizedBox(height: 4.h,));
      }
      myChoices.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Dragi(headings[i]),
            SizedBox(width: 8.0.w),
            Dragi(headings[i + 1]),
            SizedBox(width: 8.0.w),
            Dragi(headings[i + 2]),
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
            SizedBox(width: 24.w,),
            const Text("النشاط"),
            SizedBox(width: 25.w,),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 4.h,
            ),
             Align(
              alignment: Alignment.centerRight,
              child: Text(
                "أمامك مجموعة من المربعات الفارغة انظري اسفل الاحجية ستجدين مجموعة من الاكواد قومي بترتيبها بطريقة السحب والافلات.",
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 17.0.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    color: Colors.black,
                    width: 10.w,
                    height: 7.h,
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 20.0.sp,
                            decoration: TextDecoration.none,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  DragTarget<String>(
                    onAccept: (data) => setState(() {
                      inputs[0] = data;
                      if (check()) {
                        finished = true;
                      }
                      else
                      {
                        finished=false;
                      }
                    }),
                    builder: (context, _, __) => BlackRow(input: inputs[0]),
                  ),
                  DragTarget<String>(
                    onAccept: (data) => setState(() {
                      inputs[1] = data;
                      if (check()) {
                        finished = true;
                      }
                      else
                      {
                        finished=false;
                      }
                    }),
                    builder: (context, _, __) => BlackRow(input: inputs[1]),
                  ),
                  DragTarget<String>(
                    onAccept: (data) => setState(() {
                      inputs[2] = data;
                      if (check()) {
                        finished = true;
                      }
                      else
                      {
                        finished=false;
                      }
                    }),
                    builder: (context, _, __) => BlackRow(input: inputs[2]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  color: Colors.red,
                  width: 10.w,
                  height: 7.h,
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                          fontSize: 20.0.sp,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                  ),
                ),
                DragTarget<String>(
                  onAccept: (data) => setState(() {
                    inputs[3] = data;
                    if (check()) {
                      finished = true;
                    }
                    else
                    {
                      finished=false;
                    }
                  }),
                  builder: (context, _, __) => GreenRow(input: inputs[3]),
                ),
                DragTarget<String>(
                  onAccept: (data) => setState(() {
                    inputs[4] = data;
                    if (check()) {
                      finished = true;
                    }
                    else
                    {
                      finished=false;
                    }
                  }),
                  builder: (context, _, __) => GreenRow(input: inputs[4]),
                ),
                DragTarget<String>(
                  onAccept: (data) => setState(() {
                    inputs[5] = data;
                    if (check()) {
                      finished = true;
                    }
                    else
                      {
                        finished=false;
                      }
                  }),
                  builder: (context, _, __) => GreenRow(input: inputs[5]),
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: fillRows(),
            ),
            SizedBox(height: 8.h),
            if (finished)
              ElevatedButton(
                onPressed: () {
                  HomePage.checkLevel(3);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LessonFourStudy()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: Size(60.w, 7.h)),
                child: Text(
                  "التالي",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class GreenRow extends StatelessWidget {
  const GreenRow({
    Key? key,
    required this.input,
  }) : super(key: key);

  final String input;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.7),
      width: 26.w,
      height: 7.h,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          input,
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
    );
  }
}

class BlackRow extends StatelessWidget {
  const BlackRow({
    Key? key,
    required this.input,
  }) : super(key: key);

  final String input;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.7),
      width: 26.w,
      height: 7.h,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          input,
          style: TextStyle(fontSize: 16.0.sp),
        ),
      ),
    );
  }
}

class Dragi extends StatelessWidget {
  final String item;

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: item,
      feedback: AnswerItem(item),
      childWhenDragging: null,
      child: AnswerItem(item),
    );
  }

  Dragi(this.item, {Key? key}) : super(key: key);
}

class AnswerItem extends StatelessWidget {
  final String item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withOpacity(0.8),
      width: 25.w,
      height: 7.h,
      child: Center(
          child: Text(
        item,
        style: TextStyle(
            fontSize: 15.0.sp,
            decoration: TextDecoration.none,
            color: Colors.white),
      )),
    );
  }

  AnswerItem(this.item);
}