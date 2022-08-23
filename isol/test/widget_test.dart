import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; //flutter의 package를 가져오는 코드 반드시 필요
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget { //MyApp 클래스 선언
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my first app',
      home: MyPage(),
    );
  }
}


class MyPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Text('button'),
        onPressed: (){
          createData();
        },
      ),
    );
  }
}

void createData(){
  final usercol=FirebaseFirestore.instance.collection("users").doc("userkey2");
  usercol.set({
    "username" : "ios",
    "age" : 134,
  });
}
