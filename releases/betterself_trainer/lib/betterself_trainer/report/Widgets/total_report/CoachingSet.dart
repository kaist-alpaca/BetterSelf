import 'package:flutter/material.dart';
import '../../total_coaching/SevenDaysCoaching.dart';
import '../../total_coaching/MonthCoaching.dart';
import '../../total_coaching/YearCoaching.dart';

int? buttonCase;

class CoachingSet extends StatefulWidget {
  CoachingSet(int a) {
    buttonCase = a;
  }

  @override
  _CoachingSet createState() => _CoachingSet();
}

class _CoachingSet extends State<CoachingSet> {
  @override
  Widget build(BuildContext context) {
    if (buttonCase == 0) {
      //7일로 선택되었을 때 표현될 위젯들은 여기에.
      return SevenDaysCoaching();
    } else if (buttonCase == 1) {
      //31일로 선택되었을 때 표현될 위젯들은 여기에.
      return MonthCoaching();
    } else if (buttonCase == 2) {
      //12개월로 선택되었을 때 표현될 위젯들은 여기에.
      return YearCoaching();
    } else {
      return Container();
    }
  }
}
