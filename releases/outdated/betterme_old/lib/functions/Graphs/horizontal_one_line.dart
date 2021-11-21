import 'package:flutter/material.dart';

class MadeHorizontalOneLineChart extends StatefulWidget {
  final percentage;
  const MadeHorizontalOneLineChart({Key? key, required this.percentage})
      : super(key: key);

  @override
  _MadeHorizontalOneLineChart createState() => _MadeHorizontalOneLineChart();
}

class _MadeHorizontalOneLineChart extends State<MadeHorizontalOneLineChart> {
  @override
  void initState() {
    super.initState();

    setState(() {});
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
        painter: CustomeScatterChartPainter(widget.percentage),
      ),
    );
  }
}

class CustomeScatterChartPainter extends CustomPainter {
  final percentage;
  CustomeScatterChartPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final double border = 10.0;
    final drawableWidth = size.width - 2.0 * border;
    final wd = drawableWidth / 100;
    Paint paint = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Color(0XFF53525E) // 색은 보라색
      ..strokeCap = StrokeCap.round // 선의 끝은 둥글게 함.
      ..strokeWidth = 11.0; // 선의 굵기는 4.0
    // TODO: implement paint
    canvas.drawLine(
        Offset(border, border), Offset(border + drawableWidth, border), paint);
    paint..color = Color(0XFFD2ABBA);
    canvas.drawLine(Offset(border, border),
        Offset(border + wd * percentage, border), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }
}
