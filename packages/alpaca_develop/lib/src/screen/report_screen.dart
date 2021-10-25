import 'dart:math';

import 'package:alpaca_develop/src/chart/line_chart.dart';
import 'package:alpaca_develop/src/chart/line_chart3.dart';
import 'package:alpaca_develop/src/chart/line_chart2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alpaca_develop/src/pages/report_page/inbody_page/inbody_screen.dart';
import 'package:alpaca_develop/src/pages/report_page/food_page/food_screen.dart';
import 'package:alpaca_develop/src/pages/report_page/exercise_page/exercise_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
    double defaultSize = valWidth * 0.0025;
    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
      ),
      body: ListView(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  '코칭',
                  style: TextStyle(fontSize: defaultSize * 12),
                ),
                height: valHeight * 0.05,
                margin: EdgeInsets.only(
                    left: valWidth * 0.14, top: valHeight * 0.03),
              ),
              Container(
                child: Text('여기에는 코칭 내용이 들어갈 예정입니다.'),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3)),
                width: valWidth * 0.84,
                margin: EdgeInsets.only(left: valWidth * 0.08),
                height: valHeight * 0.23,
              ),
              Container(
                child: Text(
                  '데이터',
                  style: TextStyle(fontSize: defaultSize * 12),
                ),
                height: valHeight * 0.05,
                margin: EdgeInsets.only(
                    left: valWidth * 0.14, top: valHeight * 0.03),
              ),
              GestureDetector(
                //여기를 누르면 인바디 및 기타등등으로 넘어감. (pages-> reportpage 참조.)
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InbodyScreen()));
                },
                child: Container(
                  color: Colors.grey,
                  height: 0.2 * valHeight,
                  width: valWidth * 0.84,
                  margin: EdgeInsets.only(left: valWidth * 0.08),
                  child: madeLineChart(scores: _scores),
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
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
