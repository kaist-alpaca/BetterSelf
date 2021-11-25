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
              print(snapshot.data);
              // print(snapshot.data!);
              if (widget.GraphTypes[0]) {
                return Container(
                    child: CustomPaint(
                  size: Size(valWidth, valHeight / 2.8),
                  // willChange: true,
                  painter: PathPainterWeight(snapshot.data!, widget.Duration,
                      ProfileController.to.totaldate),
                ));
              } else {
                return Container();
              }
            } else {
              print('do not have data');
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
              if (widget.GraphTypes[1]) {
                // print('date list');
                // print(ProfileController.to.datelist);
                // print('have data');
                // print(snapshot.data);
                // print(snapshot.data!);
                return Container(
                    child: CustomPaint(
                  size: Size(valWidth, valHeight / 2.8),
                  painter: PathPainterSleep(snapshot.data!, widget.Duration,
                      ProfileController.to.totaldate),
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
              if (widget.GraphTypes[2]) {
                // print('have data');
                // print(snapshot.data);
                // print(snapshot.data!);
                return Container(
                    child: CustomPaint(
                  size: Size(valWidth, valHeight / 2.8),
                  painter: PathPainterStress(snapshot.data!, widget.Duration,
                      ProfileController.to.totaldate),
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
              if (widget.GraphTypes[3]) {
                // print('have data');
                // print(snapshot.data);
                // print(snapshot.data!);
                return Container(
                    child: CustomPaint(
                  size: Size(valWidth, valHeight / 2.8),
                  painter: PathPainterFood(snapshot.data!, widget.Duration,
                      ProfileController.to.totaldate),
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
              if (widget.GraphTypes[4]) {
                // print('have data burned');
                // print(snapshot.data);
                // print(snapshot.data!);
                return Container(
                    child: CustomPaint(
                        size: Size(valWidth, valHeight / 2.8),
                        painter: PathPainterBurned(snapshot.data!,
                            widget.Duration, ProfileController.to.totaldate)));
              } else {
                return Container();
              }
            } else {
              // print('do not have data');
              return Container();
            }
          },
        ),
        // GestureDetector(
        //   onTap: () {
        //     print('click');
        //     // setState(() {
        //     //   // time = time.add(Duration(days: -widget.Duration));
        //     //   // date = [];
        //     //   // for (int i = 0; i < widget.Duration; i++) {
        //     //   //   var tmp = time
        //     //   //       .add(Duration(days: -i))
        //     //   //       .toString()
        //     //   //       .substring(0, 10)
        //     //   //       .replaceAll("-", "_");
        //     //   //   date.add(tmp);
        //     //   // }
        //     // });
        //     ProfileController.to.minusDatelist(widget.Duration);
        //   },
        //   child: Container(
        //     width: 35,
        //     height: 35,
        //     // color: Colors.red,
        //     margin: EdgeInsets.fromLTRB(
        //         (MediaQuery.of(context).size.width - 30) -
        //             6.5 * (MediaQuery.of(context).size.width - 30) / 7 -
        //             20,
        //         MediaQuery.of(context).size.height / 2.8 - 30 + 6 - 9.5,
        //         0,
        //         0),
        //     child: Icon(
        //       Icons.arrow_back_ios_new_rounded,
        //       size: 20.0,
        //       color: Color.fromRGBO(133, 142, 147, 1),
        //     ),
        //   ),
        // ),
        // ProfileController.to.totaldate.day == DateTime.now().day
        //     ? Container()
        //     : GestureDetector(
        //         onTap: () {
        //           print('click');
        //           ProfileController.to.plusDatelist(widget.Duration);
        //         },
        //         child: Container(
        //           width: 35,
        //           height: 35,
        //           // color: Colors.red,
        //           margin: EdgeInsets.fromLTRB(
        //               (MediaQuery.of(context).size.width - 30) +
        //                   0.5 * (MediaQuery.of(context).size.width - 30) / 7 -
        //                   15,
        //               MediaQuery.of(context).size.height / 2.8 - 30 + 6 - 9.5,
        //               0,
        //               0),
        //           child: Icon(
        //             Icons.arrow_forward_ios_rounded,
        //             size: 20.0,
        //             color: Color.fromRGBO(133, 142, 147, 1),
        //           ),
        //         ),
        //       ),
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
    double YPadd_bottom = 30;
    double YPadd_top = 0;
    DateTime today = date;

    // print('x date');
    // print(today);

    double LineSize = 1.5;

    final clipRect = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.clipRect(clipRect);

    canvas.drawPaint(Paint()..color = Color(0xff0B202A));

    final GraphXSize = size.width - XPadd_right;

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
    path.lineTo(GraphXSize, GraphYSize);
    canvas.drawPath(path, LinePaint);

    path.close();

    //////////////////////////////////////////////////////////////////////////////////////XLabel
    // print('date check');
    if (duration == 7) {
      for (int i = 0; i < 7; i++) {
        final XGridUnit = GraphXSize / 7;
        final x = GraphXSize - i * XGridUnit - 6;
        final y = size.height - YPadd_bottom + 6;

        final p = Offset(x, y);

        final textPainter = (today.day == 1)
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

        textPainter.layout();

        textPainter.paint(canvas, p);
        today = today.subtract(Duration(days: 1));
      }
    } else if (duration == 31) {
      for (int i = 0; i < 7; i++) {
        final XGridUnit = GraphXSize / 7;
        final x = GraphXSize - i * XGridUnit - 6;
        final y = size.height - YPadd_bottom + 6;

        final p = Offset(x, y);

        final textPainter = (today.day == 1 ||
                (i != 0 && today.day < today.subtract(Duration(days: 5)).day))
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

        textPainter.layout();

        textPainter.paint(canvas, p);
        today = today.subtract(Duration(days: 5));
      }
    }
    //////////////////////////////////////////////////////////////////////////////////////YSubLine
    for (int i = 1; i < 7; i++) {
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
    // for (int i = 0; i < 7; i++) {
    //   final XGridUnit = GraphXSize / 7;
    //   final x = GraphXSize - i * XGridUnit - 7;
    //   final y = size.height - YPadd_bottom - 1.2 * floor;

    //   final p = Offset(x, y);

    //   final textPainter = (null != WeightData[WeightData.length - 1 - i])
    //       ? TextPainter(
    //           text: TextSpan(
    //               text: '${WeightData[WeightData.length - 1 - i].value}',
    //               style: TextStyle(fontSize: 7, color: Color(0xff858E93))),
    //           textDirection: TextDirection.ltr,
    //         )
    //       : TextPainter(
    //           text: TextSpan(text: ''),
    //           textDirection: TextDirection.ltr,
    //         );

    //   textPainter.layout();

    //   textPainter.paint(canvas, p);
    // }
    //////////////////////////////////////////////////////////////////////////////////////weight

    // if (GraphTypes[0]) {
    //   // double min = 1000;
    //   // double max = 0;
    //   // WeightData.forEach((e) {
    //   //   if (e.value < min) min = e.value;
    //   //   if (e.value > min) max = e.value;
    //   // });

    //   // WeightData.forEach((e) {
    //   //   e.value = (e.value - min) / (max - min) * 0.4 * floor;
    //   //   e.value /= 2;
    //   //   e.value += floor * 0.3; //correction
    //   // });

    //   // var datapath = ComputePoints(WeightData, GraphXSize, GraphYSize);

    //   // // print("debug : $datapath");

    //   // Paint LinePaint = Paint()
    //   //   ..color = Color(0xffFFFDFD)
    //   //   ..style = PaintingStyle.stroke
    //   //   ..strokeWidth = LineSize;

    //   // Path path = ComputePath(datapath);
    //   // canvas.drawPath(path, LinePaint);

    //   // path.close();
    //   print('show weight');
    //   // TotalGraphWeight();
    // }
    //////////////////////////////////////////////////////////////////////////////////////Sleep
    // if (GraphTypes[1]) {
    //   SleepData.forEach((e) {
    //     e.value = e.value / 2;
    //     e.value += floor * 2 + YPadd_bottom;
    //   });

    //   var datapath = ComputePoints(SleepData, GraphXSize, GraphYSize);

    //   // print("debug : $datapath");

    //   Paint LinePaint = Paint()
    //     ..color = Color(0xffA0B1DF)
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = LineSize;

    //   Path path = ComputePath(datapath);
    //   canvas.drawPath(path, LinePaint);

    //   path.close();
    // }
    //////////////////////////////////////////////////////////////////////////////////////Stress
    // if (GraphTypes[2]) {
    //   StressData.forEach((e) {
    //     e.value = e.value / 2;
    //     e.value += floor * 2 + YPadd_bottom;
    //   });

    //   var datapath = ComputePoints(StressData, GraphXSize, GraphYSize);

    //   // print("debug : $datapath");

    //   Paint LinePaint = Paint()
    //     ..color = Color(0xffF2D8A7)
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = LineSize;

    //   Path path = ComputePath(datapath);
    //   canvas.drawPath(path, LinePaint);

    //   path.close();
    // }
    //////////////////////////////////////////////////////////////////////////////////////Diet
    // if (GraphTypes[3]) {
    //   DietData.forEach((e) {
    //     e.value = e.value / 2;
    //     e.value += floor + YPadd_bottom;
    //   });

    //   var datapath = ComputePoints(DietData, GraphXSize, GraphYSize);

    //   // print("debug : $datapath");

    //   Paint LinePaint = Paint()
    //     ..color = Color(0xffD2ABBA)
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = LineSize;

    //   Path path = ComputePath(datapath);
    //   canvas.drawPath(path, LinePaint);

    //   path.close();
    // }
    //////////////////////////////////////////////////////////////////////////////////////Burned
    // if (GraphTypes[4]) {
    //   BurnedData.forEach((e) {
    //     e.value = e.value / 2;
    //     e.value += floor + YPadd_bottom;
    //   });

    //   var datapath = ComputePoints(BurnedData, GraphXSize, GraphYSize);

    //   // print("debug : $datapath");

    //   Paint LinePaint = Paint()
    //     ..color = Color(0xff8DBFBC)
    //     ..style = PaintingStyle.stroke
    //     ..strokeWidth = LineSize;

    //   Path path = ComputePath(datapath);
    //   canvas.drawPath(path, LinePaint);

    //   path.close();
    // }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class PathPainterWeight extends CustomPainter {
  late List<dynamic> weight;
  late int duration;
  late DateTime time;

  PathPainterWeight(List<dynamic> e, int n, DateTime d) {
    weight = e;
    duration = n;
    time = d;
  }
  @override
  void paint(Canvas canvas, Size size) {
    List<DateData> WeightData = [];
    weight.forEach((e) {
      // print(e);
      // print(DateTime.fromMicrosecondsSinceEpoch(
      //     (double.parse(e['time']) * 1000000).toInt()));
      WeightData.add(
        DateData(
          DateTime.fromMicrosecondsSinceEpoch(
              (double.parse(e['time']) * 1000000).toInt()),
          double.parse(e['weight']),
        ),
      );
    });

    // print('good...?');
    // print(WeightData);

    double min = 1000;
    double max = 0;
    double XPadd_right = 30;
    double YPadd_bottom = 30;
    double YPadd_top = 0;

    double LineSize = 1.5;

    final GraphXSize = size.width - XPadd_right;

    final GraphYSize = size.height - YPadd_bottom;

    final floorCorrection = 20;
    final floor = (GraphYSize + floorCorrection) / 5;
    WeightData.forEach((e) {
      // print('weight value');
      // print(e.value);
      if (e.value < min) min = e.value;
      if (e.value > min) max = e.value;
    });

    WeightData.forEach((e) {
      e.value = (e.value - min) / (max - min) * 0.4 * floor;
      e.value /= 2;
      e.value += floor * 0.3; //correction
    });

    var datapath = TotalGraphHelper.ComputePoints(
        WeightData, GraphXSize, GraphYSize, duration, time);

    // print("debug : $datapath");

    Paint LinePaint = Paint()
      ..color = Color(0xffFFFDFD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = LineSize;

    Path path = TotalGraphHelper.ComputePath(datapath, GraphXSize, duration);
    canvas.drawPath(path, LinePaint);

    if (ProfileController.to.duration == 7) {
      datapath.forEach((dp) {
        final dotPaintFill = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill
          ..strokeWidth = 1.0;
        canvas.drawCircle(dp, 5.0, dotPaintFill);
      });
    }

    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class PathPainterSleep extends CustomPainter {
  late List<dynamic> sleep;
  late int duration;
  late DateTime time;

  PathPainterSleep(List<dynamic> e, int n, DateTime d) {
    sleep = e;
    duration = n;
    time = d;
  }
  @override
  void paint(Canvas canvas, Size size) {
    List<DateData> SleepData = [];
    // print('sleep');
    sleep.forEach((e) {
      // print(e);
      // print(DateTime.parse(e['time'].replaceAll("_", "")));
      SleepData.add(
        DateData(
          DateTime.parse(e['time'].replaceAll("_", "")),
          double.parse(e['sleep']) / 60,
        ),
      );
    });

    // print('good...?');
    // print("print sleepdata");
    // print(SleepData);

    double XPadd_right = 30;
    double YPadd_bottom = 30;

    double LineSize = 1.5;

    final GraphXSize = size.width - XPadd_right;

    final GraphYSize = size.height - YPadd_bottom;

    final floorCorrection = 20;
    final floor = (GraphYSize + floorCorrection) / 5;

    SleepData.forEach((e) {
      e.value = e.value / 2;
      e.value += floor * 2 + YPadd_bottom;
    });

    var datapath = TotalGraphHelper.ComputePoints(
        SleepData, GraphXSize, GraphYSize, duration, time);

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
          ..color = Colors.white
          ..style = PaintingStyle.fill
          ..strokeWidth = 1.0;
        canvas.drawCircle(dp, 5.0, dotPaintFill);
      });
    }

    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class PathPainterStress extends CustomPainter {
  late List<dynamic> stress;
  late int duration;
  late DateTime time;

  PathPainterStress(List<dynamic> e, int n, DateTime d) {
    stress = e;
    duration = n;
    time = d;
  }
  @override
  void paint(Canvas canvas, Size size) {
    List<DateData> StressData = [];
    // print('sress');
    // print(stress);
    stress.forEach((e) {
      // print(e);
      // print(DateTime.parse(e['time'].replaceAll("_", "")));
      StressData.add(
        DateData(
          DateTime.parse(e['time'].replaceAll("_", "")),
          double.parse(e['stress']),
        ),
      );
    });

    // print('good...?');
    // print(StressData);

    double XPadd_right = 30;
    double YPadd_bottom = 30;

    double LineSize = 1.5;

    final GraphXSize = size.width - XPadd_right;

    final GraphYSize = size.height - YPadd_bottom;

    final floorCorrection = 20;
    final floor = (GraphYSize + floorCorrection) / 5;

    StressData.forEach((e) {
      e.value = e.value / 2;
      e.value += floor * 2 + YPadd_bottom;
    });

    var datapath = TotalGraphHelper.ComputePoints(
        StressData, GraphXSize, GraphYSize, duration, time);

    // print("debug : $datapath");

    Paint LinePaint = Paint()
      ..color = Color(0xffF2D8A7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = LineSize;

    Path path = TotalGraphHelper.ComputePath(datapath, GraphXSize, duration);
    canvas.drawPath(path, LinePaint);

    if (ProfileController.to.duration == 7) {
      datapath.forEach((dp) {
        final dotPaintFill = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill
          ..strokeWidth = 1.0;
        canvas.drawCircle(dp, 5.0, dotPaintFill);
      });
    }

    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class PathPainterFood extends CustomPainter {
  late List<dynamic> food;
  late int duration;
  late DateTime time;

  PathPainterFood(List<dynamic> e, int n, DateTime d) {
    food = e;
    duration = n;
    time = d;
  }
  @override
  void paint(Canvas canvas, Size size) {
    List<DateData> DietData = [];
    // print('food');
    food.forEach((e) {
      // print(e);
      // print(DateTime.parse(e['time'].replaceAll("_", "")));
      DietData.add(
        DateData(
          DateTime.parse(e['time'].replaceAll("_", "")),
          e['food'] / 5,
        ),
      );
    });

    // print('good...?');
    // print(DietData);

    double XPadd_right = 30;
    double YPadd_bottom = 30;

    double LineSize = 1.5;

    final GraphXSize = size.width - XPadd_right;

    final GraphYSize = size.height - YPadd_bottom;

    final floorCorrection = 20;
    final floor = (GraphYSize + floorCorrection) / 5;

    DietData.forEach((e) {
      e.value = e.value / 2;
      e.value += floor + YPadd_bottom;
    });

    var datapath = TotalGraphHelper.ComputePoints(
        DietData, GraphXSize, GraphYSize, duration, time);

    // print("debug : $datapath");

    Paint LinePaint = Paint()
      ..color = Color(0xffD2ABBA)
      ..style = PaintingStyle.stroke
      ..strokeWidth = LineSize;

    Path path = TotalGraphHelper.ComputePath(datapath, GraphXSize, duration);
    canvas.drawPath(path, LinePaint);

    if (ProfileController.to.duration == 7) {
      datapath.forEach((dp) {
        final dotPaintFill = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill
          ..strokeWidth = 1.0;
        canvas.drawCircle(dp, 5.0, dotPaintFill);
      });
    }

    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class PathPainterBurned extends CustomPainter {
  late List<dynamic> burned;
  late int duration;
  late DateTime time;

  PathPainterBurned(List<dynamic> e, int n, DateTime d) {
    burned = e;
    duration = n;
    time = d;
  }
  @override
  void paint(Canvas canvas, Size size) {
    List<DateData> BurnedData = [];
    // print('burned');
    burned.forEach((e) {
      // print(e);
      // print(DateTime.parse(e['time'].replaceAll("_", "")));
      BurnedData.add(
        DateData(
          DateTime.parse(e['time'].replaceAll("_", "")),
          double.parse(e['burned']) / 60,
        ),
      );
    });

    // print('good...?');
    // print(BurnedData);

    double XPadd_right = 30;
    double YPadd_bottom = 30;

    double LineSize = 1.5;

    final GraphXSize = size.width - XPadd_right;

    final GraphYSize = size.height - YPadd_bottom;

    final floorCorrection = 20;
    final floor = (GraphYSize + floorCorrection) / 5;

    BurnedData.forEach((e) {
      e.value = e.value / 2;
      e.value += floor + YPadd_bottom;
    });

    var datapath = TotalGraphHelper.ComputePoints(
        BurnedData, GraphXSize, GraphYSize, duration, time);

    // print("debug : $datapath");

    Paint LinePaint = Paint()
      ..color = Color(0xff8DBFBC)
      ..style = PaintingStyle.stroke
      ..strokeWidth = LineSize;

    Path path = TotalGraphHelper.ComputePath(datapath, GraphXSize, duration);
    canvas.drawPath(path, LinePaint);

    if (ProfileController.to.duration == 7) {
      datapath.forEach((dp) {
        final dotPaintFill = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill
          ..strokeWidth = 1.0;
        canvas.drawCircle(dp, 5.0, dotPaintFill);
      });
    }

    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
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
      final XGridUnit = width / duration;
      final x = width -
          (ComputeDate(time).difference(ComputeDate(i.time)).inDays) *
              XGridUnit;
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
