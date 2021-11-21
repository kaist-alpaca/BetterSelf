import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'line_chart.dart';

class SingleBar extends StatefulWidget {
  final List<Score> scores;
  final bool Values;
  final bool LastValueOnly;
  final bool ShowYaxis;
  SingleBar(
      {Key? key,
      required this.scores,
      required this.Values,
      required this.LastValueOnly,
      required this.ShowYaxis})
      : super(key: key);

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
      var showTooltip = [1];
      if(widget.Values && widget.LastValueOnly){
        if(e.time == widget.scores.last.time)showTooltip = [0];
      }else if(widget.Values){
        showTooltip = [0];
      }else{
        showTooltip = [1];
      }
      barlist.add(
        BarChartGroupData(x: e.time.month*100+e.time.day,
          barRods: [
            BarChartRodData(
              y: e.value,
              colors: [Color(0xffF2D8A7)],
              width: 15,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
          ],
          showingTooltipIndicators: showTooltip,
        ),
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
                fontSize: 12,
                color: Color(0xFFFFFDFD),
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
            color: Color(0xFFFFFDFD),
            fontSize: 12,
          ),
          margin: 10,
          getTitles: (double value) {
            var tmp = value.toInt();
            return (tmp%100).toString();
          },
        ),
        leftTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      );

  FlBorderData get borderData => FlBorderData(
        // 하단 가로선
        show: true,
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: Color(0xFFFFFDFD),
          ),
        ),
      );
}
