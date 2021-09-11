import 'package:flutter/material.dart';

void main() {
  runApp(ExerciseNote());
}

class ExerciseNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise Note',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SelectPage(),
    );
  }
}

class SelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext contextselect) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    contextselect,
                    MaterialPageRoute(
                        builder: (contextselect) => StopwatchPage()));
              },
              child: Text("경*중도 웨이트트레이닝"))
        ],
      ),
    ));
  }
}

class StopwatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
