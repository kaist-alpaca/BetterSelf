import 'package:flutter/material.dart';

//코칭 종류와 날짜를 보여주는 위젯

Widget CoachingDate(
  BuildContext context,
  String title,
  String date,
) {
  final valWidth = MediaQuery.of(context).size.width;
  final valHeight = MediaQuery.of(context).size.height;
  double miniHeight = 0.02 * valHeight;
  double defaultSize = valWidth * 0.0025;
  double lineLength = valWidth * 0.7;

  final bgColor = Color(0xff0B202A); //배경색
  final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
  final boxBorderRadius = valWidth * 0.015;

  return Container(
    width: valWidth * 0.86,
    child: Column(
      children: [
        Row(children: [
          SizedBox(
            width: valWidth * 0.05,
          ),
          Container(
            width: valWidth * 0.3,
            child: Text(title, //ㅇㅇ데이터 코칭
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14 * defaultSize, color: txtColor)),
          ),
          SizedBox(
            width: valWidth * 0.3,
          ),
          Container(
              width: valWidth * 0.2,
              child: Text(
                //날짜
                date,
                style: TextStyle(color: txtColor, fontSize: 12 * defaultSize),
              )),
        ]),
        SizedBox(height: valHeight * 0.0025),
        Container(
          width: valWidth * 0.74,
          child: Divider(
            color: Color(0xff858E93),
            thickness: 0.6,
          ),
        ),
      ],
    ),
  );
}
