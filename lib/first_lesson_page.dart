import 'package:flutter/material.dart';
import 'package:intro_to_html/home_page.dart';
import 'package:intro_to_html/main_page.dart';
import 'package:intro_to_html/second_lesson.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonOneActivity extends StatefulWidget {
  const LessonOneActivity({Key? key}) : super(key: key);

  @override
  State<LessonOneActivity> createState() => _LessonOneActivityState();
}

class _LessonOneActivityState extends State<LessonOneActivity> {
  String answer1 = "", answer2 = "";
  bool finished = false, next = false;

  void check(){
  if(answer1!="" && answer2!="") {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "إجابة غير صحيحة من فضلك أعد المحاولة",
        textDirection: TextDirection.rtl,
      ),
    ));
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
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "تعريف لغة HTML:",
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 30.0,
                  color: Colors.red[900]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                children: <Widget>[
                  DragTarget<String>(
                    onAccept: (data) => setState(() {
                      answer2 = data;
                      if (answer1 == "HTML" && answer2 == "هيكلة") {
                        finished = true;
                      }
                      else {
                        check();
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
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "في تصميم",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 23.0, color: Colors.red[900]),
                ),
              ),
              Column(
                children: <Widget>[
                  DragTarget<String>(
                    onAccept: (data) => setState(() {
                      answer1 = data;
                      if (answer1 == "HTML" && answer2 == "هيكلة") {
                        finished = true;
                      }
                      else {
                        check();
                      }
                    },
                    ),
                    builder: (context, _, __) => SizedBox(
                      width: 70,
                      height: 40,
                      child: Text(
                        answer1,
                        style: const TextStyle(fontSize: 25.0),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "..................",
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.red[900]),
                      )),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "تستخدم لغة ",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 25.0, color: Colors.red[900]),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "المواقع الالكترونية",
              style: TextStyle(fontSize: 23.0, color: Colors.red[900]),
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
          if (finished)
            const Center(
              child: Icon(
                Icons.check_circle,
                size: 50,
                color: Colors.green,
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          if (finished)
            Center(
              child: ElevatedButton(
                onPressed: () {
                  HomePage.checkLevel(1);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LessonTwoStudy()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: const Size(300, 60)),
                child: const Text(
                  "التالي",
                  style: TextStyle(fontSize: 20),
                ),
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
      height: 45,
      child: Center(
          child: Text(
        item,
        style: const TextStyle(
            fontSize: 20.0,
            decoration: TextDecoration.none,
            color: Colors.white),
      )),
    );
  }

  MatchItem(this.item, {Key? key}) : super(key: key);
}

class LessonOneStudy extends StatelessWidget {
  const LessonOneStudy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String videoId;
    videoId = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=ERXcU_TpIio")!;
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MainPage()));
          },
          icon: const Icon(Icons.home),
        ),
        title: const Text("خريطة السير"),
      ),
      body: Column(
        children: [
          Center(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LessonOneActivity()));
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
