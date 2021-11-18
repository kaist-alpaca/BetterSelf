import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'YearCoachingBody.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class YearCoaching extends StatefulWidget {
  @override
  _YearCoaching createState() => _YearCoaching();
}

class _YearCoaching extends State<YearCoaching> {
  ProfileController controller = ProfileController();
  String formattedDate = DateFormat('y/M/d').format(DateTime.now());

  Color button2Color = Color(0xff827380);
  Color button3Color = Color(0xff0B202A);
  Color button4Color = Color(0xff0B202A);

  int buttonCase = 1;

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색

    double defaultSize = valWidth * 0.0025;

    double buttonHeight = 30; //상단 버튼 크기
    double buttonWidth = valWidth * 0.27;

    return GetBuilder<ProfileController>(builder: (controller) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Color(0xff333C47),
                child: Stack(
                  children: [
                    Container(
                      height: 85,
                      width: valWidth,
                      color: bgColor,
                    ),
                    TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: controller.focusedDay,
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                        leftChevronIcon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                        rightChevronIcon: Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Color(0XFFFFFDFD)),
                        weekendStyle: TextStyle(color: Color(0XFFD2ABBA)),
                      ),
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: false,
                        selectedTextStyle: TextStyle(
                          color: Colors.red,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Color(0xff333C47),
                        ),
                        outsideDaysVisible: false,
                        holidayTextStyle: TextStyle(color: Color(0XFFFFFDFD)),
                        weekendTextStyle: TextStyle(color: Color(0XFFFFFDFD)),
                        disabledTextStyle: TextStyle(color: Color(0XFFFFFDFD)),
                        defaultTextStyle: TextStyle(color: Color(0XFFFFFDFD)),
                      ),
                      selectedDayPredicate: (day) {
                        return isSameDay(controller.selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {});
                        controller.updateselectedDay(selectedDay);
                        controller.updatefocusedDay(focusedDay);
                        print(controller.selectedDay);
                        setState(() {
                          formattedDate = DateFormat('y/M/d')
                              .format(controller.selectedDay);
                        });
                      },
                      locale: 'ko-KR',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: valHeight * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: valWidth * 0.095,
                  ),
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
                height: 25,
              ),
              YearCoachingBody(buttonCase, controller.selectedDay)
            ],
          ),
        ),
      );
    });
  }
}
