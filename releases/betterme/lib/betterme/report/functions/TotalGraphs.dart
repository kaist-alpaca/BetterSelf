import 'package:betterme/betterme/report/functions/DataType.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:flutter/material.dart';

class TotalGraphs extends StatefulWidget {
  TotalGraphs({Key? key, required this.GraphTypes, required this.Duration})
      : super(key: key);

  List<bool> GraphTypes; // 체중 수면 스트레스 섭취 소모
  int Duration;

  @override
  _TotalGraphsState createState() => _TotalGraphsState();
}

class _TotalGraphsState extends State<TotalGraphs> {
  List<dynamic> date = [];
  // DateTime time = DateTime.now().add(Duration(days: -7));
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    // int test = ProfileController.to.initalDatelist(widget.Duration);

    // // int k = widget.Duration;
    // int k = 10;
    // time = time.add(Duration(days: -k));
    // for (int i = 0; i < widget.Duration; i++) {
    //   var tmp = time
    //       .add(Duration(days: -i))
    //       .toString()
    //       .substring(0, 10)
    //       .replaceAll("-", "_");
    //   date.add(tmp);
    // }

    // print('send date');
    // print(time);

    int tmpcnt = 0;
    widget.GraphTypes.forEach((e) {
      print("dedbug e : $e");
      if(e) tmpcnt++;
    });
    print("dedbug tmpcnt : $tmpcnt");

    bool isshowingone = (tmpcnt == 1);

