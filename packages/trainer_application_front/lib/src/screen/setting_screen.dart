import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreen createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    return Scaffold(
        appBar: AppBar(
          title: Text('설정'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: valHeight * 0.1,
              ),
              //프사 위쪽 다듬는건 잘 예쁘게 화이팅.
              Container(
                height: valHeight * 0.1, //여기에 프사 설정
                width: valHeight * 0.1,
                color: Colors.grey,
              ),
              SizedBox(
                height: valHeight * 0.05,
              ),
              Row(
                //ID 설정용
                children: [
                  Container(
                    //ID 써있는 텍스트
                    height: valHeight * 0.1,
                    width: valWidth * 0.2,
                    child: Text(
                      'ID',
                      style: TextStyle(fontSize: defaultSize * 12),
                    ),
                    margin: EdgeInsets.only(
                      left: valWidth * 0.3,
                    ),
                  ),
                  GestureDetector(
                    //이거 누르면 ID 입력하는 팝업 등장해야함.
                    onTap: () {}, //요기에 작성
                    child: Container(
                      height: valHeight * 0.1,
                      width: valWidth * 0.2,
                      child: Text(
                        'Edit',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: valHeight * 0.08),
              Row(
                //여기가 성별 설정하는 곳
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: valHeight * 0.06,
                    width: valWidth * 0.16,
                    child: Text(
                      '성별',
                      style: TextStyle(fontSize: defaultSize * 12),
                    ),
                  ),
                  Container(
                    // 여기에 입력란 만들어야함.
                    height: valHeight * 0.06,
                    width: valWidth * 0.34,
                    color: Colors.grey,
                    margin: EdgeInsets.only(bottom: valHeight * 0.01),
                  ),
                ],
              ),
              Row(
                //여기가 생년월일 설정하는 곳
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: valHeight * 0.06,
                    width: valWidth * 0.16,
                    child: Text(
                      '생년월일',
                      style: TextStyle(fontSize: defaultSize * 12),
                    ),
                  ),
                  Container(
                    // 여기에 입력란 만들어야함.
                    height: valHeight * 0.06,
                    width: valWidth * 0.34,
                    color: Colors.grey,
                    margin: EdgeInsets.only(bottom: valHeight * 0.01),
                  ),
                ],
              ),
              SizedBox(
                height: valHeight * 0.14,
              ),
              GestureDetector(
                //로그아웃
                onTap: () {
                  //여기에 로그아웃 기능 만들어야함.
                },
                child: Container(
                  height: valHeight * 0.08,
                  width: valWidth * 0.65,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Text('Log Out'),
                ),
              )
            ],
          ),
        ));
  }
}
