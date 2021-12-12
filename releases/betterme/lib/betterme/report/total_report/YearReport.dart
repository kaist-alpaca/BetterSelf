import 'package:betterme/betterme/report/functions/TotalGraphs.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

class YearReport extends StatefulWidget {
  @override
  _YearReport createState() => _YearReport();
}

class _YearReport extends State<YearReport> {
  List<bool> graphTypes = [true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final tagWidth = valWidth / 5.6;
    final leftBlank = valWidth / 9; // 태그 왼쪽 여백
    final blankInterval = valWidth / 45.5; // 태그 사이 여백

    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색

    double miniBoxSize = 0.015;

    double defaultSize = valWidth * 0.0025;

    return GetBuilder<ProfileController>(builder: (controller) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(width: leftBlank),
                wholeTag(graphTypes, tagWidth, Color(0xff858E93), txtColor),
                SizedBox(width: blankInterval),
                Tag(graphTypes, tagWidth, 0, Color(0xffFFFDFD), [
                  Text(
                    '체중',
                    style: TextStyle(fontSize: 12, color: txtColor),
                  ),
                  Text(
                    ' (kg)',
                    style: TextStyle(fontSize: 9, color: txtColor),
                  )
                ]),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(width: leftBlank),
                Tag(graphTypes, tagWidth, 1, Color(0xffA0B1DF), [
                  Text(
                    '수면',
                    style: TextStyle(fontSize: 12, color: txtColor),
                  ),
                  Text(
                    ' (시간)',
                    style: TextStyle(fontSize: 9, color: txtColor),
                  ),
                ]),
                SizedBox(
                  width: blankInterval,
                ),
                Tag(graphTypes, tagWidth, 2, Color(0xffF2D8A7), [
                  Text(
                    '스트레스',
                    style: TextStyle(fontSize: 12, color: txtColor),
                  ),
                ]),
                SizedBox(
                  width: blankInterval,
                ),
                Tag(graphTypes, tagWidth, 3, Color(0xffD2ABBA), [
                  Text(
                    '섭취',
                    style: TextStyle(fontSize: 12, color: txtColor),
                  ),
                  Text(
                    ' (kcal)',
                    style: TextStyle(fontSize: 9, color: txtColor),
                  )
                ]),
                SizedBox(
                  width: blankInterval,
                ),
                Tag(graphTypes, tagWidth, 4, Color(0xff8DBFBC), [
                  Text(
                    '소모',
                    style: TextStyle(fontSize: 12, color: txtColor),
                  ),
                  Text(
                    ' (kcal)',
                    style: TextStyle(fontSize: 9, color: txtColor),
                  )
                ]),
              ]),
              SizedBox(
                height: 20,
              ),
              TotalGraphs(GraphTypes: graphTypes, Duration: 180),
            ],
          ),
        ),
      );
    });
  }

  GestureDetector wholeTag(List<bool> graphTypes, double tagWidth,
      Color boundaryColor, Color txtColor) {
    return GestureDetector(
        onTap: () {
          ServerConnection.write_log('ReportScreen', 'year_tag_whole', '');
          setState(() {
            if (graphTypes.contains(true)) {
              //하나 이상의 태그가 켜져있을 경우

              for (var i = 0; i < graphTypes.length; i++) {
                graphTypes[i] = false;
              } //모두 끈다

            } else {
              //하나 이상의 태그가 꺼져있을 경우

              for (var i = 0; i < graphTypes.length; i++) {
                graphTypes[i] = true;
              }
              //모두 켠다
              ;
            }
          });
        },
        child: Container(
          height: 22,
          width: tagWidth,
          color: Colors.transparent,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(color: boundaryColor, width: 1)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '전체',
                          style: TextStyle(fontSize: 12, color: txtColor),
                        ),
                      ],
                    ),
                  ])),
        ));
  }

  GestureDetector Tag(List<bool> graphTypes, double tagWidth, int graphNum,
      Color boundaryColor, List<Text> text) {
    return GestureDetector(
        onTap: () {
          ServerConnection.write_log(
              'ReportScreen', 'year_tag_' + graphNum.toString(), '');
          setState(() {
            graphTypes[graphNum]
                ? graphTypes[graphNum] = false
                : graphTypes[graphNum] = true;
          });
        },
        child: Container(
          height: 22,
          width: tagWidth,
          color: Colors.transparent,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(color: boundaryColor, width: 1)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: text,
                    ),
                  ])),
        ));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
