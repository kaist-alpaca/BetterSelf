import 'package:flutter/material.dart';

Widget MiniCircle(BuildContext context, Color boxColor, double boxRatio,
    double txtRatio, double fontSize, String txt) {
  final valWidth = MediaQuery.of(context).size.width;
  final valHeight = MediaQuery.of(context).size.height;
  double defaultSize = valWidth * 0.0025;

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
          radius: valHeight * boxRatio * 0.5, backgroundColor: boxColor),
      Container(
        width: valWidth * txtRatio,
        child: Text(
          txt,
          style: TextStyle(
            fontSize: defaultSize * fontSize,
            color: Color(0xffFFFDFD),
          ),
          textAlign: TextAlign.center,
        ),
      )
    ],
  );
}
