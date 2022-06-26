import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_html/third_lesson_page.dart';
import 'package:sizer/sizer.dart';
import 'home_page.dart';
import 'main_page.dart';

class LessonTwoStudy extends StatefulWidget {
  const LessonTwoStudy({Key? key}) : super(key: key);

  @override
  State<LessonTwoStudy> createState() => _LessonTwoStudyState();
}

class _LessonTwoStudyState extends State<LessonTwoStudy> {
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
            SizedBox(width: 16.w,),
            Text("الدرس الثاني", style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold)),
            SizedBox(width: 13.w,),
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
      body: Container(
        margin:  EdgeInsets.symmetric(horizontal: 1.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 5.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "ما هو شكل صفحة الHTML",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 22.sp,
                    color: Colors.redAccent),
                textDirection: TextDirection.rtl,
              ),
            ),
            Center(
              child: Image.asset("assets/lesson2.png"),
            ),
            SizedBox(height: 12.h,),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LessonTwoActivity(game: false,)));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: Size(80.w, 9.h)),
                child: Text(
                  "النشاط",
                  style: TextStyle(fontSize: 24.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LessonTwoActivity extends StatefulWidget {
  const LessonTwoActivity({Key? key, required this.game}) : super(key: key);
  final bool game;
  @override
  State<LessonTwoActivity> createState() => _LessonTwoActivityState();
}

class _LessonTwoActivityState extends State<LessonTwoActivity> {
  List<String> headings = ["1", "2", "3", "4", "5", "6", "7", "8"];
  List<String> headingsNo = [
    "<HTML>",
    "<head>",
    "<title>",
    "</title>",
    "</head>",
    "<body>",
    "</body>",
    "</HTML>"
  ];
  List<String> inputs = ["", "", "", "", "", "", "", ""];
  bool finished = false;
  void emptyAllAnswers(){
    for (int i = 0; i < inputs.length; i++) {
      inputs[i]="";
    }
  }
  bool checkDraggableUsed(String draggableText){

    for(int i=0;i<inputs.length;i++) {
      if(inputs[i] == draggableText) {
        return false;
      }
    }
    return true;
  }
  bool check() {
    for (int i = 0; i < headingsNo.length; i++) {
      if (inputs[i] != headingsNo[i]) {
        return false;
      }
    }
    return true;
  }
  bool checkAllAnswers() {
    for (int i = 0; i < inputs.length; i++) {
      if (inputs[i] == "") {
        return false;
      }
    }
    emptyAllAnswers();
    return true;
  }

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
  List<Widget> fillRows() {
    List<Widget> myChoices = [];
    for (int i = 0; i < headingsNo.length; i += 2) {
      myChoices.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DraggableItemLevelTwo(item: headingsNo[i], visible: checkDraggableUsed(headingsNo[i]),),
             SizedBox(width: 13.w),
            DraggableItemLevelTwo(item: headingsNo[i + 1], visible: checkDraggableUsed(headingsNo[i + 1]),),
          ],
        ),
      );
      myChoices.add(SizedBox(height: 2.h,));
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
          icon: const Icon(Icons.arrow_back, size: 35),
        ),
        title: Row(
          children: [
            SizedBox(width: 25.w,),
            Text("النشاط", style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold)),
            SizedBox(width: 18.w,),
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.h),
        child: Column(
          children: <Widget>[
            SizedBox(height: 1.h,),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "قم بترتيب الاكواد التالية حسب الترتيب الصحيح للبنية الهيكلية لغة HTML",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900]),
              ),
            ),
            Container(
              color: Colors.blue.withOpacity(0.3),
              width: 50.w,
              height: 40.h,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[0]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[0] = data;
                          if (check()) {
                            playCorrectSound();
                            finished = true;
                          } else if (checkAllAnswers()) {
                            playWrongSound();
                            finished=false;
                          }else {
                            finished = false;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[0],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[1]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[1] = data;
                          if (check()) {
                            playCorrectSound();
                            finished = true;
                          } else if (checkAllAnswers()) {
                            playWrongSound();
                            finished=false;
                          }else {
                            finished = false;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[1],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[2]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[2] = data;
                          if (check()) {
                            playCorrectSound();
                            finished = true;
                          } else if (checkAllAnswers()) {
                            playWrongSound();
                            finished=false;
                          }else {
                            finished = false;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[2],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[3]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[3] = data;
                          if (check()) {
                            playCorrectSound();
                            finished = true;
                          } else if (checkAllAnswers()) {
                            playWrongSound();
                            finished=false;
                          }else {
                            finished = false;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[3],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[4]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[4] = data;
                          if (check()) {
                            playCorrectSound();
                            finished = true;
                          } else if (checkAllAnswers()) {
                            playWrongSound();
                            finished=false;
                          }else {
                            finished = false;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[4],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[5]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[5] = data;
                          if (check()) {
                            playCorrectSound();
                            finished = true;
                          } else if (checkAllAnswers()) {
                            playWrongSound();
                            finished=false;
                          }else {
                            finished = false;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[5],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[6]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[6] = data;
                          if (check()) {
                            playCorrectSound();
                            finished = true;
                          } else if (checkAllAnswers()) {
                            playWrongSound();
                            finished=false;
                          }else {
                            finished = false;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[6],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      HeadingsBox(headings[7]),
                      SizedBox(
                        width: 7.w,
                      ),
                      DragTarget<String>(
                        onAccept: (data) => setState(() {
                          inputs[7] = data;
                          if (check()) {
                            playCorrectSound();
                            finished = true;
                          } else if (checkAllAnswers()) {
                            playWrongSound();
                            finished=false;
                          }else {
                            finished = false;
                          }
                        }),
                        builder: (context, _, __) => DragTargetContainer(
                          input: inputs[7],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Column(
              children: fillRows(),
            ),
            SizedBox(height: 2.h),
            if (finished && !widget.game)
              ElevatedButton(
                onPressed: () {
                  HomePage.checkLevel(2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LessonThreeStudy()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, minimumSize: Size(80.w, 9.h)),
                child:  Text(
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

class DragTargetContainer extends StatelessWidget {
  const DragTargetContainer({
    Key? key,
    required this.input,
  }) : super(key: key);

  final String input;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 27.w,
      height: 5.h,
      child: Align(
        child: Text(
          input,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
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
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}

class DraggableItemLevelTwo extends StatefulWidget {
  const DraggableItemLevelTwo({Key? key, required this.item, required this.visible}) : super(key: key);
  final String item;
  final bool visible;
  @override
  State<DraggableItemLevelTwo> createState() => _DraggableItemLevelTwoState();
}

class _DraggableItemLevelTwoState extends State<DraggableItemLevelTwo> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Draggable<String>(
        data: widget.item,
        feedback: MatchItemLevelTwo(item: widget.item),
        childWhenDragging: null,
        child: MatchItemLevelTwo(item: widget.item),
      ),
    );
  }
}




class MatchItemLevelTwo extends StatelessWidget {
  final String item;

  const MatchItemLevelTwo({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.blueGrey
      ),
      width: 30.w,
      height: 6.h,
      child: Center(
          child: Text(
            item,
            style:  TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Colors.white),
          )),
    );
  }


}

// if (finished)
// const Center(
// child: Icon(
// Icons.check_circle,
// size: 50,
// color: Colors.green,
// ),
// ),
