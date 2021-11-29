import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'SevenDaysCoachingBody.dart';

class SevenDaysCoaching extends StatefulWidget {
  @override
  _SevenDaysCoaching createState() => _SevenDaysCoaching();
}

class _SevenDaysCoaching extends State<SevenDaysCoaching> {
  Color button1Color = Color(0xff827380); //상단 버튼 색상
  Color button2Color = Color(0xff827380);
  Color button3Color = Color(0xff0B202A);
  Color button4Color = Color(0xff0B202A);

  Color dayButton1Color = Color(0xff0B202A);
  Color dayButton2Color = Color(0xff0B202A);
  Color dayButton3Color = Color(0xff0B202A);
  Color dayButton4Color = Color(0xff0B202A);
  Color dayButton5Color = Color(0xff0B202A);
  Color dayButton6Color = Color(0xff0B202A);
  Color dayButton7Color = Color(0xff474A55);
  int dayButtonCase = 6; //좌측 버튼 상태 확인용 (0: 7일전, 6:오늘)

  int buttonCase = 1; // 상단 버튼 상태 확인용.
//0: 전반  1: 운동  2: 식단  3: 생체

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색

    double defaultSize = valWidth * 0.0025;

    double dayButtonHeight = valHeight * 0.075;
    double dayButtonWidth = valWidth * 0.12; //버튼크기
    double blankBetweenButton = valHeight * 0.01; //버튼사이 여백

    double graphWidth = valWidth * 0.88; // 그래프들 너비(였던것)

    double buttonHeight = 30; //상단 버튼 크기
    double buttonWidth = (graphWidth - dayButtonWidth - valWidth * 0.015) / 3;

