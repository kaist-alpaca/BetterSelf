import 'package:flutter/material.dart';

int buttonCase = 0; // 상단 버튼 상태 확인용.
//0: 전반  1: 운동  2: 식단  3: 생체

int dayButtonCase = 0; //왼쪽 버튼 상태 확인용.
//0: 그저께  1: 어제  2: 오늘

double? widgetHeight1;
double? widgetWidth1;

class Coaching extends StatefulWidget {
  Coaching(double widgetHeight2, double widgetWidth2) {
    widgetHeight1 = widgetHeight2;
    widgetWidth1 = widgetWidth2;
  }
  @override
  _Coaching createState() => _Coaching();
}

class _Coaching extends State<Coaching> {
  Color button1Color = Color(0xff827380); //상단 버튼 색상
  Color button2Color = Color(0xff0B202A);
  Color button3Color = Color(0xff0B202A);
  Color button4Color = Color(0xff0B202A);

  Color dayButton1Color = Color(0xff0B202A);
  Color dayButton2Color = Color(0xff0B202A);
  Color dayButton3Color = Color(0xff474A55);

  @override
  Widget build(BuildContext context) {
    double widgetWidth = widgetWidth1!;
    double widgetHeight = widgetHeight1!;

    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    final outTopBlank = valHeight * 0.007; //바깥쪽 여백
    final outLeftBlank = valWidth * 0.012;
    double inWidgetWidth = widgetWidth - 2 * outLeftBlank;
    double inWidgetHeight = widgetHeight - 2 * outTopBlank;

    double buttonHeight = inWidgetHeight * 0.18; //상단 버튼 크기
    double buttonWidth = inWidgetWidth * 0.208;

    double dayButtonHeight = inWidgetHeight * 0.24; //좌측 버튼 크기
    double dayButtonWidth = inWidgetWidth * 0.15;

    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    double defaultSize = valWidth * 0.0025;

    return Container(
        height: widgetHeight,
        width: widgetWidth,
        padding: EdgeInsets.fromLTRB(
            outLeftBlank, outTopBlank, outLeftBlank, outTopBlank),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: inWidgetWidth * 0.165),
                Container(
                  width: buttonWidth * 4,
                  height: buttonHeight,
                  decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(valWidth * 0.015),
                      boxShadow: [
                        BoxShadow(color: Color(0xffD2ABBA), blurRadius: 1.2),
                      ]),
                  child: Row(
                    // 여기서부터 버튼
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
                            minimumSize: Size(buttonWidth, buttonHeight)),
                        child: Text(
                          '전반',
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
                            button4Color = Color(0xff0B202A);
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
                          minimumSize: Size(buttonWidth, buttonHeight),
                        ),
                        child: Text(
                          '운동',
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
                              button4Color = Color(0xff0B202A);
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
                          minimumSize: Size(buttonWidth, buttonHeight),
                        ),
                        child: Text(
                          '식단',
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
                            button4Color = Color(0xff0B202A);
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(valWidth * 0.015),
                            ),
                            primary: button4Color,
                            minimumSize: Size(buttonWidth, buttonHeight)),
                        child: Text(
                          '생체',
                          style: TextStyle(
                            color: txtColor,
                            fontSize: defaultSize * 14,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            buttonCase = 3;
                          });
                          setState(() {
                            button4Color = Color(0xff827380);
                            button3Color = Color(0xff0B202A);
                            button2Color = Color(0xff0B202A);
                            button1Color = Color(0xff0B202A);
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: widgetHeight * 0.035),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //여기에 좌측 버튼
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: dayButtonHeight,
                      width: dayButtonWidth,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Color(0xffD2ABBA), blurRadius: 0.4),
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(valWidth * 0.02),
                            bottomLeft: Radius.circular(valWidth * 0.02)),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(valWidth * 0.02),
                                  bottomLeft: Radius.circular(valWidth * 0.02)),
                            ),
                            primary: dayButton1Color,
                            minimumSize: Size(dayButtonWidth, dayButtonHeight)),
                        child: Text(
                          '2',
                          style: TextStyle(
                            color: txtColor,
                            fontSize: defaultSize * 12,
                          ),
                        ),
                        onPressed: () {
                          dayButtonCase = 0;
                          setState(() {
                            dayButton1Color = Color(0xff474A55);
                            dayButton2Color = Color(0xff0B202A);
                            dayButton3Color = Color(0xff0B202A);
                          });
                        },
                      ),
                    ),
                    SizedBox(height: widgetHeight * 0.015),
                    Container(
                      height: dayButtonHeight,
                      width: dayButtonWidth,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Color(0xffD2ABBA), blurRadius: 0.4),
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(valWidth * 0.02),
                            bottomLeft: Radius.circular(valWidth * 0.02)),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(valWidth * 0.02),
                                  bottomLeft: Radius.circular(valWidth * 0.02)),
                            ),
                            primary: dayButton2Color,
                            minimumSize: Size(dayButtonWidth, dayButtonHeight)),
                        child: Text(
                          '30',
                          style: TextStyle(
                            color: txtColor,
                            fontSize: defaultSize * 12,
                          ),
                        ),
                        onPressed: () {
                          dayButtonCase = 1;
                          setState(() {
                            dayButton2Color = Color(0xff474A55);
                            dayButton1Color = Color(0xff0B202A);
                            dayButton3Color = Color(0xff0B202A);
                          });
                        },
                      ),
                    ),
                    SizedBox(height: widgetHeight * 0.015),
                    Container(
                      height: dayButtonHeight,
                      width: dayButtonWidth,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Color(0xffD2ABBA), blurRadius: 0.4),
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(valWidth * 0.02),
                            bottomLeft: Radius.circular(valWidth * 0.02)),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(valWidth * 0.02),
                                  bottomLeft: Radius.circular(valWidth * 0.02)),
                            ),
                            primary: dayButton3Color,
                            minimumSize: Size(dayButtonWidth, dayButtonHeight)),
                        child: Text(
                          '31',
                          style: TextStyle(
                            color: txtColor,
                            fontSize: defaultSize * 12,
                          ),
                        ),
                        onPressed: () {
                          dayButtonCase = 0;
                          setState(() {
                            dayButton3Color = Color(0xff474A55);
                            dayButton2Color = Color(0xff0B202A);
                            dayButton1Color = Color(0xff0B202A);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(width: widgetWidth * 0.015),
                Container(
                    //여기에 코칭 텍스트 들어감.
                    height: dayButtonHeight * 3 + widgetHeight * 0.03,
                    width: buttonWidth * 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(valWidth * 0.02),
                          bottomRight: Radius.circular(valWidth * 0.02)),
                      color: Color(0xff333C47),
                      boxShadow: [
                        BoxShadow(color: Color(0xffD2ABBA), blurRadius: 0.4),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(
                        widgetWidth * 0.033,
                        widgetHeight * 0.1,
                        widgetWidth * 0.033,
                        widgetHeight * 0.1),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '여기에 코칭 내용adfadfasdfㅁㄴㅇㄻㅇㄹㄴㅁㅇㄻㄴㅇㄹㄴ',
                        softWrap: true,
                        style: TextStyle(
                            color: txtColor, fontSize: defaultSize * 12),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            ),
          ],
        ));
  }
}
