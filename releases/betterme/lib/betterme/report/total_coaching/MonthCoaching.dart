import 'package:betterme/betterme/report/total_coaching/utils.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'MonthCoachingBody.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class MonthCoaching extends StatefulWidget {
  @override
  _MonthCoaching createState() => _MonthCoaching();
}

class _MonthCoaching extends State<MonthCoaching> {
  ProfileController controller = ProfileController();
  String formattedDate = DateFormat('y/M/d').format(DateTime.now());

  Color button2Color = Color(0xff827380);
  Color button3Color = Color(0xff0B202A);
  Color button4Color = Color(0xff0B202A);

  int buttonCase = 1;

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

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
                      availableGestures: AvailableGestures.horizontalSwipe,
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
                          color: Color(0xffD2ABBA),
                        ),
                        // selectedDecoration: BoxDecoration(
                        //   color: Color(0xff333C47),
                        //   shape: BoxShape.circle,
                        //   border: Border.all(
                        //     width: 1,
                        //     color: Color(0xffD2ABBA),
                        //     style: BorderStyle.solid,
                        //   ),
                        // ),
                        selectedDecoration: BoxDecoration(
                          color: const Color(0xff333C47),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            // image:
                            //     ExactAssetImage("images/calendar_circle.png"),
                            image: Svg('images/calendar_circle.svg'),
                            fit: BoxFit.cover,
                            // image: NetworkImage(
                            //     'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                            // fit: BoxFit.cover,
                          ),
                        ),
                        outsideDaysVisible: false,
                        holidayTextStyle: TextStyle(color: Color(0XFFFFFDFD)),
                        weekendTextStyle: TextStyle(color: Color(0XFFFFFDFD)),
                        disabledTextStyle: TextStyle(color: Color(0XFFFFFDFD)),
                        defaultTextStyle: TextStyle(color: Color(0XFFFFFDFD)),
                        markerDecoration: BoxDecoration(
                            color: Color(0xffD2ABBA), shape: BoxShape.circle),
                      ),
                      selectedDayPredicate: (day) {
                        return isSameDay(controller.selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        ServerConnection.write_log('ReportScreen',
                            'month_coaching_calendar_change_date', '');
                        setState(() {});
                        controller.updateselectedDay(selectedDay);
                        controller.updatefocusedDay(focusedDay);
                        print(controller.selectedDay);
                        setState(() {
                          formattedDate = DateFormat('y/M/d')
                              .format(controller.selectedDay);
                        });
                      },
                      eventLoader: _getEventsForDay,
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
                            ServerConnection.write_log(
                                'ReportScreen', 'month_coaching_exercise', '');
                            setState(() {
                              buttonCase = 1;
                              button2Color = Color(0xff827380);
                              button4Color = Color(0xff0B202A);
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
                                'ReportScreen', 'month_coaching_food', '');
                            setState(() {
                              buttonCase = 2;
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
                                'ReportScreen', 'month_coaching_life', '');
                            setState(() {
                              buttonCase = 3;
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
              MonthCoachingBody(buttonCase, controller.selectedDay)
            ],
          ),
        ),
      );
    });
  }
}
