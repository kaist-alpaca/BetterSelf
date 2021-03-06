import 'dart:math';

import 'package:betterme/functions/Calendar/calendar.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:betterme/functions/Graphs/bar_chart.dart';
import 'package:betterme/functions/Graphs/gradient_chart.dart';
import 'package:betterme/functions/Graphs/group_bar_three_chart.dart';
import 'package:betterme/functions/Graphs/horizontal_chart.dart';
import 'package:betterme/functions/Graphs/horizontal_one_line.dart';
import 'package:betterme/functions/Graphs/pie_chart.dart';
import 'package:betterme/functions/Graphs/pie_chart_hole.dart';
import 'package:betterme/functions/Graphs/scatter_chart.dart';
import 'package:betterme/functions/Graphs/single_bar.dart';
import 'package:betterme/functions/Graphs/sliced_bar_chart.dart';
import 'package:betterme/functions/Graphs/vertical_time_bar_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:betterme/functions/Graphs/line_chart.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'bio_report/BioScreen.dart';
import 'exercise_report/ExerciseScreen.dart';

import 'food_report/FoodScreen.dart';

import 'package:table_calendar/table_calendar.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreen createState() => _ReportScreen();
}

final rng = Random();
const dayCount = 7;

class _ReportScreen extends State<ReportScreen> {
  late List<Score> _scores;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  final List<Color> _gradientColors = [
    const Color(0xFF6FFF7C),
    const Color(0xFF0087FF),
    const Color(0xFF5620FF),
  ];

