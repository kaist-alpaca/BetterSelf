import 'package:betterme/betterme/report/functions/TotalGraphs.dart';
import 'package:betterme/betterme/report/Widgets/MiniBox.dart';
import 'package:betterme/betterme/report/functions/TotalHorizontalGraph.dart';
import 'package:betterme/betterme/report/total_report/Tag.dart';

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
              getTags(tagWidth, leftBlank, blankInterval, txtColor, graphTypes),
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
                margin: EdgeInsets.only(left: valWidth * 0.025),
                child: TotalHorizontalChart(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
