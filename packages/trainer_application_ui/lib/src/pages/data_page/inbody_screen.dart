import 'package:flutter/material.dart';

int? buttonCase;

class InbodyScreen extends StatefulWidget {
  InbodyScreen(int a) {
    buttonCase = a;
  }

  @override
  _InbodyScreen createState() => _InbodyScreen();
}

class _InbodyScreen extends State<InbodyScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025; //폰트사이즈용
    double graphWidth = valWidth * 0.86; // 그래프들 너비

    if (buttonCase == 0) {
      //7일로 선택되었을 때 표현될 위젯들은 여기에.
      return Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '신체변화',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 7일짜리 신체변화 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '스트레스',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 7일짜리 스트레스 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '수면 시간',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 7일짜리 수면 시간 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '수면 시간대',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 7일짜리 수면 시간대 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: valWidth * 0.8,
              margin: EdgeInsets.only(top: valHeight * 0.028),
              child: Text(
                '코칭',
                style: TextStyle(fontSize: defaultSize * 12),
              ),
            ),
            Row(
              // 코칭 날짜 입력
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: valHeight * 0.06,
                  width: valWidth * 0.12,
                  child: Text(
                    '날짜',
                    style: TextStyle(
                      fontSize: defaultSize * 12,
                    ),
                  ),
                ),
                Container(
                  //여기에 날짜 입력
                  height: valHeight * 0.06,
                  width: valWidth * 0.65,
                  color: Colors.grey,
                )
              ],
            ),
            Container(
              // 여기에 코칭 내용 입력
              height: valHeight * 0.25,
              width: valWidth * 0.84,
              color: Colors.grey,
              margin: EdgeInsets.only(
                  top: valHeight * 0.012, bottom: valHeight * 0.02),
            ),
            GestureDetector(
              onTap: () {}, //여기 누르면 코칭 저장시켜야함.
              child: Container(
                height: valHeight * 0.06,
                width: valWidth * 0.3,
                color: Colors.grey,
                child: Text(
                  '코칭 저장',
                  style: TextStyle(fontSize: defaultSize * 14),
                ),
              ),
            ),
            SizedBox(
              height: valHeight * 0.1,
            )
          ])));
    } else if (buttonCase == 1) {
      //31일로 선택되었을 때 표현될 위젯들은 여기에
      return Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '신체변화',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.blue,
              child: Text('여기에 31일짜리 신체변화 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '스트레스',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 31일짜리 스트레스 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '수면 시간',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 31일짜리 수면 시간 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '수면 시간대',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 31일짜리 수면 시간대 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '코칭',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Row(
              //기간(월) 선택하는 bar.
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
              child: Text('여기에 해당 날의 코칭'),
            ),
            SizedBox(
              height: valHeight * 0.1,
            )
          ])));
    } else if (buttonCase == 2) {
      //12개월로 선택되었을 때 표현될 위젯들은 여기에.
      return Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '신체변화',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.red,
              child: Text('여기에 12개월짜리 신체변화 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '스트레스',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 12개월짜리 스트레스 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '수면 시간',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 12개월짜리 수면 시간 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '수면 시간대',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 12개월짜리 수면 시간대 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '코칭',
                style: TextStyle(fontSize: defaultSize * 14),
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
              child: Text('여기에 해당 날의 코칭'),
            ),
            SizedBox(
              height: valHeight * 0.1,
            )
          ])));
    } else {
      return Container();
    }
  }
}
