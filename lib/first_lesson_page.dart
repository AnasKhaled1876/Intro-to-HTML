import 'package:flutter/material.dart';
import 'package:intro_to_html/main_page.dart';

class FirstLessonPage extends StatefulWidget {
  const FirstLessonPage({Key? key}) : super(key: key);

  @override
  State<FirstLessonPage> createState() => _FirstLessonPageState();
}

class _FirstLessonPageState extends State<FirstLessonPage> {
  String answer = "";

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
                    onAccept: (data) => setState(() => answer = data),
                    builder: (context, _, __) => SizedBox(
                      width: 70,
                      height: 40,
                      child: Text(
                        answer,
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
                  style: TextStyle(fontSize: 26.0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              DraggableItem(item: "CSS"),
              DraggableItem(item: "HTML"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              DraggableItem(item: "تنسيق"),
              DraggableItem(item: "هيكلة"),
            ],
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
