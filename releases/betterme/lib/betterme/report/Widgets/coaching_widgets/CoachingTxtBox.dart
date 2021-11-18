import 'package:flutter/material.dart';

//직접적으로 트레이너가 '말해준' 코칭이 들어가는 위젯

Widget CoachingTxtBox(BuildContext context, String content, double heightRate) {
  final valWidth = MediaQuery.of(context).size.width;
  final valHeight = MediaQuery.of(context).size.height;
  double miniHeight = 0.02 * valHeight;
  double defaultSize = valWidth * 0.0025;
  double lineLength = valWidth * 0.7;

  final bgColor = Color(0xff0B202A); //배경색
  final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
  final boxBorderRadius = valWidth * 0.015;

  return Container(
      height: valHeight * heightRate,
      width: valWidth * 0.86,
      child: Column(children: [
        SizedBox(height: valHeight * 0.008),
        Container(
          width: lineLength,
          child: Text(
            content,
            softWrap: true,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 10 * defaultSize, color: txtColor),
          ),
        )
      ]));
}
