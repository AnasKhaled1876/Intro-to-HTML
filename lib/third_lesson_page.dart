import 'package:flutter/material.dart';
import 'package:intro_to_html/home_page.dart';

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
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("الدرس الثالث"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "انواع أكواد HTML",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 25.0,
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
                primary: Colors.black, minimumSize: const Size(300, 60)),
            child: const Text(
              "النشاط",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
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
  List<String> inputs = ["", "", "", "", "", ""];
  bool finished = false;

  bool check() {
    for (int i = 0; i < headings.length; i++) {
      if (inputs[i] != headings[i]) {
        return false;
      }
    }
    return true;
  }

  List<Widget> fillRows() {
    List<Widget> myChoices = [];
    for (int i = 0; i < headings.length; i += 3) {
      myChoices.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Dragi(headings[i]),
            const SizedBox(width: 30.0),
            Dragi(headings[i + 1]),
            const SizedBox(width: 30.0),
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
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("الدرس الثاني"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "أمامك مجموعة من المربعات الفارغة انظري اسفل الاحجية ستجدين مجموعة من الاكواد قومي بترتيبها بطريقة السحب والافلات.",
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  color: Colors.black,
                  width: 30,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                          fontSize: 20.0,
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
                  }),
                  builder: (context, _, __) => Container(
                    color: Colors.black.withOpacity(0.7),
                    width: 100,
                    height: 50,
                    child: Text(
                      inputs[0],
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                DragTarget<String>(
                  onAccept: (data) => setState(() {
                    inputs[1] = data;
                    if (check()) {
                      finished = true;
                    }
                  }),
                  builder: (context, _, __) => Container(
                    color: Colors.black.withOpacity(0.7),
                    width: 100,
                    height: 50,
                    child: Text(
                      inputs[1],
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                DragTarget<String>(
                  onAccept: (data) => setState(() {
                    inputs[2] = data;
                    if (check()) {
                      finished = true;
                    }
                  }),
                  builder: (context, _, __) => Container(
                    color: Colors.black.withOpacity(0.7),
                    width: 100,
                    height: 50,
                    child: Text(
                      inputs[2],
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                color: Colors.red,
                width: 30,
                height: 50,
                child: const Center(
                  child: Text(
                    "2",
                    style: TextStyle(
                        fontSize: 20.0,
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
                }),
                builder: (context, _, __) => Container(
                  color: Colors.red.withOpacity(0.7),
                  width: 100,
                  height: 50,
                  child: Text(
                    inputs[3],
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              DragTarget<String>(
                onAccept: (data) => setState(() {
                  inputs[4] = data;
                  if (check()) {
                    finished = true;
                  }
                }),
                builder: (context, _, __) => Container(
                  color: Colors.red.withOpacity(0.7),
                  width: 100,
                  height: 50,
                  child: Text(
                    inputs[4],
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              DragTarget<String>(
                onAccept: (data) => setState(() {
                  inputs[5] = data;
                  if (check()) {
                    finished = true;
                  }
                }),
                builder: (context, _, __) => Container(
                  color: Colors.red.withOpacity(0.7),
                  width: 100,
                  height: 50,
                  child: Text(
                    inputs[5],
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: fillRows(),
          )
        ],
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
      width: 100,
      height: 50,
      child: Center(
          child: Text(
        item,
        style: const TextStyle(
            fontSize: 18.0,
            decoration: TextDecoration.none,
            color: Colors.amber),
      )),
    );
  }

  AnswerItem(this.item);
}
