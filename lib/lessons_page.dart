import 'package:flutter/material.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({Key? key}) : super(key: key);

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
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
        title: const Text("دروس التعلم"),
      ),
      body: ListView(
        children:  <Widget>[
          LessonTile( "الأول"),
          LessonTile( "الثاني"),
          LessonTile( "الثالث"),
          LessonTile( "الرابع"),
          LessonTile( "الخامس"),
          LessonTile( "السادس"),
        ],
      ),
    );
  }
}

class LessonTile extends StatelessWidget {

  LessonTile(this.lessonNumber);
  String lessonNumber;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: ListTile(
        title: Text(
          lessonNumber,
          textDirection: TextDirection.rtl,
        ),
        onTap: (){

        },
      ),
    );
  }


}
