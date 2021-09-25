import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/common/custom_icons_icons.dart';
import 'package:ui/screen/setting_ID.dart';
import 'package:ui/screen/setting_PW.dart';
import 'package:ui/screen/setting_data.dart';
import 'package:ui/screen/setting_location.dart';
import 'package:ui/screen/setting_security.dart';
import 'package:ui/screen/setting_terms&conditions.dart';
import 'package:ui/widget/setting_bar.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreen createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    var maxHeight = MediaQuery.of(context).size.height;
    var defaultSize = maxWidth * 0.0025;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, maxHeight * 0.05, 0, 0),
              height: maxWidth * 0.15,
              width: double.infinity,
              color: Colors.greenAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "설정",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: defaultSize * 25,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Container(
              height: maxWidth * 0.1,
              width: double.infinity,
              margin:
                  EdgeInsets.fromLTRB(maxWidth * 0.08, maxWidth * 0.05, 0, 0),
              child: Text(
                "프로필",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: defaultSize * 23,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              // height: 100,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        maxWidth * 0.08, 0, maxWidth * 0.03, 0),
                    height: maxWidth * 0.18,
                    width: maxWidth * 0.18,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(maxWidth * 0.03),
                        color: Colors.redAccent,
                        border: Border.all(
                            color: Colors.black12, width: maxWidth * 0.015)),
                  ),
                  Column(
                    children: [
                      Container(
                        height: maxWidth * 0.11,
                        width: maxWidth * 0.68,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent,
                          border: Border.all(color: Colors.black12, width: 3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: maxWidth * 0.02),
                              child: Text(
                                "이름",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: defaultSize * 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: maxWidth * 0.03),
                              child: Text(
                                "고경빈",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: defaultSize * 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: maxWidth * 0.01,
                      ),
                      Container(
                        height: maxWidth * 0.11,
                        width: maxWidth * 0.68,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent,
                          border: Border.all(color: Colors.black12, width: 3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: maxWidth * 0.02),
                              child: Text(
                                "생년월일",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: defaultSize * 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: maxWidth * 0.03),
                              child: Text(
                                "2000년 5월 3일",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: defaultSize * 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: maxWidth * 0.1,
              width: double.infinity,
              margin:
                  EdgeInsets.fromLTRB(maxWidth * 0.08, maxWidth * 0.04, 0, 0),
              child: Text(
                "설정",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: defaultSize * 23,
                    fontWeight: FontWeight.w700),
              ),
            ),
            settingBar(
              name: "ID",
              screen: SettingIDScreen(),
            ),
            settingBar(
              name: "암호",
              screen: SettingPWScreen(),
            ),
            settingBar(
              name: "위치 설정",
              screen: SettingLocationScreen(),
            ),
            settingBar(
              name: "데이터 관리",
              screen: SettingDataScreen(),
            ),
            Container(
              height: maxWidth * 0.1,
              width: double.infinity,
              margin:
                  EdgeInsets.fromLTRB(maxWidth * 0.08, maxWidth * 0.04, 0, 0),
              child: Text(
                "App",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: defaultSize * 23,
                    fontWeight: FontWeight.w700),
              ),
            ),
            settingBar(
              name: "보안 정책",
              screen: SettingScurityScreen(),
            ),
            settingBar(
              name: "이용약관",
              screen: SettingTermsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
