
import 'package:betterself_trainer/betterself_trainer/coaching/report/total_report/MonthReport.dart';
import 'package:betterself_trainer/betterself_trainer/coaching/report/total_report/SevenDaysReport.dart';
import 'package:betterself_trainer/betterself_trainer/coaching/report/total_report/YearReport.dart';
import 'package:flutter/material.dart';


// int? buttonCase;

class ReportSet extends StatefulWidget {
  // ReportSet(int a) {
  //   buttonCase = a;
  // }
  ReportSet({Key? key, required this.buttonCase, required this.uid}) : super(key: key);

  final uid;
  int buttonCase;
  @override
  _ReportSet createState() => _ReportSet();
}

class _ReportSet extends State<ReportSet> {
  @override
  Widget build(BuildContext context) {
    if (widget.buttonCase == 0) {
      //7일로 선택되었을 때 표현될 위젯들은 여기에.
      return SevenDaysReport(uid: widget.uid);
    } else if (widget.buttonCase == 1) {
      //31일로 선택되었을 때 표현될 위젯들은 여기에.
      return MonthReport(uid: widget.uid);
    } else if (widget.buttonCase == 2) {
      //12개월로 선택되었을 때 표현될 위젯들은 여기에.
      return YearReport(uid: widget.uid);
    } else {
      return Container();
    }
  }
}
