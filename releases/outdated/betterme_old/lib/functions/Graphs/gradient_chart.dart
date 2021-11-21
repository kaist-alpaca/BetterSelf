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
  late List<DateTime> _X;
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
      _X = widget.scores.map((e) => e.time).toList();
      data = widget.scores.asMap().entries.map((e) {
        return FlSpot((e.value.time.millisecondsSinceEpoch).toDouble(), e.value.value);
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
      List<DateTime> x, List<double> y, double min, double max) {
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
      backgroundColor: Color(0xff0B202A),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          getTextStyles: (context, value) => const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
          getTitles: (double value) {
            var tmp = DateTime.fromMillisecondsSinceEpoch(value.toInt());
            return "${tmp.day}:${tmp.hour}h";
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
      minX: x.first.millisecondsSinceEpoch.toDouble(),
      maxX: x.last.millisecondsSinceEpoch.toDouble(),
      minY: 0,
      maxY: _max+5,
      lineBarsData: [
        LineChartBarData(
          spots: data,
          colors: [Color(0xFFFFFFFF)],
          barWidth: 1,
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
