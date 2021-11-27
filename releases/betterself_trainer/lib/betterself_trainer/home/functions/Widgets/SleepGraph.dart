import 'package:betterself_trainer/functions/Graphs/pie_chart_hole.dart';
import 'package:flutter/material.dart';


double? widgetHeight2;
double? widgetWidth2;

class SleepGraph extends StatefulWidget {
  SleepGraph(double widgetHeight1, double widgetWidth1) {
    widgetHeight2 = widgetHeight1;
    widgetWidth2 = widgetWidth1;
  }
  @override
  _SleepGraph createState() => _SleepGraph();
}

class _SleepGraph extends State<SleepGraph> {
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
                  width: valWidth * 0.1,
                  decoration: BoxDecoration(
                      color: Color(0xff53525E),
                      borderRadius: BorderRadius.circular(valWidth * 0.01)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '수면',
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
                  child: Container(
                    width: valWidth * 0.4,
                    height: valHeight * 0.2,
                    child: CustomPaint(
                      // CustomPaint를 그리고 이 안에 차트를 그려줍니다..
                      size: Size(
                          150, 150), // CustomPaint의 크기는 가로 세로 150, 150으로 합니다.
                      painter: MadePieChartHole(
                        percentage1: 60,
                        percentage2: 20,
                        text: "6시간 21분",
                        type: 'sleep',
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
