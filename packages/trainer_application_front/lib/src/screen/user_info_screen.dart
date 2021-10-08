import 'package:flutter/material.dart';
import '../screen/report_screen.dart';

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
              SizedBox(
                height: valHeight * 0.05,
              ),
              Container(
                height: valHeight * 0.2,
                width: valWidth * 0.84,
                color: Colors.grey,
                child: Text('여기에 사용자 관련 노트 작성.'),
              ),
              SizedBox(
                height: valHeight * 0.15,
              ),
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
                  child: Text('리포트 확인'),
                ),
              )
            ],
          ),
        ));
  }
}
