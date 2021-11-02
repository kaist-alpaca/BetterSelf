import 'package:flutter/material.dart';

import 'FoodDailyMenu1.dart';
import 'FoodDailyMenu2.dart';
import 'FoodDailyMenu3.dart';

double? widgetHeight2;
double? widgetWidth2;

class FoodDaily extends StatefulWidget {
  FoodDaily(double widgetHeight1, double widgetWidth1) {
    widgetHeight2 = widgetHeight1;
    widgetWidth2 = widgetWidth1;
  }
  @override
  _FoodDaily createState() => _FoodDaily();
}

class _FoodDaily extends State<FoodDaily> {
  @override
  Widget build(BuildContext context) {
    double widgetWidth = widgetWidth2!;
    double widgetHeight = widgetHeight2!;
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    final outTopBlank = valHeight * 0.007; //바깥쪽 여백
    final outLeftBlank = valWidth * 0.012;
    final inTopBlank = valHeight * 0.02; //안쪽 여백
    final inLeftBlank = valWidth * 0.03;

//안쪽 세 위젯(FoodDailyMenu 너비, 높이)
    final menuWidth = (widgetWidth - (2 * (inLeftBlank + outLeftBlank))) / 3;
    final menuHeight = (widgetHeight - (2 * (inTopBlank + outTopBlank)));

    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    double defaultSize = valWidth * 0.0025;

    return Container(
        height: widgetHeight,
        width: widgetWidth,
        padding: EdgeInsets.fromLTRB(
            outLeftBlank, outTopBlank, outLeftBlank, outTopBlank),
        child: Container(
          padding: EdgeInsets.fromLTRB(
              inLeftBlank, inTopBlank, inLeftBlank, inTopBlank),
          decoration: BoxDecoration(
            color: Color(0xff333C47),
            borderRadius: BorderRadius.circular(valWidth * 0.015),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: menuHeight,
                  width: menuWidth,
                  child: FoodDailyMenu1(1, menuHeight, menuWidth),
                ),
                Container(
                  height: menuHeight,
                  width: menuWidth,

                  child: FoodDailyMenu2(0, menuHeight, menuWidth),
                ),
                Container(
                  height: menuHeight,
                  width: menuWidth,
                  child: FoodDailyMenu3(0, menuHeight, menuWidth),
                ),
              ]),
        ));
  }
}
