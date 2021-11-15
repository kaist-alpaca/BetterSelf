import 'package:betterme/betterme/report/functions/DataType.dart';
import 'package:flutter/material.dart';

class TotalGraphs extends StatefulWidget {

  TotalGraphs({Key? key, required this.GraphTypes}) : super(key: key);

  List<bool> GraphTypes;   // 체중 수면 스트레스 섭취 소모

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
<<<<<<< HEAD
      child : CustomPaint(
        size: Size(valWidth, valHeight/2.8),
        painter: PathPainter(widget.GraphTypes),
      )
    );
=======
        child: CustomPaint(
      size: Size(200, 200),
      painter: PathPainter(),
    ));
>>>>>>> develop
  }
}

class PathPainter extends CustomPainter {
<<<<<<< HEAD

  List<bool> GraphTypes = [true, true, true, true, true];

  PathPainter(List<bool> e){
    GraphTypes = e;
  }

  List<DateData> WeightData = [
    DateData(DateTime.now().subtract(Duration(days: 7, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 70),
    DateData(DateTime.now().subtract(Duration(days: 6, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 70.5),
    DateData(DateTime.now().subtract(Duration(days: 5, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 71),
    DateData(DateTime.now().subtract(Duration(days: 4, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 72),
    DateData(DateTime.now().subtract(Duration(days: 3, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 74),
    DateData(DateTime.now().subtract(Duration(days: 2, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 70),
    DateData(DateTime.now().subtract(Duration(days: 1, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 71),
    DateData(DateTime.now().subtract(Duration(days: 0, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 69)];
  List<DateData> SleepData = [
    DateData(DateTime.now().subtract(Duration(days: 7, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 20),
    DateData(DateTime.now().subtract(Duration(days: 6, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 70),
    DateData(DateTime.now().subtract(Duration(days: 5, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 90),
    DateData(DateTime.now().subtract(Duration(days: 4, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 80),
    DateData(DateTime.now().subtract(Duration(days: 3, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 60),
    DateData(DateTime.now().subtract(Duration(days: 2, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 84),
    DateData(DateTime.now().subtract(Duration(days: 1, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 82),
    DateData(DateTime.now().subtract(Duration(days: 0, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 80)];
  List<DateData> StressData = [
    DateData(DateTime.now().subtract(Duration(days: 7, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 40),
    DateData(DateTime.now().subtract(Duration(days: 6, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 50),
    DateData(DateTime.now().subtract(Duration(days: 5, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 60),
    DateData(DateTime.now().subtract(Duration(days: 4, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 70),
    DateData(DateTime.now().subtract(Duration(days: 3, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 80),
    DateData(DateTime.now().subtract(Duration(days: 2, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 94),
    DateData(DateTime.now().subtract(Duration(days: 1, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 22),
    DateData(DateTime.now().subtract(Duration(days: 0, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 10)];
  List<DateData> DietData = [
    DateData(DateTime.now().subtract(Duration(days: 7, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 20),
    DateData(DateTime.now().subtract(Duration(days: 6, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 70),
    DateData(DateTime.now().subtract(Duration(days: 5, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 90),
    DateData(DateTime.now().subtract(Duration(days: 4, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 80),
    DateData(DateTime.now().subtract(Duration(days: 3, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 60),
    DateData(DateTime.now().subtract(Duration(days: 2, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 84),
    DateData(DateTime.now().subtract(Duration(days: 1, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 82),
    DateData(DateTime.now().subtract(Duration(days: 0, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 80)];
  List<DateData> BurnedData = [
    DateData(DateTime.now().subtract(Duration(days: 7, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 70),
    DateData(DateTime.now().subtract(Duration(days: 6, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 10),
    DateData(DateTime.now().subtract(Duration(days: 5, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 10),
    DateData(DateTime.now().subtract(Duration(days: 4, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 20),
    DateData(DateTime.now().subtract(Duration(days: 3, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 50),
    DateData(DateTime.now().subtract(Duration(days: 2, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 94),
    DateData(DateTime.now().subtract(Duration(days: 1, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 42),
    DateData(DateTime.now().subtract(Duration(days: 0, hours: DateTime.now().hour, minutes: DateTime.now().minute)), 30)];

  final LineSize = 0.7;
=======
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
>>>>>>> develop

  @override
  void paint(Canvas canvas, Size size) {

    double XPadd_right = 30;
    double YPadd_bottom = 30;
    double YPadd_top = 0;

    double LineSize = 1.5;

    final clipRect = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.clipRect(clipRect);

    canvas.drawPaint(Paint()..color = Color(0xff0B202A));

    final GraphXSize = size.width - XPadd_right;

    final GraphYSize = size.height - YPadd_bottom;

    final floorCorrection = 20;
    final floor = (GraphYSize+floorCorrection) / 5;
    //////////////////////////////////////////////////////////////////////////////////////Underbar

    Paint LinePaint = Paint()
      ..color = Color(0xffFFFDFD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(0, GraphYSize);
    path.lineTo(GraphXSize, GraphYSize);
    canvas.drawPath(path, LinePaint);

    path.close();

    //////////////////////////////////////////////////////////////////////////////////////XLabel
    for(int i = 0 ; i < 7 ; i++){
      final XGridUnit = GraphXSize / 7;
      final x = GraphXSize - i * XGridUnit - 6;
      final y = size.height - YPadd_bottom + 6;

      final p = Offset(x, y);


      final textPainter = (DateTime.now().subtract(Duration(days: i)).day == 1)? TextPainter(
        text: TextSpan(
            text: '${DateTime.now().subtract(Duration(days: i)).month}/${DateTime.now().subtract(Duration(days: i)).day}',
            style: TextStyle(fontSize: 12, color: Color(0xffFFFDFD))
        ),
        textDirection: TextDirection.ltr,
      ) : TextPainter(
        text: TextSpan(
            text: '${DateTime.now().subtract(Duration(days: i)).day}',
            style: TextStyle(fontSize: 12, color: Color(0xffFFFDFD))
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      textPainter.paint(canvas, p);
    }
    //////////////////////////////////////////////////////////////////////////////////////YSubLine
    for(int i = 1 ; i < 7 ; i++){
      final XGridUnit = GraphXSize / 7;
      final x = GraphXSize - i * XGridUnit;
      final y = GraphYSize - 1;

      Paint LinePaint = Paint()
        ..color = Color(0xff858E93)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.75;

      Path path = Path();
      path.moveTo(x, y);
      path.lineTo(x, YPadd_top);
      canvas.drawPath(path, LinePaint);

      path.close();

    }
    //////////////////////////////////////////////////////////////////////////////////////weight_label
    for(int i = 0 ; i < 7 ; i++){
      final XGridUnit = GraphXSize / 7;
      final x = GraphXSize - i * XGridUnit - 7;
      final y = size.height - YPadd_bottom - 1.2*floor;

      final p = Offset(x, y);

      final textPainter = (null != WeightData[WeightData.length - 1 - i])? TextPainter(
        text: TextSpan(
            text: '${WeightData[WeightData.length - 1 - i].value}',
            style: TextStyle(fontSize: 7, color: Color(0xff858E93))
        ),
        textDirection: TextDirection.ltr,
      ) : TextPainter(
        text: TextSpan(text: ''),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      textPainter.paint(canvas, p);
    }
    //////////////////////////////////////////////////////////////////////////////////////weight

    if(GraphTypes[0]){

      double min = 1000;
      double max = 0;
      WeightData.forEach((e) {
        if(e.value < min)min = e.value;
        if(e.value > min)max = e.value;
      });

      WeightData.forEach((e) {
        e.value = (e.value - min) / (max - min) * 0.4 * floor;
        e.value /= 2;
        e.value += floor*0.3;//correction
      });

      var datapath = ComputePoints(WeightData, GraphXSize, GraphYSize);

      print("debug : $datapath");

      Paint LinePaint = Paint()
        ..color = Color(0xffFFFDFD)
        ..style = PaintingStyle.stroke
        ..strokeWidth = LineSize;

      Path path = ComputePath(datapath);
      canvas.drawPath(path, LinePaint);

      path.close();
    }
    //////////////////////////////////////////////////////////////////////////////////////Sleep
    if(GraphTypes[1]){

      SleepData.forEach((e) {
        e.value = e.value/2;
        e.value += floor*2 + YPadd_bottom;
      });

      var datapath = ComputePoints(SleepData, GraphXSize, GraphYSize);

      print("debug : $datapath");

      Paint LinePaint = Paint()
        ..color = Color(0xffA0B1DF)
        ..style = PaintingStyle.stroke
        ..strokeWidth = LineSize;

      Path path = ComputePath(datapath);
      canvas.drawPath(path, LinePaint);

      path.close();
    }
    //////////////////////////////////////////////////////////////////////////////////////Stress
    if(GraphTypes[2]){

      StressData.forEach((e) {
        e.value = e.value/2;
        e.value += floor*2 + YPadd_bottom;
      });

      var datapath = ComputePoints(StressData, GraphXSize, GraphYSize);

      print("debug : $datapath");

      Paint LinePaint = Paint()
        ..color = Color(0xffF2D8A7)
        ..style = PaintingStyle.stroke
        ..strokeWidth = LineSize;

      Path path = ComputePath(datapath);
      canvas.drawPath(path, LinePaint);

      path.close();
    }
    //////////////////////////////////////////////////////////////////////////////////////Diet
    if(GraphTypes[3]){

      DietData.forEach((e) {
        e.value = e.value/2;
        e.value += floor + YPadd_bottom;
      });

      var datapath = ComputePoints(DietData, GraphXSize, GraphYSize);

      print("debug : $datapath");

      Paint LinePaint = Paint()
        ..color = Color(0xffD2ABBA)
        ..style = PaintingStyle.stroke
        ..strokeWidth = LineSize;

      Path path = ComputePath(datapath);
      canvas.drawPath(path, LinePaint);

      path.close();
    }
    //////////////////////////////////////////////////////////////////////////////////////Burned
    if(GraphTypes[4]){

      BurnedData.forEach((e) {
        e.value = e.value/2;
        e.value += floor + YPadd_bottom;
      });

      var datapath = ComputePoints(BurnedData, GraphXSize, GraphYSize);

      print("debug : $datapath");

      Paint LinePaint = Paint()
        ..color = Color(0xff8DBFBC)
        ..style = PaintingStyle.stroke
        ..strokeWidth = LineSize;

      Path path = ComputePath(datapath);
      canvas.drawPath(path, LinePaint);

      path.close();
    }
  }

  List<Offset> ComputePoints(List<DateData> p, double width, double height) {
    List<Offset> points = [];
    p.forEach((i) {
      final XGridUnit = width / 7;
      final x = width - (DateTime.now().day - i.time.day) * XGridUnit;
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
