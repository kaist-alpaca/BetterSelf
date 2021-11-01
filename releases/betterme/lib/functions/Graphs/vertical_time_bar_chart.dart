import 'package:flutter/material.dart';

class VerticalTimeBarChart extends StatefulWidget {
  final activity;
  const VerticalTimeBarChart({Key? key, required this.activity})
      : super(key: key);

  @override
  _VerticalTimeBarChart createState() => _VerticalTimeBarChart();
}

class _VerticalTimeBarChart extends State<VerticalTimeBarChart> {
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
        painter: CustomeScatterChartPainter(widget.activity),
      ),
    );
  }
}

class CustomeScatterChartPainter extends CustomPainter {
  final activity;
  CustomeScatterChartPainter(this.activity);

  @override
  void paint(Canvas canvas, Size size) {
    final double border = 10.0;
    final drawableHeight = size.height - 2.0 * border;
    final drawableWidth = size.width - 2.0 * border;
    final xd = drawableWidth / 24;
    final yd = drawableWidth / 450;
    Paint paint = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Color(0XFF53525E) // 색은 보라색
      ..strokeCap = StrokeCap.round // 선의 끝은 둥글게 함.
      ..strokeWidth = 5.0; // 선의 굵기는 4.0
    // TODO: implement paint
    double start_x = border;
    double start_y = border + drawableHeight;
    for (int i = 0; i <= 24; i++) {
      // drawTextCentered(canvas, c, i.toString(), xLabelStyle, xd);
      // canvas.drawLine(c, c_x, paint);
      canvas.drawLine(Offset(start_x, start_y), Offset(start_x, border), paint);
      start_x += xd;
    }
    paint..color = Color(0XFFAAB0D8);
    activity.forEach((e) {
      canvas.drawLine(Offset(border + xd * e[0], start_y),
          Offset(border + xd * e[0], start_y - yd * e[1]), paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }
}
