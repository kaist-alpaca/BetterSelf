import 'dart:math';

import 'package:betterself_trainer/functions/Firestore/AuthMethods.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'ThreeDaysCoaching.dart';

var CoachingExercisetexts = [];
var CoachingExercisetimes = [];

var CoachingBiotexts = [];
var CoachingBiotimes = [];

var CoachingFoodtexts = [];
var CoachingFoodtimes = [];

var user = AuthMethods()
    .auth
    .currentUser!
    .email
    .toString()
    .replaceAll("@gmail.com", "");

var currentuser = AuthMethods().auth.currentUser!.uid;

Widget InitBioCoaching(
    BuildContext context,
    DateTime selectedDate,
    double dayButtonHeight,
    double buttonWidth,
    double blankBetweenButton,
    double widgetHeight,
    double widgetWidth) {
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

            print(selectedDate.toString());
            if (DiffDays == 0) {
              print('$checkTime and ' + CoachingBiotexts[checkTime]);
              return ThreeDaysCoaching(
                context,
                CoachingBiotexts[checkTime],
                dayButtonHeight,
                buttonWidth,
                blankBetweenButton,
                widgetHeight,
                widgetWidth,
              );
            } else if (DiffDays < 0) {
              return ThreeDaysCoaching(
                context,
                '아직 해당 날짜의 생체 데이터 코칭이 없습니다.',
                dayButtonHeight,
                buttonWidth,
                blankBetweenButton,
                widgetHeight,
                widgetWidth,
              );
            }
            checkTime = checkTime - 1;
          }
          print('out of While');
          return ThreeDaysCoaching(
            context,
            '아직 해당 날짜의 생체 데이터 코칭이 없습니다.',
            dayButtonHeight,
            buttonWidth,
            blankBetweenButton,
            widgetHeight,
            widgetWidth,
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
    double buttonWidth,
    double blankBetweenButton,
    double widgetHeight,
    double widgetWidth) {
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
              return ThreeDaysCoaching(
                context,
                CoachingExercisetexts[checkTime],
                dayButtonHeight,
                buttonWidth,
                blankBetweenButton,
                widgetHeight,
                widgetWidth,
              );
            } else if (DiffDays < 0) {
              return ThreeDaysCoaching(
                context,
                '아직 해당 날짜의 운동 코칭이 없습니다.',
                dayButtonHeight,
                buttonWidth,
                blankBetweenButton,
                widgetHeight,
                widgetWidth,
              );
            }
            checkTime = checkTime - 1;
          }
          print('out of While');
          return ThreeDaysCoaching(
            context,
            '아직 해당 날짜의 운동 코칭이 없습니다.',
            dayButtonHeight,
            buttonWidth,
            blankBetweenButton,
            widgetHeight,
            widgetWidth,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

Widget InitFoodCoaching(
    BuildContext context,
    DateTime selectedDate,
    double dayButtonHeight,
    double buttonWidth,
    double blankBetweenButton,
    double widgetHeight,
    double widgetWidth) {
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

            print(selectedDate.toString());
            if (DiffDays == 0) {
              print('$checkTime and ' + CoachingFoodtexts[checkTime]);
              return ThreeDaysCoaching(
                context,
                CoachingFoodtexts[checkTime],
                dayButtonHeight,
                buttonWidth,
                blankBetweenButton,
                widgetHeight,
                widgetWidth,
              );
            } else if (DiffDays < 0) {
              return ThreeDaysCoaching(
                context,
                '아직 해당 날짜의 식단 코칭이 없습니다.',
                dayButtonHeight,
                buttonWidth,
                blankBetweenButton,
                widgetHeight,
                widgetWidth,
              );
            }
            checkTime = checkTime - 1;
          }
          print('out of While');
          return ThreeDaysCoaching(
            context,
            '아직 해당 날짜의 식단 코칭이 없습니다.',
            dayButtonHeight,
            buttonWidth,
            blankBetweenButton,
            widgetHeight,
            widgetWidth,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

int? buttonCase;
DateTime? selectedDate1;
double? dayButtonHeight1;
double? buttonWidth1;
double? blankBetweenButton1;
double? widgetHeight1;
double? widgetWidth1;

class CoachingInside extends StatefulWidget {
  CoachingInside(
      int a,
      DateTime selectedDate,
      double dayButtonHeight,
      double buttonWidth,
      double blankBetweenButton,
      double widgetHeight,
      double widgetWidth) {
    buttonCase = a;
    selectedDate1 = selectedDate;
    dayButtonHeight1 = dayButtonHeight;
    buttonWidth1 = buttonWidth;
    blankBetweenButton1 = blankBetweenButton;
    widgetHeight1 = widgetHeight;
    widgetWidth1 = widgetWidth;
  }

  @override
  _CoachingInside createState() => _CoachingInside();
}

class _CoachingInside extends State<CoachingInside> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = selectedDate1!;
    double dayButtonHeight = dayButtonHeight1!;
    double buttonWidth = buttonWidth1!;
    double blankBetweenButton = blankBetweenButton1!;
    double widgetHeight = widgetHeight1!;
    double widgetWidth = widgetWidth1!;

    if (buttonCase == 1) {
      return InitExerciseCoaching(context, selectedDate, dayButtonHeight,
          buttonWidth, blankBetweenButton, widgetHeight, widgetWidth);
    } else if (buttonCase == 2) {
      return InitFoodCoaching(context, selectedDate, dayButtonHeight,
          buttonWidth, blankBetweenButton, widgetHeight, widgetWidth);
    } else if (buttonCase == 3) {
      return InitBioCoaching(context, selectedDate, dayButtonHeight,
          buttonWidth, blankBetweenButton, widgetHeight, widgetWidth);
    } else {
      return Container();
    }
  }
}
