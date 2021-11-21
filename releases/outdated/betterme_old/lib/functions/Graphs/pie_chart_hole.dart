import 'dart:math';
import 'package:flutter/material.dart';

class MadePieChartHole extends CustomPainter {
  int percentage1 = 0;
  int percentage2 = 0;
  String text;

  MadePieChartHole(
      {required this.percentage1,
      required this.percentage2,
      required this.text});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0XFFA0B1DF)
      ..strokeWidth = 8.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = min(size.width / 2 - paint.strokeWidth / 2,
        size.height / 2 - paint.strokeWidth / 2);
    Offset center = Offset(size.width / 2, size.height / 2);
    double arcAngle1 = 2 * pi * (percentage1 / 100);
    double arcAngle2 = 2 * pi * (percentage2 / 100);
    double arcAngle3 = 2 * pi * ((100 - percentage1 - percentage2) / 100);

    double tmp = pi / 20;
    // tmp = 0;

    // canvas.drawCircle(center, radius, paint);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -pi / 2 + tmp, arcAngle1 - tmp * 2, false, paint);
    paint..color = Color(0XFFDBB9C7);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -pi / 2 + arcAngle1 + tmp, arcAngle2 - tmp * 2, false, paint);
    paint..color = Color(0XFFF2D8A7);
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2 + arcAngle1 + arcAngle2 + tmp,
        arcAngle3 - tmp * 2,
        false,
        paint);

    double fontSize = 12;

    TextSpan sp = TextSpan(
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
            color: Color(0XFFFFFDFD)),
        text: text); // TextSpan은 Text위젯과 거의 동일하다.
    TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr);

    tp.layout(); // 필수! 텍스트 페인터에 그려질 텍스트의 크기와 방향를 정함.
    double dx = size.width / 2 - tp.width / 2;
    double dy = size.height / 2 - tp.height / 2;

    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(MadePieChartHole old) {
    return true;
  }
}
