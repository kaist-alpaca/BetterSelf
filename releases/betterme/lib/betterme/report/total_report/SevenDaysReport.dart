import 'package:betterme/betterme/report/functions/TotalGraphs.dart';
import 'package:betterme/betterme/report/Widgets/MiniBox.dart';
import 'package:betterme/betterme/report/functions/TotalHorizontalGraph.dart';

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
  List<bool> GraphTypes = [true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        GraphTypes[0]
                            ? GraphTypes[0] = false
                            : GraphTypes[0] = true;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: valWidth / 7,
                      color: Colors.transparent,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              border: Border.all(
                                  color: Color(0xffFFFDFD), width: 1)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '체중',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffFFFDFD)),
                                    ),
                                    Text(
                                      ' (kg)',
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xffFFFDFD)),
                                    )
                                  ],
                                ),
                              ])),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        GraphTypes[1]
                            ? GraphTypes[1] = false
                            : GraphTypes[1] = true;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: valWidth / 7,
                      color: Colors.transparent,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              border: Border.all(
                                  color: Color(0xffA0B1DF), width: 1)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '수면',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffFFFDFD)),
                                    ),
                                    Text(
                                      ' (시간)',
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xffFFFDFD)),
                                    )
                                  ],
                                ),
                              ])),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          GraphTypes[2]
                              ? GraphTypes[2] = false
                              : GraphTypes[2] = true;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: valWidth / 7,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(
                                    color: Color(0xffF2D8A7), width: 1)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '스트레스',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffFFFDFD)),
                                      ),
                                    ],
                                  ),
                                ])),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          GraphTypes[3]
                              ? GraphTypes[3] = false
                              : GraphTypes[3] = true;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: valWidth / 7,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(
                                    color: Color(0xffD2ABBA), width: 1)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '섭취',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffFFFDFD)),
                                      ),
                                      Text(
                                        ' (kcal)',
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: Color(0xffFFFDFD)),
                                      )
                                    ],
                                  ),
                                ])),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          GraphTypes[4]
                              ? GraphTypes[4] = false
                              : GraphTypes[4] = true;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: valWidth / 7,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(
                                    color: Color(0xff8DBFBC), width: 1)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '소모',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffFFFDFD)),
                                      ),
                                      Text(
                                        ' (kcal)',
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: Color(0xffFFFDFD)),
                                      )
                                    ],
                                  ),
                                ])),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TotalGraphs(GraphTypes: GraphTypes, Duration: 7),
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

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
