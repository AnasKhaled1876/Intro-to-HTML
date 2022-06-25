import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_html/home_page.dart';
import 'package:intro_to_html/main_page.dart';
import 'package:intro_to_html/second_lesson.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonOneActivity extends StatefulWidget {
  const LessonOneActivity({Key? key}) : super(key: key);

  @override
  State<LessonOneActivity> createState() => _LessonOneActivityState();
}

class _LessonOneActivityState extends State<LessonOneActivity> {
  String answer1 = "", answer2 = "";
  bool finished = false, next = false;
  void playCorrectSound() {
    final assetsAudioPlayer = AssetsAudioPlayer();

    assetsAudioPlayer.open(
      Audio("assets/correct.wav"),
    );
    assetsAudioPlayer.play();
  }

  void playWrongSound() {
    final assetsAudioPlayer2 = AssetsAudioPlayer();

    assetsAudioPlayer2.open(
      Audio("assets/wrong.wav"),
    );
    assetsAudioPlayer2.play();
  }
  void emptyAllAnswers(){
    answer1="";
    answer2="";
  }
  void check(){
  if(answer1!="" && answer2!="") {
    emptyAllAnswers();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "إجابة غير صحيحة من فضلك أعد المحاولة",
        textDirection: TextDirection.rtl,
      ),
    ));
    playWrongSound();
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
          icon: const Icon(Icons.arrow_back, size: 35),
        ),
        title: Row(
          children: [
            SizedBox(width: 20.w,),
            const Text("الدرس الأول"),
            SizedBox(width: 17.w,),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainPage()));
                },
                icon: const Icon(Icons.home, size: 35),
              ),
            ),
          ],
        ),
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
                  fontSize: 22.0.sp,
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
                        playCorrectSound();
                        finished = true;
                      }
                      else {
                        finished=false;
                        check();
                      }
                    }),
                    builder: (context, _, __) => SizedBox(
                      width: 20.w,
                      height: 5.h,
                      child: Text(
                        answer2,
                        style:  TextStyle(fontSize: 20.0.sp),
                      ),
                    ),
                  ),
                   Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "..................",
                      style: TextStyle(fontSize: 14.0.sp, color: Colors.red),
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
                  style: TextStyle(fontSize: 14.sp, color: Colors.red[900]),
                ),
              ),
              Column(
                children: <Widget>[
                  DragTarget<String>(
                    onAccept: (data) => setState(() {
                      answer1 = data;
                      if (answer1 == "HTML" && answer2 == "هيكلة") {
                        playCorrectSound();
                        finished = true;
                      }
                      else {
                        finished=false;
                        check();
                      }
                    },
                    ),
                    builder: (context, _, __) => SizedBox(
                      width: 22.w,
                      height: 5.h,
                      child: Text(
                        answer1,
                        style:  TextStyle(fontSize: 20.0.sp),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "..................  ",
                        style:
                            TextStyle(fontSize: 15.sp, color: Colors.red[900]),
                      )),
                ],
              ),
              Text(
                "تستخدم لغة ",
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 15.sp, color: Colors.red[900]),
              ),
            ],
          ),
           SizedBox(
            height: 3.h,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              ".المواقع الالكترونية",
              style: TextStyle(fontSize: 18.sp, color: Colors.red[900]),
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              DraggableItem(item: "CSS", visible: (answer1=="CSS" || answer2 == "CSS"),),
              SizedBox(width: 8.w),
              DraggableItem(item: "HTML", visible: (answer1=="HTML" || answer2 == "HTML"),),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              DraggableItem(item: "تنسيق", visible: (answer1=="تنسيق" || answer2 == "تنسيق"),),
              SizedBox(width: 8.w),
              DraggableItem(item: "هيكلة", visible: (answer1=="هيكلة" || answer2 == "هيكلة"),),
            ],
          ),
          SizedBox(height: 6.h),
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
                    primary: Colors.black, minimumSize:  Size(70.w, 7.h)),
                child:  Text(
                  "التالي",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class DraggableItem extends StatefulWidget {
  const DraggableItem({Key? key, required this.item, required this.visible}) : super(key: key);
  final String item;
  final bool visible;
  @override
  State<DraggableItem> createState() => _DraggableItemState();
}

class _DraggableItemState extends State<DraggableItem> {
  @override
  Widget build(BuildContext context) {

    return Visibility(
      visible: !widget.visible,
      child: Draggable<String>(
        onDragCompleted: (){
        },
        data: widget.item,
        feedback: MatchItem(widget.item),
        childWhenDragging: null,
        child: MatchItem(widget.item),
      ),
    );
  }
}


class MatchItem extends StatelessWidget {
  final String item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.blueGrey
      ),
      width: 29.w,
      height: 6.h,
      child: Center(
          child: Text(
        item,
        style:  TextStyle(
            fontSize: 20.sp,
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
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, size: 35),
        ),
        title: Row(
          children: [
            SizedBox(width: 20.w,),
            const Text("الدرس الأول"),
            SizedBox(width: 21.w,),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainPage()));
                },
                icon: const Icon(Icons.home, size: 35),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 22.h,
          ),
          Center(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
            ),
          ),
           SizedBox(
            height: 14.h,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LessonOneActivity()));
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.black, minimumSize:  Size(80.w, 8.h)),
            child: Text(
              "النشاط",
              style: TextStyle(fontSize: 20.sp),
            ),
          )
        ],
      ),
    );
  }
}
