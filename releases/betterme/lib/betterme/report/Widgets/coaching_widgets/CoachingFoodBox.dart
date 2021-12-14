import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//식단을 보여주기 위한 위젯

Widget CoachingFoodBox(BuildContext context, DateTime selectedDay) {
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
    SizedBox(
      height: valHeight * 0.008,
    ),
    Container(
      width: lineLength,
      child: FutureBuilder<List<dynamic>>(
        future: ServerConnection.get_food_by_date(
          ProfileController.to.originMyProfile.uid == null
              ? ''
              : ProfileController.to.originMyProfile.uid!,
          selectedDay,
        ),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasError) {
            return Container(
              height: valHeight * 0.2,
              child: Text('이 날의 식단 기록이 없습니다.',
                  style: TextStyle(fontSize: 10, color: txtColor)),
            );
          } else if (snapshot.hasData && snapshot.data!.length > 0) {
            print('\n\ndebug : ${snapshot.data}');
            var data = List.from(snapshot.data!);
            double sum = 0;

            List<Widget> FoodList = data.map<Widget>((e) {
              print("debug Time : ${e['date']}");
              DateTime Time = DateTime.parse(e['time'].toString());
              print("debug Time : $Time");

              sum += double.parse(e['amount'].toString());

              String dateurl = e['date'].replaceAll(" ", "").replaceAll("-", "_");
              dateurl = 'http://kaistuser.iptime.org:8080/img/food/' + FirebaseAuth.instance.currentUser!.uid + '.' + dateurl + '.jpg';
              print('debug : foodimg $dateurl');

              return Column(children: [
                Row(
                  children: [
                    SizedBox(
                      width: valWidth * 0.07,
                    ),
                    Text(e['when'],
                        style: TextStyle(fontSize: 10, color: txtColor)),
                    SizedBox(
                      width: valWidth * 0.04,
                    ),
                    Text(DateFormat.jm().format(Time),
                        style: TextStyle(fontSize: 10, color: txtColor)),
                    SizedBox(
                      width: valWidth * 0.04,
                    ),
                    Text(e['name'],
                        style: TextStyle(fontSize: 10, color: txtColor)),
                    SizedBox(
                      width: valWidth * 0.04,
                    ),
                    Text("${e['amount']} kcal",
                        style: TextStyle(fontSize: 10, color: txtColor)),
                    SizedBox(
                      width: valWidth * 0.04,
                    ),
                    //Text('$Dura 분', style: TextStyle(fontSize: 10, color: txtColor)),
                  ],
                ),
                //Text('$Dura 분', style: TextStyle(fontSize: 10, color: txtColor)),
                SizedBox(
                  height: 10,
                ),
                dateurl != null ? Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 30,
                      child : Image.network(dateurl)
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ) : SizedBox(),
              ]);
            }).toList();

            FoodList.add(
              Row(
                children: [
                  SizedBox(
                    width: valWidth * 0.07,
                  ),
                  Text('총 칼로리: $sum kcal',
                      style: TextStyle(
                          fontSize: 10,
                          color: txtColor,
                          fontWeight: FontWeight.bold))
                ],
              ),
            );

            return Container(
              child: Column(children: FoodList),
            ); //Text(snapshot.data[]);

          } else {
            return Container(
              height: valHeight * 0.2,
              child: Text('이 날의 식단 기록이 없습니다.',
                  style: TextStyle(fontSize: 10, color: txtColor)),
            );
          }
        },
      ),
    ),
  ]));
}
