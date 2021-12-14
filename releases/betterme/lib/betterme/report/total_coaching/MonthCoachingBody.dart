import 'package:betterme/betterme/report/functions/DataType.dart';
import 'package:betterme/functions/Widgets/WidgetInfo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:betterme/functions/Firestore/AuthMethods.dart';

import '../Widgets/coaching_widgets/CoachingTxtBox.dart';
import '../Widgets/coaching_widgets/CoachingDate.dart';
import '../Widgets/coaching_widgets/CoachingFoodBox.dart';
import '../Widgets/coaching_widgets/CoachingExerciseBox.dart';

var CoachingBiotexts = [];
var CoachingBiotimes = [];

var CoachingFoodtexts = [];
var CoachingFoodtimes = [];

var CoachingExercisetexts = [];
var CoachingExercisetimes = [];

// var user = AuthMethods()
//     .auth
//     .currentUser!
//     .email
//     .toString()
//     .replaceAll("@gmail.com", "");
var user = AuthMethods().auth.currentUser!.email.toString().split('@')[0];

var currentuser = AuthMethods().auth.currentUser!.uid;

Widget InitBioCoaching(
    BuildContext context, DateTime selectedDate, String formatD) {
  Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(currentuser)
      .collection('coaching_bio')
      .orderBy("time")
      .snapshots();

  return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      child: StreamBuilder<QuerySnapshot>(
          stream: usersStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            CoachingBiotexts = [];
            CoachingBiotimes = [];
            if (snapshot.hasData) {
              List CoachingList =
                  snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                print(
                    "time : ${DateTime.parse(data['time'].toDate().toString())}");
                CoachingBiotexts.add(data['message']);
                CoachingBiotimes.add(
                    DateTime.parse(data['time'].toDate().toString()));
                return data['message'];
              }).toList();

              int checkTime = CoachingBiotimes.length - 1;
              // DateFormat('y/M/d').format(controller.selectedDay)

              while (checkTime >= 0) {
                // Coachingtimes[checkTime]-selectedDate]
                int date1 = int.parse(
                    DateFormat('yyyyMMdd').format(CoachingBiotimes[checkTime]));
                int date2 =
                    int.parse(DateFormat('yyyyMMdd').format(selectedDate));
                int DiffDays = date1 - date2;

                if (DiffDays == 0) {
                  print('$checkTime and ' + CoachingBiotexts[checkTime]);
                  return CoachingTxtBox(
                      context, CoachingBiotexts[checkTime], 0.25);
                } else if (DiffDays < 0) {
                  return CoachingTxtBox(
                      context, '아직 해당 날짜의 생활 데이터 코칭이 없습니다.', 0.25);
                }
                checkTime = checkTime - 1;
              }

              return CoachingTxtBox(
                  context, '아직 해당 날짜의 생활 데이터 코칭이 없습니다.', 0.25);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }));
}

Widget InitExerciseCoaching(BuildContext context, DateTime selectedDate) {
  Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(currentuser)
      .collection('coaching_exercise')
      .orderBy("time")
      .snapshots();

  return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        CoachingExercisetexts = [];
        CoachingExercisetimes = [];
        if (snapshot.hasData) {
          List CoachingList =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            print("time : ${DateTime.parse(data['time'].toDate().toString())}");
            CoachingExercisetexts.add(data['message']);
            CoachingExercisetimes.add(
                DateTime.parse(data['time'].toDate().toString()));
            return data['message'];
          }).toList();

          int checkTime = CoachingExercisetimes.length - 1;
          // DateFormat('y/M/d').format(controller.selectedDay)

          while (checkTime >= 0) {
            // Coachingtimes[checkTime]-selectedDate]
            int date1 = int.parse(DateFormat('yyyyMMdd')
                .format(CoachingExercisetimes[checkTime]));
            int date2 = int.parse(DateFormat('yyyyMMdd').format(selectedDate));
            int DiffDays = date1 - date2;

            print(selectedDate.toString());
            if (DiffDays == 0) {
              print('$checkTime and ' + CoachingExercisetexts[checkTime]);
              return CoachingTxtBox(
                  context, CoachingExercisetexts[checkTime], 0.2);
            } else if (DiffDays < 0) {
              return CoachingTxtBox(context, '아직 해당 날짜의 운동 코칭이 없습니다.', 0.2);
            }
            checkTime = checkTime - 1;
          }

          return CoachingTxtBox(context, '아직 해당 날짜의 운동 코칭이 없습니다.', 0.2);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

Widget InitFoodCoaching(BuildContext context, DateTime selectedDate) {
  Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(currentuser)
      .collection('coaching_diet')
      .orderBy("time")
      .snapshots();

  return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        CoachingFoodtexts = [];
        CoachingFoodtimes = [];
        if (snapshot.hasData) {
          int checkTime = CoachingFoodtimes.length - 1;
          // DateFormat('y/M/d').format(controller.selectedDay)

          while (checkTime >= 0) {
            // Coachingtimes[checkTime]-selectedDate]
            int date1 = int.parse(
                DateFormat('yyyyMMdd').format(CoachingFoodtimes[checkTime]));
            int date2 = int.parse(DateFormat('yyyyMMdd').format(selectedDate));
            int DiffDays = date1 - date2;

            if (DiffDays == 0) {
              return CoachingTxtBox(context, CoachingFoodtexts[checkTime], 0.2);
            } else if (DiffDays < 0) {
              return CoachingTxtBox(context, '아직 해당 날짜의 식단 코칭이 없습니다.', 0.2);
            }
            checkTime = checkTime - 1;
          }

          return CoachingTxtBox(context, '아직 해당 날짜의 식단 코칭이 없습니다.', 0.2);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

DataType? buttonCase;
DateTime? selectedDay1;

class MonthCoachingBody extends StatefulWidget {
  MonthCoachingBody(DataType dt, DateTime selectedDay) {
    buttonCase = dt;
    selectedDay1 = selectedDay;
  }

  @override
  _MonthCoachingBody createState() => _MonthCoachingBody();
}

class _MonthCoachingBody extends State<MonthCoachingBody> {
  @override
  Widget build(BuildContext context) {
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    DateTime selectedDay = selectedDay1!;
    String formattedDate = DateFormat('y/M/dd').format(selectedDay);
    HomeCoachingInfo homeInfo = HomeCoachingInfo(valWidth);

    print('buttonCase : ${buttonCase}');

    switch (buttonCase) {
      // 운동
      case DataType.exercise:
        print('운동');
        return Column(
          children: [
            CoachingDate(context, '운동 기록 및 코칭', '$formattedDate'),
            CoachingExerciseBox(context, selectedDay),
            homeInfo.coachingDetailDivider,
            InitExerciseCoaching(context, selectedDay),
            homeInfo.coachingDivider,
            SizedBox(
              height: 200,
            )
          ],
        );
      // 식단
      case DataType.diet:
        return Column(
          children: [
            CoachingDate(context, '식단 기록 및 코칭', '$formattedDate'),
            CoachingFoodBox(context, selectedDay),
            homeInfo.coachingDetailDivider,
            InitFoodCoaching(context, selectedDay),
            homeInfo.coachingDivider,
            SizedBox(
              height: 200,
            )
          ],
        );
      // 생활
      case DataType.life:
        return Column(
          children: [
            CoachingDate(context, '생활 데이터 코칭', '$formattedDate'),
            InitBioCoaching(context, selectedDay, '$formattedDate'),
            SizedBox(
              height: 500,
            )
          ],
        );
      //raise error
      default:
        return Container();
    }
  }
}
