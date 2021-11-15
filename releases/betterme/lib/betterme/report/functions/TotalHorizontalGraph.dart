import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TotalHorizontalChart extends StatefulWidget {
  final sleep;
  const TotalHorizontalChart({Key? key, required this.sleep}) : super(key: key);

  @override
  _TotalHorizontalChart createState() => _TotalHorizontalChart();
}

class _TotalHorizontalChart extends State<TotalHorizontalChart> {
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
    final double left_border = 20.0;
    final double right_border = 10.0;
    final drawableHeight = size.height - 2.0 * right_border;
    final drawableWidth = size.width - left_border - right_border;
    final hd = drawableHeight / 7.0;
    final wd = drawableWidth / 24 / 60 / 60;
    final xd = drawableWidth / 24;
    Paint paint = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Colors.white // 색은 보라색
      ..strokeCap = StrokeCap.round // 선의 끝은 둥글게 함.
      ..strokeWidth = 25.0; // 선의 굵기는 4.0
    Paint paint4 = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Color(0x7BFFFDFD) // 색은 보라색
      ..strokeCap = StrokeCap.butt // 선의 끝은 둥글게 함.
      ..strokeWidth = 1.0; // 선의 굵기는 4.0
    // TODO: implement paint
    final xLabelStyle = TextStyle(color: Colors.white, fontSize: 10);
    Offset c = Offset(left_border, right_border + hd * 7);
    Offset c_x = Offset(left_border, right_border);
    const int dashWidth = 1;
    const int dashSpace = 5;
    double dash_x = left_border;
    Paint paint_ = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Color(0xFF48575F) // 색은 보라색
      ..strokeCap = StrokeCap.round // 선의 끝은 둥글게 함.
      ..strokeWidth = 15.0; // 선의 굵기는 4.0
    Paint paint3 = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Color(0xFF48575F) // 색은 보라색
      ..strokeCap = StrokeCap.butt // 선의 끝은 둥글게 함.
      ..strokeWidth = 15.0; // 선의 굵기는 4.0

    int tmp = 6;
    int temp = 7;
    for (int i = 0; i < 7; i++) {
      sleep[i].forEach((e) {
        print(e);
        print(e[2].split(" ")[1]);
        print('test');
        print(DateTime.parse(e[2]).hour);
        int startTime = DateTime.parse(e[2]).hour * 60 * 60 +
            DateTime.parse(e[2]).minute * 60 +
            DateTime.parse(e[2]).second;
        int endTime = DateTime.parse(e[3]).hour * 60 * 60 +
            DateTime.parse(e[3]).minute * 60 +
            DateTime.parse(e[3]).second;
        // canvas.drawLine(Offset(left_border + wd * startTime, left_border + hd * i),
        //     Offset(left_border + wd * endTime, left_border + hd * i), paint);

        String date = DateTime.parse(e[3]).day == 1
            ? DateTime.parse(e[3]).month.toString() +
                '/' +
                DateTime.parse(e[3]).day.toString()
            : DateTime.parse(e[3]).day.toString();

        drawTextCentered2(
            canvas,
            Offset(left_border / 2, right_border + hd * i),
            date,
            xLabelStyle,
            20);

        canvas.drawLine(
            Offset(left_border + wd * startTime + temp,
                right_border + hd * i - tmp),
            Offset(
                left_border + wd * endTime - temp, right_border + hd * i - tmp),
            paint_);
        canvas.drawLine(
            Offset(left_border + wd * startTime + temp,
                right_border + hd * i + tmp),
            Offset(
                left_border + wd * endTime - temp, right_border + hd * i + tmp),
            paint_);
        canvas.drawLine(
            Offset(left_border + wd * startTime + temp,
                right_border + hd * i + tmp),
            Offset(left_border + wd * startTime + temp,
                right_border + hd * i - tmp),
            paint_);
        canvas.drawLine(
            Offset(
                left_border + wd * endTime - temp, right_border + hd * i + tmp),
            Offset(
                left_border + wd * endTime - temp, right_border + hd * i - tmp),
            paint_);
        canvas.drawLine(
            Offset(left_border + wd * startTime, right_border + hd * i),
            Offset(left_border + wd * endTime, right_border + hd * i),
            paint3);
      });
    }
    paint.strokeWidth = 1.0;
    for (int i = 0; i <= 24; i++) {
      if (i % 4 == 0) {
        drawTextCentered(
            canvas, c - Offset(0, 10), i.toString(), xLabelStyle, xd);
      }
      // canvas.drawLine(c, c_x, paint);
      double start_y = left_border + hd * 6.5; //아래로 시작점
      canvas.drawLine(c - Offset(0, hd / 2), c - Offset(0, hd * 7.54), paint4);
      // while (start_y >= left_border) {
      //   canvas.drawLine(Offset(dash_x, start_y),
      //       Offset(dash_x, start_y - dashWidth), paint);
      //   start_y -= dashSpace;
      // }
      // startX =
      c += Offset(xd, 0);
      dash_x += xd;
    }

    Paint paint2 = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 0.8;

    //아래 가로줄
    double start_y = right_border + hd * 6.5; //아래로 시작점
    canvas.drawLine(Offset(0, -right_border),
        Offset(size.width - right_border, -right_border), paint4);
    canvas.drawLine(
        Offset(0, start_y), Offset(size.width - right_border, start_y), paint2);
    for (int i = 1; i < 7; i++) {
      canvas.drawLine(Offset(0, start_y - i * hd),
          Offset(size.width - right_border, start_y - i * hd), paint4);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
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
    if (text.length == 1) text = '0' + text;
    final tp = measureText(text, style, maxWidth, TextAlign.center);
    final offset = c + Offset(-tp.width / 2.0, 0);
    // final offset = c + Offset(-tp.width / 2.0, -tp.height / 2.0);
    tp.paint(canvas, offset);
    return tp.size;
  }

  Size drawTextCentered2(
      Canvas canvas, Offset c, String text, TextStyle style, double maxWidth) {
    // if (text.length == 1) text = '0' + text;
    final tp = measureText(text, style, maxWidth, TextAlign.center);
    final offset = c + Offset(-tp.width / 2.0, -tp.height / 2.0);
    // final offset = c + Offset(-tp.width / 2.0, -tp.height / 2.0);
    tp.paint(canvas, offset);
    return tp.size;
  }
}
