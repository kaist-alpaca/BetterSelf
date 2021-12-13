import 'package:betterme/betterme/report/functions/TotalGraphs.dart';
import 'package:betterme/betterme/report/Widgets/MiniBox.dart';
import 'package:betterme/betterme/report/functions/TotalHorizontalGraph.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

class SevenDaysReport extends StatefulWidget {
  SevenDaysReport({Key? key}) : super(key: key);

  @override
  _SevenDaysReport createState() => _SevenDaysReport();
}

// TotalGraphs(
//       {Key? key,
//       required this.GraphTypes,
//       required this.Duration,
//       required this.count})
//       : super(key: key);

//   List<bool> GraphTypes; // 체중 수면 스트레스 섭취 소모
//   int Duration;
//   int count;

class _SevenDaysReport extends State<SevenDaysReport> {
  List<bool> graphTypes = [true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    // final valHeight = MediaQuery.of(context).size.height; //화면 높이
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
              //Tag 기능
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
              //그래프 : 7일 default
              TotalGraphs(GraphTypes: graphTypes, Duration: 7),
              /////////////  그래프 2 설명 /////////////
              SizedBox(
                height: 20,
              ),
              Row(
                // 여기는 식단/수면 그래프 색 설명해줌.
                children: [
                  SizedBox(width: valWidth * 0.095),
                  MiniBox(
                      context, Color(0xff48575F), miniBoxSize, 0.08, 10, '수면'),
                  MiniBox(
                      context, Color(0xff8DBFBC), miniBoxSize, 0.08, 10, '아침'),
                  MiniBox(
                      context, Color(0xffF2D8A7), miniBoxSize, 0.08, 10, '점심'),
                  MiniBox(
                      context, Color(0xffA0B1DF), miniBoxSize, 0.08, 10, '저녁'),
                  MiniBox(
                      context, Color(0xffD2ABBA), miniBoxSize, 0.08, 10, '간식'),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: valWidth * 0.95 / 24 * 7 * 1.7,
                width: valWidth * 0.95,
                // margin: EdgeInsets.only(left: valWidth * 0.025),
                margin: EdgeInsets.fromLTRB(valWidth * 0.025, 15, 0, 0),
                child: TotalHorizontalChart(),
              ),
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
          ServerConnection.write_log('ReportScreen', 'week_tag_whole', '');
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
              'ReportScreen', 'week_tag_' + graphNum.toString(), '');
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
