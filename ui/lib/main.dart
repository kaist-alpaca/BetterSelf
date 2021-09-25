import 'package:flutter/material.dart';
import 'package:ui/screen/communication.dart';
import 'package:ui/screen/home.dart';
import 'package:ui/screen/question_and_answer.dart';
import 'package:ui/screen/report.dart';
import 'package:ui/screen/setting.dart';
import 'package:ui/widget/bottom_bar.dart';

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
          bottomNavigationBar: BottomNavigation(),
        ),
      ),
    );
  }
}
