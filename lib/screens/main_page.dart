import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static const String id = "main_page";
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver App'),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            DatabaseReference ref =
                FirebaseDatabase.instance.reference().child('testing');
            ref.set('testing connection');
          },
          color: Colors.blue,
          minWidth: 200,
          child: Text('Test connection'),
        ),
      ),
    );
  }
}
