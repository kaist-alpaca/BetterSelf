import 'package:flutter/material.dart';

Widget MiniBox(BuildContext context, Color boxColor, double boxRatio,
    double txtRatio, double fontSize, String txt) {
  final valWidth = MediaQuery.of(context).size.width;
  final valHeight = MediaQuery.of(context).size.height;
  double defaultSize = valWidth * 0.0025;

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: valHeight * boxRatio,
        height: valHeight * boxRatio,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(valWidth * boxRatio * 0.3),
            color: boxColor),
      ),
      Container(
        margin: EdgeInsets.only(left: valWidth * 0.01),
        width: valWidth * txtRatio * 1.18,
        child: Text(
          txt,
          style: TextStyle(
            fontSize: defaultSize * fontSize,
            color: Color(0xffFFFDFD),
          ),
          textAlign: TextAlign.start,
        ),
      )
    ],
  );
}
