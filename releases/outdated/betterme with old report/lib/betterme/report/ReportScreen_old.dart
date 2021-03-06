import 'dart:math';

import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:betterme/functions/Graphs/gradient_chart.dart';
import 'package:betterme/functions/Graphs/line_chart_new.dart';
import 'package:betterme/functions/Graphs/line_chart_space.dart';
import 'package:betterme/functions/Graphs/single_bar.dart';
import 'package:betterme/functions/Graphs/sliced_bar_chart.dart';
import 'package:betterme/functions/Graphs/group_bar_three_chart.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:betterme/functions/Graphs/line_chart.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';
import '../../functions/Widgets/DividewithObj.dart';

import 'bio_report/BioScreen.dart';
import 'exercise_report/ExerciseScreen.dart';

import 'food_report/FoodScreen.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreen createState() => _ReportScreen();
}

final rng = Random();
const dayCount = 7;

class _ReportScreen extends State<ReportScreen> {
  final String TestUid = "4fT7dL3H8CUkLKBx9bB3Pqjp3bi1";

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
      final d = DateTime.now().add(Duration(days: index));
      return Score(y, d);
    });
    setState(() {
      _scores = scores;
    });
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    final shadowColor = Color(0xffD2ABBA);
    double defaultSize = valWidth * 0.0025;

    return GetBuilder<ProfileController>(builder: (controller) {
      return Container(
        color: bgColor,
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(valHeight * 0.08),
            child: AppBar(
              backgroundColor: bgColor,
              elevation: 0.0,
              title: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: valHeight * 0.08,
                  padding: EdgeInsets.only(top: valHeight * 0.035),
                  child: Text(
                      controller.startDate(controller.date).month.toString() +
                          "월 " +
                          controller.startDate(controller.date).day.toString() +
                          "일 - " +
                          controller.endDate(controller.date).month.toString() +
                          "월 " +
                          controller.endDate(controller.date).day.toString() +
                          "일",
                      style: TextStyle(
                          fontSize: defaultSize * 17, color: txtColor),
                      textAlign: TextAlign.center),
                ),
              ),
              leading: Container(
                height: valHeight * 0.08,
                padding: EdgeInsets.only(top: valHeight * 0.022),
                child: IconButton(
                  icon: SvgPicture.asset('images/arrow towards left_icon.svg'),
                  onPressed: () {
                    controller.dateMinus7(controller.date);
                  },
                ),
              ),
              actions: <Widget>[
                Container(
                  height: valHeight * 0.08,
                  padding: EdgeInsets.only(top: valHeight * 0.022),
                  child: IconButton(
                    icon:
                        SvgPicture.asset('images/arrow towards right_icon.svg'),
                    onPressed: () {
                      controller.datePlus7(controller.date);
                    },
                  ),
                ),
              ],
            ),
          ),
          body: ListView(children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: valHeight * 0.005,
                  ),
                  DividewithObj(
                      context,
                      Container(
                        width: valWidth * 0.25,
                        child: Text(
                          '데이터',
                          style: TextStyle(
                              fontSize: defaultSize * 14, color: linetxtColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      0.15,
                      0.6),
                  SizedBox(
                    height: valHeight * 0.032,
                  ),
                  Container(
                      //생체그래프
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(valWidth * 0.015),
                          boxShadow: [
                            BoxShadow(color: shadowColor, blurRadius: 2.2),
                          ]),
                      height: valHeight * 0.35,
                      width: valWidth * 0.84,
                      margin: EdgeInsets.only(left: valWidth * 0.08),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  // 좌측 상단 작은 박스
                                  height: valHeight * 0.02,
                                  width: valWidth * 0.25,
                                  margin: EdgeInsets.only(
                                      left: valWidth * 0.04,
                                      top: valHeight * 0.01,
                                      bottom: valHeight * 0.008),
                                  decoration: BoxDecoration(
                                      color: Color(0xff333C47),
                                      borderRadius: BorderRadius.circular(
                                          valWidth * 0.013)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'InBody - 체중(kg)',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: txtColor,
                                          fontSize: defaultSize * 10),
                                    ),
                                  ),
                                ),
                              ),
                              FutureBuilder(
                                  future: ServerConnection.GetWeight(TestUid),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData == false) {
                                      return CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Error: ${snapshot.error}',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      );
                                    } else {
                                      var result = snapshot
                                          .data['result'].reversed
                                          .toList();
                                      int count = 0;
                                      while (DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      double.parse(result[count]
                                                                  ['time'])
                                                              .round() *
                                                          1000)
                                              .isAfter(DateTime.now()
                                                  .add(Duration(days: -3))) &&
                                          result.length - 1 > count) count++;
                                      print("debug weight count : $count");
                                      List<Score> WeightList =
                                          List<Score>.generate(count + 1,
                                              (index) {
                                        final y = double.parse(
                                            result[index]['weight']);
                                        final d =
                                            DateTime.fromMillisecondsSinceEpoch(
                                                double.parse(result[index]
                                                            ['time'])
                                                        .round() *
                                                    1000);
                                        print("debug weight count : $y \t $d");
                                        return Score(y, d);
                                      });
                                      return Container(
                                        width: valWidth * 0.85,
                                        height: valHeight * 0.15,
                                        color: Color(0xff0B202A),
                                        child: MadeLineChart(
                                            scores:
                                                WeightList.reversed.toList()),
                                      );
                                    }
                                  })
                            ],
                          ),
                          Row(
                            children: [
                              Column(children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    // 좌측 상단 작은 박스
                                    height: valHeight * 0.02,
                                    width: valWidth * 0.2,
                                    margin: EdgeInsets.only(
                                        left: valWidth * 0.04,
                                        top: valHeight * 0.01,
                                        bottom: valHeight * 0.008),
                                    decoration: BoxDecoration(
                                        color: Color(0xff333C47),
                                        borderRadius: BorderRadius.circular(
                                            valWidth * 0.013)),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '스트레스(%)',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: txtColor,
                                            fontSize: defaultSize * 10),
                                      ),
                                    ),
                                  ),
                                ),
                                FutureBuilder(
                                    future: ServerConnection.GetStress(TestUid),
                                    builder: (context, AsyncSnapshot snapshot) {
                                      if (snapshot.hasData == false) {
                                        return CircularProgressIndicator();
                                      } else if (snapshot.hasError) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Error: ${snapshot.error}',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        );
                                      } else {
                                        List result = snapshot
                                            .data['result'].reversed
                                            .toList();
                                        int count = 0;
                                        while (
                                            DateTime.fromMillisecondsSinceEpoch(
                                                        double.parse(result[
                                                                        count]
                                                                    ['time'])
                                                                .round() *
                                                            1000)
                                                    .isAfter(DateTime.now().add(
                                                        Duration(days: -3))) &&
                                                result.length > count) count++;
                                        print("debug count : $count");
                                        List<Score> StressList =
                                            List<Score>.generate(count + 1,
                                                (index) {
                                          final y = double.parse(
                                              result[index]['stress']);
                                          final d = DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  double.parse(result[index]
                                                              ['time'])
                                                          .round() *
                                                      1000);
                                          print("debug count : $y \t $d");
                                          return Score(y, d);
                                        });
                                        return Container(
                                          width: valWidth * 0.35,
                                          height: valHeight * 0.1,
                                          color: Color(0xff0B202A),
                                          child: GradientChart(
                                              scores:
                                                  StressList.reversed.toList()),
                                          margin: EdgeInsets.only(
                                            left: valWidth * 0.04,
                                          ),
                                        );
                                      }
                                    })
                              ]),
                              SizedBox(width: valWidth * 0.04),
                              Column(children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    // 좌측 상단 작은 박스
                                    height: valHeight * 0.02,
                                    width: valWidth * 0.2,
                                    margin: EdgeInsets.only(
                                        left: valWidth * 0.04,
                                        top: valHeight * 0.01,
                                        bottom: valHeight * 0.008),
                                    decoration: BoxDecoration(
                                        color: Color(0xff333C47),
                                        borderRadius: BorderRadius.circular(
                                            valWidth * 0.013)),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '수면(시간)',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: txtColor,
                                            fontSize: defaultSize * 10),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: valWidth * 0.4,
                                  height: valHeight * 0.1,
                                  color: Colors.grey,
                                  child: MadeLineChart2(scores: _scores),
                                  // child: LineChartNew(scores: _scores),
                                )
                              ]),
                            ],
                          )
                        ],
                      )),
                  SizedBox(height: valHeight * 0.01),
                  Center(
                      child: ElevatedButton(
                    onPressed: () {
                      controller.dateReset(controller.date);
                      controller.reportDayReset(controller.reportDay);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BioScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Color(0xff333C47),
                        minimumSize: Size(valWidth * 0.2, valHeight * 0.038),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(valWidth * 0.02),
                          side: BorderSide(
                              color: Color(0xff999CA2),
                              width: defaultSize * 0.7),
                        )),
                    child: Container(
                      height: valHeight * 0.042,
                      width: valWidth * 0.27,
                      child: Row(
                        children: [
                          Container(
                            width: valWidth * 0.25,
                            padding: EdgeInsets.only(right: valWidth * 0.02),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '생체 데이터',
                                style: TextStyle(
                                    fontSize: defaultSize * 12,
                                    color: txtColor),
                              ),
                            ),
                          ),
                          Center(
                              child: SvgPicture.asset(
                                  'images/arrow towards right_icon.svg',
                                  width: valWidth * 0.01,
                                  height: valHeight * 0.016))
                        ],
                      ),
                    ),
                  )),
                  SizedBox(height: valHeight * 0.025),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            //운동 그래프
                            width: valWidth * 0.4,
                            height: valHeight * 0.2,
                            decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius:
                                    BorderRadius.circular(valWidth * 0.015),
                                boxShadow: [
                                  BoxShadow(
                                      color: shadowColor, blurRadius: 2.2),
                                ]),
                            child: Column(children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  // 좌측 상단 작은 박스
                                  height: valHeight * 0.02,
                                  width: valWidth * 0.2,
                                  margin: EdgeInsets.only(
                                      left: valWidth * 0.04,
                                      top: valHeight * 0.01,
                                      bottom: valHeight * 0.008),
                                  decoration: BoxDecoration(
                                      color: Color(0xff333C47),
                                      borderRadius: BorderRadius.circular(
                                          valWidth * 0.013)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '운동(kcal)',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: txtColor,
                                          fontSize: defaultSize * 10),
                                    ),
                                  ),
                                ),
                              ),
                              FutureBuilder(
                                  future:
                                      ServerConnection.GetEnergyburned(TestUid),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData == false) {
                                      return CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Error: ${snapshot.error}',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      );
                                    } else {
                                      var result = snapshot.data['result'];
                                      List<Score> EnergyList =
                                          List<Score>.generate(4, (index) {
                                        final y = double.parse(
                                            result[3 - index]['EnergyBurned']);
                                        final d = DateTime.now()
                                            .add(Duration(days: index - 3));
                                        return Score(y, d);
                                      });
                                      //print("\n\n debug : $result");
                                      return Container(
                                        width: valWidth * 0.34,
                                        height: valHeight * 0.16,
                                        child: SingleBar(
                                            scores: EnergyList,
                                            Values: true,
                                            LastValueOnly: true,
                                            ShowYaxis: false),
                                      );
                                    }
                                  })
                            ]),
                          ),
                          SizedBox(height: valHeight * 0.015),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.dateReset(controller.date);
                                controller.reportDayReset(controller.reportDay);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ExerciseScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Color(0xff333C47),
                                  minimumSize:
                                      Size(valWidth * 0.2, valHeight * 0.038),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(valWidth * 0.02),
                                    side: BorderSide(
                                        color: Color(0xff999CA2),
                                        width: defaultSize * 0.7),
                                  )),
                              child: Container(
                                height: valHeight * 0.042,
                                width: valWidth * 0.27,
                                child: Row(
                                  children: [
                                    Container(
                                      width: valWidth * 0.25,
                                      padding: EdgeInsets.only(
                                          right: valWidth * 0.02),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '운동 데이터',
                                          style: TextStyle(
                                              fontSize: defaultSize * 12,
                                              color: txtColor),
                                        ),
                                      ),
                                    ),
                                    Center(
                                        child: SvgPicture.asset(
                                            'images/arrow towards right_icon.svg',
                                            width: valWidth * 0.01,
                                            height: valHeight * 0.016))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: valWidth * 0.06),
                      Column(
                        children: [
                          Container(
                            //식단그래프
                            width: valWidth * 0.4,
                            height: valHeight * 0.2,
                            decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius:
                                    BorderRadius.circular(valWidth * 0.015),
                                boxShadow: [
                                  BoxShadow(
                                      color: shadowColor, blurRadius: 2.2),
                                ]),
                            child: Column(children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  // 좌측 상단 작은 박스
                                  height: valHeight * 0.02,
                                  width: valWidth * 0.2,
                                  margin: EdgeInsets.only(
                                      left: valWidth * 0.04,
                                      top: valHeight * 0.01,
                                      bottom: valHeight * 0.008),
                                  decoration: BoxDecoration(
                                      color: Color(0xff333C47),
                                      borderRadius: BorderRadius.circular(
                                          valWidth * 0.013)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '식단(kcal)',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: txtColor,
                                          fontSize: defaultSize * 10),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: valWidth * 0.34,
                                height: valHeight * 0.16,
                                child: GroupBarThreeChart(),
                              )
                            ]),
                          ),
                          SizedBox(height: valHeight * 0.015),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.dateReset(controller.date);
                                controller.reportDayReset(controller.reportDay);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FoodScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Color(0xff333C47),
                                  minimumSize:
                                      Size(valWidth * 0.35, valHeight * 0.038),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(valWidth * 0.02),
                                    side: BorderSide(
                                        color: Color(0xff999CA2),
                                        width: defaultSize * 0.7),
                                  )),
                              child: Container(
                                height: valHeight * 0.042,
                                width: valWidth * 0.27,
                                child: Row(
                                  children: [
                                    Container(
                                      width: valWidth * 0.25,
                                      padding: EdgeInsets.only(
                                          right: valWidth * 0.02),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '식단 데이터',
                                          style: TextStyle(
                                              fontSize: defaultSize * 12,
                                              color: txtColor),
                                        ),
                                      ),
                                    ),
                                    Center(
                                        child: SvgPicture.asset(
                                            'images/arrow towards right_icon.svg',
                                            width: valWidth * 0.01,
                                            height: valHeight * 0.016))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]),
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
