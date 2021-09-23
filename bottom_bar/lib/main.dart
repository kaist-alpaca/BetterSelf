import 'package:bottom_bar/screen/communication.dart';
import 'package:bottom_bar/screen/home.dart';
import 'package:bottom_bar/screen/question_and_answer.dart';
import 'package:bottom_bar/screen/report.dart';
import 'package:bottom_bar/screen/setting.dart';
import 'package:bottom_bar/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              QuestionAnswerScreen(),
              CommunicationScreen(),
              HomeScreen(),
              ReportScreen(),
              SettingScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
