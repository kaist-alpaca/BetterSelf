import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart'; // pubspec.yaml의 dependencies에 intl: ^0.17.0 추가.

String exerciseName = ''; //운동 이름 저장용 전역변수
double exerciseTime = 0; // 운동 시간 저장용 변수
double weight = 70; // 사용자 체중 전역변수
double calories = 0; //소모 칼로리 저장용 변수
String startTime = ''; //운동 시작 시각
String endTime = ''; //운동 종료 시각

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
        //리스트뷰 설정
        Column(
          children: [
            TextButton(
                onPressed: () {
                  //버튼 누르면
                  exerciseName = '경*중도 웨이트트레이닝'; //운동 이름 전역변수 변경
                  Navigator.push(
                      // 스톱워치 페이지로 이동
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

//이 아래로 스톱워치 페이지 구현
class StopwatchPage extends StatefulWidget {
  StopwatchPage({Key? key}) : super(key: key);

  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late Timer _timer;
  double _timeCount = 0; //시간 기록용
  double _timesec = 0; // 초단위 시간
  double _timemillisec = 0; // 0.01초단위 시간
  double _timemin = 0; //분단위 시간
  bool _isRunning = false; //지금 스톱워치 기록중인지 확인용
  bool _isRecording = false; //지금 시작시간이 기록되었는지 확인용

  void _start() {
    //타이머 시작함수
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _timeCount++;
        _timemillisec = _timeCount % 100;
        _timesec = (_timeCount ~/ 100).toDouble();
        _timemin = (_timesec ~/ 60).toDouble();
      });
    });
  }

  void _pause() {
    //타이머 중지함수
    _timer.cancel();
  }

  void _clickPlayButton() {
    //시작 버튼 누르는 함수
    _isRunning = !_isRunning;

    if (_isRunning) {
      _start();
    } else {
      _pause();
    } //시작 중지 구분

    if (_isRecording) {
    } else {
      _isRecording = !_isRecording; //기록중이 아니었다면 시작시각 기록
      startTime = DateFormat('yyyy-MM-dd-HH:mm:ss').format(DateTime.now());
    }
  }

  void _clickResetButton() {
    // 리셋함수
    setState(() {
      _isRunning = false;
      _timer.cancel();
      _timeCount = 0;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Text('$exerciseName 중'),
          FloatingActionButton(
            //운동 시작&중지 버튼.
            child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
            onPressed: () => setState(() {
              _clickPlayButton();
            }),
          ),
          Text('$_timemin 분 $_timesec . $_timemillisec 초'), //현재 운동시간 표시
          TextButton(
            //리셋 및 저장버튼
            onPressed: () {
              exerciseTime = _timesec;
              calories = exerciseCalorie(exerciseName, exerciseTime, weight);
              endTime =
                  DateFormat('yyyy-MM-dd-HH:mm:ss').format(DateTime.now());
              _isRecording = false;
              _clickResetButton();
            },
            child: Text('저장'),
          ),
          Text('$exerciseTime 초 동안 운동했습니다.'),
          Text('$calories kcal 만큼의 칼로리를 소모했습니다.'),
          Text('$startTime 부터 $endTime 까지 운동했습니다.'),
        ],
      ),
    ));
  }
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
