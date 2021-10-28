import 'package:flutter/material.dart';

Widget DividewithObj(BuildContext context, Widget CenterObj, double Rratio, double Lratio) {

  final valWidth = MediaQuery.of(context).size.width;

  return Row(
    children: [
      Container(
        width: valWidth * Rratio,
        child: Divider(
          color: Colors.pink[100],
          thickness: 1.0,
        ),
      ),
      CenterObj,
      Container(
        width: valWidth * Lratio,
        child: Divider(
          color: Colors.pink[100],
          thickness: 1.0,
        ),
      ),
    ],
  );
}