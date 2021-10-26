import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainer_application_front/src/pages/feedback_page/inbody_feedback_screen.dart';
import 'package:trainer_application_front/src/pages/feedback_page/food_feedback_screen.dart';
import 'package:trainer_application_front/src/pages/feedback_page/exercise_feedback_screen.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreen createState() => _ReportScreen();
}

class _ReportScreen extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    return Scaffold(
        appBar: AppBar(
          title: Text("누구누구 님의 리포트"),
        ),
        body: ListView(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    '데이터',
                    style: TextStyle(fontSize: defaultSize * 12),
                  ),
                  height: valHeight * 0.05,
                  margin: EdgeInsets.only(
                      left: valWidth * 0.14, top: valHeight * 0.03),
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
                SizedBox(
                  height: valHeight * 0.02,
                ),
                Container(
                  //여기에 인바디(생체) 데이터가 보여야함
                  color: Colors.grey,
                  height: 0.4 * valHeight,
                  width: valWidth * 0.84,
                  margin: EdgeInsets.only(left: valWidth * 0.08),
                  child: Text('여긴 인바디데이터'),
                ),
                SizedBox(height: valHeight * 0.015),
                GestureDetector(
                  //여기를 누르면 생체(인바디) 리포트로 넘어감
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InbodyFeedbackScreen()));
                  },
                  child: Container(
                    height: valHeight * 0.04,
                    width: valWidth * 0.35,
                    color: Colors.grey,
                    margin: EdgeInsets.only(left: valWidth * 0.325),
                    child: Text(
                      '생체 리포트  >',
                      style: TextStyle(fontSize: defaultSize * 10),
                    ),
                  ),
                ),
                SizedBox(
                  height: valHeight * 0.035,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            //여기에 해당 날짜의 운동 그래프.
                            width: valWidth * 0.4,
                            height: valHeight * 0.2,
                            color: Colors.grey,
                            margin: EdgeInsets.only(bottom: valHeight * 0.015),
                            child: Text('여기에 운동 그래프가 들어가야 합니다.'),
                          ),
                          GestureDetector(
                            //여기를 누르면 운동 리포트로 넘어감
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ExerciseFeedbackScreen()));
                            },
                            child: Container(
                              height: valHeight * 0.04,
                              width: valWidth * 0.35,
                              color: Colors.grey,
                              child: Text(
                                '운동 리포트  >',
                                style: TextStyle(fontSize: defaultSize * 10),
                              ),
                            ),
                          ),
                        ]),
                    SizedBox(width: valWidth * 0.04),
                    Column(children: [
                      Container(
                        width: valWidth * 0.4,
                        height: valHeight * 0.2,
                        color: Colors.grey,
                        margin: EdgeInsets.only(bottom: valHeight * 0.015),
                        child: Text('여기에 식단 기록이 들어가야 합니다.'),
                      ),
                      GestureDetector(
                        //여기를 누르면 식단 리포트로 넘어감
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FoodFeedbackScreen()));
                        },
                        child: Container(
                          height: valHeight * 0.04,
                          width: valWidth * 0.35,
                          color: Colors.grey,
                          child: Text(
                            '식단 리포트  >',
                            style: TextStyle(fontSize: defaultSize * 10),
                          ),
                        ),
                      ),
                    ])
                  ],
                ),
                SizedBox(
                  height: valHeight * 0.05,
                )
              ],
            ),
          ),
        ]));
  }
}
