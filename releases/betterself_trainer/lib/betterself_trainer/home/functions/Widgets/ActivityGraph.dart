import 'package:betterself_trainer/functions/Graphs/horizontal_one_line.dart';
import 'package:betterself_trainer/functions/Graphs/vertical_time_bar_chart.dart';
import 'package:flutter/material.dart';

double? widgetHeight2;
double? widgetWidth2;

class ActivityGraph extends StatefulWidget {
  ActivityGraph(double widgetHeight1, double widgetWidth1) {
    widgetHeight2 = widgetHeight1;
    widgetWidth2 = widgetWidth1;
  }
  @override
  _ActivityGraph createState() => _ActivityGraph();
}

class _ActivityGraph extends State<ActivityGraph> {
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

    final _activity = [
      [0, 20],
      [2, 50],
      [12, 80],
      [6, 10],
      [11, 50],
      [10, 20],
      [13, 30]
    ];

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
                inLeftBlank, inTopBlank, inLeftBlank, 0), //안쪽 여백
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
                      '활동',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: txtColor, fontSize: defaultSize * 10),
                    ),
                  ),
                ),
                SizedBox(height: valHeight * 0.016),
                Container(
                    width: widgetWidth - outLeftBlank * 2 - inLeftBlank * 2,
                    height: widgetHeight * 0.67,
                    child: Column(
                      children: [
                        Container(
                          height: widgetHeight * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text('266kcal',
                                        style: TextStyle(
                                            color: txtColor,
                                            fontSize: defaultSize * 15))),
                              ),
                              Container(
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(' / 450kcal',
                                        style: TextStyle(
                                            color: txtColor,
                                            fontSize: defaultSize * 10))),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: widgetHeight * 0.03),
                        Container(
                          height: widgetHeight * 0.11,
                          child: MadeHorizontalOneLineChart(
                            percentage: 30,
                          ),
                        ),
                        Container(
                          height: widgetHeight * 0.42,
                          child: VerticalTimeBarChart(
                            activity: _activity,
                          ),
                        ),
                      ],
                    ))
              ],
            )));
  }
}
