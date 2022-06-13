import 'package:flutter/material.dart';
import 'package:intro_to_html/main_page.dart';

class FirstLessonPage extends StatefulWidget {
  const FirstLessonPage({Key? key}) : super(key: key);

  @override
  State<FirstLessonPage> createState() => _FirstLessonPageState();
}

class _FirstLessonPageState extends State<FirstLessonPage> {
  String answer1 = "", answer2 = "";
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
        title: const Text("الدرس الأول"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "تعريف لغة HTML:",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  decoration: TextDecoration.underline, fontSize: 30.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                children: <Widget>[
                  DragTarget<String>(
                    onAccept: (data) => setState(() async{
                      answer2 = data;
                      if (answer1 == "HTML" && answer2 == "هيكلة") {
                        finished = true;
                        await Future.delayed(const Duration(seconds: 2));
                      }
                    }),
                    builder: (context, _, __) => SizedBox(
                      width: 70,
                      height: 40,
                      child: Text(
                        answer2,
                        style: const TextStyle(fontSize: 23.0),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "..................",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "في تصميم",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 23.0),
                ),
              ),
              Column(
                children: <Widget>[
                  DragTarget<String>(
                    onAccept: (data) => setState(() async{
                      answer1 = data;
                      if (answer1 == "HTML" && answer2 == "هيكلة") {
                        finished = true;
                        await Future.delayed(const Duration(seconds: 2));
                      }
                    }),
                    builder: (context, _, __) => SizedBox(
                      width: 70,
                      height: 40,
                      child: Text(
                        answer1,
                        style: const TextStyle(fontSize: 25.0),
                      ),
                    ),
                  ),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "..................",
                        style: TextStyle(fontSize: 20.0),
                      )),
                ],
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "تستخدم لغة ",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "المواقع الالكترونية",
              style: TextStyle(fontSize: 23.0),
            ),
          ),
          const SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              DraggableItem(item: "CSS"),
              SizedBox(width: 30.0),
              DraggableItem(item: "HTML"),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              DraggableItem(item: "تنسيق"),
              SizedBox(width: 30.0),
              DraggableItem(item: "هيكلة"),
            ],
          ),
          const SizedBox(height: 60.0),
          if(finished)
          const Center(
            child: Icon(
              Icons.check_circle,
              size: 50,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}

class DraggableItem extends StatelessWidget {
  final String item;

  const DraggableItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: item,
      feedback: MatchItem(item),
      childWhenDragging: null,
      child: MatchItem(item),
    );
  }
}

class MatchItem extends StatelessWidget {
  final String item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      width: 100,
      height: 50,
      child: Center(
          child: Text(
        item,
        style: const TextStyle(
            decoration: TextDecoration.none, color: Colors.amber),
      )),
    );
  }

  MatchItem(this.item, {Key? key}) : super(key: key);
}
