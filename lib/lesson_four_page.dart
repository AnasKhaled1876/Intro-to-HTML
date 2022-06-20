import 'package:flutter/material.dart';
import 'package:intro_to_html/lesson_five_page.dart';
import 'package:intro_to_html/lessons_page.dart';
import 'package:sizer/sizer.dart';

import 'home_page.dart';
import 'main_page.dart';

class LessonFourStudy extends StatelessWidget {
  const LessonFourStudy({Key? key}) : super(key: key);

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
            const Text("الدرس الرابع"),
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
        margin: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              flex: 9,
              child: Center(
                child: Image.asset("assets/lesson4.png"),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LessonFourActivity()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: Size(80.w, 8.h)),
                child:  Text(
                  "النشاط",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            ),
            SizedBox(
              height: 9.h,
            )
          ],
        ),
      ),
    );
  }
}

class LessonFourActivity extends StatefulWidget {
  const LessonFourActivity({Key? key}) : super(key: key);

  @override
  State<LessonFourActivity> createState() => _LessonFourActivityState();
}

class _LessonFourActivityState extends State<LessonFourActivity> {
  List<bool> checkBoxValues = [false, false, false, false];
  bool finished = false;

  void checkAndSetRestFalse(int except) {
    for (int i = 0; i < checkBoxValues.length; i++) {
      if (i == except) {
        continue;
      }
      checkBoxValues[i] = false;
    }
  }

  void setFinished(){
    if (checkBoxValues[2] == true) {
      finished = true;
    } else {
      finished = false;
    }
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
        margin: EdgeInsets.all(1.w),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 4.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "أمامك بعض المشكلات يرجى ملاحظتها جيدا واختيار الإجابة الصحيحة بين المشكلات التالية:",
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              width: double.infinity,
              color: Colors.deepOrangeAccent,
              child: Center(
                child: Text(
                  "قام احد المبرمجين المبتدئين بكتابة كود العنوان في رأيك كيف قام بكتابته",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: <Widget>[
                Container(
                  color: Colors.deepOrangeAccent.withOpacity(0.6),
                  height: 15.h,
                  width: 24.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "< hr color\n \"blue\" >",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(
                        value: checkBoxValues[0],
                        onChanged: (val) {
                          checkBoxValues[0] = val!;
                          setState(() {
                            checkBoxValues[0] = val;
                            checkAndSetRestFalse(0);
                            setFinished();
                          });
                        },
                        activeColor: Colors.grey,
                        checkColor: Colors.black,
                        shape: const CircleBorder(),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.deepOrangeAccent.withOpacity(0.6),
                  height: 15.h,
                  width: 24.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "      < hr\n color blue>",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(
                        value: checkBoxValues[1],
                        onChanged: (val) {
                          checkBoxValues[1] = val!;
                          setState(() {
                            checkBoxValues[1] = val;
                            checkAndSetRestFalse(1);
                            setFinished();
                          });
                        },
                        activeColor: Colors.grey,
                        checkColor: Colors.black,
                        shape: const CircleBorder(),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.deepOrangeAccent.withOpacity(0.6),
                  height: 15.h,
                  width: 24.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "< hr color\n = \"blue\" >",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(
                        value: checkBoxValues[2],
                        onChanged: (val) {
                          checkBoxValues[2] = val!;
                          setState(() {
                            checkBoxValues[2] = val;
                            checkAndSetRestFalse(2);
                            setFinished();
                          });
                        },
                        activeColor: Colors.grey,
                        checkColor: Colors.black,
                        shape: const CircleBorder(),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.deepOrangeAccent.withOpacity(0.6),
                  height: 15.h,
                  width: 24.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "< hr color\n = blue >",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(
                        value: checkBoxValues[3],
                        onChanged: (val) {
                          checkBoxValues[3] = val!;
                          setState(() {
                            checkBoxValues[3] = val;
                            checkAndSetRestFalse(3);
                            setFinished();
                          });
                        },
                        activeColor: Colors.grey,
                        checkColor: Colors.black,
                        shape: const CircleBorder(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            if (finished)
              ElevatedButton(
                onPressed: () {
                  HomePage.checkLevel(4);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LessonFiveStudy()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: Size(80.w, 8.h)),
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
