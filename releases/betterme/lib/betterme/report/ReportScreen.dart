import 'dart:math';

import 'package:betterme/functions/Graphs/gradient_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  late List<Score> _scores;
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
          appBar: AppBar(
            backgroundColor: bgColor,
            title: Text(
                controller.date.month.toString() +
                    "월 " +
                    controller.date.day.toString() +
                    "일",
                style: TextStyle(fontSize: defaultSize * 17, color: txtColor),
                textAlign: TextAlign.center),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                controller.dateMinus(controller.date);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  controller.datePlus(controller.date);
                },
              ),
            ],
          ),
          body: ListView(children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: valHeight * 0.035,
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
                    height: valHeight * 0.02,
                  ),
                  GestureDetector(
                    //여기를 누르면 인바디 및 기타등등으로 넘어감. (pages-> reportpage 참조.)
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BioScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(valWidth * 0.015),
                          boxShadow: [
                            BoxShadow(color: shadowColor, blurRadius: 2.2),
                          ]),
                      height: valHeight * 0.35,
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
                          decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius:
                                  BorderRadius.circular(valWidth * 0.015),
                              boxShadow: [
                                BoxShadow(color: shadowColor, blurRadius: 2.2),
                              ]),
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
                          decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius:
                                  BorderRadius.circular(valWidth * 0.015),
                              boxShadow: [
                                BoxShadow(color: shadowColor, blurRadius: 2.2),
                              ]),
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
