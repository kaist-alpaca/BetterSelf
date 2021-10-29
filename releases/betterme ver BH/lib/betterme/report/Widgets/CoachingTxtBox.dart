import 'package:flutter/material.dart';

//직접적으로 트레이너가 '말해준' 코칭이 들어가는 위젯
//type 0는 bio데이터, type 1은 운동 or 식단

Widget CoachingTxtBox(BuildContext context, int type, String title,
    String content, double heightRate) {
  final valWidth = MediaQuery.of(context).size.width;
  final valHeight = MediaQuery.of(context).size.height;
  double miniHeight = 0.02 * valHeight;
  double defaultSize = valWidth * 0.0025;
  double lineLength = valWidth * 0.7;

  final bgColor = Color(0xff0B202A); //배경색
  final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
  final boxBorderRadius = valWidth * 0.015;

  if (type == 0) {
    miniHeight = 0.04 * valHeight;
  }

  return Container(
      height: valHeight * heightRate,
      width: valWidth * 0.86,
      decoration: BoxDecoration(
        color: Color(0xff333C47),
        borderRadius: BorderRadius.circular(valWidth * 0.015),
      ),
      child: Column(children: [
        SizedBox(height: valHeight * 0.008),
        Container(
          height: miniHeight,
          width: valWidth * 0.2,
          decoration: BoxDecoration(
            color: Color(0xff53525E),
            borderRadius: BorderRadius.circular(valWidth * 0.015),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10 * defaultSize, color: txtColor)),
          ),
        ),
        SizedBox(height: valHeight * 0.008),
        Container(
          width: valWidth * 0.74,
          child: Divider(
            color: Color(0xff94999E),
            thickness: 0.6,
          ),
        ),
        SizedBox(height: valHeight * 0.008),
        Container(
          width: lineLength,
          child: Text(
            content,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10 * defaultSize, color: txtColor),
          ),
        )
      ]));
}
