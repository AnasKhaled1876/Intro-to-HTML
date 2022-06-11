import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
        title: const Text("لوحة التعلم"),
      ),
      body: ListView(
        itemExtent: 220.0,
        children: <Widget>[
          Image.asset("assets/list1.png"),
          Image.asset("assets/list2.png"),
          Image.asset("assets/list3.png")
        ],
      ),
    );
  }
}
