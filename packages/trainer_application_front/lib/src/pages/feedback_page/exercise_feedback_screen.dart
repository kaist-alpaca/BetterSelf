import 'package:flutter/material.dart';
import '../data_page/exercise_screen.dart';

class ExerciseFeedbackScreen extends StatefulWidget {
  @override
  _ExerciseFeedbackScreen createState() => _ExerciseFeedbackScreen();
}

int exerciseButton = 1;

class _ExerciseFeedbackScreen extends State<ExerciseFeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    double graphWidth = valWidth * 0.86; //그래프들 너비
    double barHeight = valHeight * 0.08;
    double barFontSize = defaultSize * 18;
    return Scaffold(
        appBar: AppBar(),
        body: ListView(children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: barHeight,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      bottom: valHeight * 0.028, top: valHeight * 0.028),
                  child: Text(
                    '운동 피드백',
                    style: TextStyle(fontSize: barFontSize),
                  ),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                ),
                Container(
                  height: valHeight * 0.2,
                  width: graphWidth,
                  margin: EdgeInsets.only(bottom: valHeight * 0.04),
                  color: Colors.grey,
                  child: Text('여기에 지난 운동 코칭'),
                ),
                SizedBox(height: valHeight * 0.04),
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
                SizedBox(
                  height: valHeight * 0.04,
                ),
                Container(
                  height: valHeight * 0.4,
                  width: valWidth,
                  child: Text("여기에 달력 들어가야함."),
                  color: Colors.grey,
                ),
                SizedBox(
                  height: valHeight * 0.04,
                ),
                Container(
                  height: valHeight * 0.23,
                  width: graphWidth,
                  color: Colors.grey,
                  child: Text('여기에 달력에서 체크한 날의 운동'),
                ),
                SizedBox(
                  height: valHeight * 0.028,
                ),
                Container(
                  height: valHeight * 0.05,
                  width: graphWidth,
                  child: Text(
                    '(댤력에서 체크한 날짜)의 피드백',
                    style: TextStyle(fontSize: defaultSize * 15),
                  ),
                ),
                Container(
                  height: valHeight * 0.025,
                  width: graphWidth,
                  child: Text('운동량 피드백'),
                ),
                Container(
                  height: valHeight * 0.16,
                  width: graphWidth,
                  child: Text('여기에 운동량 피드백이 적혀야함'),
                  color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: valHeight * 0.008, bottom: valHeight * 0.036),
                ),
                Container(
                  height: valHeight * 0.025,
                  width: graphWidth,
                  child: Text('운동 시간 피드백'),
                ),
                Container(
                  height: valHeight * 0.16,
                  width: graphWidth,
                  child: Text('여기에 운동 시간 피드백이 적혀야함'),
                  color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: valHeight * 0.008, bottom: valHeight * 0.036),
                ),
                Container(
                  height: valHeight * 0.025,
                  width: graphWidth,
                  child: Text('운동 종류 피드백'),
                ),
                Container(
                  height: valHeight * 0.16,
                  width: graphWidth,
                  child: Text('여기에 운동 종류 피드백이 적혀야함'),
                  color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: valHeight * 0.008, bottom: valHeight * 0.036),
                ),
                Container(
                  height: valHeight * 0.025,
                  width: graphWidth,
                  child: Text('운동 강도 피드백'),
                ),
                Container(
                  height: valHeight * 0.16,
                  width: graphWidth,
                  child: Text('여기에 운동 강도 피드백이 적혀야함'),
                  color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: valHeight * 0.008, bottom: valHeight * 0.036),
                ),
                Container(
                  height: valHeight * 0.025,
                  width: graphWidth,
                  child: Text('사용자 경험 피드백'),
                ),
                Container(
                  height: valHeight * 0.16,
                  width: graphWidth,
                  child: Text('여기에 마킹된 사용자 경험 피드백'),
                  color: Colors.grey,
                  margin: EdgeInsets.only(top: valHeight * 0.008),
                ),
                Container(
                  height: valHeight * 0.16,
                  width: graphWidth,
                  child: Text('여기에 사용자 경험 피드백이 적혀야함'),
                  color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: valHeight * 0.016, bottom: valHeight * 0.036),
                ),
                SizedBox(
                  height: valHeight * 0.085,
                ),
                Container(
                  height: valHeight * 0.025,
                  width: graphWidth,
                  child: Text('기타 피드백'),
                ),
                Container(
                  height: valHeight * 0.16,
                  width: graphWidth,
                  child: Text('여기에 기타 피드백이 적혀야함'),
                  color: Colors.grey,
                  margin: EdgeInsets.only(
                      top: valHeight * 0.008, bottom: valHeight * 0.036),
                ),
                SizedBox(
                  height: valHeight * 0.3,
                )
              ],
            ),
          ),
        ]));
  }
}