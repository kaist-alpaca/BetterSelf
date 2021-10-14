//지금은 안쓰는 화면. 예전 UI 기준으로 만들어져서 수정되었으나,
//개발의 용이성과 만약을 대비해 일단 남겨둠.

import 'package:flutter/material.dart';
import '../pages/data_page/stress_screen.dart';
import '../pages/data_page/exercise_screen.dart';
import '../pages/data_page/sleep_screen.dart';
import '../pages/data_page/food_screen.dart';
import '../pages/feedback_page/exercise_feedback_screen.dart';
import '../pages/feedback_page/food_feedback_screen.dart';
import '../pages/feedback_page/sleep_feedback_screen.dart';
import '../pages/feedback_page/stress_feedback_screen.dart';
import '../pages/feedback_page/inbody_feedback_screen.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreen createState() => _ReportScreen();
}

//7일,31일,12개월 조절용 버튼 변수들
int stressButton = 0;
int exerciseButton = 0;
int sleepButton = 0;
int foodButton = 0;

class _ReportScreen extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    double graphWidth = valWidth * 0.86; //그래프들 너비
    double barHeight = valHeight * 0.08;
    double barFontSize = defaultSize * 18;

    return Scaffold(
        appBar: AppBar(
          title: Text('쥐돌이님의 리포트'),
        ),
        body: ListView(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: valHeight * 0.05,
                ),
                Row(
                  //기간(날짜) 선택하는 bar.
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      //날짜 왼쪽으로 넘기는 버튼
                      onTap: () {},
                      child: Container(
                        width: valWidth * 0.1,
                        height: valHeight * 0.1,
                        child: Text('왼쪽버튼'),
                      ),
                    ),
                    Container(
                      width: valWidth * 0.8,
                      child: Text('보고 있는 날짜 범위'),
                    ),
                    GestureDetector(
                      //날짜 오른쪽으로 넘기는 버튼
                      onTap: () {},
                      child: Container(
                        width: valWidth * 0.1,
                        height: valHeight * 0.1,
                        child: Text('오른쪽버튼'),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: valHeight * 0.1,
                  width: graphWidth,
                  child: Text(
                    'InBody',
                    style: TextStyle(fontSize: defaultSize * 20),
                  ),
                ),
                Container(
                  height: valHeight * 0.6,
                  width: graphWidth,
                  child: Text('여기에 인바디 그래프'),
                  margin: EdgeInsets.only(
                      top: valHeight * 0.002, bottom: valHeight * 0.016),
                  color: Colors.grey,
                ),
                GestureDetector(
                  //인바디 피드백하러 가기
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InbodyFeedbackScreen()));
                  },
                  child: Container(
                    height: valHeight * 0.05,
                    width: graphWidth - valWidth * 0.003,
                    color: Colors.grey,
                    margin: EdgeInsets.only(bottom: valHeight * 0.032),
                    child: Text('피드백하러 가기'),
                  ),
                ),
                Container(
                  height: barHeight,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: valHeight * 0.028),
                  child: Text(
                    '스트레스',
                    style: TextStyle(fontSize: barFontSize),
                  ),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                ),
                Row(
                  // 스트레스 버튼(7일/31일/12개월 구분)
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          stressButton = 0;
                        });
                      },
                      child: Text('7일'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            stressButton = 1;
                          });
                        },
                        child: Text('31일')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            stressButton = 2;
                          });
                        },
                        child: Text('12개월'))
                  ],
                ),
                StressScreen(stressButton),
                SizedBox(
                  height: valHeight * 0.04,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StressFeedbackScreen()));
                    },
                    child: Container(
                      height: valHeight * 0.32,
                      width: graphWidth,
                      child: Text('여기에 스트레스 코칭, 겸 피드백하러 가기 버튼.'),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      margin: EdgeInsets.only(bottom: valHeight * 0.032),
                    )),
                Container(
                  height: barHeight,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: valHeight * 0.028),
                  child: Text(
                    '운동',
                    style: TextStyle(fontSize: barFontSize),
                  ),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                ),
                Row(
                  // 운동 데이터 버튼(7일/31일/12개월 구분)
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          exerciseButton = 0;
                        });
                      },
                      child: Text('7일'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            exerciseButton = 1;
                          });
                        },
                        child: Text('31일')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            exerciseButton = 2;
                          });
                        },
                        child: Text('12개월'))
                  ],
                ),
                ExerciseScreen(exerciseButton),
                Container(
                  height: valHeight * 0.2,
                  width: graphWidth,
                  margin: EdgeInsets.only(
                      top: valHeight * 0.04, bottom: valHeight * 0.04),
                  color: Colors.grey,
                  child: Text('여기에 오늘의 운동'),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExerciseFeedbackScreen()));
                    },
                    child: Container(
                      height: valHeight * 0.32,
                      width: graphWidth,
                      child: Text('여기에 지난 운동 코칭, 겸 피드백하러 가기 버튼.'),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      margin: EdgeInsets.only(bottom: valHeight * 0.032),
                    )),
                Container(
                  //여기부터 수면
                  height: barHeight,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: valHeight * 0.028),
                  child: Text(
                    '수면',
                    style: TextStyle(fontSize: barFontSize),
                  ),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                ),
                Row(
                  // 수면 버튼(7일/31일/12개월 구분)
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          sleepButton = 0;
                        });
                      },
                      child: Text('7일'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            sleepButton = 1;
                          });
                        },
                        child: Text('31일')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            sleepButton = 2;
                          });
                        },
                        child: Text('12개월'))
                  ],
                ),
                SleepScreen(sleepButton),
                SizedBox(
                  height: valHeight * 0.04,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SleepFeedbackScreen()));
                    },
                    child: Container(
                      height: valHeight * 0.32,
                      width: graphWidth,
                      child: Text('여기에 지난 수면 코칭, 겸 피드백하러 가기 버튼.'),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      margin: EdgeInsets.only(bottom: valHeight * 0.032),
                    )),
                Container(
                  //여기서부터 식단
                  height: barHeight,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: valHeight * 0.028),
                  child: Text(
                    '식단',
                    style: TextStyle(fontSize: barFontSize),
                  ),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                ),
                Row(
                  // 식단 데이터 버튼(7일/31일/12개월 구분)
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          foodButton = 0;
                        });
                      },
                      child: Text('7일'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            foodButton = 1;
                          });
                        },
                        child: Text('31일')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            foodButton = 2;
                          });
                        },
                        child: Text('12개월'))
                  ],
                ),
                FoodScreen(foodButton),
                Container(
                  height: valHeight * 0.2,
                  width: graphWidth,
                  margin: EdgeInsets.only(
                      top: valHeight * 0.04, bottom: valHeight * 0.04),
                  color: Colors.grey,
                  child: Text('여기에 오늘의 식단'),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodFeedbackScreen()));
                    },
                    child: Container(
                      height: valHeight * 0.32,
                      width: graphWidth,
                      child: Text('여기에 지난 식단 코칭, 겸 피드백하러 가기 버튼.'),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      margin: EdgeInsets.only(bottom: valHeight * 0.032),
                    )),
                Container(
                  //여기서부터 전반 코칭
                  height: barHeight,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: valHeight * 0.028),
                  child: Text(
                    '전반 코칭',
                    style: TextStyle(fontSize: barFontSize),
                  ),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                ),
                Container(
                  height: valHeight * 0.32,
                  width: graphWidth,
                  child: Text('여기에는 전반 코칭 기록 및 수정'),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.only(bottom: valHeight * 0.03),
                ),
                Row(
                  //히스토리 및 피드백 추가
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: valHeight * 0.08,
                        width: graphWidth / 2.0,
                        color: Colors.grey,
                        child: Text('히스토리'),
                      ),
                    ),
                    SizedBox(
                      width: valWidth * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: valHeight * 0.08,
                        width: graphWidth / 2.0,
                        color: Colors.grey,
                        child: Text('피드백 추가'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: valHeight * 0.3,
                )
              ],
            ),
          )
        ]));
  }
}
