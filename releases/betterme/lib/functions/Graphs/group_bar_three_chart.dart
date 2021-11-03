import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GroupBarThreeChart extends StatefulWidget {
  const GroupBarThreeChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GroupBarThreeChart();
}

class _GroupBarThreeChart extends State<GroupBarThreeChart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          BarChart(
            BarChartData(
              borderData: FlBorderData(
                border: Border(
                  top: BorderSide.none,
                  right: BorderSide.none,
                  left: BorderSide(width: 1),
                  bottom: BorderSide(width: 1),
                ),
              ),
              gridData: FlGridData(show: false),
              // groupsSpace: 3,
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 20,
                  getTextStyles: (context, value) => const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                  getTitles: (value) {
                    return value.toInt().toString();
                  },
                ),
                topTitles: SideTitles(showTitles: false),
                leftTitles: SideTitles(showTitles: false),
                rightTitles: SideTitles(showTitles: false),
              ),
              barGroups: [
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      y: 3,
                      width: 7,
                      colors: [Color(0xFFFDBB9C7)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    BarChartRodData(
                      y: 4.2,
                      width: 7,
                      colors: [Color(0xFFFF2D8A7)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    BarChartRodData(
                      y: 5,
                      width: 7,
                      colors: [Color(0xFFA0B1DF)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(
                      y: 8,
                      width: 7,
                      colors: [Color(0xFFFDBB9C7)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    BarChartRodData(
                      y: 6.2,
                      width: 7,
                      colors: [Color(0xFFFF2D8A7)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    BarChartRodData(
                      y: 8,
                      width: 7,
                      colors: [Color(0xFFA0B1DF)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(
                      y: 13,
                      width: 7,
                      colors: [Color(0xFFFDBB9C7)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    BarChartRodData(
                      y: 9.1,
                      width: 7,
                      colors: [Color(0xFFFF2D8A7)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    BarChartRodData(
                      y: 5.3,
                      width: 7,
                      colors: [Color(0xFFA0B1DF)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [
                    BarChartRodData(
                      y: 5,
                      width: 7,
                      colors: [Color(0xFFFDBB9C7)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    BarChartRodData(
                      y: 11,
                      width: 7,
                      colors: [Color(0xFFFF2D8A7)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    BarChartRodData(
                      y: 5,
                      width: 7,
                      colors: [Color(0xFFA0B1DF)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Divider(
                color: Colors.white,
                thickness: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
