import 'package:flutter/material.dart';
import 'report_screen.dart';
import '../pages/info_coaching_page/add_coaching_screen.dart';
import '../pages/info_coaching_page/coaching_history_screen.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreen createState() => _UserInfoScreen();
}

class _UserInfoScreen extends State<UserInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    return Scaffold(
        appBar: AppBar(
          title: Text('회원 정보'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: valHeight * 0.05,
              ),
              Container(
                height: valHeight * 0.25,
                width: valWidth * 0.84,
                color: Colors.grey,
                child: Text('여기에 프사와 기본 정보들'),
              ),
              SizedBox(height: valHeight * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReportScreen()));
                },
                child: Container(
                  height: 0.055 * valHeight,
                  width: 0.63 * valWidth,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Text('BP 리포트 확인'),
                  margin: EdgeInsets.only(bottom: valHeight * 0.04),
                ),
              ),
              Container(
                height: valHeight * 0.035,
                width: valWidth * 0.6,
                child: Text(
                  '코칭',
                  style: TextStyle(fontSize: defaultSize * 12),
                ),
              ),
              Container(
                height: valHeight * 0.25,
                width: valWidth * 0.84,
                color: Colors.grey,
                margin: EdgeInsets.only(bottom: valHeight * 0.015),
                child: Text('여기에 지난 전반 코칭이 들어가야 함'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoachingHistoryScreen()));
                    }, //여기에 코칭 히스토리로 이동
                    child: Container(
                      height: valHeight * 0.04,
                      width: valWidth * 0.38,
                      color: Colors.grey,
                      child: Text(
                        '코칭 히스토리',
                        style: TextStyle(fontSize: defaultSize * 11),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: valWidth * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddCoachingScreen()));
                    }, //여기에 코칭 추가로 이동
                    child: Container(
                      height: valHeight * 0.04,
                      width: valWidth * 0.38,
                      color: Colors.grey,
                      child: Text(
                        '코칭 추가',
                        style: TextStyle(fontSize: defaultSize * 11),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
