import 'package:flutter/material.dart';
import 'package:intro_to_html/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:  <Widget>[
          const SizedBox(height: 60,),
          Image.asset("assets/Welcome.png"),
          const SizedBox(height: 50,),
          const Text(
            "مرحبا بك يا صديقي سنتعلم سويا آساسيات برمجة الويب \n  \t\t\t\t\t\t\t\t\t\t\t لبدء التعلم اضغط على زر الدخول ",
            style: TextStyle(fontSize: 18.0,color: Colors.redAccent,fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.black, minimumSize: const Size(300, 60)),
            child: const Text(
              "دخول",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
