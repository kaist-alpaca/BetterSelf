import 'package:flutter/material.dart';
import '../pages/data_page/stress_screen.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreen createState() => _ReportScreen();
}

int stressButton = 0;

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
                  onTap: () {},
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
                        stressButton = 0;
                        setState(() {});
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
                    onTap: () {},
                    child: Container(
                      height: valHeight * 0.32,
                      width: graphWidth,
                      child: Text('여기에 스트레스 코칭, 겸 피드백하러 가기 버튼.'),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                    ))
              ],
            ),
          )
        ]));
  }
}
