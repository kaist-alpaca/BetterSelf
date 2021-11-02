import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../CoachingExerciseBox.dart';
import '../CoachingTxtBox.dart';

import 'package:betterme/functions/Firestore/AuthMethods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:intl/intl_browser.dart';

var Coachingtexts = [];
var Coachingtimes = [];

var user = AuthMethods()
    .auth
    .currentUser!
    .email
    .toString()
    .replaceAll("@gmail.com", "");

var currentuser = AuthMethods().auth.currentUser!.uid;

Widget InitCoaching(BuildContext context, DateTime selectedDate) {
  Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(currentuser)
      .collection('coaching_exercise')
      .orderBy("time")
      .snapshots();

  return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        Coachingtexts = [];
        Coachingtimes = [];
        if (snapshot.hasData) {
          List CoachingList =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            print("time : ${DateTime.parse(data['time'].toDate().toString())}");
            Coachingtexts.add(data['message']);
            Coachingtimes.add(DateTime.parse(data['time'].toDate().toString()));
            return data['message'];
          }).toList();

          int checkTime = Coachingtimes.length - 1;
          // DateFormat('y/M/d').format(controller.selectedDay)

          while (checkTime >= 0) {
            // Coachingtimes[checkTime]-selectedDate]
            int date1 = int.parse(
                DateFormat('yyyyMMdd').format(Coachingtimes[checkTime]));
            int date2 = int.parse(DateFormat('yyyyMMdd').format(selectedDate));
            int DiffDays = date1 - date2;

            print(selectedDate.toString());
            if (DiffDays == 0) {
              print('$checkTime and ' + Coachingtexts[checkTime]);
              return CoachingTxtBox(
                  context, 1, '운동 코칭', Coachingtexts[checkTime], 0.2);
            } else if (DiffDays < 0) {
              return CoachingTxtBox(
                  context, 1, '운동 코칭', '아직 해당 날짜의 운동 코칭이 없습니다.', 0.2);
            }
            checkTime = checkTime - 1;
          }
          print('out of While');
          return CoachingTxtBox(
              context, 1, '운동 코칭', '아직 해당 날짜의 운동 코칭이 없습니다.', 0.2);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

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
                  DateFormat('y/M/dd').format(controller.selectedDay);
            });
          },
          locale: 'ko-KR',
        ),
        SizedBox(height: valHeight * 0.025),
        CoachingExerciseBox(
            context, '운동\n' + '[$formattedDate]', '운동 내용', 0.25),
        SizedBox(
          height: valHeight * 0.015,
        ),
        InitCoaching(context, controller.selectedDay),
        SizedBox(
          height: valHeight * 0.03,
        )
      ],
    );
  }
}
