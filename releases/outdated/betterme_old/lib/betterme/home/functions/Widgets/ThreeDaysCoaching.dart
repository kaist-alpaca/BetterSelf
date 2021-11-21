import 'package:flutter/material.dart';

Widget ThreeDaysCoaching(
    BuildContext context,
    String content,
    double dayButtonHeight,
    double buttonWidth,
    double blankBetweenButton,
    double widgetHeight,
    double widgetWidth) {
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
      height: dayButtonHeight * 3 + blankBetweenButton * 2,
      width: buttonWidth * 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(valWidth * 0.02),
            bottomRight: Radius.circular(valWidth * 0.02)),
        color: Color(0xff333C47),
        boxShadow: [
          BoxShadow(color: Color(0xffD2ABBA), blurRadius: 0.4),
        ],
      ),
      padding: EdgeInsets.fromLTRB(widgetWidth * 0.033, widgetHeight * 0.1,
          widgetWidth * 0.033, widgetHeight * 0.1),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          content,
          softWrap: true,
          style: TextStyle(color: txtColor, fontSize: defaultSize * 12),
          textAlign: TextAlign.center,
        ),
      ));
}
