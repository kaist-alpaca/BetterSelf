import 'package:betterme/betterme/report/functions/TotalGraphs.dart';
import 'package:betterme/betterme/report/Widgets/MiniBox.dart';
import 'package:betterme/betterme/report/functions/TotalHorizontalGraph.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:betterme/functions/Widgets/WidgetInfo.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

import 'Tag.dart';

class SevenDaysReport extends StatefulWidget {
  SevenDaysReport({Key? key}) : super(key: key);

  @override
  _SevenDaysReport createState() => _SevenDaysReport();
}

// TotalGraphs(
//       {Key? key,
//       required this.GraphTypes,
//       required this.Duration,
//       required this.count})
//       : super(key: key);

//   List<bool> GraphTypes; // 체중 수면 스트레스 섭취 소모
//   int Duration;
//   int count;

class _SevenDaysReport extends State<SevenDaysReport> {
  List<bool> graphTypes = [true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    // final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    double miniBoxSize = 0.015;

    HomeGraphInfo homeinfo = HomeGraphInfo(valWidth);

    return GetBuilder<ProfileController>(builder: (controller) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Tag 기능
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: homeinfo.indent_tag),
                  wholeTag(homeinfo),
                  SizedBox(width: homeinfo.blank_tags),
                  Tag(homeinfo, 1),
                ],
              ),
              SizedBox(height: homeinfo.blank_spaceTags),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: homeinfo.indent_tag),
                  Tag(homeinfo, 2),
                  SizedBox(
                    width: homeinfo.blank_tags,
                  ),
                  Tag(homeinfo, 3),
                  SizedBox(
                    width: homeinfo.blank_tags,
                  ),
                  Tag(homeinfo, 4),
                  SizedBox(
                    width: homeinfo.blank_tags,
                  ),
                  Tag(homeinfo, 5),
                ],
              ),
              SizedBox(height: homeinfo.blank_tagcontainer),
              //그래프 : 7일 default
              TotalGraphs(GraphTypes: graphTypes, Duration: 7),
              SizedBox(
                height: homeinfo.blank_graph1,
              ),
              /////////////  그래프 2 설명 /////////////
              Row(
                // 여기는 식단/수면 그래프 색 설명해줌.
                children: [
                  SizedBox(width: homeinfo.indent_graph2Exp),
                  MiniBox(
                      context, Color(0xff48575F), miniBoxSize, 0.08, 10, '수면'),
                  MiniBox(
                      context, Color(0xff8DBFBC), miniBoxSize, 0.08, 10, '아침'),
                  MiniBox(
                      context, Color(0xffF2D8A7), miniBoxSize, 0.08, 10, '점심'),
                  MiniBox(
                      context, Color(0xffA0B1DF), miniBoxSize, 0.08, 10, '저녁'),
                  MiniBox(
                      context, Color(0xffD2ABBA), miniBoxSize, 0.08, 10, '간식'),
                ],
              ),
              SizedBox(
                height: homeinfo.blank_graph2ExpContainer,
              ),
              Container(
                height: valWidth * 0.95 / 24 * 7 * 1.7,
                width: valWidth * 0.95,
                margin: EdgeInsets.fromLTRB(
                    valWidth * 0.025, homeinfo.blank_graph2ExpContainer, 0, 0),
                child: TotalHorizontalChart(),
              ),
            ],
          ),
        ),
      );
    });
  }

  GestureDetector wholeTag(HomeGraphInfo homeinfo) {
    return GestureDetector(
      onTap: () {
        ServerConnection.write_log('ReportScreen', 'month_tag_whole', '');
        setState(
          () {
            (graphTypes.contains(true))
                ? {
                    for (var i = 0; i < graphTypes.length; i++)
                      {graphTypes[i] = false} //모두 끈다
                  }
                : {
                    for (var i = 0; i < graphTypes.length; i++)
                      {graphTypes[i] = true} //모두 끈다
                  };
          },
        );
      },
      child: Container(
        height: homeinfo.tag_height,
        width: homeinfo.tag_width,
        color: homeinfo.tag_colorDefault,
        child: Container(
          decoration: TagBoundary(homeinfo, 0),
          child: TagText(
            homeinfo,
            0,
          ),
        ),
      ),
    );
  }

  GestureDetector Tag(HomeGraphInfo homeinfo, int graphNum) {
    return GestureDetector(
        onTap: () {
          ServerConnection.write_log(
              'ReportScreen', 'month_tag_' + graphNum.toString(), '');
          setState(() {
            graphTypes[graphNum - 1] = !graphTypes[graphNum - 1];
          });
        },
        child: Container(
          height: homeinfo.tag_height,
          width: homeinfo.tag_width,
          color: homeinfo.tag_colorDefault,
          child: Container(
            decoration: TagBoundary(homeinfo, graphNum),
            child: TagText(homeinfo, graphNum),
          ),
        ));
  }
}
