import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'line_chart.dart';

class SlicededBarChart extends StatefulWidget {
  final List<Score> scores;
  SlicededBarChart({Key? key, required this.scores}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SlicededBarChart();
}

class _SlicededBarChart extends State<SlicededBarChart> {
  List<BarChartGroupData> barlist = [];
  late double _min, _max;

  final Color dark = const Color(0xFFFF2D8A7);
  final Color normal = const Color(0xFFFDBB9C7);
  final Color light = const Color(0xFFA0B1DF);

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
        alignment: BarChartAlignment.spaceAround,
        barTouchData: BarTouchData(
          enabled: false,
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context, value) =>
                const TextStyle(color: Color(0xff0B202A), fontSize: 10),
            margin: 10,

            /// 여기 임시로 보이는 부분 바꾸기 위해 Color 수정했으니 참고. (안보이게 배경색으로 수정)
            getTitles: (double value) {
              switch (value.toInt()) {
                case 0:
                  return 'Apr';
                case 1:
                  return 'May';
                case 2:
                  return 'Jun';
                case 3:
                  return 'Jul';
                case 4:
                  return 'Aug';
                default:
                  return '';
              }
            },
          ),
          leftTitles: SideTitles(
            showTitles: false,
            reservedSize: 40,
            getTextStyles: (context, value) => const TextStyle(
                color: Color(
                  0xff939393,
                ),
                fontSize: 10),
            margin: 0,
          ),
          topTitles: SideTitles(showTitles: false),
          rightTitles: SideTitles(showTitles: false),
        ),
        gridData: FlGridData(
          show: false,
          checkToShowHorizontalLine: (value) => value % 10 == 0,
          getDrawingHorizontalLine: (value) => FlLine(
            color: const Color(0xffe7e8ec),
            strokeWidth: 1,
          ),
        ),
        borderData: FlBorderData(
          show: true,
        ),
        barGroups: getData(),
      ),
    );
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 1,
        barRods: [
          BarChartRodData(
            y: 17000000000,
            width: 15,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            rodStackItems: [
              BarChartRodStackItem(0, 2000000000, dark),
              BarChartRodStackItem(2000000000, 12000000000, normal),
              BarChartRodStackItem(12000000000, 17000000000, light),
            ],
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 1,
        barRods: [
          BarChartRodData(
            y: 31000000000,
            width: 15,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            rodStackItems: [
              BarChartRodStackItem(0, 11000000000, dark),
              BarChartRodStackItem(11000000000, 18000000000, normal),
              BarChartRodStackItem(18000000000, 31000000000, light),
            ],
          )
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 1,
        barRods: [
          BarChartRodData(
            y: 34000000000,
            width: 15,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            rodStackItems: [
              BarChartRodStackItem(0, 6000000000, dark),
              BarChartRodStackItem(6000000000, 23000000000, normal),
              BarChartRodStackItem(23000000000, 34000000000, light),
            ],
          )
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 1,
        barRods: [
          BarChartRodData(
            y: 14000000000,
            width: 15,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            rodStackItems: [
              BarChartRodStackItem(0, 1000000000.5, dark),
              BarChartRodStackItem(1000000000.5, 12000000000, normal),
              BarChartRodStackItem(12000000000, 14000000000, light),
            ],
          )
        ],
      ),
    ];
  }
}
