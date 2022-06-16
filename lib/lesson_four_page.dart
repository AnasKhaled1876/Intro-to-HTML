import 'package:flutter/material.dart';
import 'package:intro_to_html/lessons_page.dart';

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
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("الدرس الرابع"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
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
            ))
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
  void checkAndSetRestFalse(int except){
    for(int i = 0; i<checkBoxValues.length;i++)
      {
        if(i == except) {
          continue;
        }
        checkBoxValues[i]=false;
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
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("النشاط"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "أمامك بعض المشكلات يرجى ملاحظتها جيدا واختيار الإجابة الصحيحة بين المشكلات التالية:",
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              color: Colors.deepOrangeAccent,
              child: const Center(
                child: Text(
                  "قام احد المبرمجين المبتدئين بكتابة كود العنوان في رأيك كيف قام بكتابته",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                Container(
                  color: Colors.deepOrangeAccent.withOpacity(0.6),
                  height: 110,
                  width: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "< hr color\n \"blue\" >",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(
                        value: checkBoxValues[0],
                        onChanged: (val) {
                          checkBoxValues[0] = val!;
                          setState(() {
                            checkBoxValues[0] = val;
                            checkAndSetRestFalse(0);
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
                  height: 110,
                  width: 95,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "      < hr\n color blue>",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(
                        value: checkBoxValues[1],
                        onChanged: (val) {
                          checkBoxValues[1] = val!;
                          setState(() {
                            checkBoxValues[1] = val;
                            checkAndSetRestFalse(1);
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
                  height: 110,
                  width: 95,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "< hr color\n = \"blue\" >",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(
                        value: checkBoxValues[2],
                        onChanged: (val) {
                          checkBoxValues[2] = val!;
                          setState(() {
                            checkBoxValues[2] = val;
                            finished=true;
                            checkAndSetRestFalse(2);
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
                  height: 110,
                  width: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "< hr color\n = blue >",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Checkbox(
                        value: checkBoxValues[3],
                        onChanged: (val) {
                          checkBoxValues[3] = val!;
                          setState(() {
                            checkBoxValues[3] = val;
                            checkAndSetRestFalse(3);
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
            const SizedBox(height: 20.0),
            if (finished)
              const Center(
                child: Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Colors.green,
                ),
              ),
            const SizedBox(height: 40.0),
            if (finished)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LessonsPage()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: const Size(300, 60)),
                child: const Text(
                  "التالي",
                  style: TextStyle(fontSize: 20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}