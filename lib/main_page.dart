import 'package:flutter/material.dart';
import 'package:intro_to_html/educative_games_page.dart';
import 'package:intro_to_html/lessons_page.dart';
import 'package:intro_to_html/profile_page.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person, size: 35),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("لوحة التعلم",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        itemExtent: 220.0,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RoadMapPage()));
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
  RoadMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String videoId;
    videoId = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=RAkF5WU6F4g")!;
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, size: 35),
        ),
        title: Text("خريطة السير",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RoadMapPage2()));
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.black, minimumSize: Size(60.w, 7.h)),
            child: Text(
              "التالي",
              style: TextStyle(fontSize: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}

class RoadMapPage2 extends StatelessWidget {
  RoadMapPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String videoId;
    videoId = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=bCV7yd7ueVQ")!;
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, size: 35),
        ),
        title: Text("خريطة السير",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainPage()));
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.black, minimumSize: Size(60.w, 7.h)),
            child: Text(
              "الرجوع للصفحة الرئيسية",
              style: TextStyle(fontSize: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
