import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'line_chart.dart';

class GradientChart extends StatefulWidget {
  final List<Score> scores;
  GradientChart({Key? key, required this.scores}) : super(key: key);

  @override
  State<GradientChart> createState() => _GradientChartState();
}

class _GradientChartState extends State<GradientChart> {
  final List<Color> _gradientColors = [
    const Color(0xFFFB6E65),
    const Color(0xFFFAD86D),
    const Color(0xFFB6D87C),
  ];
  late double _min, _max;
  late List<double> _Y;
  late List<String> _X;
  late List<FlSpot> data;

  @override
  void initState() {
    super.initState();
    var min = double.maxFinite;
    var max = -double.maxFinite;
    widget.scores.forEach((e) {
      min = min > e.value ? e.value : min;
      max = max < e.value ? e.value : max;
    });

    setState(() {
      _min = min;
      _max = max;
      _Y = widget.scores.map((e) => e.value).toList();
      _X = widget.scores.map((e) => "${e.time.day}").toList();
      data = widget.scores.asMap().entries.map((e) {
        return FlSpot(e.value.time.day.toDouble(), e.value.value);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    return LineChart(
      mainChart(_X, _Y, _min, _max),
    );
  }

  LineChartData mainChart(
      List<String> x, List<double> y, double min, double max) {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          getTextStyles: (context, value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            // print('bottomTitles $value');
            // switch (value.toInt()) {
            //   case 2:
            //     return 'MAR';
            //   case 5:
            //     return 'JUN';
            //   case 8:
            //     return 'SEP';
            // }
            // return '';

            // print(value);
            return value.toInt().toString();
          },
          // margin: 8,
        ),
        rightTitles: SideTitles(
          showTitles: false,
        ),
        topTitles: SideTitles(
          showTitles: false,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xFF004D99),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            // print('leftTitles $value');
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 10,
          // margin: 12,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      minX: 22,
      maxX: 28,
      minY: 0,
      maxY: _max,
      lineBarsData: [
        LineChartBarData(
          // spots: [
          //   FlSpot(0, 3),
          //   FlSpot(2.6, 5.5),
          //   FlSpot(4.9, 6),
          //   FlSpot(6.8, 5.8),
          //   FlSpot(8, 4),
          //   FlSpot(9.5, 3),
          //   FlSpot(11, 4),
          // ],
          spots: data,
          // colors: [
          //   const Color(0xFF6FFF7C),
          //   const Color(0xFF0087FF),
          //   const Color(0xFF5620FF),
          // ],
          colors: [Color(0xFFFFFFFF)],
          // shadow:
          // colorStops: const [0.25, 0.5, 0.75],
          // gradientFrom: const Offset(0.5, 0),
          // gradientTo: const Offset(0.5, 1),
          barWidth: 1,
          // shadow: BoxShadow(
          //   color: Colors.black,
          //   spreadRadius: 10,
          //   blurRadius: 3,
          //   offset: Offset(0, 3),
          //   spreadRadius = -9,
          // ),
          shadow: Shadow(
            color: Colors.black,
            offset: Offset(0, 3),
            blurRadius: 2.2,
          ),
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            colors:
                _gradientColors.map((color) => color.withOpacity(1)).toList(),
            gradientColorStops: const [0.25, 0.5, 0.75],
            gradientFrom: const Offset(0.5, 0),
            gradientTo: const Offset(0.5, 1),
          ),
          // isCurved: true,
          // colors: gradientColors,
          // barWidth: 5,
          // isStrokeCapRound: true,
          // dotData: FlDotData(
          //   show: true,
          // ),
          // belowBarData: BarAreaData(
          //   show: true,
          //   colors:
          //       gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          // ),
        ),
      ],
    );
  }
}
