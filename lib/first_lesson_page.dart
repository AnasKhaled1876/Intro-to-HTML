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
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
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
                icon: const Icon(Icons.home),
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
                        finished = true;
                      }
                      else {
                        check();
                      }
                    }),
                    builder: (context, _, __) => SizedBox(
                      width: 17.w,
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
                        finished = true;
                      }
                      else {
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
              const DraggableItem(item: "CSS"),
              SizedBox(width: 8.w),
              const DraggableItem(item: "HTML"),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              const DraggableItem(item: "تنسيق"),
              SizedBox(width: 8.w),
              const DraggableItem(item: "هيكلة"),
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
          icon: const Icon(Icons.arrow_back),
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
                icon: const Icon(Icons.home),
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
