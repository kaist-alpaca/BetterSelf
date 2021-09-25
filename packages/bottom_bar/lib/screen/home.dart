import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItem { question_and_anwer, communication, home, report, setting }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home',
            )
          ],
        ),
      ),
    );
  }
}
