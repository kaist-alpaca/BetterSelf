import 'package:flutter/material.dart';

class CoachingHistoryScreen extends StatefulWidget {
  @override
  _CoachingHistoryScreen createState() => _CoachingHistoryScreen();
}

class _CoachingHistoryScreen extends State<CoachingHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    double graphWidth = valWidth * 0.86; //그래프들 너비

    return Scaffold(
        appBar: AppBar(
          title: Text('코칭 히스토리'),
        ),
        body: ListView(children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: valHeight * 0.05,
                  width: valWidth * 0.8,
                  margin: EdgeInsets.only(
                      bottom: valHeight * 0.015, top: valHeight * 0.028),
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
                        height: valHeight * 0.08,
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
                        height: valHeight * 0.08,
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
                  child: Text('여기에 달력에서 체크한 날의 전반 코칭 및 수정 버튼.'),
                ),
                SizedBox(
                  height: valHeight * 0.028,
                ),
              ],
            ),
          ),
        ]));
  }
}
