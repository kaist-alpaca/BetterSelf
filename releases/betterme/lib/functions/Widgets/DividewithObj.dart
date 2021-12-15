import 'package:betterme/functions/Widgets/WidgetInfo.dart';
import 'package:flutter/material.dart';

Widget DividewithObj(
    BuildContext context, Widget CenterObj, double Rratio, double Lratio) {
  final valWidth = MediaQuery.of(context).size.width;
  HomeCoachingInfo homeinfo = HomeCoachingInfo(valWidth);

  return Row(
    children: [
      Container(
        width: valWidth * Lratio,
        child: Divider(
          color: homeinfo.color_homeDivder,
          thickness: 1,
        ),
      ),
      CenterObj,
      Container(
        width: valWidth * Rratio,
        child: Divider(
          color: homeinfo.color_homeDivder,
          thickness: 1,
        ),
      ),
    ],
  );
}
