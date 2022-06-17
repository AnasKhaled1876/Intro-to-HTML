import 'package:flutter/material.dart';
import 'package:intro_to_html/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List<Widget> fillLevels(){
    List<Widget> myLevels= [];

    for(int i=6;i>0;i--)
      {
       myLevels.add(LevelTile(levelNumber: "${i}",));
      }
    return myLevels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text(
          "الملف الشخصي",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListTile(
            leading: StringBar(
              myText: HomePage.prefs.getString("name"),
            ),
            trailing: const Text(
              "الاسم",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            leading: StringBar(
              myText: HomePage.prefs.getString("age"),
            ),
            trailing: const Text(
              "العمر",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                "مستوى التقدم",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              itemExtent: 50,
              padding: const EdgeInsets.symmetric(horizontal: 35),
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
    Key? key, required this.levelNumber,
  }) : super(key: key);
  final String levelNumber;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Text(
        levelNumber,
        style: const TextStyle(fontSize: 30),
      ),
      title: const Checkbox(
        onChanged: null,
        value: false,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
    );
  }
}

class StringBar extends StatelessWidget {
  final String? myText;

  const StringBar({super.key, required this.myText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: 250,
      height: 70,
      color: Colors.grey.withOpacity(0.7),
      child: Center(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            myText!,
            style: const TextStyle(fontSize: 35.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
