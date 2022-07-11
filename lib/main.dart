import 'package:chat/home/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection("mensagens").get();
  snapshot.docs.forEach((element) {
    print(element.data());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.blue)),
      home: const ChatScreen(),
    );
  }
}
