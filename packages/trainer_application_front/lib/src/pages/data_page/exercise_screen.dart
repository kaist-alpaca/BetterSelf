import 'package:flutter/material.dart';

int? buttonCase;

class ExerciseScreen extends StatefulWidget {
  ExerciseScreen(int a) {
    buttonCase = a;
  }

  @override
  _ExerciseScreen createState() => _ExerciseScreen();
}

class _ExerciseScreen extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    print('In buttonCase is $buttonCase');
    if (buttonCase == 0) {
      //7일로 선택되었을 때 표현될 위젯들은 여기에.
      return Container(
          child: Center(
              child: Column(children: [
        Container(
          child: Text('여기다가 운동 7일짜리 그래프'),
        ),
        Container(
          height: 20,
          width: 20,
          color: Colors.grey,
        ),
      ])));
    } else if (buttonCase == 1) {
      //31일로 선택되었을 때 표현될 위젯들은 여기에
      return Container(
        child: Center(
          child: Column(children: [
            Container(
              child: Text('여기다가 운동 31일짜리 그래프'),
            ),
            Container(
              width: 20,
              height: 20,
              color: Colors.red,
            )
          ]),
        ),
      );
    } else if (buttonCase == 2) {
      //12개월로 선택되었을 때 표현될 위젯들은 여기에.
      return Container(
          child: Center(
              child: Column(children: [
        Container(
          child: Text('여기다가 운동 12개월짜리 그래프'),
        ),
        Container(
          width: 20,
          height: 20,
          color: Colors.blue,
        )
      ])));
    } else {
      return Container();
    }
  }
}