    return Stack(
      children: [
        Container(
          child: CustomPaint(
            size: Size(valWidth, valHeight / 2.8),
            painter: PathPainter(widget.GraphTypes, widget.Duration,
                ProfileController.to.totaldate),
          ),
        ),
        FutureBuilder<List<dynamic>>(
          future: ServerConnection.total_weight(
            ProfileController.to.originMyProfile.uid == null
                ? ''
                : ProfileController.to.originMyProfile.uid!,
            ProfileController.to.datelist,
          ),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              // print('have data');
              // print(snapshot.data);
              // print(snapshot.data!);
              if (widget.GraphTypes[0] &&
                  (ProfileController.to.total_graph_type == 0 ||
                      ProfileController.to.total_graph_type == 3)) {
                return Container(
                    child: CustomPaint(
                  size: Size(valWidth, valHeight / 2.8),
                  // willChange: true,
                  painter: PathPainterWeight(snapshot.data!, widget.Duration,
                      ProfileController.to.totaldate, isshowingone),
                ));
              } else {
                return Container();
              }
            } else {
              // print('do not have data');
              return Container();
            }
          },
        ),
        FutureBuilder<List<dynamic>>(
          future: ServerConnection.total_sleep(
            ProfileController.to.originMyProfile.uid == null
                ? ''
                : ProfileController.to.originMyProfile.uid!,
            ProfileController.to.datelist,
          ),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              if (widget.GraphTypes[1] &&
                  (ProfileController.to.total_graph_type <= 1)) {
                // print('date list');
                // print(ProfileController.to.datelist);
                // print('have data');
                // print(snapshot.data);
                // print(snapshot.data!);
                return Container(
                    child: CustomPaint(
                  size: Size(valWidth, valHeight / 2.8),
                  painter: PathPainterSleep(snapshot.data!, widget.Duration,
                      ProfileController.to.totaldate, isshowingone),
                ));
              } else {
                return Container();
              }
            } else {
              // print('do not have data');
              return Container();
            }
          },
        ),
        FutureBuilder<List<dynamic>>(
          future: ServerConnection.total_stress(
            ProfileController.to.originMyProfile.uid == null
                ? ''
                : ProfileController.to.originMyProfile.uid!,
            ProfileController.to.datelist,
          ),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              if (widget.GraphTypes[2] &&
                  (ProfileController.to.total_graph_type <= 1)) {
                // print('have data');
                // print(snapshot.data);
                // print(snapshot.data!);
                return Container(
                    child: CustomPaint(
                  size: Size(valWidth, valHeight / 2.8),
                  painter: PathPainterStress(snapshot.data!, widget.Duration,
                      ProfileController.to.totaldate, isshowingone),
                ));
              } else {
                return Container();
              }
            } else {
              // print('do not have data');
              return Container();
            }
          },
        ),
        FutureBuilder<List<dynamic>>(
          future: ServerConnection.total_food(
            ProfileController.to.originMyProfile.uid == null
                ? ''
                : ProfileController.to.originMyProfile.uid!,
            ProfileController.to.datelist,
          ),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              if (widget.GraphTypes[3] &&
                  (ProfileController.to.total_graph_type == 0 ||
                      ProfileController.to.total_graph_type == 2)) {
                // print('have data');
                // print(snapshot.data);
                // print(snapshot.data!);
                return Container(
                    child: CustomPaint(
                  size: Size(valWidth, valHeight / 2.8),
                  painter: PathPainterFood(snapshot.data!, widget.Duration,
                      ProfileController.to.totaldate, isshowingone),
                ));
              } else {
                return Container();
              }
            } else {
              // print('do not have data');
              return Container();
            }
          },
        ),
        FutureBuilder<List<dynamic>>(
          future: ServerConnection.total_burned(
            ProfileController.to.originMyProfile.uid == null
                ? ''
                : ProfileController.to.originMyProfile.uid!,
            ProfileController.to.datelist,
          ),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              if (widget.GraphTypes[4] &&
                  (ProfileController.to.total_graph_type == 0 ||
                      ProfileController.to.total_graph_type == 2)) {
                // print('have data burned');
                // print(snapshot.data);
                // print(snapshot.data!);
                return Container(
                    child: CustomPaint(
                        size: Size(valWidth, valHeight / 2.8),
                        painter: PathPainterBurned(snapshot.data!,
                            widget.Duration, ProfileController.to.totaldate, isshowingone)));
              } else {
                return Container();
              }
            } else {
              // print('do not have data');
              return Container();
            }
          },
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                ServerConnection.write_log(
                    'ReportScreen', 'graph_area_top', '');
                print('!!!!!!!!!!!!!!!!!!!!');
                ProfileController.to.updatetotal_graph_type(1);
              },
              child: Container(
                color: Colors.red.withOpacity(0),
                width: valWidth,
                height: valHeight / 2.8 / 3 - 10,
              ),
            ),
            GestureDetector(
              onTap: () {
                ServerConnection.write_log(
                    'ReportScreen', 'graph_area_middle', '');
                print('@@@@@@@@@@@');
                ProfileController.to.updatetotal_graph_type(2);
              },
              child: Container(
                color: Colors.blue.withOpacity(0),
                width: valWidth,
                height: valHeight / 2.8 / 3 - 10,
              ),
            ),
            GestureDetector(
              onTap: () {
                ServerConnection.write_log(
                    'ReportScreen', 'graph_area_bottom', '');
                print('dsfdsfdsfdsf');
                ProfileController.to.updatetotal_graph_type(3);
              },
              child: Container(
                color: Colors.green.withOpacity(0),
                width: valWidth,
                height: valHeight / 2.8 / 3 - 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PathPainter extends CustomPainter {
  List<bool> GraphTypes = [true, true, true, true, true];
  late int duration;
  late DateTime date;

  PathPainter(
    List<bool> e,
    int n,
    DateTime d,
  ) {
    GraphTypes = e;
    duration = n;
    date = d;
  }

  final LineSize = 0.7;

  @override
  void paint(Canvas canvas, Size size) {
    // var tmp = DateData(
    //     DateTime.now().subtract(Duration(
    //         days: 3,
    //         hours: DateTime.now().hour,
    //         minutes: DateTime.now().minute)),
    //     50);
    // // var temp = DateTime.parse('1636628143.7570000');
    // var temp = DateTime.fromMicrosecondsSinceEpoch(
    //     (1636628143.7570000 * 1000000).toInt());
    // tmp = DateData(temp, 50);
    double XPadd_right = 30;
    double XPadd_left = 15;
    double YPadd_bottom = 30;
    double YPadd_top = 0;
    DateTime today = date;

    // print('x date');
    // print(today);

    double LineSize = 1.5;

    final clipRect = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.clipRect(clipRect);

    canvas.drawPaint(Paint()..color = Color(0xff0B202A));

    final GraphXSize = size.width - XPadd_right - XPadd_left;

    final GraphYSize = size.height - YPadd_bottom;

    final floorCorrection = 20;
    final floor = (GraphYSize + floorCorrection) / 5;
    //////////////////////////////////////////////////////////////////////////////////////Underbar

    Paint LinePaint = Paint()
      ..color = Color(0xffFFFDFD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(0, GraphYSize);
    path.lineTo(GraphXSize + XPadd_left + XPadd_right / 2, GraphYSize);
    canvas.drawPath(path, LinePaint);

    path.close();

    //////////////////////////////////////////////////////////////////////////////////////XLabel
    // print('date check');
    if (duration == 7) {
      for (int i = 0; i < 7; i++) {
        final XGridUnit = GraphXSize / 7;
        final x = GraphXSize - i * XGridUnit + XPadd_left;
        final y = size.height - YPadd_bottom + 6;

        final p = Offset(x, y);

        // final textPainter = (today.day == 1)
        //     ? TextPainter(
        //         text: TextSpan(
        //             text: '${today.month}/${today.day}',
        //             style: TextStyle(fontSize: 12, color: Color(0xffFFFDFD))),
        //         textDirection: TextDirection.ltr,
        //       )
        //     : TextPainter(
        //         text: TextSpan(
        //             text: '${today.day}',
        //             style: TextStyle(fontSize: 12, color: Color(0xffFFFDFD))),
        //         textDirection: TextDirection.ltr,
        //       );
        drawTextCentered(
            canvas,
            p,
            today.day == 1 ? '${today.month}/${today.day}' : '${today.day}',
            TextStyle(fontSize: 12, color: Color(0xffFFFDFD)),
            40);
        // textPainter.layout();

        // textPainter.paint(canvas, p);

        today = today.subtract(Duration(days: 1));
      }
    } else if (duration == 31) {
      for (int i = 0; i < 4; i++) {
        final XGridUnit = GraphXSize / 4;
        final x = GraphXSize - i * XGridUnit + XPadd_left;
        final y = size.height - YPadd_bottom + 6;

        final p = Offset(x, y);

        final textPainter = (today.day == 1 ||
                (i != 0 && today.day < today.subtract(Duration(days: 7)).day))
            ? TextPainter(
                text: TextSpan(
                    text: '${today.month}/${today.day}',
                    style: TextStyle(fontSize: 12, color: Color(0xffFFFDFD))),
                textDirection: TextDirection.ltr,
              )
            : TextPainter(
                text: TextSpan(
                    text: '${today.day}',
                    style: TextStyle(fontSize: 12, color: Color(0xffFFFDFD))),
                textDirection: TextDirection.ltr,
              );

        drawTextCentered(
            canvas,
            p,
            today.day == 1 ||
                    (i != 0 &&
                        today.day < today.subtract(Duration(days: 7)).day)
                ? '${today.month}/${today.day}'
                : '${today.day}',
            TextStyle(fontSize: 12, color: Color(0xffFFFDFD)),
            40);

        // textPainter.layout();

        // textPainter.paint(canvas, p);
        today = today.subtract(Duration(days: 7));
      }
    } else {
      today =
          today.day > (DateTime(today.year, today.month + 1, 0).day / 2).floor()
              ? DateTime(today.year, today.month + 1, 1)
              : DateTime(today.year, today.month, 1);
      for (int i = 0; i < 6; i++) {
        final XGridUnit = GraphXSize / 6;
        final x = GraphXSize - i * XGridUnit + XPadd_left;
        final y = size.height - YPadd_bottom + 6;

        final p = Offset(x, y);

        print("today");
        print(today);

        drawTextCentered(canvas, p, '${today.month}',
            TextStyle(fontSize: 12, color: Color(0xffFFFDFD)), 40);

        // textPainter.layout();

        // textPainter.paint(canvas, p);
        today = DateTime(today.year, today.month, 0);
        today = DateTime(today.year, today.month, 1);
      }
    }
    //////////////////////////////////////////////////////////////////////////////////////YSubLine
    if (duration == 7) {
      for (int i = 0; i < 7; i++) {
        final XGridUnit = GraphXSize / 7;
        final x = GraphXSize - i * XGridUnit + XPadd_left;
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
    } else if (duration == 31) {
      for (int i = 0; i < 4; i++) {
        final XGridUnit = GraphXSize / 4;
        final x = GraphXSize - i * XGridUnit + XPadd_left;
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
    } else {
      for (int i = 0; i < 6; i++) {
        final XGridUnit = GraphXSize / 6;
        final x = GraphXSize - i * XGridUnit + XPadd_left;
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
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

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
    final offset = c + Offset(-tp.width / 2.0, 0);
    // final offset = c + Offset(-tp.width / 2.0, -tp.height / 2.0);
    tp.paint(canvas, offset);
    return tp.size;
  }
}

class PathPainterWeight extends CustomPainter {
  late List<dynamic> weight;
  late int duration;
  late DateTime time;
  late bool isshowingone;

  PathPainterWeight(List<dynamic> e, int n, DateTime d, bool b) {
    weight = e;
    duration = n;
    time = d;
    isshowingone = b;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double min = double.infinity;
    double max = -double.infinity;
    double XPadd_right = 30;
    double XPadd_left = 15;
    double YPadd_bottom = 30;

    List<DateData> WeightData = [];
    if (duration == 180) {
      List Data1 = [];
      bool check = false;
      DateTime first = DateTime.parse(weight[0]['day'].replaceAll("_", ""));
      weight.forEach((e) {
        var map = {};
        var tmp = DateTime.parse(e['day'].replaceAll("_", ""));
        int last = DateTime(tmp.year, tmp.month + 1, 0).day;
        if (!check && (tmp.day == last || tmp.day == (last / 2).floor()) ||
            first.month != tmp.month ||
            (first.day > (last / 2).floor() && tmp.day > (last / 2).floor())) {
          check = true;
        }
        if (check) {
          map['day'] = tmp.day > last / 2
              ? DateTime(tmp.year, tmp.month, (last / 2).floor())
                  .toString()
                  .substring(0, 10)
                  .replaceAll('-', '_')
              : DateTime(tmp.year, tmp.month, 1)
                  .toString()
                  .substring(0, 10)
                  .replaceAll('-', '_');
          map['value'] = e['weight'];
          if (Data1.isNotEmpty && Data1.last['day'] == map['day']) {
            Data1.last['value'] =
                (double.parse(Data1.last["value"]) + double.parse(map["value"]))
                    .toString();
            Data1.last['count'] += 1;
          } else {
            map['count'] = 1;
            Data1.add(map);
          }
        }
      });
      print('weight');
      print(Data1);
      Data1.forEach((e) {
        double tmp = double.parse(e['value']) / e['count'];
        if (tmp < min) min = tmp;
        if (tmp > max) max = tmp;
        // print(e);
        // print(DateTime.parse(e['time'].replaceAll("_", "")));
        WeightData.add(
          DateData(
            DateTime.parse(e['day'].replaceAll("_", "")),
            tmp,
          ),
        );
      });
    } else {
      weight.forEach((e) {
        double tmp = double.parse(e['weight']);
        if (tmp < min) min = tmp;
        if (tmp > max) max = tmp;
        // print(e);
        // print(DateTime.fromMicrosecondsSinceEpoch(
        //     (double.parse(e['time']) * 1000000).toInt()));
        WeightData.add(
          DateData(
            DateTime.fromMicrosecondsSinceEpoch(
                (double.parse(e['time']) * 1000000).toInt()),
            tmp,
          ),
        );
      });
    }

    // print('good...?');
    // print(WeightData);

    double LineSize = duration == 7 ? 1.0 : 1.5;

    final GraphXSize = size.width - XPadd_right - XPadd_left;

    final GraphYSize = size.height - YPadd_bottom;

    final floorCorrection = 20;
    final floor = (GraphYSize + floorCorrection) / 5;

    WeightData.forEach((e) {
      e.value =
          (e.value - (min - 2)) * ((GraphYSize - 1) / 3) / (max - min + 4);

      if (ProfileController.to.total_graph_type == 3) {
        e.value *= 3;
      }
    });

    var datapath = TotalGraphHelper.ComputePoints(
        WeightData, GraphXSize, (GraphYSize - 1), duration, time);

    // print("debug : $datapath");

    Paint LinePaint = Paint()
      ..color = Color(0xffFFFDFD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = LineSize;

    Path path = TotalGraphHelper.ComputePath(datapath, GraphXSize, duration);
    canvas.drawPath(path, LinePaint); /////////////////////////////////////// draw line

    if(isshowingone && ProfileController.to.total_graph_type == 3 && WeightData.isNotEmpty){ /////////////////////////////////////////////////////////// draw y axis
      drawTextCentered(canvas,
          Offset(size.width - 15, 0),
          '${max+2}',
          TextStyle(fontSize: 12, color: Color(0xff858e93)),
          40);
      drawTextCentered(canvas,
          Offset(size.width - 15, size.height - 50),
          '${min-2}',
          TextStyle(fontSize: 12, color: Color(0xff858e93)),
          40);
    }

    if (ProfileController.to.duration == 7) { //////////////////////////////// draw circle
      datapath.forEach((dp) {
        final dotPaintFill = Paint()
          ..color = Color(0xffFFFDFD)
          ..style = PaintingStyle.fill
          ..strokeWidth = 1.0;
        canvas.drawCircle(dp, 3.5, dotPaintFill);
      });
    }

    path.close();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

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
    final offset = c + Offset(-tp.width / 2.0, 0);
    // final offset = c + Offset(-tp.width / 2.0, -tp.height / 2.0);
    tp.paint(canvas, offset);
    return tp.size;
  }

}

class PathPainterSleep extends CustomPainter {
  late List<dynamic> sleep;
  late int duration;
  late DateTime time;
  late bool isshowingone;

  PathPainterSleep(List<dynamic> e, int n, DateTime d, bool b) {
    sleep = e;
    duration = n;
    time = d;
    isshowingone = b;
  }
  @override
  void paint(Canvas canvas, Size size) {
    double min = double.infinity;
    double max = -double.infinity;
    List<DateData> SleepData = [];

    if (duration == 180) {
      List Data1 = [];
      bool check = false;
      DateTime first = DateTime.parse(sleep[0]['time'].replaceAll("_", ""));
      sleep.forEach((e) {
        var map = {};
        var tmp = DateTime.parse(e['time'].replaceAll("_", ""));
        int last = DateTime(tmp.year, tmp.month + 1, 0).day;
        if (!check && (tmp.day == last || tmp.day == (last / 2).floor()) ||
            first.month != tmp.month ||
            (first.day > (last / 2).floor() && tmp.day > (last / 2).floor())) {
          check = true;
        }
        if (check) {
          map['time'] = tmp.day > last / 2
              ? DateTime(tmp.year, tmp.month, (last / 2).floor())
                  .toString()
                  .substring(0, 10)
                  .replaceAll('-', '_')
              : DateTime(tmp.year, tmp.month, 1)
                  .toString()
                  .substring(0, 10)
                  .replaceAll('-', '_');
          map['value'] = e['sleep'];
          if (Data1.isNotEmpty && Data1.last['time'] == map['time']) {
            Data1.last['value'] =
                (double.parse(Data1.last["value"]) + double.parse(map["value"]))
                    .toString();
            Data1.last['count'] += 1;
          } else {
            map['count'] = 1;
            Data1.add(map);
          }
        }
      });
      print('sleep');
      print(Data1);
      Data1.forEach((e) {
        double tmp = double.parse(e['value']) / e['count'];
        if (tmp < min) min = tmp;
        if (tmp > max) max = tmp;
        // print(e);
        // print(DateTime.parse(e['time'].replaceAll("_", "")));
        SleepData.add(
          DateData(
            DateTime.parse(e['time'].replaceAll("_", "")),
            tmp,
          ),
        );
      });
    } else {
      sleep.forEach((e) {
        double tmp = double.parse(e['sleep']) / 60;
        if (tmp < min) min = tmp;
        if (tmp > max) max = tmp;
        // print(e);
        // print(DateTime.parse(e['time'].replaceAll("_", "")));
        SleepData.add(
          DateData(
            DateTime.parse(e['time'].replaceAll("_", "")),
            tmp,
          ),
        );
      });
    }


    double XPadd_right = 30;
    double XPadd_left = 15;
    double YPadd_bottom = 30;

    double LineSize = duration == 7 ? 1.0 : 1.5;

    final GraphXSize = size.width - XPadd_right - XPadd_left;

    final GraphYSize = size.height - YPadd_bottom;

    final floorCorrection = 20;
    final floor = (GraphYSize + floorCorrection) / 5;

    SleepData.forEach((e) {
      e.value =
          (e.value - (min - 2)) * ((GraphYSize - 1) / 3) / (max - min + 4);

      if (ProfileController.to.total_graph_type == 1) {
        e.value *= 3;
      }
    });

    var datapath = TotalGraphHelper.ComputePoints(
        SleepData,
        GraphXSize,
        ProfileController.to.total_graph_type == 1
            ? (GraphYSize - 1)
            : (GraphYSize - 1) / 3,
        duration,
        time);

    // print("debug : $datapath");

    Paint LinePaint = Paint()
      ..color = Color(0xffA0B1DF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = LineSize;

    Path path = TotalGraphHelper.ComputePath(datapath, GraphXSize, duration);
    canvas.drawPath(path, LinePaint);

    if (ProfileController.to.duration == 7) {
      datapath.forEach((dp) {
        final dotPaintFill = Paint()
          ..color = Color(0xffA0B1DF)
          ..style = PaintingStyle.fill
          ..strokeWidth = 1.0;
        canvas.drawCircle(dp, 3.5, dotPaintFill);
      });
    }

    if(isshowingone && ProfileController.to.total_graph_type == 1 && SleepData.isNotEmpty){ /////////////////////////////////////////////////////////// draw y axis
      drawTextCentered(canvas,
          Offset(size.width - 15, 0),
          '${(max+2).round()}',
          TextStyle(fontSize: 12, color: Color(0xff858e93)),
          40);
      drawTextCentered(canvas,
          Offset(size.width - 15, size.height - 50),
          '${(min).round()}',
          TextStyle(fontSize: 12, color: Color(0xff858e93)),
          40);
    }

    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

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
    final offset = c + Offset(-tp.width / 2.0, 0);
    // final offset = c + Offset(-tp.width / 2.0, -tp.height / 2.0);
    tp.paint(canvas, offset);
    return tp.size;
  }
}

class PathPainterStress extends CustomPainter {
  late List<dynamic> stress;
  late int duration;
  late DateTime time;
  late bool isshowingone;

  PathPainterStress(List<dynamic> e, int n, DateTime d, bool b) {
    stress = e;
    duration = n;
    time = d;
    isshowingone = b;
  }
  @override
  void paint(Canvas canvas, Size size) {
    double min = 0;
    double max = 100;
    List<DateData> StressData = [];
    // print('sress');
    // print(stress);
    if (duration == 180) {
      List Data1 = [];
      bool check = false;
      DateTime first = DateTime.parse(stress[0]['time'].replaceAll("_", ""));
      stress.forEach((e) {
        var map = {};
        var tmp = DateTime.parse(e['time'].replaceAll("_", ""));
        int last = DateTime(tmp.year, tmp.month + 1, 0).day;
        if (!check && (tmp.day == last || tmp.day == (last / 2).floor()) ||
            first.month != tmp.month ||
            (first.day > (last / 2).floor() && tmp.day > (last / 2).floor())) {
          check = true;
        }
        if (check) {
          map['time'] = tmp.day > last / 2
              ? DateTime(tmp.year, tmp.month, (last / 2).floor())
                  .toString()
                  .substring(0, 10)
                  .replaceAll('-', '_')
              : DateTime(tmp.year, tmp.month, 1)
                  .toString()
                  .substring(0, 10)
                  .replaceAll('-', '_');
          map['value'] = e['stress'];
          if (Data1.isNotEmpty && Data1.last['time'] == map['time']) {
            Data1.last['value'] =
                (double.parse(Data1.last["value"]) + double.parse(map["value"]))
                    .toString();
            Data1.last['count'] += 1;
          } else {
            map['count'] = 1;
            Data1.add(map);
          }
        }
      });
      print('stress');
      print(Data1);
      Data1.forEach((e) {
        double tmp = double.parse(e['value']) / e['count'];
        if (tmp < min) min = tmp;
        if (tmp > max) max = tmp;
        StressData.add(
          DateData(
            DateTime.parse(e['time'].replaceAll("_", "")),
            tmp,
          ),
        );
      });
    } else {
      stress.forEach((e) {
        double tmp = double.parse(e['stress']);
        if (tmp > max) max = tmp;
        // print(e);
        // print(DateTime.parse(e['time'].replaceAll("_", "")));
        StressData.add(
          DateData(
            DateTime.parse(e['time'].replaceAll("_", "")),
            tmp,
          ),
        );
      });
    }

    // print('good...?');
    // print(StressData);

    double XPadd_right = 30;
    double XPadd_left = 15;
    double YPadd_bottom = 30;

    double LineSize = duration == 7 ? 1.0 : 1.5;

    final GraphXSize = size.width - XPadd_right - XPadd_left;

    final GraphYSize = size.height - YPadd_bottom;

    final floorCorrection = 20;
    final floor = (GraphYSize + floorCorrection) / 5;

    StressData.forEach((e) {
      // e.value = e.value / 2;
      // e.value += floor * 2 + YPadd_bottom;
      e.value =
          (e.value - (min - 2)) * ((GraphYSize - 1) / 3) / (max - min + 4);

      if (ProfileController.to.total_graph_type == 1) {
        e.value *= 3;
      }
    });

    var datapath = TotalGraphHelper.ComputePoints(
        StressData,
        GraphXSize,
        ProfileController.to.total_graph_type == 1
            ? (GraphYSize - 1)
            : (GraphYSize - 1) / 3,
        duration,
        time);

    // print("debug : $datapath");
    Paint LinePaint = Paint()
      ..color = Color(0xffF2D8A7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = LineSize;

    Path path = TotalGraphHelper.ComputePath(datapath, GraphXSize, duration);
    canvas.drawPath(path, LinePaint);

    if(isshowingone && ProfileController.to.total_graph_type == 1 && stress.isNotEmpty){ /////////////////////////////////////////////////////////// draw y axis
      drawTextCentered(canvas,
          Offset(size.width - 15, 0),
          '${100}',
          TextStyle(fontSize: 12, color: Color(0xff858e93)),
          40);
      drawTextCentered(canvas,
          Offset(size.width - 15, size.height - 50),
          '${0}',
          TextStyle(fontSize: 12, color: Color(0xff858e93)),
          40);
    }

    if (ProfileController.to.duration == 7) {
      datapath.forEach((dp) {
        final dotPaintFill = Paint()
          ..color = Color(0xffF2D8A7)
          ..style = PaintingStyle.fill
          ..strokeWidth = 1.0;
        canvas.drawCircle(dp, 3.5, dotPaintFill);
      });
    }

    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

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
    final offset = c + Offset(-tp.width / 2.0, 0);
    // final offset = c + Offset(-tp.width / 2.0, -tp.height / 2.0);
    tp.paint(canvas, offset);
    return tp.size;
  }
}

class PathPainterFood extends CustomPainter {
  late List<dynamic> food;
  late int duration;
  late DateTime time;
  late bool isshowingone;

  PathPainterFood(List<dynamic> e, int n, DateTime d, bool b) {
    food = e;
    duration = n;
    time = d;
    isshowingone = b;
  }
  @override
  void paint(Canvas canvas, Size size) {
    double min = double.infinity;
    double max = -double.infinity;
    List<DateData> DietData = [];
    // print('food');
    if (duration == 180) {
      List Data1 = [];
      bool check = false;
      DateTime first = DateTime.parse(food[0]['time'].replaceAll("_", ""));
      food.forEach((e) {
        var map = {};
        var tmp = DateTime.parse(e['time'].replaceAll("_", ""));
        int last = DateTime(tmp.year, tmp.month + 1, 0).day;
        if (!check && (tmp.day == last || tmp.day == (last / 2).floor()) ||
            first.month != tmp.month ||
            (first.day > (last / 2).floor() && tmp.day > (last / 2).floor())) {
          check = true;
        }
        if (check) {
          map['time'] = tmp.day > last / 2
              ? DateTime(tmp.year, tmp.month, (last / 2).floor())
                  .toString()
                  .substring(0, 10)
                  .replaceAll('-', '_')
              : DateTime(tmp.year, tmp.month, 1)
                  .toString()
                  .substring(0, 10)
                  .replaceAll('-', '_');
          map['value'] = e['food'].toDouble();
          if (Data1.isNotEmpty && Data1.last['time'] == map['time']) {
            Data1.last['value'] = Data1.last["value"] + map["value"];
            Data1.last['count'] += 1;
          } else {
            map['count'] = 1;
            Data1.add(map);
          }
        }
      });
      print('food');
      print(Data1);
      Data1.forEach((e) {
        double tmp = e['value'] / e['count'];
        if (tmp < min) min = tmp;
        if (tmp > max) max = tmp;
        // print(e);
        // print(DateTime.parse(e['time'].replaceAll("_", "")));
        DietData.add(
          DateData(
            DateTime.parse(e['time'].replaceAll("_", "")),
            tmp,
          ),
        );
      });
    } else {
      food.forEach((e) {
        print(e['food'].toDouble().runtimeType);
        print(e['food']);
        double tmp = e['food'].toDouble();
        if (tmp < min) min = tmp;
        if (tmp > max) max = tmp;
        // print(e);
        // print(DateTime.parse(e['time'].replaceAll("_", "")));
        DietData.add(
          DateData(
            DateTime.parse(e['time'].replaceAll("_", "")),
            tmp,
          ),
        );
      });
    }

    if(!max.isNaN && !max.isInfinite)max = (max/100.0).round()*100.0 + 300.0;
    min = 0;
    // print('good...?');
    // print(DietData);

    double XPadd_right = 30;
    double XPadd_left = 15;
    double YPadd_bottom = 30;

    double LineSize = duration == 7 ? 1.0 : 1.5;

    final GraphXSize = size.width - XPadd_right - XPadd_left;

    final GraphYSize = size.height - YPadd_bottom;

    final floorCorrection = 20;
    final floor = (GraphYSize + floorCorrection) / 5;

    DietData.forEach((e) {
      // e.value = e.value / 2;
      // e.value += floor + YPadd_bottom;
      e.value =
          (e.value - (min)) * ((GraphYSize - 1) / 3) / (max + 200 - min);

      if (ProfileController.to.total_graph_type == 2) {
        e.value *= 3;
      }
    });

    var datapath = TotalGraphHelper.ComputePoints(
        DietData,
        GraphXSize,
        ProfileController.to.total_graph_type == 2
            ? (GraphYSize - 1)
            : ((GraphYSize - 1) / 3 * 2),
        duration,
        time);

    // print("debug : $datapath");

    Paint LinePaint = Paint()
      ..color = Color(0xffD2ABBA)
      ..style = PaintingStyle.stroke
      ..strokeWidth = LineSize;

    Path path = TotalGraphHelper.ComputePath(datapath, GraphXSize, duration);
    canvas.drawPath(path, LinePaint);

    if(isshowingone && ProfileController.to.total_graph_type == 2 && food.isNotEmpty){ /////////////////////////////////////////////////////////// draw y axis
      drawTextCentered(canvas,
          Offset(size.width - 15, 0),
          '${(max).round()}',
          TextStyle(fontSize: 12, color: Color(0xff858e93)),
          40);
      drawTextCentered(canvas,
          Offset(size.width - 15, size.height - 50),
          '${(min).round()}',
          TextStyle(fontSize: 12, color: Color(0xff858e93)),
          40);
    }

    if (ProfileController.to.duration == 7) {
      datapath.forEach((dp) {
        final dotPaintFill = Paint()
          ..color = Color(0xffD2ABBA)
          ..style = PaintingStyle.fill
          ..strokeWidth = 1.0;
        canvas.drawCircle(dp, 3.5, dotPaintFill);
      });
    }

    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

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
    final offset = c + Offset(-tp.width / 2.0, 0);
    // final offset = c + Offset(-tp.width / 2.0, -tp.height / 2.0);
    tp.paint(canvas, offset);
    return tp.size;
  }
}

class PathPainterBurned extends CustomPainter {
  late List<dynamic> burned;
  late int duration;
  late DateTime time;
  late bool isshowingone;

  PathPainterBurned(List<dynamic> e, int n, DateTime d, bool b) {
    burned = e;
    duration = n;
    time = d;
    isshowingone = b;
  }
  @override
  void paint(Canvas canvas, Size size) {
    double min = double.infinity;
    double max = -double.infinity;
    List<DateData> BurnedData = [];
    // print('burned');
    if (duration == 180) {
      List BurnedData1 = [];
      bool check = false;
      DateTime first = DateTime.parse(burned[0]['time'].replaceAll("_", ""));
      burned.forEach((e) {
        var map = {};
        var tmp = DateTime.parse(e['time'].replaceAll("_", ""));
        int last = DateTime(tmp.year, tmp.month + 1, 0).day;
        if (!check && (tmp.day == last || tmp.day == (last / 2).floor()) ||
            first.month != tmp.month ||
            (first.day > (last / 2).floor() && tmp.day > (last / 2).floor())) {
          check = true;
        }
        if (check) {
          map['time'] = tmp.day > last / 2
              ? DateTime(tmp.year, tmp.month, (last / 2).floor())
                  .toString()
                  .substring(0, 10)
                  .replaceAll('-', '_')
              : DateTime(tmp.year, tmp.month, 1)
                  .toString()
                  .substring(0, 10)
                  .replaceAll('-', '_');
          map['value'] = e['burned'];
          if (BurnedData1.isNotEmpty &&
              BurnedData1.last['time'] == map['time']) {
            BurnedData1.last['value'] =
                (double.parse(BurnedData1.last["value"]) +
                        double.parse(map["value"]))
                    .toString();
            BurnedData1.last['count'] += 1;
          } else {
            map['count'] = 1;
            BurnedData1.add(map);
          }
        }
        // print(DateTime(tmp.year, tmp.day, 0).day / 2);
        // double tmp = double.parse(e['burned']);
        // if (tmp < min) min = tmp;
        // if (tmp > max) max = tmp;
        // // print(e);
        // // print(DateTime.parse(e['time'].replaceAll("_", "")));
        // BurnedData.add(
        //   DateData(
        //     DateTime.parse(e['time'].replaceAll("_", "")),
        //     tmp,
        //   ),
        // );
      });
      BurnedData1.forEach((e) {
        double tmp = double.parse(e['value']) / e['count'];
        if (tmp < min) min = tmp;
        if (tmp > max) max = tmp;
        // print(e);
        // print(DateTime.parse(e['time'].replaceAll("_", "")));
        BurnedData.add(
          DateData(
            DateTime.parse(e['time'].replaceAll("_", "")),
            tmp,
          ),
        );
      });
    } else {
      burned.forEach((e) {
        double tmp = double.parse(e['burned']);
        if (tmp < min) min = tmp;
        if (tmp > max) max = tmp;
        // print(e);
        // print(DateTime.parse(e['time'].replaceAll("_", "")));
        BurnedData.add(
          DateData(
            DateTime.parse(e['time'].replaceAll("_", "")),
            tmp,
          ),
        );
      });
    }

    if(!max.isNaN && !max.isInfinite)max = (max/100.0).round()*100.0 + 300.0;
    min = 0;
    // print('good...?');
    // print(BurnedData);

    double XPadd_right = 30;
    double XPadd_left = 15;
    double YPadd_bottom = 30;

    double LineSize = duration == 7 ? 1.0 : 1.5;

    final GraphXSize = size.width - XPadd_right - XPadd_left;

    final GraphYSize = size.height - YPadd_bottom;

    final floorCorrection = 20;
    final floor = (GraphYSize + floorCorrection) / 5;

    BurnedData.forEach((e) {
      // e.value = e.value / 2;
      // e.value += floor + YPadd_bottom;
      e.value =
          (e.value - (min)) * ((GraphYSize - 1) / 3) / (max - min);

      if (ProfileController.to.total_graph_type == 2) {
        e.value *= 3;
      }
    });

    var datapath = TotalGraphHelper.ComputePoints(
        BurnedData,
        GraphXSize,
        ProfileController.to.total_graph_type == 2
            ? (GraphYSize - 1)
            : ((GraphYSize - 1) / 3 * 2),
        duration,
        time);

    // print("debug : $datapath");

    Paint LinePaint = Paint()
      ..color = Color(0xff8DBFBC)
      ..style = PaintingStyle.stroke
      ..strokeWidth = LineSize;

    Path path = TotalGraphHelper.ComputePath(datapath, GraphXSize, duration);
    canvas.drawPath(path, LinePaint);

    if(isshowingone && ProfileController.to.total_graph_type == 2 && BurnedData.isNotEmpty){ /////////////////////////////////////////////////////////// draw y axis
      drawTextCentered(canvas,
          Offset(size.width - 15, 0),
          '${max.round()}',
          TextStyle(fontSize: 12, color: Color(0xff858e93)),
          40);
      drawTextCentered(canvas,
          Offset(size.width - 15, size.height - 50),
          '${(min).round()}',
          TextStyle(fontSize: 12, color: Color(0xff858e93)),
          40);
    }

    if (ProfileController.to.duration == 7) {
      datapath.forEach((dp) {
        final dotPaintFill = Paint()
          ..color = Color(0xff8DBFBC)
          ..style = PaintingStyle.fill
          ..strokeWidth = 1.0;
        canvas.drawCircle(dp, 3.5, dotPaintFill);
      });
    }

    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

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
    final offset = c + Offset(-tp.width / 2.0, 0);
    // final offset = c + Offset(-tp.width / 2.0, -tp.height / 2.0);
    tp.paint(canvas, offset);
    return tp.size;
  }
}

class TotalGraphHelper {
  static DateTime ComputeDate(DateTime time) {
    return DateTime.parse(time.year.toString() +
        time.month.toString().padLeft(2, '0') +
        time.day.toString().padLeft(2, '0'));
  }

  static List<Offset> ComputePoints(List<DateData> p, double width,
      double height, int duration, DateTime time) {
    List<Offset> points = [];
    p.forEach((i) {
      // final XGridUnit = duration == 365 ? width / 180 : width / duration;
      final XGridUnit = duration == 7
          ? width / duration
          : duration == 31
              ? width / 20
              : width / 12;
      final x = duration == 180
          ? width -
              (ComputeDate(time).difference(ComputeDate(i.time)).inDays / 15)
                      .round() *
                  XGridUnit +
              15
          : width -
              (ComputeDate(time).difference(ComputeDate(i.time)).inDays) *
                  XGridUnit +
              15;
      // final x = width - (time.day - i.time.day) * XGridUnit;
      final y = height - (i.value);
      final dp = Offset(x, y);
      points.add(dp);
    });
    return points;
  }

  static Path ComputePath(List<Offset> points, double width, int duration) {
    final path = Path();
    final XGridUnit = width / duration;
    for (int i = 0; i < points.length; i++) {
      final p = points[i];
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      } else if (duration == 7 && (points[i - 1].dx - p.dx) > XGridUnit * 1.2) {
        path.moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    return path;
  }
}
