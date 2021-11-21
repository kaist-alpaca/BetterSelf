import 'dart:math';
import 'package:flutter/material.dart';

class MadePieChart extends CustomPainter {
  int percentage = 0;
  double textScaleFactor = 1.0;
  Color textColor;

  MadePieChart(
      {required this.percentage,
      required this.textScaleFactor,
      required this.textColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0XFFA0B1DF)
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    Paint middle = Paint()
      ..color = Colors.black54
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5)
      ..strokeWidth = 1.3;

    double radius = min(size.width / 2 - paint.strokeWidth / 2,
        size.height / 2 - paint.strokeWidth / 2);
    Offset center = Offset(size.width / 2, size.height / 2);
    double arcAngle = 2 * pi * (percentage / 100);
    final x = radius * sin(arcAngle);
    final y = -radius * cos(arcAngle);

    canvas.drawCircle(center, radius, paint);
    paint..color = Color(0xFFDBB9C7);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, true, paint);
    canvas.drawLine(center, center + Offset(x, y), middle);
    middle..strokeCap = StrokeCap.butt;
    Path path = Path();
    path.moveTo(size.width / 2, size.height / 2);
    path.lineTo(size.width / 2 + x, size.width / 2 + y);
  }

  void drawText(Canvas canvas, Size size, String text) {
    double fontSize = getFontSize(size, text);

    TextSpan sp = TextSpan(
        style: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: textColor),
        text: text);
    TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr);

    tp.layout();
    double dx = size.width / 2 - tp.width / 2;
    double dy = size.height / 2 - tp.height / 2;

    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  double getFontSize(Size size, String text) {
    return size.width / text.length * textScaleFactor;
  }

  @override
  bool shouldRepaint(MadePieChart old) {
    return old.percentage != percentage;
  }
}
