
import 'package:betterself_trainer/functions/Controllers/profile_controller.dart';
import 'package:betterself_trainer/functions/Controllers/server_connection.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TotalHorizontalChart extends StatefulWidget {
  const TotalHorizontalChart({Key? key}) : super(key: key);

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
    return Stack(
      children: [
        Container(
          child: CustomPaint(
            child: Container(),
            painter: CustomeScatterChartPainter(),
          ),
        ),
        FutureBuilder<List<dynamic>>(
          future: ServerConnection.total_seven_sleep(
              ProfileController.to.originMyProfile.uid == null
                  ? ''
                  : ProfileController.to.originMyProfile.uid!,
              ProfileController.to.datelist),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              // print(snapshot.data!);
              // print(snapshot.data!.length);
              return Container(
                child: CustomPaint(
                  child: Container(),
                  painter: CustomeScatterChartPainterSleep(snapshot.data!),
                ),
              );
            } else {
              // print('do not have data');
              return Container();
            }
          },
        ),
        FutureBuilder<List<dynamic>>(
          future: ServerConnection.total_seven_food(
              ProfileController.to.originMyProfile.uid == null
                  ? ''
                  : ProfileController.to.originMyProfile.uid!,
              ProfileController.to.datelist),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              // print('seven food');
              // print(snapshot.data!);
              // print(snapshot.data!.length);
              return Container(
                child: CustomPaint(
                  child: Container(),
                  painter: CustomeScatterChartPainterFood(snapshot.data!),
                ),
              );
            } else {
              // print('do not have data');
              return Container();
            }
          },
        ),
      ],
    );
  }
}

class CustomeScatterChartPainter extends CustomPainter {
  CustomeScatterChartPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final double left_border = 20.0;
    final double right_border = 10.0;
    final drawableWidth = size.width - left_border - right_border;
    // final hd = drawableHeight / 7.0;
    final hd = drawableWidth / 24 * 1.5;
    final wd = drawableWidth / 24 / 60 / 60;
    final xd = drawableWidth / 24;
    Paint paint = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Colors.white // 색은 보라색
      ..strokeCap = StrokeCap.round // 선의 끝은 둥글게 함.
      ..strokeWidth = 25.0; // 선의 굵기는 4.0
    Paint paint4 = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Color(0x7BFFFDFD) // 색은 보라색
      ..strokeCap = StrokeCap.butt // 선의 끝은 둥글게 함.
      ..strokeWidth = 0.5; // 선의 굵기는 4.0
    Paint paint5 = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Color(0x7BFFFDFD) // 색은 보라색
      ..strokeCap = StrokeCap.butt // 선의 끝은 둥글게 함.
      ..strokeWidth = 1.0; // 선의 굵기는 4.0
    // TODO: implement paint
    final xLabelStyle = TextStyle(color: Colors.white, fontSize: 12);
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
    // DateTime today = DateTime.now();
    DateTime today = ProfileController.to.totaldate;
    for (int i = 0; i < 7; i++) {
      int startTime = today.hour * 60 * 60 + today.minute * 60 + today.second;
      int endTime = today.hour * 60 * 60 + today.minute * 60 + today.second;
      // canvas.drawLine(Offset(left_border + wd * startTime, left_border + hd * i),
      //     Offset(left_border + wd * endTime, left_border + hd * i), paint);

      String date = today.day == 1
          ? today.month.toString() + '/' + today.day.toString()
          : today.day.toString();

      drawTextCentered2(
          canvas,
          Offset(left_border / 2, right_border * 0 + hd * i),
          date,
          xLabelStyle,
          30);
      today = today.subtract(Duration(days: 1));
      // sleep[i].forEach((e) {
      // print(e);
      // print(e[2].split(" ")[1]);
      // print('test');
      // print(DateTime.parse(e[2]).hour);
      // int startTime = DateTime.parse(e[2]).hour * 60 * 60 +
      //     DateTime.parse(e[2]).minute * 60 +
      //     DateTime.parse(e[2]).second;
      // int endTime = DateTime.parse(e[3]).hour * 60 * 60 +
      //     DateTime.parse(e[3]).minute * 60 +
      //     DateTime.parse(e[3]).second;
      // canvas.drawLine(Offset(left_border + wd * startTime, left_border + hd * i),
      //     Offset(left_border + wd * endTime, left_border + hd * i), paint);

      // String date = DateTime.parse(e[3]).day == 1
      //     ? DateTime.parse(e[3]).month.toString() +
      //         '/' +
      //         DateTime.parse(e[3]).day.toString()
      //     : DateTime.parse(e[3]).day.toString();

      // drawTextCentered2(
      //     canvas,
      //     Offset(left_border / 2, right_border + hd * i),
      //     date,
      //     xLabelStyle,
      //     20);

      // canvas.drawLine(
      //     Offset(left_border + wd * startTime + temp,
      //         right_border + hd * i - tmp),
      //     Offset(
      //         left_border + wd * endTime - temp, right_border + hd * i - tmp),
      //     paint_);
      // canvas.drawLine(
      //     Offset(left_border + wd * startTime + temp,
      //         right_border + hd * i + tmp),
      //     Offset(
      //         left_border + wd * endTime - temp, right_border + hd * i + tmp),
      //     paint_);
      // canvas.drawLine(
      //     Offset(left_border + wd * startTime + temp,
      //         right_border + hd * i + tmp),
      //     Offset(left_border + wd * startTime + temp,
      //         right_border + hd * i - tmp),
      //     paint_);
      // canvas.drawLine(
      //     Offset(
      //         left_border + wd * endTime - temp, right_border + hd * i + tmp),
      //     Offset(
      //         left_border + wd * endTime - temp, right_border + hd * i - tmp),
      //     paint_);
      // canvas.drawLine(
      //     Offset(left_border + wd * startTime, right_border + hd * i),
      //     Offset(left_border + wd * endTime, right_border + hd * i),
      //     paint3);
      // },
      // );
    }
    paint.strokeWidth = 1.0;
    for (int i = 0; i <= 24; i++) {
      if (i % 4 == 0) {
        drawTextCentered(
            canvas, c - Offset(0, hd * 0.7), i.toString(), xLabelStyle, xd * 2);
        canvas.drawLine(c - Offset(0, hd), c - Offset(0, hd * 8), paint5);
      }
      // canvas.drawLine(c, c_x, paint);
      canvas.drawLine(c - Offset(0, hd), c - Offset(0, hd * 8), paint4);
      c += Offset(xd, 0);
      dash_x += xd;
    }

