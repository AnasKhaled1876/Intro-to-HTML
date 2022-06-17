import 'package:flutter/material.dart';
import 'package:intro_to_html/educative_games_page.dart';
import 'package:intro_to_html/lessons_page.dart';
import 'package:intro_to_html/profile_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          itemExtent: 700,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
              child: const Text("الملف الشخصي",style: TextStyle(fontSize: 25),),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text("لوحة التعلم"),
      ),
      body: ListView(
        itemExtent: 220.0,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RoadMapPage()));
            },
            child: Image.asset("assets/list1.png"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LessonsPage()));
            },
            child: Image.asset("assets/list2.png"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EducativeGames()));
            },
            child: Image.asset("assets/list3.png"),
          ),
        ],
      ),
    );
  }
}

class RoadMapPage extends StatelessWidget {
  const RoadMapPage({Key? key}) : super(key: key);

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
        title: const Text("خريطة السير"),
      ),
      body: const Center(
        child: Text("Coming soon"),
      ),
    );
  }
}
