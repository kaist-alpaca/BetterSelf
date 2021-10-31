import 'package:flutter/material.dart';

class MadeHorizontalChart extends StatefulWidget {
  final sleep;
  const MadeHorizontalChart({Key? key, required this.sleep}) : super(key: key);

  @override
  _MadeHorizontalChart createState() => _MadeHorizontalChart();
}

class _MadeHorizontalChart extends State<MadeHorizontalChart> {
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
        painter: CustomeScatterChartPainter(widget.sleep),
      ),
    );
  }
}

class CustomeScatterChartPainter extends CustomPainter {
  final sleep;
  CustomeScatterChartPainter(this.sleep);

  @override
  void paint(Canvas canvas, Size size) {
    final double border = 10.0;
    final drawableHeight = size.height - 2.0 * border;
    final drawableWidth = size.width - 2.0 * border;
    final hd = drawableHeight / 7.0;
    final wd = drawableWidth / 24 / 60;
    final xd = drawableWidth / 7;
    final dotPaintFill1 = Paint()
      ..color = Color(0XFF9BC3C1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;
    final dotPaintFill2 = Paint()
      ..color = Color(0XFFF2D8A7)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;
    final dotPaintFill3 = Paint()
      ..color = Color(0XFFA0B1DF)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;
    final dotPaintFill4 = Paint()
      ..color = Color(0XFFDBB9C7)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;
    Paint paint = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Colors.white // 색은 보라색
      ..strokeCap = StrokeCap.round // 선의 끝은 둥글게 함.
      ..strokeWidth = 10.0; // 선의 굵기는 4.0
    // TODO: implement paint
    final xLabelStyle = TextStyle(
        color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold);
    Offset c = Offset(border, border + hd * 7);
    Offset c_x = Offset(border, border);
    const int dashWidth = 1;
    const int dashSpace = 5;
    double dash_x = border;
    for (int i = 0; i < 7; i++) {
      sleep[i].forEach((e) {
        print(e);
        print(e[2]);
        canvas.drawLine(Offset(border + wd * e[1], border + hd * i),
            Offset(border + wd * e[2], border + hd * i), paint);
      });
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }
}
