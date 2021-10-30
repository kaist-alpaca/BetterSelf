import 'package:flutter/material.dart';

Widget SleepGraph(
    BuildContext context, double widgetHeight, double widgetWidth) {
  final valHeight = MediaQuery.of(context).size.height; //화면 높이
  final valWidth = MediaQuery.of(context).size.width; //화면 너비

  final bgColor = Color(0xff0B202A); //배경색
  final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
  final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
  double defaultSize = valWidth * 0.0025;

  return Container(
      height: widgetHeight,
      width: widgetWidth,
      decoration: BoxDecoration(color: Color(0xff333C47)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: valHeight * 0.008,
          )
        ],
      ));
}
