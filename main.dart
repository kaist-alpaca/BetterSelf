import 'package:flutter/material.dart';

String exerciseName = '';

void main() {
  runApp(ExerciseNote());
}

class ExerciseNote extends StatefulWidget {
  @override
  _ExerciseNoteState createState() => _ExerciseNoteState();
}

class _ExerciseNoteState extends State<ExerciseNote> {
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
        body: Container(
      child: ListView(children: [
        Column(
          children: [
            TextButton(
                onPressed: () {
                  exerciseName = '경*중도 웨이트트레이닝';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("경*중도 웨이트트레이닝")),
            TextButton(
                onPressed: () {
                  exerciseName = '볼링';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("볼링")),
            TextButton(
                onPressed: () {
                  exerciseName = '배구';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("배구")),
            TextButton(
                onPressed: () {
                  exerciseName = '프리즈비';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("프리즈비")),
            TextButton(
                onPressed: () {
                  exerciseName = '체조';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("체조")),
            TextButton(
                onPressed: () {
                  exerciseName = '골프';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("골프")),
            TextButton(
                onPressed: () {
                  exerciseName = '속보';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("속보")),
            TextButton(
                onPressed: () {
                  exerciseName = '탁구';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("탁구")),
            TextButton(
                onPressed: () {
                  exerciseName = '배드민턴';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("배드민턴")),
            TextButton(
                onPressed: () {
                  exerciseName = '발레';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("발레")),
            TextButton(
                onPressed: () {
                  exerciseName = '소프트볼';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("소프트볼")),
            TextButton(
                onPressed: () {
                  exerciseName = '야구';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("야구")),
            TextButton(
                onPressed: () {
                  exerciseName = '매우 빠른 속보';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("매우 빠른 속보")),
            TextButton(
                onPressed: () {
                  exerciseName = '고강도 웨이트트레이닝';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("고강도 웨이트트레이닝")),
            TextButton(
                onPressed: () {
                  exerciseName = '미용체조';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("미용체조")),
            TextButton(
                onPressed: () {
                  exerciseName = '재즈댄스';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("재즈댄스")),
            TextButton(
                onPressed: () {
                  exerciseName = '번갈아 조깅과 보행';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("번갈아 조깅과 보행")),
            TextButton(
                onPressed: () {
                  exerciseName = '농구';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("농구")),
            TextButton(
                onPressed: () {
                  exerciseName = '수영(천천히 다리젓기)';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("수영(천천히 다리젓기)")),
            TextButton(
                onPressed: () {
                  exerciseName = '에어로빅';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("에어로빅")),
            TextButton(
                onPressed: () {
                  exerciseName = '조깅';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("조깅")),
            TextButton(
                onPressed: () {
                  exerciseName = '축구';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("축구")),
            TextButton(
                onPressed: () {
                  exerciseName = '테니스';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("테니스")),
            TextButton(
                onPressed: () {
                  exerciseName = '수영(배영)';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("수영(배영)")),
            TextButton(
                onPressed: () {
                  exerciseName = '스케이트';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("스케이트")),
            TextButton(
                onPressed: () {
                  exerciseName = '스키';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("스키")),
            TextButton(
                onPressed: () {
                  exerciseName = '등산(1~2kg 가방)';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("등산(1~2kg 가방)")),
            TextButton(
                onPressed: () {
                  exerciseName = '사이클';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("사이클")),
            TextButton(
                onPressed: () {
                  exerciseName = '런닝(비교적 천천히)';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("런닝(비교적 천천히)")),
            TextButton(
                onPressed: () {
                  exerciseName = '수영(자유형, 천천히)';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("수영(자유형, 천천히)")),
            TextButton(
                onPressed: () {
                  exerciseName = '런닝(빠르게)';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("런닝(빠르게)")),
            TextButton(
                onPressed: () {
                  exerciseName = '유도';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("유도")),
            TextButton(
                onPressed: () {
                  exerciseName = '가라테';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("가라테")),
            TextButton(
                onPressed: () {
                  exerciseName = '킥복싱';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("킥복싱")),
            TextButton(
                onPressed: () {
                  exerciseName = '태권도';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("태권도")),
            TextButton(
                onPressed: () {
                  exerciseName = '럭비';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("럭비")),
            TextButton(
                onPressed: () {
                  exerciseName = '수영(평영)';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("수영(평영)")),
            TextButton(
                onPressed: () {
                  exerciseName = '수영(접영)';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("수영(접영)")),
            TextButton(
                onPressed: () {
                  exerciseName = '수영(자유형, 빠르게)';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("수영(자유형, 빠르게)")),
            TextButton(
                onPressed: () {
                  exerciseName = '런닝(계단)';
                  Navigator.push(
                      contextselect,
                      MaterialPageRoute(
                          builder: (contextselect) => StopwatchPage()));
                },
                child: Text("런닝(계단)")),
          ],
        ),
      ]),
    ));
  }
}

class StopwatchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Text('$exerciseName 시작'),
          )
        ],
      ),
    ));
  }
}
