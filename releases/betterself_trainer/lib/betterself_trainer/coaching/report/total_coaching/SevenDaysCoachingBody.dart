
import 'package:betterself_trainer/functions/Firestore/AuthMethods.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


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

Widget InitBioCoaching(
    BuildContext context,
    DateTime selectedDate,
    double dayButtonHeight,
    double dayButtonWidth,
    double blankBetweenButton,
    double graphWidth,
    String uid) {
  Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
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

            print(selectedDate.toString());
            if (DiffDays == 0) {
              print('$checkTime and ' + CoachingBiotexts[checkTime]);
              return CoachingBody(
                context,
                CoachingBiotexts[checkTime],
                dayButtonHeight,
                dayButtonWidth,
                blankBetweenButton,
                graphWidth,
                uid
              );
            } else if (DiffDays < 0) {
              return CoachingBody(
                context,
                '아직 해당 날짜의 생활 데이터 코칭이 없습니다.',
                dayButtonHeight,
                dayButtonWidth,
                blankBetweenButton,
                graphWidth,
                uid
              );
            }
            checkTime = checkTime - 1;
          }
          //print('out of While');
          return CoachingBody(
            context,
            '아직 해당 날짜의 생활 데이터 코칭이 없습니다.',
            dayButtonHeight,
            dayButtonWidth,
            blankBetweenButton,
            graphWidth,
            uid
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

Widget InitExerciseCoaching(
    BuildContext context,
    DateTime selectedDate,
    double dayButtonHeight,
    double dayButtonWidth,
    double blankBetweenButton,
    double graphWidth,
    String uid) {
  Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
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
              return CoachingBody(
                context,
                CoachingExercisetexts[checkTime],
                dayButtonHeight,
                dayButtonWidth,
                blankBetweenButton,
                graphWidth,
                uid);
            } else if (DiffDays < 0) {
              return CoachingBody(
                context,
                '아직 해당 날짜의 운동 코칭이 없습니다.',
                dayButtonHeight,
                dayButtonWidth,
                blankBetweenButton,
                graphWidth,
                uid);
            }
            checkTime = checkTime - 1;
          }
          //print('out of While');
          return CoachingBody(
            context,
            '아직 해당 날짜의 운동 코칭이 없습니다.',
            dayButtonHeight,
            dayButtonWidth,
            blankBetweenButton,
            graphWidth,
            uid);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

Widget InitFoodCoaching(
    BuildContext context,
    DateTime selectedDate,
    double dayButtonHeight,
    double dayButtonWidth,
    double blankBetweenButton,
    double graphWidth,
    String uid) {
  Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
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

            print(selectedDate.toString());
            if (DiffDays == 0) {
              print('$checkTime and ' + CoachingFoodtexts[checkTime]);
              return CoachingBody(
                context,
                CoachingFoodtexts[checkTime],
                dayButtonHeight,
                dayButtonWidth,
                blankBetweenButton,
                graphWidth,
                uid
              );
            } else if (DiffDays < 0) {
              return CoachingBody(
                context,
                '아직 해당 날짜의 식단 코칭이 없습니다.',
                dayButtonHeight,
                dayButtonWidth,
                blankBetweenButton,
                graphWidth,
                uid
              );
            }
            checkTime = checkTime - 1;
          }
          //print('out of While');
          return CoachingBody(
            context,
            '아직 해당 날짜의 식단 코칭이 없습니다.',
            dayButtonHeight,
            dayButtonWidth,
            blankBetweenButton,
            graphWidth,
            uid
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

Widget CoachingBody(
    BuildContext context,
    String content,
    double dayButtonHeight,
    double dayButtonWidth,
    double blankBetweenButton,
    double graphWidth,
    String uid) {
  final valWidth = MediaQuery.of(context).size.width;
  final valHeight = MediaQuery.of(context).size.height;
  double miniHeight = 0.02 * valHeight;
  double defaultSize = valWidth * 0.0025;
  double lineLength = valWidth * 0.7;

  final bgColor = Color(0xff0B202A); //배경색
  final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
  final boxBorderRadius = valWidth * 0.015;

  return Container(
    //여기에 코칭 텍스트 들어감.
    height: dayButtonHeight * 7 + blankBetweenButton * 6,
    width: graphWidth - dayButtonWidth - valWidth * 0.015,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(valWidth * 0.02),
          bottomRight: Radius.circular(valWidth * 0.02)),
      color: Color(0xff333C47),
      boxShadow: [
        BoxShadow(color: Color(0xffD2ABBA), blurRadius: 0.4),
      ],
    ),
    padding: EdgeInsets.fromLTRB(valWidth * 0.033, valHeight * 0.035,
        valWidth * 0.033, valHeight * 0.35),
    child: Text(
      content,
      softWrap: true,
      style: TextStyle(color: txtColor, fontSize: defaultSize * 12),
      textAlign: TextAlign.left,
    ),
  );
}

DateTime? selectedDate1;

double? dayButtonHeight1;
double? dayButtonWidth1;
double? blankBetweenButton1;
double? graphWidth1;
int? buttonCase;
String? uid;

class SevenDaysCoachingBody extends StatefulWidget {
  SevenDaysCoachingBody(int a, DateTime selectedDate, double dayButtonHeight,
      double dayButtonWidth, double blankBetweenButton, double graphWidth, String uid1) {
    buttonCase = a;
    selectedDate1 = selectedDate;

    dayButtonHeight1 = dayButtonHeight;
    dayButtonWidth1 = dayButtonWidth;
    blankBetweenButton1 = blankBetweenButton;
    graphWidth1 = graphWidth;
    uid = uid1;
  }

  @override
  _SevenDaysCoachingBody createState() => _SevenDaysCoachingBody();
}

class _SevenDaysCoachingBody extends State<SevenDaysCoachingBody> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = selectedDate1!;

    double dayButtonHeight = dayButtonHeight1!;
    double dayButtonWidth = dayButtonWidth1!;
    double graphWidth = graphWidth1!;
    double blankBetweenButton = blankBetweenButton1!;

    if (buttonCase == 1) {
      return InitExerciseCoaching(context, selectedDate, dayButtonHeight,
          dayButtonWidth, blankBetweenButton, graphWidth, uid!);
    } else if (buttonCase == 2) {
      return InitFoodCoaching(context, selectedDate, dayButtonHeight,
          dayButtonWidth, blankBetweenButton, graphWidth, uid!);
    } else if (buttonCase == 3) {
      return InitBioCoaching(context, selectedDate, dayButtonHeight,
          dayButtonWidth, blankBetweenButton, graphWidth, uid!);
    } else {
      return Container();
    }
  }
}
