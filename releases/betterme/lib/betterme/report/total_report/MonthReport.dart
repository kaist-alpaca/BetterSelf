import 'package:betterme/betterme/report/functions/TotalGraphs.dart';
import 'package:betterme/betterme/report/total_report/Tag.dart';
import 'package:betterme/functions/Widgets/DividewithObj.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

class MonthReport extends StatefulWidget {
  @override
  _MonthReport createState() => _MonthReport();
}

class _MonthReport extends State<MonthReport> {
  List<bool> graphTypes = [true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final tagWidth = valWidth / 5.6;
    final leftBlank = valWidth / 9; // 태그 왼쪽 여백
    final blankInterval = valWidth / 45.5; // 태그 사이 여백

    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색

    double miniBoxSize = 0.015;

    double defaultSize = valWidth * 0.0025;

    return GetBuilder<ProfileController>(builder: (controller) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getTags(tagWidth, leftBlank, blankInterval, txtColor, graphTypes),
              SizedBox(
                height: 20,
              ),
              TotalGraphs(GraphTypes: graphTypes, Duration: 31),
            ],
          ),
        ),
      );
    });
  }
}
