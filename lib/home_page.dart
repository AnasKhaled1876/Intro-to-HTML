import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_html/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static late SharedPreferences prefs;

  static void checkLevel(int n) {
    if (HomePage.prefs.getInt("Level")! < n) {
      HomePage.prefs.setInt("Level", n);
    }
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";
  String age = "";

  Future initialize() async {
    HomePage.prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
           SizedBox(
              height: 7.h,
            ),
          Expanded(
            flex: 3,
            child: Image.asset("assets/Welcome.png"),
          ),
          Expanded(
            child: TextField(
              onChanged: (String u) {
                username = u;
              },
              decoration: InputDecoration(
                  labelText: 'ادخل اسمك',
                  enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 1.w, color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:  BorderSide(width: 1.w, color: Colors.blue),
                    borderRadius: BorderRadius.circular(5),
                  )),
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (String a) {
                age = a;
              },
              decoration: InputDecoration(
                labelText: 'ادخل عمرك',
                enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(width: 1.w, color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:  BorderSide(width: 1.w, color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
           SizedBox(height: 3.h),
          ElevatedButton(
            onPressed: () async {
              await initialize();
              if (username != "" && age != "") {
                HomePage.prefs.setString("name", username);
                HomePage.prefs.setString("age", age);
                HomePage.prefs.setInt("Level", 1);
                MyDB.addFireRecord(username, age);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainPage()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    "من فضلك ادخل اسمك وعمرك",
                    textDirection: TextDirection.rtl,
                  ),
                ));
              }
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.black, minimumSize:  Size(80.w, 8.h)),
            child:  Text(
              "التالي",
              style: TextStyle(fontSize: 20.sp),
            ),
          ),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }
}

class MyDB {
  static void addFireRecord(String name, String age) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    users
        .add({
          'name': name,
          'age': age,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static void addRecord(String name, String age) async {
    var path = "my_db.db";

// open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Users (id INTEGER PRIMARY KEY, name TEXT, age TEXT)');
    });

// Insert some records in a transaction
    await database.transaction((txn) async {
      int id1 = await txn
          .rawInsert('INSERT INTO Users(name, age) VALUES($name, $age)');
    });

// Get the records
    List<Map> list = await database.rawQuery('SELECT * FROM Users');
    print(list);

// Close the database
    await database.close();
  }
// Get a location using getDatabasesPath

}
