import 'package:flutter/material.dart';
import 'package:user_application_front/widget/setting_bar.dart'; //SettingBar 위젯
import 'package:user_application_front/src/pages/login_page/basic_ill_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_application_front/src/pages/setting_page/setting_ID.dart';
import 'package:user_application_front/src/pages/login_page/agreement_screen.dart';
import 'package:user_application_front/widget/setting_bar.dart';

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
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "내 정보",
                    style: TextStyle(
                      fontSize: defaultSize * 20,
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
                          height: valHeight * 0.07,
                        ),
                        Container(
                            //여기에 아마도 프사설정
                            width: valHeight * 0.15,
                            height: valHeight * 0.15,
                            color: Colors.grey,
                            margin: EdgeInsets.fromLTRB(
                                valWidth * 0.025, 0, valWidth * 0.025, 0)),
                        SizedBox(
                          height: valHeight * 0.1,
                        )
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
                              "성별",
                              style: TextStyle(fontSize: defaultSize * 15),
                            )),
                            Container(
                              //성별 입력란
                              height: valHeight * 0.06,
                              width: valWidth * 0.34,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 3)),
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
                              style: TextStyle(fontSize: defaultSize * 15),
                            )),
                            Container(
                              //생년월일 입력란
                              height: valHeight * 0.06,
                              width: valWidth * 0.34,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 3)),
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
                              style: TextStyle(fontSize: defaultSize * 15),
                            )),
                            Container(
                              //키 입력란
                              height: valHeight * 0.06,
                              width: valWidth * 0.34,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 3)),
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
                              style: TextStyle(fontSize: defaultSize * 15),
                            )),
                            Container(
                              //체중 입력란
                              height: valHeight * 0.06,
                              width: valWidth * 0.34,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 3)),
                              margin: EdgeInsets.fromLTRB(valWidth * 0.02, 0,
                                  valWidth * 0.02, valWidth * 0.03),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  height: valWidth * 0.1,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(
                      valWidth * 0.08, valWidth * 0.04, 0, 0),
                  child: Text(
                    "설정",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: defaultSize * 23,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SettingBar(name: 'ID', screen: SettingIDScreen()), //ID 수정으로 넘어감
                SettingBar(
                    name: '질병 기초 정보 입력',
                    screen: BasicIllScreen()), //질병 기초 입력으로 넘어감
                Container(
                  height: valWidth * 0.1,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(
                      valWidth * 0.08, valWidth * 0.04, 0, 0),
                  child: Text(
                    "App",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: defaultSize * 23,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SettingBar(
                    name: '개인정보 처리방침 및 이용약관',
                    screen: AgreementScreen()), //이용약관으로 넘어감
                SizedBox(
                  height: valHeight * 0.24,
                ),

                GestureDetector(
                  // 저장 후 다음 페이지로 넘어감.
                  onTap: () {}, //여기에 로그아웃 기능 구현
                  child: Container(
                    width: valWidth * 0.7,
                    height: valHeight * 0.05,
                    margin: EdgeInsets.only(left: 0.15 * valWidth),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3)),
                    child: Text(
                      "로그아웃",
                      style: TextStyle(
                        fontSize: defaultSize * 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: valHeight * 0.08,
                )
              ],
            ),
          ]),
        ));
  }
}