    Paint paint2 = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 0.8;

    //아래 가로줄
    double start_y = right_border + hd * 6; //아래로 시작점
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

class CustomeScatterChartPainterSleep extends CustomPainter {
  final sleep;
  CustomeScatterChartPainterSleep(this.sleep);

  @override
  void paint(Canvas canvas, Size size) {
    final double left_border = 20.0;
    final double right_border = 10.0;
    final drawableWidth = size.width - left_border - right_border;
    // final hd = drawableHeight / 7.0;
    final hd = drawableWidth / 24 * 1.5;
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
      ..strokeWidth = 8.0; // 선의 굵기는 4.0
    Paint paint3 = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Color(0xFF48575F) // 색은 보라색
      ..strokeCap = StrokeCap.butt // 선의 끝은 둥글게 함.
      ..strokeWidth = 4.0; // 선의 굵기는 4.0

    int tmp = 3;
    int temp = 7;
    // print("what....?");
    // print(sleep.runtimeType);
    // print(sleep[0]);
    for (int i = 0; i < 7; i++) {
      sleep[i].forEach((e) {
        // print(e);
        // print(e[2].split(" ")[1]);
        // print('test');
        // print(DateTime.parse(e[2]).hour);
        if (e[2] != 0) {
          // print(e[2]);
          // print(e[2].runtimeType);

          String date = DateTime.parse(e[3]).day == 1
              ? DateTime.parse(e[3]).month.toString() +
                  '/' +
                  DateTime.parse(e[3]).day.toString()
              : DateTime.parse(e[3]).day.toString();

          // drawTextCentered2(
          //     canvas,
          //     Offset(left_border / 2, right_border + hd * i),
          //     date,
          //     xLabelStyle,
          //     20);

          if (e[0] == e[1]) {
            int startTime = DateTime.parse(e[2]).hour * 60 * 60 +
                DateTime.parse(e[2]).minute * 60 +
                DateTime.parse(e[2]).second;
            int endTime = DateTime.parse(e[3]).hour * 60 * 60 +
                DateTime.parse(e[3]).minute * 60 +
                DateTime.parse(e[3]).second;
            // canvas.drawLine(Offset(left_border + wd * startTime, left_border + hd * i),
            //     Offset(left_border + wd * endTime, left_border + hd * i), paint);

            //print(startTime);

            canvas.drawLine(
                Offset(left_border + wd * startTime + temp, hd * i - tmp),
                Offset(left_border + wd * endTime - temp, hd * i - tmp),
                paint_);
            canvas.drawLine(
                Offset(left_border + wd * startTime + temp, hd * i + tmp),
                Offset(left_border + wd * endTime - temp, hd * i + tmp),
                paint_);
            canvas.drawLine(
                Offset(left_border + wd * startTime + temp, hd * i + tmp),
                Offset(left_border + wd * startTime + temp, hd * i - tmp),
                paint_);
            canvas.drawLine(
                Offset(left_border + wd * endTime - temp, hd * i + tmp),
                Offset(left_border + wd * endTime - temp, hd * i - tmp),
                paint_);
            // canvas.drawLine(Offset(left_border + wd * startTime, hd * i),
            //     Offset(left_border + wd * endTime, hd * i), paint3);
          } else {
            // print('differnet');
            int startTime = DateTime.parse(e[2]).hour * 60 * 60 +
                DateTime.parse(e[2]).minute * 60 +
                DateTime.parse(e[2]).second;
            int endTime = 23 * 60 * 60 + 59 * 60 + 59;
            // canvas.drawLine(Offset(left_border + wd * startTime, left_border + hd * i),
            //     Offset(left_border + wd * endTime, left_border + hd * i), paint);

            // print(startTime);

            if (i != 6) {
              canvas.drawLine(
                  Offset(
                      left_border + wd * startTime + temp, hd * (i + 1) - tmp),
                  Offset(left_border + wd * endTime - temp, hd * (i + 1) - tmp),
                  paint_);
              canvas.drawLine(
                  Offset(
                      left_border + wd * startTime + temp, hd * (i + 1) + tmp),
                  Offset(left_border + wd * endTime - temp, hd * (i + 1) + tmp),
                  paint_);
              canvas.drawLine(
                  Offset(
                      left_border + wd * startTime + temp, hd * (i + 1) + tmp),
                  Offset(
                      left_border + wd * startTime + temp, hd * (i + 1) - tmp),
                  paint_);
              canvas.drawLine(
                  Offset(left_border + wd * endTime - temp, hd * (i + 1) + tmp),
                  Offset(left_border + wd * endTime - temp, hd * (i + 1) - tmp),
                  paint_);
              // canvas.drawLine(
              //     Offset(left_border + wd * startTime, hd * (i + 1)),
              //     Offset(left_border + wd * endTime, hd * (i + 1)),
              //     paint3);
            }

            startTime = 0;
            endTime = DateTime.parse(e[3]).hour * 60 * 60 +
                DateTime.parse(e[3]).minute * 60 +
                DateTime.parse(e[3]).second;
            var endTime11 =
                DateTime.parse('2021-11-12 00:00:00.000').hour * 60 * 60 +
                    DateTime.parse('2021-11-12 00:00:00.000').minute * 60 +
                    DateTime.parse('2021-11-12 00:00:00.000').second;

            // print(left_border + wd * startTime + temp);
            // print(endTime11);
            // print(startTime);
            // print(DateTime.parse('2021-11-12 00:00:00.000').hour);
            // print(DateTime.parse('2021-11-12 00:00:00.000').minute);
            // print(DateTime.parse('2021-11-12 00:00:00.000').second);
            // print('!!!!!!!!!!!!!!!!!!!!!!!@@@@');
            // print(left_border + wd * endTime - temp);

            if (left_border + wd * endTime - temp < 23) {
              canvas.drawLine(
                  Offset(left_border + wd * startTime + temp, hd * i - tmp),
                  Offset(25, hd * i - tmp),
                  paint_);
              canvas.drawLine(
                  Offset(left_border + wd * startTime + temp, hd * i + tmp),
                  Offset(25, hd * i + tmp),
                  paint_);
              canvas.drawLine(
                  Offset(left_border + wd * startTime + temp, hd * i + tmp),
                  Offset(left_border + wd * startTime + temp, hd * i - tmp),
                  paint_);
              canvas.drawLine(
                  Offset(25, hd * i + tmp), Offset(25, hd * i - tmp), paint_);
              // canvas.drawLine(Offset(left_border + wd * startTime, hd * i),
              //     Offset(left_border + wd * endTime, hd * i), paint3);
            } else {
              canvas.drawLine(
                  Offset(left_border + wd * startTime + temp, hd * i - tmp),
                  Offset(left_border + wd * endTime - temp, hd * i - tmp),
                  paint_);
              canvas.drawLine(
                  Offset(left_border + wd * startTime + temp, hd * i + tmp),
                  Offset(left_border + wd * endTime - temp, hd * i + tmp),
                  paint_);
              canvas.drawLine(
                  Offset(left_border + wd * startTime + temp, hd * i + tmp),
                  Offset(left_border + wd * startTime + temp, hd * i - tmp),
                  paint_);
              canvas.drawLine(
                  Offset(left_border + wd * endTime - temp, hd * i + tmp),
                  Offset(left_border + wd * endTime - temp, hd * i - tmp),
                  paint_);
              // canvas.drawLine(
              //     Offset(left_border + wd * startTime, right_border + hd * i),
              //     Offset(left_border + wd * endTime, right_border + hd * i),
              //     paint3);
            }
          }
        }
      });
    }

    Paint paintline = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Color(0xff0B202A) // 색은 보라색
      ..strokeCap = StrokeCap.square // 선의 끝은 둥글게 함.
      ..strokeWidth = 15.0; // 선의 굵기는 4.0
    canvas.drawLine(Offset(left_border + drawableWidth + 8.5, -5),
        Offset(left_border + drawableWidth + 8.5, hd * 6.5), paintline);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }
}

class CustomeScatterChartPainterFood extends CustomPainter {
  final food;
  CustomeScatterChartPainterFood(this.food);

