import 'package:flutter/material.dart';

import 'line_chart.dart';

// class Score {
//   late double value;
//   late DateTime time;
//   Score(this.value, this.time);
// }

class LineChartBodyChange extends StatefulWidget {
  final List<Score> scores;
  const LineChartBodyChange({Key? key, required this.scores}) : super(key: key);

  @override
  _LineChartBodyChangeState createState() => _LineChartBodyChangeState();
}

class _LineChartBodyChangeState extends State<LineChartBodyChange> {
  late double _min, _max;
  late List<double> _Y;
  late List<String> _X;

  @override
  void initState() {
    super.initState();
    var min = double.maxFinite;
    var max = -double.maxFinite;
    widget.scores.forEach((e) {
      min = min > e.value ? e.value : min;
      max = max < e.value ? e.value : max;
    });

    setState(() {
      _min = min;
      _max = max;
      _Y = widget.scores.map((e) => e.value).toList();
      _X = widget.scores.map((e) => "${e.time.day}").toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색

    return Container(
      child: CustomPaint(
        child: Container(),
        painter: customeLineChartPainter(_X, _Y, _min, _max),
      ),
    );
  }
}

class customeLineChartPainter extends CustomPainter {
  final List<String> x;
  final List<double> y;
  final double min, max;
  customeLineChartPainter(this.x, this.y, this.min, this.max);

  final linePaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeWidth = 0.5;

  final dotPaintFill = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill
    ..strokeWidth = 1.0;

  final ylabelStyle = TextStyle(color: Colors.white, fontSize: 11);
  final xLabelStyle = TextStyle(color: Colors.white, fontSize: 12);
  static double border = 10.0;
  static double radius = 5.0;
  @override
  void paint(Canvas canvas, Size size) {
    final clipRect = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.clipRect(clipRect);
    canvas.drawPaint(Paint()..color = Color(0xff0B202A));
    final drawableHeight = size.height - 2.0 * border; // 보더
    final drawableWidth = size.width - 2.0 * border;
    final hd = drawableHeight / (max * 1.2); // 여기서 최대 값을 바꿀 수 있습니다
    final wd = drawableWidth / (this.x.length.toDouble() - 1);

    Offset c = Offset(border, drawableHeight);

    print(max);
    print("printint max !!!!!!");

    final path = Path();
    int i = 0;
    y.forEach((dp) {
      // canvas.drawCircle(dp, 5.0, dotPaintFill);
      print("y value");
      print(dp);
      Offset p = c - Offset(0, hd * dp);
      canvas.drawCircle(p, 5.0, dotPaintFill);
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
        i = 1;
      } else {
        path.lineTo(p.dx, p.dy);
      }
      c += Offset(wd, 0);
    });

    canvas.drawPath(path, linePaint);

    for (int i = 0; i < this.x.length.toDouble(); i++) {
      drawTextCentered(canvas, Offset(border + i * wd, border + drawableHeight),
          i.toString(), xLabelStyle, 3);
    }

    // final height = hd * 3.0; // 얘가 위에 있는 선 그래프 공간 차지율
    // final width = drawableWidth;
    // if (height <= 0.0 || width <= 0.0) return;
    // if (max - min < 1.0e-6) return;

    // final hr = height / (max - min);

    // final left = border;
    // final top = border;
    // final c = Offset(left + wd / 2.0, top + height / 2.0);
    // _drawOutline(canvas, c, wd, height);

    // final points = _computePoints(c, wd, height, hr);
    // final path = _computePath(points);
    // final labels = _computeLabels();
    // canvas.drawPath(path, linePaint);
    // _drawDataPoints(canvas, points, dotPaintFill);
    // _drawYLabels(canvas, labels, points, c, wd, top);

    // final c1 = Offset(c.dx, top + 4 * hd);
    // _drawXLabels(canvas, c1, wd);
  }

  void _drawXLabels(Canvas canvas, Offset c, double wd) {
    x.forEach((xp) {
      drawTextCentered(canvas, c, xp, xLabelStyle, wd);
      c += Offset(wd, 0);
    });
  }

  void _drawYLabels(Canvas canvas, List<String> labels, List<Offset> points,
      Offset c, double wd, double top) {
    var i = 0;
    labels.forEach((label) {
      final dp = points[i];
      final dy = (dp.dy - 15.0) < top ? 15.0 : -15.0;
      final ly = dp + Offset(0, dy);
      drawTextCentered(canvas, ly, label, ylabelStyle, wd);
      i++;
    });
  }

  void _drawDataPoints(Canvas canvas, List<Offset> points, Paint dotPaintFill) {
    points.forEach((dp) {
      canvas.drawCircle(dp, 5.0, dotPaintFill);
    });
  }

  Path _computePath(List<Offset> points) {
    final path = Path();
    for (var i = 0; i < points.length; i++) {
      final p = points[i];
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    return path;
  }

  List<Offset> _computePoints(
      Offset c, double width, double height, double hr) {
    List<Offset> points = [];
    y.forEach((yp) {
      final yy = height - (yp - min) * hr;
      final dp = Offset(c.dx, c.dy - height / 2.0 + yy);
      points.add(dp);
      c += Offset(width, 0);
    });
    return points;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

  final Paint outlinePaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;
  void _drawOutline(Canvas canvas, Offset c, double width, double height) {
    y.forEach((p) {
      final rect = Rect.fromCenter(center: c, width: width, height: height);
      canvas.drawRect(rect, outlinePaint);
      c += Offset(width, 0);
    });
  }

  List<String> _computeLabels() {
    return y.map((yp) => "${yp.toStringAsFixed(1)}").toList();
  }

  TextPainter measureText(
      String s, TextStyle style, double maxWidth, TextAlign align) {
    final span = TextSpan(text: s, style: style);
    final tp = TextPainter(
        text: span, textAlign: align, textDirection: TextDirection.ltr);
    tp.layout(minWidth: 0, maxWidth: maxWidth);
    return tp;
  }

  Size drawTextCentered(
      Canvas canvas, Offset c, String text, TextStyle style, double maxWidth) {
    final tp = measureText(text, style, maxWidth, TextAlign.center);
    final offset = c + Offset(-tp.width / 2.0, -tp.height / 2.0);
    tp.paint(canvas, offset);
    return tp.size;
  }
}
