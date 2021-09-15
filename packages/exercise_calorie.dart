import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

double exerciseCalorie(String EN, double ET, double weight) {
  //운동 칼로리 계산 함수. EN이 운동 이름, ET가 시간(단위:sec), weight는 사용자의 체중
  double result = 0;
  double METs = 0;
  //여기부터 운동 종류별 METs 값 가져오기.
  if (EN == '경*중도 웨이트트레이닝' || EN == '볼링' || EN == '배구' || EN == '프리즈비') {
    METs = 3.0;
  } else if (EN == '체조' || EN == '골프') {
    METs = 3.5;
  } else if (EN == '속보' || EN == '탁구') {
    METs = 4.0;
  } else if (EN == '배드민턴') {
    METs = 4.5;
  } else if (EN == '발레') {
    METs = 4.8;
  } else if (EN == '소프트볼' || EN == '야구' || EN == '매우 빠른 속보') {
    METs = 5.0;
  } else if (EN == '고강도 웨이트트레이닝' ||
      EN == '미용체조' ||
      EN == '재즈댄스' ||
      EN == '번갈아 조깅과 보행' ||
      EN == '농구' ||
      EN == '수영(천천히 다리젓기)') {
    METs = 6.0;
  } else if (EN == '에어로빅') {
    METs = 6.5;
  } else if (EN == '조깅' ||
      EN == '축구' ||
      EN == '테니스' ||
      EN == '수영(배영)' ||
      EN == '스케이트' ||
      EN == '스키') {
    METs = 7.0;
  } else if (EN == '등산(1~2kg 가방)') {
    METs = 7.5;
  } else if (EN == '사이클' || EN == '런닝(비교적 천천히)' || EN == '수영(자유형, 천천히') {
    METs = 8.0;
  } else if (EN == '런닝(빠르게)' ||
      EN == '유도' ||
      EN == '가라테' ||
      EN == '킥복싱' ||
      EN == '태권도' ||
      EN == '럭비' ||
      EN == '수영(평영)') {
    METs = 10.0;
  } else if (EN == '수영(접영)' || EN == '수영(자유형, 빠르게)') {
    METs = 11.0;
  } else if (EN == '런닝(계단)') {
    METs = 15.0;
  }
  result = METs * 3.5 * weight * 0.005 * (ET / 60); //칼로리 계산 공식
  return result;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'exercise_calories',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class _HomeState extends State<Home> {
  String exerciseName = '';
  String exerciseTime = '';
  double calorie = 0;
  double weight = 65.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Calculator'),
      ),
      body: Column(
        children: [
          Center(
            //운동 종류 입력
            child: Padding(
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    exerciseName = text;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'exercise', hintText: '운동 종류를 입력하세요'),
              ),
              padding: EdgeInsets.all(20.0),
            ),
          ),
          Center(
            // 운동 시간 입력
            child: Padding(
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    exerciseTime = text;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'time', hintText: '운동 시간을 입력하세요'),
              ),
              padding: EdgeInsets.all(20.0),
            ),
          ),
          ButtonTheme(
            minWidth: 100.0,
            height: 50.0,
            child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  calorie = exerciseCalorie(
                      exerciseName, double.parse(exerciseTime), weight);
                }),
          ),
          Center(
            child: Text('$calorie'), // 계산한 칼로리값 출력
          ),
        ],
      ),
    );
  }
}
