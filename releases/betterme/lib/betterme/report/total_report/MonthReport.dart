import 'package:betterme/betterme/report/functions/TotalGraphs.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:betterme/functions/Widgets/WidgetInfo.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

import 'package:betterme/betterme/report/total_report/Tag.dart';

class MonthReport extends StatefulWidget {
  @override
  _MonthReport createState() => _MonthReport();
}

class _MonthReport extends State<MonthReport> {
  @override
  Widget build(BuildContext context) {
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final HomeGraphInfo homeinfo = HomeGraphInfo(valWidth);

    return GetBuilder<ProfileController>(builder: (controller) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: homeinfo.indent_tag),
                  wholeTag(homeinfo),
                  SizedBox(width: homeinfo.blank_tags),
                  Tag(homeinfo, 1),
                ],
              ),
              SizedBox(
                height: homeinfo.blank_spaceTags,
              ),
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
              SizedBox(
                width: homeinfo.blank_tagcontainer,
              ),
              TotalGraphs(GraphTypes: graphTypes, Duration: 31),
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
            for (var i = 0; i < graphTypes.length; i++) {
              graphTypes[i] = !graphTypes[0];
            } //모두 끈다
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
            graphTypes[graphNum] = !graphTypes[graphNum];

            graphTypes[0] = false;
            for (int i = 1; i < graphTypes.length; i++) {
              if (graphTypes[i] == true) {
                graphTypes[0] = true;
                break;
              }
            }
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
