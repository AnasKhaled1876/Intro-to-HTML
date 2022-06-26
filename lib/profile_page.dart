import 'package:flutter/material.dart';
import 'package:intro_to_html/home_page.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Widget> fillLevels() {
    List<Widget> myLevels = [];
    int? userLevel = HomePage.prefs.getInt("Level");
    for (int i = 6; i > 0; i--) {
      if (i == userLevel) {
        myLevels.add(LevelTile(
          levelNumber: "$i",
          checkBoxValue: true,
        ));
        continue;
      }
      myLevels.add(LevelTile(
        levelNumber: "$i",
        checkBoxValue: false,
      ));
    }
    return myLevels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "الملف الشخصي",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset("assets/profilepic.jpg"),
            height: 20.h,
            width: 60.w,
          ),
          SizedBox(height: 7.h,),
          ListTile(
            leading: StringBar(
              myText: HomePage.prefs.getString("name"),
            ),
            trailing: Text(
              "الاسم",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          ListTile(
            leading: StringBar(
              myText: HomePage.prefs.getString("age"),
            ),
            trailing: Text(
              "العمر",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "مستوى التقدم",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 10.h,
            width: 100.w,
            margin: EdgeInsets.symmetric(horizontal: 1.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              itemExtent: 60,
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              children: fillLevels(),
            ),
          )
        ],
      ),
    );
  }
}

class LevelTile extends StatelessWidget {
  const LevelTile({
    Key? key,
    required this.levelNumber,
    required this.checkBoxValue,
  }) : super(key: key);
  final String levelNumber;
  final bool checkBoxValue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Text(
        levelNumber,
        style: TextStyle(fontSize: 25.sp),
      ),
      title: Checkbox(
        onChanged: null,
        value: checkBoxValue,
        shape: const CircleBorder(),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
    );
  }
}

class StringBar extends StatelessWidget {
  final String? myText;

  const StringBar({super.key, required this.myText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      width: 67.w,
      height: 12.h,
      color: Colors.grey.withOpacity(0.7),
      child: Center(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            myText!,
            style: TextStyle(fontSize: 30.sp, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
