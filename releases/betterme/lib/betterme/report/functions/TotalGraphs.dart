import 'package:betterme/betterme/report/functions/DataType.dart';
import 'package:flutter/material.dart';

class TotalGraphs extends StatefulWidget {
  const TotalGraphs({Key? key}) : super(key: key);

  @override
  _TotalGraphsState createState() => _TotalGraphsState();
}

class _TotalGraphsState extends State<TotalGraphs> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색

    return Container(
        child: CustomPaint(
      size: Size(200, 200),
      painter: PathPainter(),
    ));
  }
}

class PathPainter extends CustomPainter {
  List<bool> GraphTypes = [
    true,
    true,
    true,
    true,
    true,
  ]; // 체중 수면 스트레스 섭취 소모
  List<DateData> WeightData = [
    DateData(
        DateTime.now().subtract(Duration(
            days: 7,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute)),
        70),
    DateData(
        DateTime.now().subtract(Duration(
            days: 6,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute)),
        70),
    DateData(
        DateTime.now().subtract(Duration(
            days: 5,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute)),
        70),
    DateData(
        DateTime.now().subtract(Duration(
            days: 4,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute)),
        70),
    DateData(
        DateTime.now().subtract(Duration(
            days: 3,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute)),
        70),
    DateData(
        DateTime.now().subtract(Duration(
            days: 2,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute)),
        70),
    DateData(
        DateTime.now().subtract(Duration(
            days: 1,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute)),
        70),
    DateData(
        DateTime.now().subtract(Duration(
            days: 0,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute)),
        70)
  ];
  List<double> SleepData = [];
  List<double> StressData = [];
  List<double> DietData = [];
  List<double> BurnedData = [];

  @override
  void paint(Canvas canvas, Size size) {
    final clipRect = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.clipRect(clipRect);
    canvas.drawPaint(Paint()..color = Color(0xff0B202A));

    final datapath = ComputePoints(WeightData, size.width, size.height);

    print("debug : $datapath");

    Paint LinePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = ComputePath(datapath);

    canvas.drawPath(path, LinePaint);
  }

  List<Offset> ComputePoints(List<DateData> p, double width, double height) {
    List<Offset> points = [];
    p.forEach((i) {
      final x = width - (i.time.day - DateTime.now().day);
      final y = height - (i.value);
      final dp = Offset(x, y);
      points.add(dp);
    });
    return points;
  }

  Path ComputePath(List<Offset> points) {
    final path = Path();
    for (int i = 0; i < points.length; i++) {
      final p = points[i];
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
