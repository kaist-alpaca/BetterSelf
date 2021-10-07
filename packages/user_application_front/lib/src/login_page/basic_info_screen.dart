/*import 'package:flutter/material.dart';

class AgreementScreen extends StatefulWidget {
  @override
  _AgreementScreen createState() => _AgreementScreen();
}

class _AgreementScreen extends State<AgreementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [],
      ),
    ));
  }
}
*/ // 화면 새로 만들때 사용. 개발 편의를 위한 복붙용임.

import 'package:flutter/material.dart';
import 'package:user_application_front/widget/setting_bar.dart'; //SettingBar 위젯
import 'package:user_application_front/src/login_page/basic_ill_screen.dart';
import 'package:user_application_front/src/screen/home.dart';

class BasicInfoScreen extends StatefulWidget {
  @override
  _BasicInfoScreen createState() => _BasicInfoScreen();
}

class _BasicInfoScreen extends State<BasicInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    return Scaffold(
        appBar: AppBar(
          title: Text('설정'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "내 정보",
                  style: TextStyle(
                    fontSize: 8,
                  ),
                ),
                margin: EdgeInsets.fromLTRB(
                    valWidth * 0.01, valHeight * 0.015, 0, valHeight * 0.03),
              ),
              Row(
                //내 정보 설정
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        //프사 위 여백
                        height: valHeight * 0.16,
                      ),
                      Container(
                          //여기에 아마도 프사
                          width: valHeight * 0.15,
                          height: valHeight * 0.15,
                          color: Colors.grey,
                          margin: EdgeInsets.fromLTRB(
                              valWidth * 0.025, 0, valWidth * 0.025, 0)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Text(
                            "ID",
                            style: TextStyle(fontSize: 10),
                          )),
                          Container(
                            //ID 입력란
                            height: valHeight * 0.06,
                            width: valWidth * 0.34,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3)),
                            margin: EdgeInsets.fromLTRB(valWidth * 0.02, 0,
                                valWidth * 0.02, valWidth * 0.015),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Text(
                            "성별",
                            style: TextStyle(fontSize: 10),
                          )),
                          Container(
                            //성별 입력란
                            height: valHeight * 0.06,
                            width: valWidth * 0.34,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3)),
                            margin: EdgeInsets.fromLTRB(valWidth * 0.02, 0,
                                valWidth * 0.02, valWidth * 0.015),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Text(
                            "생년월일",
                            style: TextStyle(fontSize: 10),
                          )),
                          Container(
                            //생년월일 입력란
                            height: valHeight * 0.06,
                            width: valWidth * 0.34,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3)),
                            margin: EdgeInsets.fromLTRB(valWidth * 0.02, 0,
                                valWidth * 0.02, valWidth * 0.015),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Text(
                            "ID",
                            style: TextStyle(fontSize: 10),
                          )),
                          Container(
                            //생년월일 입력란
                            height: valHeight * 0.06,
                            width: valWidth * 0.34,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3)),
                            margin: EdgeInsets.fromLTRB(valWidth * 0.02, 0,
                                valWidth * 0.02, valWidth * 0.015),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Text(
                            "키",
                            style: TextStyle(fontSize: 10),
                          )),
                          Container(
                            //키 입력란
                            height: valHeight * 0.06,
                            width: valWidth * 0.34,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3)),
                            margin: EdgeInsets.fromLTRB(valWidth * 0.02, 0,
                                valWidth * 0.02, valWidth * 0.015),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Text(
                            "체중",
                            style: TextStyle(fontSize: 10),
                          )),
                          Container(
                            //체중 입력란
                            height: valHeight * 0.06,
                            width: valWidth * 0.34,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 3)),
                            margin: EdgeInsets.fromLTRB(valWidth * 0.02, 0,
                                valWidth * 0.02, valWidth * 0.03),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SettingBar(
                  name: '질병 기초 정보 입력',
                  screen: BasicIllScreen()), //질병 기초 입력으로 넘어감
              SizedBox(
                height: valHeight * 0.05,
              ),
              GestureDetector(
                // 저장 후 다음 페이지로 넘어감.
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }, //여기에 저장 기능 구현
                child: Container(
                  width: valWidth * 0.7,
                  height: valHeight * 0.07,
                  margin: EdgeInsets.only(left: 0.15 * valWidth),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Text(
                    "저장",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
