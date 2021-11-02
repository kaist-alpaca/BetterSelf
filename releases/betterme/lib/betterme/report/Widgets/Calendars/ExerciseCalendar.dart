import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../CoachingExerciseBox.dart';
import '../CoachingTxtBox.dart';

// import 'package:intl/intl_browser.dart';

class ExerciseCalendar extends StatefulWidget {
  const ExerciseCalendar({Key? key}) : super(key: key);

  @override
  _ExerciseCalendarState createState() => _ExerciseCalendarState();
}

class _ExerciseCalendarState extends State<ExerciseCalendar> {
  ProfileController controller = ProfileController();
  String formattedDate = DateFormat('y/M/d').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    return Column(
      children: [
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
              color: Color(0xff0B202A),
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
              formattedDate =
                  DateFormat('y/M/d').format(controller.selectedDay);
            });
          },
          locale: 'ko-KR',
        ),
        Container(
          child: Text(
            controller.selectedDay.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        CoachingExerciseBox(
            context, '운동\n' + '[$formattedDate]', '운동 내용', 0.25),
        SizedBox(
          height: valHeight * 0.015,
        ),
        CoachingTxtBox(context, 1, '운동 코칭', '코칭 내용', 0.2),
        SizedBox(
          height: valHeight * 0.03,
        )
      ],
    );
  }
}
