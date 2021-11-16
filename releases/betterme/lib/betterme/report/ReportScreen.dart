import 'package:betterme/functions/Widgets/DividewithObj.dart';

import 'package:betterme/betterme/report/Widgets/total_report/ReportSet.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreen createState() => _ReportScreen();
}

int buttonCase = 0; // 7일/31일/12개월 버튼 상태 확인용

class _ReportScreen extends State<ReportScreen> {
  List<bool> GraphTypes = [true, true, true, true, true];
  Color button1Color = Color(0xff827380);
  Color button2Color = Color(0xff0B202A);
  Color button3Color = Color(0xff0B202A);

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    final shadowColor = Color(0xffD2ABBA);
    double defaultSize = valWidth * 0.0025;

    return GetBuilder<ProfileController>(builder: (controller) {
      return Container(
        color: bgColor,
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            elevation: 0.0,
            leading: Container(),
            title: Align(
              alignment: Alignment(-0.38, 0),
              child: Container(
                height: valHeight * 0.08,
                padding: EdgeInsets.only(top: 30),
                child: Text("데이터",
                    style:
                        TextStyle(fontSize: defaultSize * 17, color: txtColor),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
          body: ListView(children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DividewithObj(
                      context,
                      Container(
                          width: valWidth * 0.25,
                          child: Text(
                            "데이터",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.pink[100],
                            ),
                            textAlign: TextAlign.center,
                          )),
                      0.15,
                      0.6),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: valWidth * 0.81,
                    height: valHeight * 0.04,
                    margin: EdgeInsets.only(left: 0.095 * valWidth),
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(valWidth * 0.015),
                        boxShadow: [
                          BoxShadow(color: Color(0xffD2ABBA), blurRadius: 1.2),
                        ]),
                    child: Row(
                      // 여기서부터 버튼(7일/31일/12개월 구분)
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(valWidth * 0.015),
                              ),
                              primary: button1Color,
                              minimumSize:
                                  Size(valWidth * 0.27, valHeight * 0.04)),
                          child: Text(
                            '7일',
                            style: TextStyle(
                              color: txtColor,
                              fontSize: defaultSize * 14,
                            ),
                          ),
                          onPressed: () {
                            buttonCase = 0;
                            setState(() {
                              button1Color = Color(0xff827380);
                              button2Color = Color(0xff0B202A);
                              button3Color = Color(0xff0B202A);
                            });
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(valWidth * 0.015),
                              ),
                              primary: button2Color,
                              minimumSize:
                                  Size(valWidth * 0.27, valHeight * 0.04)),
                          child: Text(
                            '31일',
                            style: TextStyle(
                              color: txtColor,
                              fontSize: defaultSize * 14,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              buttonCase = 1;

                              setState(() {
                                button2Color = Color(0xff827380);
                                button1Color = Color(0xff0B202A);
                                button3Color = Color(0xff0B202A);
                              });
                            });
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(valWidth * 0.015),
                              ),
                              primary: button3Color,
                              minimumSize:
                                  Size(valWidth * 0.27, valHeight * 0.04)),
                          child: Text(
                            '12개월',
                            style: TextStyle(
                              color: txtColor,
                              fontSize: defaultSize * 14,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              buttonCase = 2;
                            });

                            setState(() {
                              button3Color = Color(0xff827380);
                              button2Color = Color(0xff0B202A);
                              button1Color = Color(0xff0B202A);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ReportSet(buttonCase),
                  SizedBox(
                    height: 7,
                  ),
                  DividewithObj(
                      context,
                      Container(
                          width: valWidth * 0.25,
                          child: Text(
                            "코칭",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.pink[100],
                            ),
                            textAlign: TextAlign.center,
                          )),
                      0.15,
                      0.6),
                ],
              ),
            ),
          ]),
        ),
      );
    });
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
