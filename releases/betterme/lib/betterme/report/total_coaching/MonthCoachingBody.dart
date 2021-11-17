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

var user = AuthMethods()
    .auth
    .currentUser!
    .email
    .toString()
    .replaceAll("@gmail.com", "");

var currentuser = AuthMethods().auth.currentUser!.uid;

Widget InitBioCoaching(
    BuildContext context, DateTime selectedDate, String formatD) {
  Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(currentuser)
      .collection('coaching_bio')
      .orderBy("time")
      .snapshots();

  return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        CoachingBiotexts = [];
        CoachingBiotimes = [];
        if (snapshot.hasData) {
          List CoachingList =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            print("time : ${DateTime.parse(data['time'].toDate().toString())}");
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
            int date2 = int.parse(DateFormat('yyyyMMdd').format(selectedDate));
            int DiffDays = date1 - date2;

            if (DiffDays == 0) {
              print('$checkTime and ' + CoachingBiotexts[checkTime]);
              return CoachingTxtBox(context, CoachingBiotexts[checkTime], 0.25);
            } else if (DiffDays < 0) {
              return CoachingTxtBox(
                  context, '아직 해당 날짜의 생활 데이터 코칭이 없습니다.', 0.25);
            }
            checkTime = checkTime - 1;
          }

          return CoachingTxtBox(context, '아직 해당 날짜의 생활 데이터 코칭이 없습니다.', 0.25);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
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
          List CoachingList =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            print("time : ${DateTime.parse(data['time'].toDate().toString())}");
            CoachingFoodtexts.add(data['message']);
            CoachingFoodtimes.add(
                DateTime.parse(data['time'].toDate().toString()));
            return data['message'];
          }).toList();

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

int? buttonCase;
DateTime? selectedDay1;

class MonthCoachingBody extends StatefulWidget {
  MonthCoachingBody(int a, DateTime selectedDay) {
    buttonCase = a;
    selectedDay1 = selectedDay;
  }

  @override
  _MonthCoachingBody createState() => _MonthCoachingBody();
}

class _MonthCoachingBody extends State<MonthCoachingBody> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색

    DateTime selectedDay = selectedDay1!;
    String formattedDate = DateFormat('y/M/d').format(selectedDay);

    if (buttonCase == 1) {
      //운동
      return Column(
        children: [
          CoachingDate(context, '운동 기록 및 코칭', '[$formattedDate]'),
          CoachingExerciseBox(context, selectedDay),
          SizedBox(
            height: 15,
          ),
          InitExerciseCoaching(context, selectedDay),
          Container(
            width: valWidth * 0.74,
            child: Divider(
              color: Color(0xff858E93),
              thickness: 0.6,
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      );
    } else if (buttonCase == 2) {
      //식단
      return Column(
        children: [
          CoachingDate(context, '식단 기록 및 코칭', '[$formattedDate]'),
          CoachingFoodBox(context, selectedDay),
          SizedBox(
            height: 15,
          ),
          InitFoodCoaching(context, selectedDay),
          Container(
            width: valWidth * 0.74,
            child: Divider(
              color: Color(0xff858E93),
              thickness: 0.6,
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      );
    } else if (buttonCase == 3) {
      //생활
      return Column(
        children: [
          CoachingDate(context, '생활 데이터 코칭', '[$formattedDate]'),
          InitBioCoaching(context, selectedDay, '[$formattedDate]'),
          SizedBox(
            height: 40,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
