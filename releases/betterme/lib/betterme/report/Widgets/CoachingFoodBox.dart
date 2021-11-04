import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    SizedBox(height: valHeight * 0.008),
    Container(
      height: valHeight * 0.2,
      width: lineLength,
      child: Text(
        '여기에 식단 기록 내용 들어가야 함',
        style: TextStyle(fontSize: 10 * defaultSize, color: txtColor),
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
