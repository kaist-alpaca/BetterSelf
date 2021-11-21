// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var uid = FirebaseAuth.instance.currentUser!.uid;

    print("debug : $uid");

    return Container(
      child: Text("이거 왜이럼"),
    );
  }
}

Widget InitExerciseCoaching(
    BuildContext context,
    DateTime selectedDate,
    double dayButtonHeight,
    double dayButtonWidth,
    double blankBetweenButton,
    double graphWidth) {
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
              return CoachingBody(
                context,
                CoachingExercisetexts[checkTime],
                dayButtonHeight,
                dayButtonWidth,
                blankBetweenButton,
                graphWidth,
              );
            } else if (DiffDays < 0) {
              return CoachingBody(
                context,
                '아직 해당 날짜의 운동 코칭이 없습니다.',
                dayButtonHeight,
                dayButtonWidth,
                blankBetweenButton,
                graphWidth,
              );
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
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

Widget CoachingExerciseBox(BuildContext context, DateTime selectedDay) {
  //selectedDay가 받아온 보여주길 원하는 운동 날짜임.

  final valWidth = MediaQuery.of(context).size.width;
  final valHeight = MediaQuery.of(context).size.height;
  double miniHeight = 0.04 * valHeight;
  double defaultSize = valWidth * 0.0025;
  double lineLength = valWidth * 0.7;

  final bgColor = Color(0xff0B202A); //배경색
  final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
  final boxBorderRadius = valWidth * 0.015;

  return Container(
      child: Column(children: [
        SizedBox(height: valHeight * 0.008),
        SizedBox(
          width: valWidth * 0.86,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: valWidth * 0.3,
                child: Divider(
                  color: Color(0xff30414A),
                  thickness: 0.6,
                ),
              ),
              Container(
                  width: valWidth * 0.1,
                  height: valHeight * 0.05,
                  child: SvgPicture.asset('images/coaching_icon.svg')),
              Container(
                width: valWidth * 0.3,
                child: Divider(
                  color: Color(0xff30414A),
                  thickness: 0.6,
                ),
              ),
            ],
          ),
        ),
      ]));
}
