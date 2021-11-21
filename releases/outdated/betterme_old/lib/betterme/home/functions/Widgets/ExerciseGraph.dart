import 'package:flutter/material.dart';

double? widgetHeight2;
double? widgetWidth2;

class ExerciseGraph extends StatefulWidget {
  ExerciseGraph(double widgetHeight1, double widgetWidth1) {
    widgetHeight2 = widgetHeight1;
    widgetWidth2 = widgetWidth1;
  }
  @override
  _ExerciseGraph createState() => _ExerciseGraph();
}

class _ExerciseGraph extends State<ExerciseGraph> {
  @override
  Widget build(BuildContext context) {
    double widgetWidth = widgetWidth2!;
    double widgetHeight = widgetHeight2!;
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    final outTopBlank = valHeight * 0.007; //바깥쪽 여백
    final outLeftBlank = valWidth * 0.012;
    final inTopBlank = valHeight * 0.008; //안쪽 여백
    final inLeftBlank = valWidth * 0.03;

    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    double defaultSize = valWidth * 0.0025;

    return Container(
        height: widgetHeight,
        width: widgetWidth,
        padding: EdgeInsets.fromLTRB(
            outLeftBlank, outTopBlank, outLeftBlank, outTopBlank), //바깥쪽 여백
        child: Container(
            decoration: BoxDecoration(
              color: Color(0xff333C47),
              borderRadius: BorderRadius.circular(valWidth * 0.03),
            ),
            padding: EdgeInsets.fromLTRB(
                inLeftBlank, inTopBlank, inLeftBlank, inTopBlank), //안쪽 여백
            child: Column(
              // 내용물
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // 좌측 상단 작은 박스
                  height: valHeight * 0.02,
                  width: valWidth * 0.19,
                  decoration: BoxDecoration(
                      color: Color(0xff53525E),
                      borderRadius: BorderRadius.circular(valWidth * 0.01)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '운동(kcal)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: txtColor, fontSize: defaultSize * 10),
                    ),
                  ),
                ),
                SizedBox(height: valHeight * 0.016),
                Container(
                  width: widgetWidth - outLeftBlank * 2 - inLeftBlank * 2,
                  height: widgetHeight * 0.6,
                  color: Colors.grey,
                )
              ],
            )));
  }
}
