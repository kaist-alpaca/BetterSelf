import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../CoachingExerciseBox.dart';
import '../CoachingTxtBox.dart';
import '../CoachingDate.dart';

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
              return CoachingTxtBox(context, Coachingtexts[checkTime], 0.2);
            } else if (DiffDays < 0) {
              return CoachingTxtBox(context, '?????? ?????? ????????? ?????? ????????? ????????????.', 0.2);
            }
            checkTime = checkTime - 1;
          }

          return CoachingTxtBox(context, '?????? ?????? ????????? ?????? ????????? ????????????.', 0.2);
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
    final valHeight = MediaQuery.of(context).size.height; //?????? ??????
    final valWidth = MediaQuery.of(context).size.width; //?????? ??????
    final bgColor = Color(0xff0B202A); //?????????
    final txtColor = Color(0xffFFFDFD); //????????? , ?????? ????????? ???
    final linetxtColor = Color(0xffAA8F9D); //??????-?????????-?????? ???

    return Column(
      children: [
        Container(
          color: Color(0xff333C47),
          child: Stack(
            children: [
              Container(
                height: valHeight * 0.1068,
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
                    formattedDate =
                        DateFormat('y/M/dd').format(controller.selectedDay);
                  });
                },
                locale: 'ko-KR',
              ),
            ],
          ),
        ),
        SizedBox(height: valHeight * 0.025),
        CoachingDate(context, '?????? ?????? ??? ??????', '[$formattedDate]'),
        CoachingExerciseBox(context, controller.selectedDay),
        SizedBox(
          height: valHeight * 0.015,
        ),
        InitCoaching(context, controller.selectedDay),
        Container(
          width: valWidth * 0.74,
          child: Divider(
            color: Color(0xff858E93),
            thickness: 0.6,
          ),
        ),
        SizedBox(
          height: valHeight * 0.03,
        )
      ],
    );
  }
}
