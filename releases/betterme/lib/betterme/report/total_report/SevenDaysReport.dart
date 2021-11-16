import 'package:betterme/betterme/report/functions/TotalGraphs.dart';
import 'package:betterme/betterme/report/Widgets/MiniBox.dart';
import 'package:betterme/betterme/report/functions/TotalHorizontalGraph.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

class SevenDaysReport extends StatefulWidget {
  @override
  _SevenDaysReport createState() => _SevenDaysReport();
}

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

    final _sleep = [
      [
        [
          '2021_11_12',
          '2021_11_12',
          '2021-11-12 21:08:00.000',
          '2021-11-12 23:04:00.000'
        ],
        [
          '2021_11_12',
          '2021_11_12',
          '2021-11-12 07:10:00.000',
          '2021-11-12 09:14:00.000'
        ],
      ],
      [
        [
          '2021_11_01',
          '2021_11_01',
          '2021-11-01 21:08:00.000',
          '2021-11-01 23:04:00.000'
        ],
        [
          '2021_11_01',
          '2021_11_01',
          '2021-11-01 07:10:00.000',
          '2021-11-01 09:14:00.000'
        ],
      ],
      [
        [
          '2021_11_10',
          '2021_11_10',
          '2021-11-10 21:08:00.000',
          '2021-11-10 23:04:00.000'
        ],
        [
          '2021_11_10',
          '2021_11_10',
          '2021-11-10 07:10:00.000',
          '2021-11-10 09:14:00.000'
        ],
      ],
      [
        [
          '2021_11_09',
          '2021_11_09',
          '2021-11-09 21:08:00.000',
          '2021-11-09 23:04:00.000'
        ],
        [
          '2021_11_09',
          '2021_11_09',
          '2021-11-09 07:10:00.000',
          '2021-11-09 09:14:00.000'
        ],
      ],
      [
        [
          '2021_11_08',
          '2021_11_08',
          '2021-11-08 21:08:00.000',
          '2021-11-08 23:04:00.000'
        ],
        [
          '2021_11_08',
          '2021_11_08',
          '2021-11-08 07:10:00.000',
          '2021-11-08 09:14:00.000'
        ],
      ],
      [
        [
          '2021_11_07',
          '2021_11_07',
          '2021-11-07 21:08:00.000',
          '2021-11-07 23:04:00.000'
        ],
        [
          '2021_11_07',
          '2021_11_07',
          '2021-11-07 07:10:00.000',
          '2021-11-07 09:14:00.000'
        ],
      ],
      [
        [
          '2021_11_06',
          '2021_11_06',
          '2021-11-06 21:08:00.000',
          '2021-11-06 23:59:59.999'
        ],
        [
          '2021_11_06',
          '2021_11_06',
          '2021-11-06 07:10:00.000',
          '2021-11-06 09:14:00.000'
        ],
      ],
    ];

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
              TotalGraphs(
                GraphTypes: GraphTypes,
              ),
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
                height: valHeight * 0.34,
                width: valWidth * 0.95,
                margin: EdgeInsets.only(left: valWidth * 0.025),
                child: TotalHorizontalChart(sleep: _sleep),
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
