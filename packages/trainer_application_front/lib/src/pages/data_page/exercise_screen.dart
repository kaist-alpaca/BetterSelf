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
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    double graphWidth = valWidth * 0.86;
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
        SizedBox(
          height: valHeight * 0.04,
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
            ),
            SizedBox(
              height: valHeight * 0.03,
            ),
            Container(
              height: valHeight * 0.05,
              width: valWidth * 0.8,
              margin: EdgeInsets.only(
                  bottom: valHeight * 0.028, top: valHeight * 0.028),
              child: Text(
                '코칭',
                style: TextStyle(fontSize: defaultSize * 12),
              ),
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
              height: valHeight * 0.23,
              width: graphWidth,
              color: Colors.grey,
              child: Text(
                '(여기에 댤력에서 체크한 날짜)의 운동 코칭',
              ),
            ),
            SizedBox(
              height: valHeight * 0.3,
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
        ),
        SizedBox(
          height: valHeight * 0.03,
        ),
        Container(
          height: valHeight * 0.05,
          width: valWidth * 0.8,
          margin: EdgeInsets.only(
              bottom: valHeight * 0.028, top: valHeight * 0.028),
          child: Text(
            '코칭',
            style: TextStyle(fontSize: defaultSize * 12),
          ),
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
          height: valHeight * 0.23,
          width: graphWidth,
          color: Colors.grey,
          child: Text(
            '(여기에 댤력에서 체크한 날짜)의 운동 코칭',
          ),
        ),
        SizedBox(
          height: valHeight * 0.3,
        )
      ])));
    } else {
      return Container();
    }
  }
}
