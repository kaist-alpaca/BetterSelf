import 'package:flutter/material.dart';
import '../../total_coaching/SevenDaysCoaching.dart';
import '../../total_coaching/MonthCoaching.dart';
import '../../total_coaching/YearCoaching.dart';



class CoachingSet extends StatefulWidget {
  const CoachingSet({Key? key, required this.uid, required this.buttonCase}) : super(key: key);

  final uid;
  final buttonCase;

  @override
  _CoachingSet createState() => _CoachingSet();
}

class _CoachingSet extends State<CoachingSet> {
  @override
  Widget build(BuildContext context) {
    if (widget.buttonCase == 0) {
      //7일로 선택되었을 때 표현될 위젯들은 여기에.
      return SevenDaysCoaching(uid: widget.uid,);
    } else if (widget.buttonCase == 1) {
      //31일로 선택되었을 때 표현될 위젯들은 여기에.
      return MonthCoaching(uid: widget.uid,);
    } else if (widget.buttonCase == 2) {
      //12개월로 선택되었을 때 표현될 위젯들은 여기에.
      return YearCoaching(uid: widget.uid,);
    } else {
      return Container();
    }
  }
}