  @override
  void paint(Canvas canvas, Size size) {
    final double left_border = 20.0;
    final double right_border = 10.0;
    final drawableHeight = size.height - 2.0 * right_border;
    final drawableWidth = size.width - left_border - right_border;
    // final hd = drawableHeight / 7.0;
    final hd = drawableWidth / 24 * 1.5;
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
      // ..color = Color(0xFF48575F) // 색은 보라색
      ..color = Colors.red // 색은 보라색
      ..strokeCap = StrokeCap.round // 선의 끝은 둥글게 함.
      ..strokeWidth = 8.0; // 선의 굵기는 4.0
    Paint paint3 = Paint() // Paint 클래스는 어떤 식으로 화면을 그릴지 정할 때 쓰임.
      ..color = Color(0xFF48575F) // 색은 보라색
      ..strokeCap = StrokeCap.butt // 선의 끝은 둥글게 함.
      ..strokeWidth = 4.0; // 선의 굵기는 4.0

    int tmp = 2;
    int temp = 2;
    // print('food !!!!!!!!!!!!!!!!!');
    for (int i = 0; i < 7; i++) {
      food[i].forEach((e) {
        if (e[1] != 0) {
          // print(e[2]);

          switch (e[2]) {
            case '아침':
              paint_..color = Color(0xff8DBFBC);
              break;
            case '점심':
              paint_..color = Color(0xffF2D8A7);
              break;
            case '저녁':
              paint_..color = Color(0xffA0B1DF);
              break;
            case '간식':
              paint_..color = Color(0xffD2ABBA);
          }

          int startTime = DateTime.parse(e[1]).hour * 60 * 60 +
              DateTime.parse(e[1]).minute * 60 +
              DateTime.parse(e[1]).second;
          canvas.drawLine(
              Offset(left_border + wd * startTime + temp, hd * i - tmp),
              Offset(left_border + wd * startTime - temp, hd * i - tmp),
              paint_);
          canvas.drawLine(
              Offset(left_border + wd * startTime + temp, hd * i + tmp),
              Offset(left_border + wd * startTime - temp, hd * i + tmp),
              paint_);
          canvas.drawLine(
              Offset(left_border + wd * startTime + temp, hd * i + tmp),
              Offset(left_border + wd * startTime + temp, hd * i - tmp),
              paint_);
          canvas.drawLine(
              Offset(left_border + wd * startTime - temp, hd * i + tmp),
              Offset(left_border + wd * startTime - temp, hd * i - tmp),
              paint_);
        }
      });
    }
    // paint.strokeWidth = 1.0;
    // for (int i = 0; i <= 24; i++) {
    //   if (i % 4 == 0) {
    //     drawTextCentered(
    //         canvas, c - Offset(0, 10), i.toString(), xLabelStyle, xd);
    //   }
    //   // canvas.drawLine(c, c_x, paint);
    //   double start_y = left_border + hd * 6.5; //아래로 시작점
    //   canvas.drawLine(c - Offset(0, hd / 2), c - Offset(0, hd * 7.54), paint4);
    //   // while (start_y >= left_border) {
    //   //   canvas.drawLine(Offset(dash_x, start_y),
    //   //       Offset(dash_x, start_y - dashWidth), paint);
    //   //   start_y -= dashSpace;
    //   // }
    //   // startX =
    //   c += Offset(xd, 0);
    //   dash_x += xd;
    // }

    // Paint paint2 = Paint()
    //   ..color = Colors.white
    //   ..strokeCap = StrokeCap.square
    //   ..strokeWidth = 0.8;

    // //아래 가로줄
    // double start_y = right_border + hd * 6.5; //아래로 시작점
    // canvas.drawLine(Offset(0, -right_border),
    //     Offset(size.width - right_border, -right_border), paint4);
    // canvas.drawLine(
    //     Offset(0, start_y), Offset(size.width - right_border, start_y), paint2);
    // for (int i = 1; i < 7; i++) {
    //   canvas.drawLine(Offset(0, start_y - i * hd),
    //       Offset(size.width - right_border, start_y - i * hd), paint4);
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
    return true;
  }
}