    return GetBuilder<ProfileController>(builder: (controller) {
      String dayButton1txt =
          controller.MinusSixDate(controller.date).day.toString();
      String dayButton2txt =
          controller.MinusFiveDate(controller.date).day.toString();
      String dayButton3txt =
          controller.MinusFourDate(controller.date).day.toString();
      String dayButton4txt =
          controller.MinusThreeDate(controller.date).day.toString();
      String dayButton5txt =
          controller.MinusTwoDate(controller.date).day.toString();
      String dayButton6txt =
          controller.MinusOneDate(controller.date).day.toString();
      String dayButton7txt = controller.date.day.toString();

      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                //기간(날짜) 선택하는 bar.
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: valWidth * 0.17,
                    height: valHeight * 0.055,
                    child: IconButton(
                      icon: SvgPicture.asset(
                          'images/arrow towards left_icon.svg'),
                      onPressed: () {
                        ServerConnection.write_log('ReportScreen',
                            'week_coaching_to_previous_date', '');
                        controller.dateMinus7(controller.date);
                        controller.rdateMinus7(controller.reportDay);
                      },
                    ),
                  ),
                  Container(
                    width: valWidth * 0.66,
                    height: valHeight * 0.05,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          controller.MinusSixDate(controller.date)
                                  .month
                                  .toString() +
                              "월 " +
                              controller.MinusSixDate(controller.date)
                                  .day
                                  .toString() +
                              "일 - " +
                              controller.date.month.toString() +
                              "월 " +
                              controller.date.day.toString() +
                              "일",
                          style: TextStyle(
                              fontSize: defaultSize * 17, color: txtColor),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  //날짜 오른쪽으로 넘기는 버튼
                  Container(
                    width: valWidth * 0.17,
                    height: valHeight * 0.05,
                    child: IconButton(
                      icon: SvgPicture.asset(
                          'images/arrow towards right_icon.svg'),
                      onPressed: () {
                        ServerConnection.write_log(
                            'ReportScreen', 'week_coaching_to_later_date', '');
                        controller.datePlus7(controller.date);
                        controller.rdatePlus7(controller.reportDay);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                      width:
                          (1.015 * valWidth - graphWidth) / 2 + dayButtonWidth),
                  Container(
                    width: buttonWidth * 3,
                    height: buttonHeight,
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(valWidth * 0.015),
                        boxShadow: [
                          BoxShadow(color: Color(0xffD2ABBA), blurRadius: 0.1),
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
                            ServerConnection.write_log(
                                'ReportScreen', 'week_coaching_exercise', '');
                            setState(() {
                              buttonCase = 1;

                              setState(() {
                                button2Color = Color(0xff827380);
                                button4Color = Color(0xff0B202A);
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
                            ServerConnection.write_log(
                                'ReportScreen', 'week_coaching_food', '');
                            setState(() {
                              buttonCase = 2;
                            });

                            setState(() {
                              button3Color = Color(0xff827380);
                              button2Color = Color(0xff0B202A);
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
                            '생활',
                            style: TextStyle(
                              color: txtColor,
                              fontSize: defaultSize * 14,
                            ),
                          ),
                          onPressed: () {
                            ServerConnection.write_log(
                                'ReportScreen', 'week_coaching_life', '');
                            setState(() {
                              buttonCase = 3;
                            });
                            setState(() {
                              button3Color = Color(0xff0B202A);
                              button2Color = Color(0xff0B202A);
                              button4Color = Color(0xff827380);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 7 * dayButtonHeight + 6 * blankBetweenButton,
                width: graphWidth,
                margin: EdgeInsets.only(left: (valWidth - graphWidth) / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //여기에 좌측 버튼/////////////////////////////
                  children: [
                    Container(
                      height: 7 * dayButtonHeight + 6 * blankBetweenButton,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: dayButtonHeight,
                            width: dayButtonWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffD2ABBA), blurRadius: 0.8),
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(valWidth * 0.04),
                                  bottomLeft: Radius.circular(valWidth * 0.04)),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(valWidth * 0.04),
                                        bottomLeft:
                                            Radius.circular(valWidth * 0.04)),
                                  ),
                                  primary: dayButton1Color,
                                  minimumSize:
                                      Size(dayButtonWidth, dayButtonHeight)),
                              child: Text(
                                dayButton1txt,
                                style: TextStyle(
                                  color: txtColor,
                                  fontSize: defaultSize * 10,
                                ),
                              ),
                              onPressed: () {
                                ServerConnection.write_log('ReportScreen',
                                    'week_coaching_previous_6_day', '');
                                dayButtonCase = 0;
                                setState(() {
                                  dayButton1Color = Color(0xff474A55);
                                  dayButton2Color = Color(0xff0B202A);
                                  dayButton3Color = Color(0xff0B202A);
                                  dayButton4Color = Color(0xff0B202A);
                                  dayButton5Color = Color(0xff0B202A);
                                  dayButton6Color = Color(0xff0B202A);
                                  dayButton7Color = Color(0xff0B202A);
                                });
                                controller.updateReport(
                                    controller.MinusSixDate(controller.date));
                              },
                            ),
                          ),
                          SizedBox(height: blankBetweenButton),
                          Container(
                            height: dayButtonHeight,
                            width: dayButtonWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffD2ABBA), blurRadius: 0.4),
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(valWidth * 0.04),
                                  bottomLeft: Radius.circular(valWidth * 0.04)),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(valWidth * 0.04),
                                        bottomLeft:
                                            Radius.circular(valWidth * 0.04)),
                                  ),
                                  primary: dayButton2Color,
                                  minimumSize:
                                      Size(dayButtonWidth, dayButtonHeight)),
                              child: Text(
                                dayButton2txt,
                                style: TextStyle(
                                  color: txtColor,
                                  fontSize: defaultSize * 10,
                                ),
                              ),
                              onPressed: () {
                                ServerConnection.write_log('ReportScreen',
                                    'week_coaching_previous_5_day', '');
                                dayButtonCase = 1;
                                setState(() {
                                  dayButton2Color = Color(0xff474A55);
                                  dayButton1Color = Color(0xff0B202A);
                                  dayButton3Color = Color(0xff0B202A);
                                  dayButton4Color = Color(0xff0B202A);
                                  dayButton5Color = Color(0xff0B202A);
                                  dayButton6Color = Color(0xff0B202A);
                                  dayButton7Color = Color(0xff0B202A);
                                });
                                controller.updateReport(
                                    controller.MinusFiveDate(controller.date));
                              },
                            ),
                          ),
                          SizedBox(height: blankBetweenButton),
                          Container(
                            height: dayButtonHeight,
                            width: dayButtonWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffD2ABBA), blurRadius: 0.8),
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(valWidth * 0.04),
                                  bottomLeft: Radius.circular(valWidth * 0.04)),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(valWidth * 0.04),
                                        bottomLeft:
                                            Radius.circular(valWidth * 0.04)),
                                  ),
                                  primary: dayButton3Color,
                                  minimumSize:
                                      Size(dayButtonWidth, dayButtonHeight)),
                              child: Text(
                                dayButton3txt,
                                style: TextStyle(
                                  color: txtColor,
                                  fontSize: defaultSize * 10,
                                ),
                              ),
                              onPressed: () {
                                ServerConnection.write_log('ReportScreen',
                                    'week_coaching_previous_4_day', '');
                                dayButtonCase = 0;
                                setState(() {
                                  dayButton3Color = Color(0xff474A55);
                                  dayButton2Color = Color(0xff0B202A);
                                  dayButton1Color = Color(0xff0B202A);
                                  dayButton4Color = Color(0xff0B202A);
                                  dayButton5Color = Color(0xff0B202A);
                                  dayButton6Color = Color(0xff0B202A);
                                  dayButton7Color = Color(0xff0B202A);
                                });
                                controller.updateReport(
                                    controller.MinusFourDate(controller.date));
                              },
                            ),
                          ),
                          SizedBox(height: blankBetweenButton),
                          Container(
                            height: dayButtonHeight,
                            width: dayButtonWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffD2ABBA), blurRadius: 0.8),
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(valWidth * 0.04),
                                  bottomLeft: Radius.circular(valWidth * 0.04)),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(valWidth * 0.04),
                                        bottomLeft:
                                            Radius.circular(valWidth * 0.04)),
                                  ),
                                  primary: dayButton4Color,
                                  minimumSize:
                                      Size(dayButtonWidth, dayButtonHeight)),
                              child: Text(
                                dayButton4txt,
                                style: TextStyle(
                                  color: txtColor,
                                  fontSize: defaultSize * 10,
                                ),
                              ),
                              onPressed: () {
                                ServerConnection.write_log('ReportScreen',
                                    'week_coaching_previous_3_day', '');
                                dayButtonCase = 0;
                                setState(() {
                                  dayButton4Color = Color(0xff474A55);
                                  dayButton2Color = Color(0xff0B202A);
                                  dayButton1Color = Color(0xff0B202A);
                                  dayButton3Color = Color(0xff0B202A);
                                  dayButton5Color = Color(0xff0B202A);
                                  dayButton6Color = Color(0xff0B202A);
                                  dayButton7Color = Color(0xff0B202A);
                                });
                                controller.updateReport(
                                    controller.MinusThreeDate(controller.date));
                              },
                            ),
                          ),
                          SizedBox(height: blankBetweenButton),
                          Container(
                            height: dayButtonHeight,
                            width: dayButtonWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffD2ABBA), blurRadius: 0.8),
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(valWidth * 0.04),
                                  bottomLeft: Radius.circular(valWidth * 0.04)),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(valWidth * 0.04),
                                        bottomLeft:
                                            Radius.circular(valWidth * 0.04)),
                                  ),
                                  primary: dayButton5Color,
                                  minimumSize:
                                      Size(dayButtonWidth, dayButtonHeight)),
                              child: Text(
                                dayButton5txt,
                                style: TextStyle(
                                  color: txtColor,
                                  fontSize: defaultSize * 10,
                                ),
                              ),
                              onPressed: () {
                                ServerConnection.write_log('ReportScreen',
                                    'week_coaching_previous_2_day', '');
                                dayButtonCase = 0;
                                setState(() {
                                  dayButton5Color = Color(0xff474A55);
                                  dayButton2Color = Color(0xff0B202A);
                                  dayButton1Color = Color(0xff0B202A);
                                  dayButton4Color = Color(0xff0B202A);
                                  dayButton3Color = Color(0xff0B202A);
                                  dayButton6Color = Color(0xff0B202A);
                                  dayButton7Color = Color(0xff0B202A);
                                });
                                controller.updateReport(
                                    controller.MinusTwoDate(controller.date));
                              },
                            ),
                          ),
                          SizedBox(height: blankBetweenButton),
                          Container(
                            height: dayButtonHeight,
                            width: dayButtonWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffD2ABBA), blurRadius: 0.8),
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(valWidth * 0.04),
                                  bottomLeft: Radius.circular(valWidth * 0.04)),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(valWidth * 0.04),
                                        bottomLeft:
                                            Radius.circular(valWidth * 0.04)),
                                  ),
                                  primary: dayButton6Color,
                                  minimumSize:
                                      Size(dayButtonWidth, dayButtonHeight)),
                              child: Text(
                                dayButton6txt,
                                style: TextStyle(
                                  color: txtColor,
                                  fontSize: defaultSize * 10,
                                ),
                              ),
                              onPressed: () {
                                ServerConnection.write_log('ReportScreen',
                                    'week_coaching_previous_1_day', '');
                                dayButtonCase = 0;
                                setState(() {
                                  dayButton6Color = Color(0xff474A55);
                                  dayButton2Color = Color(0xff0B202A);
                                  dayButton1Color = Color(0xff0B202A);
                                  dayButton4Color = Color(0xff0B202A);
                                  dayButton5Color = Color(0xff0B202A);
                                  dayButton3Color = Color(0xff0B202A);
                                  dayButton7Color = Color(0xff0B202A);
                                });
                                controller.updateReport(
                                    controller.MinusOneDate(controller.date));
                              },
                            ),
                          ),
                          SizedBox(height: blankBetweenButton),
                          Container(
                            height: dayButtonHeight,
                            width: dayButtonWidth,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffD2ABBA), blurRadius: 0.8),
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(valWidth * 0.04),
                                  bottomLeft: Radius.circular(valWidth * 0.04)),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(valWidth * 0.04),
                                        bottomLeft:
                                            Radius.circular(valWidth * 0.04)),
                                  ),
                                  primary: dayButton7Color,
                                  minimumSize:
                                      Size(dayButtonWidth, dayButtonHeight)),
                              child: Text(
                                dayButton7txt,
                                style: TextStyle(
                                  color: txtColor,
                                  fontSize: defaultSize * 10,
                                ),
                              ),
                              onPressed: () {
                                ServerConnection.write_log('ReportScreen',
                                    'week_coaching_previous_0_day', '');
                                dayButtonCase = 0;
                                setState(() {
                                  dayButton7Color = Color(0xff474A55);
                                  dayButton2Color = Color(0xff0B202A);
                                  dayButton1Color = Color(0xff0B202A);
                                  dayButton4Color = Color(0xff0B202A);
                                  dayButton5Color = Color(0xff0B202A);
                                  dayButton6Color = Color(0xff0B202A);
                                  dayButton3Color = Color(0xff0B202A);
                                });
                                controller.updateReport(controller.date);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: valWidth * 0.015),
                    SevenDaysCoachingBody(
                        buttonCase,
                        controller.reportDay,
                        dayButtonHeight,
                        dayButtonWidth,
                        blankBetweenButton,
                        graphWidth),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      );
    });
  }
}
