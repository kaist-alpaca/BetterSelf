import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

//운동 프로그램 코칭을 위한 위젯

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
    Container(
      height: valHeight * 0.2,
      width: lineLength,
      child: FutureBuilder<List<dynamic>>(
        future: ServerConnection.total_workout(
          ProfileController.to.originMyProfile.uid == null
              ? ''
              : ProfileController.to.originMyProfile.uid!,
          selectedDay,
        ),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Text('이 날의 운동 기록이 없습니다.',
                  style: TextStyle(fontSize: 10, color: txtColor)),
            );
          } else if (snapshot.hasData && snapshot.data![0].length > 0) {
            print('\n\ndebug : ${snapshot.data}');
            var data = List.from(snapshot.data![0].reversed);
            double sum = 0;

            List<Widget> ExerciseList = data.map<Widget>((e) {
              sum = sum + double.parse(e[3]);
              DateTime startTime = DateTime.fromMicrosecondsSinceEpoch(
                  ((double.parse(e[0]) * 1000000).round()));
              DateTime endTime = DateTime.fromMicrosecondsSinceEpoch(
                  ((double.parse(e[1]) * 1000000).round()));
              int Dura = endTime.difference(startTime).inMinutes;

              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: valWidth * 0.07,
                      ),
                      Text(DateFormat.jm().format(startTime),
                          style: TextStyle(fontSize: 10, color: txtColor)),
                      SizedBox(
                        width: valWidth * 0.04,
                      ),
                      Text(e[2],
                          style: TextStyle(fontSize: 10, color: txtColor)),
                      SizedBox(
                        width: valWidth * 0.04,
                      ),
                      Text('$Dura 분',
                          style: TextStyle(fontSize: 10, color: txtColor)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
            }).toList();

            ExerciseList.add(
              Row(
                children: [
                  SizedBox(
                    width: valWidth * 0.07,
                  ),
                  Text('총 소모 칼로리: $sum kcal',
                      style: TextStyle(
                          fontSize: 10,
                          color: txtColor,
                          fontWeight: FontWeight.bold))
                ],
              ),
            );

            return Container(
              child: Column(children: ExerciseList),
            ); //Text(snapshot.data[]);

          } else {
            return Container(
              child: Text('이 날의 운동 기록이 없습니다.',
                  style: TextStyle(fontSize: 10, color: txtColor)),
            );
          }
        },
      ),
    ),
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
              child: Image.asset('images/coaching_icon.png')),
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