  @override
  void initState() {
    super.initState();
    final scores = List<Score>.generate(dayCount, (index) {
      final y = rng.nextDouble() * 30.0;
      final d = DateTime.now().add(Duration(days: -dayCount + index));
      return Score(y, d);
    });
    setState(() {
      _scores = scores;
    });
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //?????? ??????
    final valWidth = MediaQuery.of(context).size.width; //?????? ??????
    final bgColor = Color(0xff0B202A); //?????????
    final txtColor = Color(0xffFFFDFD); //????????? , ?????? ????????? ???
    final linetxtColor = Color(0xffAA8F9D); //??????-?????????-?????? ???
    final _food = [
      [
        [27, 480, 1],
        [27, 1000, 2],
        [27, 0, 2],
      ],
      [
        [28, 872, 3]
      ],
      [
        [29, 128, 4]
      ],
      [
        [30, 739, 1]
      ],
      [
        [31, 836, 4]
      ],
      [
        [9 / 1, 947, 2]
      ],
      [
        [2, 931, 1]
      ]
    ];
    final _sleep = [
      [
        [27, 480, 1000],
      ],
      [
        [28, 872, 999]
      ],
      [
        [29, 128, 555]
      ],
      [
        [30, 739, 894]
      ],
      [
        [31, 236, 384]
      ],
      [
        [9 / 1, 347, 472]
      ],
      [
        [2, 531, 763]
      ]
    ];
    final _activity = [
      [0, 40],
      [2, 50],
      [12, 250],
    ];
    double defaultSize = valWidth * 0.0025;
    CalendarFormat _calendarFormat = CalendarFormat.month;
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          title: Text(
            "Report",
            style: TextStyle(color: txtColor),
          ),
        ),
        body: ListView(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Calendar(),
                Container(
                  child: Text(
                    '??????',
                    style: TextStyle(fontSize: defaultSize * 12),
                  ),
                  height: valHeight * 0.05,
                  margin: EdgeInsets.only(
                      left: valWidth * 0.14, top: valHeight * 0.03),
                ),
                Container(
                  child: Text('???????????? ?????? ????????? ????????? ???????????????.'),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3)),
                  width: valWidth * 0.84,
                  margin: EdgeInsets.only(left: valWidth * 0.08),
                  height: valHeight * 0.23,
                ),
                Container(
                  child: Text(
                    '?????????',
                    style: TextStyle(fontSize: defaultSize * 12),
                  ),
                  height: valHeight * 0.05,
                  margin: EdgeInsets.only(
                      left: valWidth * 0.14, top: valHeight * 0.03),
                ),
                GestureDetector(
                  //????????? ????????? ????????? ??? ?????????????????? ?????????. (pages-> reportpage ??????.)
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BioScreen()));
                  },
                  child: Container(
                    color: Colors.grey,
                    height: 0.2 * valHeight,
                    width: valWidth * 0.84,
                    margin: EdgeInsets.only(left: valWidth * 0.08),
                    child: MadeLineChart(scores: _scores),
                  ),
                ),
                SizedBox(height: valHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExerciseScreen()));
                      },
                      child: Container(
                        width: valWidth * 0.4,
                        height: valHeight * 0.2,
                        color: Colors.grey,
                        child: GradientChart(scores: _scores),
                      ),
                    ),
                    SizedBox(width: valWidth * 0.04),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoodScreen()));
                      },
                      child: Container(
                        width: valWidth * 0.4,
                        height: valHeight * 0.2,
                        color: Colors.grey,
                        child: SingleBar(scores: _scores),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: valHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: valWidth * 0.4,
                        height: valHeight * 0.2,
                        color: Colors.grey,
                        child: GroupBarThreeChart(),
                      ),
                    ),
                    SizedBox(width: valWidth * 0.04),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: valWidth * 0.4,
                        height: valHeight * 0.2,
                        color: Colors.grey,
                        child: SlicededBarChart(scores: _scores),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: valHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: valWidth * 0.4,
                        height: valHeight * 0.2,
                        color: Colors.grey,
                        child: CustomPaint(
                          size: Size(150, 150),
                          painter: MadePieChart(
                              percentage: 45,
                              textScaleFactor: 1.5,
                              textColor: Colors.blueGrey),
                        ),
                      ),
                    ),
                    SizedBox(width: valWidth * 0.04),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: valWidth * 0.4,
                        height: valHeight * 0.2,
                        color: Colors.grey,
                        child: MadeChart(food: _food),
                        // child: CustomPaint(
                        //   // CustomPaint??? ????????? ??? ?????? ????????? ???????????????..
                        //   size: Size(
                        //       150, 150), // CustomPaint??? ????????? ?????? ?????? 150, 150?????? ?????????.
                        //   painter: MadePieChart(
                        //       percentage: 50, // ?????? ????????? ????????? ????????? ????????? ????????? ???????????????.
                        //       textScaleFactor: 1.0, // ?????? ????????? ????????? ????????? ????????? ????????????.
                        //       textColor: Colors.blueGrey),
                        // ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: valHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: valWidth * 0.4,
                        height: valHeight * 0.2,
                        color: Colors.grey,
                        child: MadeHorizontalChart(sleep: _sleep),
                      ),
                    ),
                    SizedBox(width: valWidth * 0.04),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: valWidth * 0.4,
                        height: valHeight * 0.2,
                        color: Colors.grey,
                        child: CustomPaint(
                          // CustomPaint??? ????????? ??? ?????? ????????? ???????????????..
                          size: Size(150,
                              150), // CustomPaint??? ????????? ?????? ?????? 150, 150?????? ?????????.
                          painter: MadePieChartHole(
                            percentage1: 60,
                            percentage2: 20,
                            text: "6?????? 21???",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: valHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: valWidth * 0.4,
                        height: valHeight * 0.2,
                        color: Colors.grey,
                        child: MadeHorizontalOneLineChart(
                          percentage: 60,
                        ),
                      ),
                    ),
                    SizedBox(width: valWidth * 0.04),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: valWidth * 0.4,
                        height: valHeight * 0.2,
                        color: Colors.grey,
                        child: VerticalTimeBarChart(
                          activity: _activity,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: valHeight * 0.05,
                )
              ],
            ),
          ),
        ]),
      );
    });
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
