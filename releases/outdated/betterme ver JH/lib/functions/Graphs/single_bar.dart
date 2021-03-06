import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'line_chart.dart';

class SingleBar extends StatefulWidget {
  final List<Score> scores;
  SingleBar({Key? key, required this.scores}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SingleBar();
}

class _SingleBar extends State<SingleBar> {
  List<BarChartGroupData> barlist = [];
  late double _min, _max;

  @override
  void initState() {
    super.initState();
    var min = double.maxFinite;
    var max = -double.maxFinite;
    widget.scores.forEach((e) {
      barlist.add(
        BarChartGroupData(x: e.time.day, barRods: [
          BarChartRodData(
            y: e.value,
            colors: [Color(0xffF2D8A7)],
            width: 15,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ]),
      );
      min = min > e.value ? e.value : min;
      max = max < e.value ? e.value : max;
    });
    setState(() {
      _min = min;
      _max = max;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
          barTouchData: barTouchData,
          titlesData: titlesData,
          borderData: borderData,
          barGroups: barlist,
          alignment: BarChartAlignment.spaceAround,
          maxY: _max,
          gridData: FlGridData(show: false)),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.y.round().toString(),
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          margin: 10,
          getTitles: (double value) {
            print(value);
            return value.toInt().toString();
          },
        ),
        leftTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Color(0xFFFFFFFF),
          ),
        ),
      );
}
