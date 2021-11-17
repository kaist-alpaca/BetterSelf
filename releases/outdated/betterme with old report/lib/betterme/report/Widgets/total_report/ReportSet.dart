import 'package:flutter/material.dart';

import 'package:betterme/betterme/report/total_report/SevenDaysReport.dart';
import 'package:betterme/betterme/report/total_report/MonthReport.dart';
import 'package:betterme/betterme/report/total_report/YearReport.dart';

int? buttonCase;

class ReportSet extends StatefulWidget {
  ReportSet(int a) {
    buttonCase = a;
  }

  @override
  _ReportSet createState() => _ReportSet();
}

class _ReportSet extends State<ReportSet> {
  @override
  Widget build(BuildContext context) {
    if (buttonCase == 0) {
      //7일로 선택되었을 때 표현될 위젯들은 여기에.
      return SevenDaysReport();
    } else if (buttonCase == 1) {
      //31일로 선택되었을 때 표현될 위젯들은 여기에.
      return MonthReport();
    } else if (buttonCase == 2) {
      //12개월로 선택되었을 때 표현될 위젯들은 여기에.
      return YearReport();
    } else {
      return Container();
    }
  }
}
