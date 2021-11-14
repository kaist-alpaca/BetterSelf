import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:betterme/functions/Widgets/DividewithObj.dart';
import 'package:betterme/functions/Firestore/AuthMethods.dart';
import '../Widgets/CoachingTxtBox.dart';
import '../Widgets/CoachingFoodBox.dart';
import '../Widgets/MiniBox.dart';
import '../Widgets/MiniCircle.dart';
import '../Widgets/SevenDaysCoaching.dart';

import 'package:intl/intl.dart';

import '../Widgets/Calendars/FoodCalendar.dart';

import 'package:betterme/functions/Graphs/line_chart.dart';
import 'package:betterme/functions/Graphs/group_bar_three_chart.dart';
import 'package:betterme/functions/Graphs/outdated/scatter_chart.dart';

import 'package:get/get.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';

var Coachingtexts = [];
var Coachingtimes = [];

var user = AuthMethods()
    .auth
    .currentUser!
    .email
    .toString()
    .replaceAll("@gmail.com", "");

var currentuser = AuthMethods().auth.currentUser!.uid;

Widget InitCoaching(
    BuildContext context,
    DateTime selectedDate,
    double dayButtonHeight,
    double dayButtonWidth,
    double blankBetweenButton,
    double graphWidth) {
  Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(currentuser)
      .collection('coaching_diet')
      .orderBy("time")
      .snapshots();

  return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        Coachingtexts = [];
        Coachingtimes = [];
        if (snapshot.hasData) {
          List CoachingList =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            print("time : ${DateTime.parse(data['time'].toDate().toString())}");
            Coachingtexts.add(data['message']);
            Coachingtimes.add(DateTime.parse(data['time'].toDate().toString()));
            return data['message'];
          }).toList();

          int checkTime = Coachingtimes.length - 1;
          // DateFormat('y/M/d').format(controller.selectedDay)

          while (checkTime >= 0) {
            // Coachingtimes[checkTime]-selectedDate]
            int date1 = int.parse(
                DateFormat('yyyyMMdd').format(Coachingtimes[checkTime]));
            int date2 = int.parse(DateFormat('yyyyMMdd').format(selectedDate));
            int DiffDays = date1 - date2;

            print(selectedDate.toString());
            if (DiffDays == 0) {
              print('$checkTime and ' + Coachingtexts[checkTime]);
              return SevenDaysCoaching(
                  context,
                  Coachingtexts[checkTime],
                  dayButtonHeight,
                  dayButtonWidth,
                  blankBetweenButton,
                  graphWidth);
            } else if (DiffDays < 0) {
              return SevenDaysCoaching(
                  context,
                  '아직 해당 날짜의 식단 코칭이 없습니다.',
                  dayButtonHeight,
                  dayButtonWidth,
                  blankBetweenButton,
                  graphWidth);
            }
            checkTime = checkTime - 1;
          }
          print('out of While');
          return SevenDaysCoaching(context, '아직 해당 날짜의 식단 코칭이 없습니다.',
              dayButtonHeight, dayButtonWidth, blankBetweenButton, graphWidth);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

int? buttonCase;
final rng = Random();
const dayCount = 7;

class FoodTabs extends StatefulWidget {
  FoodTabs(int a) {
    buttonCase = a;
  }

  @override
  _FoodTabs createState() => _FoodTabs();
}

int testValue = 0;

class _FoodTabs extends State<FoodTabs> {
  Color dayButton1Color = Color(0xff0B202A);
  Color dayButton2Color = Color(0xff0B202A);
  Color dayButton3Color = Color(0xff0B202A);
  Color dayButton4Color = Color(0xff0B202A);
  Color dayButton5Color = Color(0xff0B202A);
  Color dayButton6Color = Color(0xff0B202A);
  Color dayButton7Color = Color(0xff0B202A);
  int dayButtonCase = 0;

  late List<Score> _scores;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  void initState() {
    if (DateTime.now().weekday == 1) {
      dayButton1Color = Color(0xff474A55);
    } else if (DateTime.now().weekday == 7) {
      dayButton7Color = Color(0xff474A55);
    } else if (DateTime.now().weekday == 2) {
      dayButton2Color = Color(0xff474A55);
    } else if (DateTime.now().weekday == 3) {
      dayButton3Color = Color(0xff474A55);
    } else if (DateTime.now().weekday == 4) {
      dayButton4Color = Color(0xff474A55);
    } else if (DateTime.now().weekday == 5) {
      dayButton5Color = Color(0xff474A55);
    } else if (DateTime.now().weekday == 6) {
      dayButton6Color = Color(0xff474A55);
    }

    super.initState();
    final scores = List<Score>.generate(dayCount, (index) {
      final y = rng.nextDouble() * 30.0;
      final d = DateTime.now().add(Duration(days: -dayCount + index));
      return Score(y, d);
    });
    setState(() {
      _scores = scores;
    });
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    final shadowColor = Color(0xffD2ABBA);
    final graphBlur = 1.2;
    final graphBorderRadius = valWidth * 0.015;

    double dayButtonHeight = valHeight * 0.075;
    double dayButtonWidth = valWidth * 0.12; //버튼크기
    double blankBetweenButton = valHeight * 0.01; //버튼사이 여백

    double miniBoxSize = 0.015;
    double defaultSize = valWidth * 0.0025; //폰트사이즈용
    double graphWidth = valWidth * 0.88; // 그래프들 너비

    final _food = [
      [
        [27, 480, 1],
        [27, 1000, 2],
        [27, 0, 2],
      ],
      [
        [28, 872, 3]
      ],
      [
        [29, 128, 4]
      ],
      [
        [30, 739, 1]
      ],
      [
        [31, 836, 4]
      ],
      [
        [9 / 1, 947, 2]
      ],
      [
        [2, 931, 1]
      ]
    ];

    if (buttonCase == 0) {
      //7일로 선택되었을 때 표현될 위젯들은 여기에.
      return GetBuilder<ProfileController>(builder: (controller) {
        String dayButton1txt =
            controller.startDate(controller.date).day.toString();
        String dayButton2txt =
            controller.TueDate(controller.date).day.toString();
        String dayButton3txt =
            controller.WedDate(controller.date).day.toString();
        String dayButton4txt =
            controller.ThuDate(controller.date).day.toString();
        String dayButton5txt =
            controller.FriDate(controller.date).day.toString();
        String dayButton6txt =
            controller.SatDate(controller.date).day.toString();
        String dayButton7txt =
            controller.endDate(controller.date).day.toString();
        return Container(
            child: Center(
                child: Column(children: [
          SizedBox(height: valHeight * 0.035),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: valWidth * 0.07,
              ),
              Container(
                height: valHeight * 0.052,
                width: valWidth * 0.2,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '섭취 칼로리',
                    style:
                        TextStyle(fontSize: defaultSize * 14, color: txtColor),
                  ),
                ),
              ),
              SizedBox(width: valWidth * 0.05),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MiniBox(
                          context, txtColor, miniBoxSize, 0.17, 10, '스트레스(%)'),
                      SizedBox(width: valWidth * 0.037),
                      MiniBox(context, Color(0xff9BC3C1), miniBoxSize, 0.2, 10,
                          '총 섭취량(kcal)')
                    ],
                  ),
                  SizedBox(height: valHeight * 0.005),
                  Row(
                    children: [
                      MiniBox(context, Color(0xffDBB9C7), miniBoxSize, 0.2, 10,
                          '탄수화물(kcal)'),
                      SizedBox(
                        width: valWidth * 0.008,
                      ),
                      MiniBox(context, Color(0xffF2D8A7), miniBoxSize, 0.17, 10,
                          '단백질(kcal)'),
                      SizedBox(
                        width: valWidth * 0.008,
                      ),
                      MiniBox(context, Color(0xffA0B1DF), miniBoxSize, 0.14, 10,
                          '지방(kcal)'),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
              height: valHeight * 0.3,
              width: graphWidth,
              decoration: BoxDecoration(
                  color: bgColor,
                  boxShadow: [
                    BoxShadow(color: shadowColor, blurRadius: graphBlur)
                  ],
                  borderRadius: BorderRadius.circular(graphBorderRadius)),
              child: Stack(
                children: [
                  Container(
                    height: valHeight * 0.34,
                    width: graphWidth,
                    padding: EdgeInsets.symmetric(
                        vertical: valHeight * 0.008,
                        horizontal: valWidth * 0.01),
                    child: MadeLineChart(scores: _scores),
                  ),
                  Container(
                    height: valHeight * 0.34,
                    width: graphWidth,
                    padding: EdgeInsets.symmetric(
                        vertical: valHeight * 0.008,
                        horizontal: valWidth * 0.01),
                    child: MadeLineChart(scores: _scores),
                  ),
                  Container(
                    height: valHeight * 0.34,
                    width: graphWidth,
                    padding: EdgeInsets.symmetric(
                        vertical: valHeight * 0.008,
                        horizontal: valWidth * 0.01),
                    child: GroupBarThreeChart(),
                  ),
                ],
              )),
          SizedBox(height: valHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: valWidth * 0.07,
              ),
              Container(
                height: valHeight * 0.052,
                width: valWidth * 0.2,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '식사 시간',
                    style:
                        TextStyle(fontSize: defaultSize * 14, color: txtColor),
                  ),
                ),
              ),
              SizedBox(width: valWidth * 0.05),
              Row(
                children: [
                  MiniCircle(
                      context, Color(0xff9BC3C1), miniBoxSize, 0.08, 10, '아침'),
                  SizedBox(
                    width: valWidth * 0.035,
                  ),
                  MiniCircle(
                      context, Color(0xffF2D8A7), miniBoxSize, 0.09, 10, '점심'),
                  SizedBox(
                    width: valWidth * 0.035,
                  ),
                  MiniCircle(
                      context, Color(0xFFA0B1DF), miniBoxSize, 0.09, 10, '저녁'),
                  SizedBox(
                    width: valWidth * 0.035,
                  ),
                  MiniCircle(
                      context, Color(0xffDBB9C7), miniBoxSize, 0.09, 10, '간식'),
                ],
              ),
            ],
          ),
          Container(
            height: valHeight * 0.23,
            width: graphWidth,
            decoration: BoxDecoration(
                color: bgColor,
                boxShadow: [
                  BoxShadow(color: shadowColor, blurRadius: graphBlur)
                ],
                borderRadius: BorderRadius.circular(graphBorderRadius)),
            child: Center(
                child: Container(
              height: valHeight * 0.20,
              width: valWidth * 0.84,
              child: MadeScatterChart(food: _food),
            )),
          ),
          SizedBox(
            height: valHeight * 0.05,
          ),
          DividewithObj(
              context,
              Container(
                width: valWidth * 0.18,
                child: Text(
                  '코칭',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: linetxtColor, fontSize: defaultSize * 14),
                ),
              ),
              0.12,
              0.7),
          SizedBox(
            height: valHeight * 0.01,
          ),
          Row(
            //기간(날짜) 선택하는 bar.
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: valWidth * 0.17,
                height: valHeight * 0.055,
                child: IconButton(
                  icon: SvgPicture.asset('images/arrow towards left_icon.svg'),
                  onPressed: () {
                    controller.dateMinus7(controller.date);
                    controller.rdateMinus7(controller.reportDay);
                  },
                ),
              ),

              Container(
                width: valWidth * 0.66,
                height: valHeight * 0.05,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      controller.startDate(controller.date).month.toString() +
                          "월 " +
                          controller.startDate(controller.date).day.toString() +
                          "일 - " +
                          controller.endDate(controller.date).month.toString() +
                          "월 " +
                          controller.endDate(controller.date).day.toString() +
                          "일",
                      style: TextStyle(
                          fontSize: defaultSize * 17, color: txtColor),
                      textAlign: TextAlign.center),
                ),
              ),

              //날짜 오른쪽으로 넘기는 버튼
              Container(
                width: valWidth * 0.17,
                height: valHeight * 0.05,
                child: IconButton(
                  icon: SvgPicture.asset('images/arrow towards right_icon.svg'),
                  onPressed: () {
                    controller.datePlus7(controller.date);
                    controller.rdatePlus7(controller.reportDay);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: valHeight * 0.01,
          ),
          Container(
            height: 7 * dayButtonHeight + 6 * blankBetweenButton,
            width: graphWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //여기에 좌측 버튼
              children: [
                Container(
                  height: 7 * dayButtonHeight + 6 * blankBetweenButton,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: dayButtonHeight,
                        width: dayButtonWidth,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffD2ABBA), blurRadius: 0.8),
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(valWidth * 0.04),
                              bottomLeft: Radius.circular(valWidth * 0.04)),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(valWidth * 0.04),
                                    bottomLeft:
                                        Radius.circular(valWidth * 0.04)),
                              ),
                              primary: dayButton1Color,
                              minimumSize:
                                  Size(dayButtonWidth, dayButtonHeight)),
                          child: Text(
                            dayButton1txt,
                            style: TextStyle(
                              color: txtColor,
                              fontSize: defaultSize * 12,
                            ),
                          ),
                          onPressed: () {
                            dayButtonCase = 0;
                            setState(() {
                              dayButton1Color = Color(0xff474A55);
                              dayButton2Color = Color(0xff0B202A);
                              dayButton3Color = Color(0xff0B202A);
                              dayButton4Color = Color(0xff0B202A);
                              dayButton5Color = Color(0xff0B202A);
                              dayButton6Color = Color(0xff0B202A);
                              dayButton7Color = Color(0xff0B202A);
                            });
                            controller.updateReport(
                                controller.startDate(controller.date));
                          },
                        ),
                      ),
                      SizedBox(height: blankBetweenButton),
                      Container(
                        height: dayButtonHeight,
                        width: dayButtonWidth,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffD2ABBA), blurRadius: 0.4),
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(valWidth * 0.04),
                              bottomLeft: Radius.circular(valWidth * 0.04)),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(valWidth * 0.04),
                                    bottomLeft:
                                        Radius.circular(valWidth * 0.04)),
                              ),
                              primary: dayButton2Color,
                              minimumSize:
                                  Size(dayButtonWidth, dayButtonHeight)),
                          child: Text(
                            dayButton2txt,
                            style: TextStyle(
                              color: txtColor,
                              fontSize: defaultSize * 12,
                            ),
                          ),
                          onPressed: () {
                            dayButtonCase = 1;
                            setState(() {
                              dayButton2Color = Color(0xff474A55);
                              dayButton1Color = Color(0xff0B202A);
                              dayButton3Color = Color(0xff0B202A);
                              dayButton4Color = Color(0xff0B202A);
                              dayButton5Color = Color(0xff0B202A);
                              dayButton6Color = Color(0xff0B202A);
                              dayButton7Color = Color(0xff0B202A);
                            });
                            controller.updateReport(
                                controller.TueDate(controller.date));
                          },
                        ),
                      ),
                      SizedBox(height: blankBetweenButton),
                      Container(
                        height: dayButtonHeight,
                        width: dayButtonWidth,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffD2ABBA), blurRadius: 0.8),
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(valWidth * 0.04),
                              bottomLeft: Radius.circular(valWidth * 0.04)),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(valWidth * 0.04),
                                    bottomLeft:
                                        Radius.circular(valWidth * 0.04)),
                              ),
                              primary: dayButton3Color,
                              minimumSize:
                                  Size(dayButtonWidth, dayButtonHeight)),
                          child: Text(
                            dayButton3txt,
                            style: TextStyle(
                              color: txtColor,
                              fontSize: defaultSize * 12,
                            ),
                          ),
                          onPressed: () {
                            dayButtonCase = 0;
                            setState(() {
                              dayButton3Color = Color(0xff474A55);
                              dayButton2Color = Color(0xff0B202A);
                              dayButton1Color = Color(0xff0B202A);
                              dayButton4Color = Color(0xff0B202A);
                              dayButton5Color = Color(0xff0B202A);
                              dayButton6Color = Color(0xff0B202A);
                              dayButton7Color = Color(0xff0B202A);
                            });
                            controller.updateReport(
                                controller.WedDate(controller.date));
                          },
                        ),
                      ),
                      SizedBox(height: blankBetweenButton),
                      Container(
                        height: dayButtonHeight,
                        width: dayButtonWidth,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffD2ABBA), blurRadius: 0.8),
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(valWidth * 0.04),
                              bottomLeft: Radius.circular(valWidth * 0.04)),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(valWidth * 0.04),
                                    bottomLeft:
                                        Radius.circular(valWidth * 0.04)),
                              ),
                              primary: dayButton4Color,
                              minimumSize:
                                  Size(dayButtonWidth, dayButtonHeight)),
                          child: Text(
                            dayButton4txt,
                            style: TextStyle(
                              color: txtColor,
                              fontSize: defaultSize * 12,
                            ),
                          ),
                          onPressed: () {
                            dayButtonCase = 0;
                            setState(() {
                              dayButton4Color = Color(0xff474A55);
                              dayButton2Color = Color(0xff0B202A);
                              dayButton1Color = Color(0xff0B202A);
                              dayButton3Color = Color(0xff0B202A);
                              dayButton5Color = Color(0xff0B202A);
                              dayButton6Color = Color(0xff0B202A);
                              dayButton7Color = Color(0xff0B202A);
                            });
                            controller.updateReport(
                                controller.ThuDate(controller.date));
                          },
                        ),
                      ),
                      SizedBox(height: blankBetweenButton),
                      Container(
                        height: dayButtonHeight,
                        width: dayButtonWidth,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffD2ABBA), blurRadius: 0.8),
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(valWidth * 0.04),
                              bottomLeft: Radius.circular(valWidth * 0.04)),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(valWidth * 0.04),
                                    bottomLeft:
                                        Radius.circular(valWidth * 0.04)),
                              ),
                              primary: dayButton5Color,
                              minimumSize:
                                  Size(dayButtonWidth, dayButtonHeight)),
                          child: Text(
                            dayButton5txt,
                            style: TextStyle(
                              color: txtColor,
                              fontSize: defaultSize * 12,
                            ),
                          ),
                          onPressed: () {
                            dayButtonCase = 0;
                            setState(() {
                              dayButton5Color = Color(0xff474A55);
                              dayButton2Color = Color(0xff0B202A);
                              dayButton1Color = Color(0xff0B202A);
                              dayButton4Color = Color(0xff0B202A);
                              dayButton3Color = Color(0xff0B202A);
                              dayButton6Color = Color(0xff0B202A);
                              dayButton7Color = Color(0xff0B202A);
                            });
                            controller.updateReport(
                                controller.FriDate(controller.date));
                          },
                        ),
                      ),
                      SizedBox(height: blankBetweenButton),
                      Container(
                        height: dayButtonHeight,
                        width: dayButtonWidth,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffD2ABBA), blurRadius: 0.8),
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(valWidth * 0.04),
                              bottomLeft: Radius.circular(valWidth * 0.04)),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(valWidth * 0.04),
                                    bottomLeft:
                                        Radius.circular(valWidth * 0.04)),
                              ),
                              primary: dayButton6Color,
                              minimumSize:
                                  Size(dayButtonWidth, dayButtonHeight)),
                          child: Text(
                            dayButton6txt,
                            style: TextStyle(
                              color: txtColor,
                              fontSize: defaultSize * 12,
                            ),
                          ),
                          onPressed: () {
                            dayButtonCase = 0;
                            setState(() {
                              dayButton6Color = Color(0xff474A55);
                              dayButton2Color = Color(0xff0B202A);
                              dayButton1Color = Color(0xff0B202A);
                              dayButton4Color = Color(0xff0B202A);
                              dayButton5Color = Color(0xff0B202A);
                              dayButton3Color = Color(0xff0B202A);
                              dayButton7Color = Color(0xff0B202A);
                            });
                            controller.updateReport(
                                controller.SatDate(controller.date));
                          },
                        ),
                      ),
                      SizedBox(height: blankBetweenButton),
                      Container(
                        height: dayButtonHeight,
                        width: dayButtonWidth,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffD2ABBA), blurRadius: 0.8),
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(valWidth * 0.04),
                              bottomLeft: Radius.circular(valWidth * 0.04)),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(valWidth * 0.04),
                                    bottomLeft:
                                        Radius.circular(valWidth * 0.04)),
                              ),
                              primary: dayButton7Color,
                              minimumSize:
                                  Size(dayButtonWidth, dayButtonHeight)),
                          child: Text(
                            dayButton7txt,
                            style: TextStyle(
                              color: txtColor,
                              fontSize: defaultSize * 12,
                            ),
                          ),
                          onPressed: () {
                            dayButtonCase = 0;
                            setState(() {
                              dayButton7Color = Color(0xff474A55);
                              dayButton2Color = Color(0xff0B202A);
                              dayButton1Color = Color(0xff0B202A);
                              dayButton4Color = Color(0xff0B202A);
                              dayButton5Color = Color(0xff0B202A);
                              dayButton6Color = Color(0xff0B202A);
                              dayButton3Color = Color(0xff0B202A);
                            });
                            controller.updateReport(
                                controller.endDate(controller.date));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: valWidth * 0.015),
                InitCoaching(context, controller.reportDay, dayButtonHeight,
                    dayButtonWidth, blankBetweenButton, graphWidth),
              ],
            ),
          ),
          SizedBox(
            height: valHeight * 0.02,
          )
        ])));
      });
    } else if (buttonCase == 1) {
      //31일로 선택되었을 때 표현될 위젯들은 여기에
      return Container(
          child: Center(
              child: Column(children: [
        SizedBox(height: valHeight * 0.035),
        Row(
          children: [
            SizedBox(
              width: valWidth * 0.07,
            ),
            Container(
              height: valHeight * 0.052,
              width: valWidth * 0.2,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '섭취 칼로리',
                  style: TextStyle(fontSize: defaultSize * 14, color: txtColor),
                ),
              ),
            ),
            SizedBox(width: valWidth * 0.05),
            Row(
              children: [
                MiniBox(context, txtColor, miniBoxSize, 0.165, 10, '스트레스(%)'),
                SizedBox(
                  width: valWidth * 0.008,
                ),
                MiniBox(context, Color(0xff9BC3C1), miniBoxSize, 0.2, 10,
                    '총 섭취량(kcal)'),
              ],
            ),
          ],
        ),
        Container(
            height: valHeight * 0.34,
            width: graphWidth,
            decoration: BoxDecoration(
                color: bgColor,
                boxShadow: [
                  BoxShadow(color: shadowColor, blurRadius: graphBlur)
                ],
                borderRadius: BorderRadius.circular(graphBorderRadius)),
            child: Stack(
              children: [
                Container(
                  height: valHeight * 0.34,
                  width: graphWidth,
                  padding: EdgeInsets.symmetric(
                      vertical: valHeight * 0.008, horizontal: valWidth * 0.01),
                  child: MadeLineChart(scores: _scores),
                ),
                Container(
                  height: valHeight * 0.34,
                  width: graphWidth,
                  padding: EdgeInsets.symmetric(
                      vertical: valHeight * 0.008, horizontal: valWidth * 0.01),
                  child: MadeLineChart(scores: _scores),
                ),
              ],
            )),
        SizedBox(
          height: valHeight * 0.015,
        ),
        FoodCalendar(),
      ])));
    } else if (buttonCase == 2) {
      //12개월로 선택되었을 때 표현될 위젯들은 여기에.
      return Container(
          child: Center(
              child: Column(children: [
        SizedBox(height: valHeight * 0.035),
        Row(
          children: [
            SizedBox(
              width: valWidth * 0.07,
            ),
            Container(
              height: valHeight * 0.052,
              width: valWidth * 0.2,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '섭취 칼로리',
                  style: TextStyle(fontSize: defaultSize * 14, color: txtColor),
                ),
              ),
            ),
            SizedBox(width: valWidth * 0.05),
            Row(
              children: [
                MiniBox(context, txtColor, miniBoxSize, 0.165, 10, '스트레스(%)'),
                SizedBox(
                  width: valWidth * 0.008,
                ),
                MiniBox(context, Color(0xff9BC3C1), miniBoxSize, 0.2, 10,
                    '총 섭취량(kcal)'),
              ],
            ),
          ],
        ),
        Container(
          height: valHeight * 0.34,
          width: graphWidth,
          decoration: BoxDecoration(
              color: bgColor,
              boxShadow: [BoxShadow(color: shadowColor, blurRadius: graphBlur)],
              borderRadius: BorderRadius.circular(graphBorderRadius)),
          child: Stack(
            children: [
              Container(
                height: valHeight * 0.34,
                width: graphWidth,
                padding: EdgeInsets.symmetric(
                    vertical: valHeight * 0.008, horizontal: valWidth * 0.01),
                child: MadeLineChart(scores: _scores),
              ),
              Container(
                height: valHeight * 0.34,
                width: graphWidth,
                padding: EdgeInsets.symmetric(
                    vertical: valHeight * 0.008, horizontal: valWidth * 0.01),
                child: MadeLineChart(scores: _scores),
              ),
            ],
          ),
        ),
        SizedBox(
          height: valHeight * 0.015,
        ),
        Row(
          //기간(날짜) 선택하는 bar.
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              //날짜 왼쪽으로 넘기는 버튼
              onTap: () {},
              child: Container(
                width: valWidth * 0.1,
                height: valHeight * 0.1,
                child: Text('왼쪽버튼'),
              ),
            ),
            Container(
              width: valWidth * 0.8,
              child: Text('보고 있는 날짜 범위'),
            ),
            GestureDetector(
              //날짜 오른쪽으로 넘기는 버튼
              onTap: () {},
              child: Container(
                width: valWidth * 0.1,
                height: valHeight * 0.1,
                child: Text('오른쪽버튼'),
              ),
            ),
          ],
        ),
        FoodCalendar(),
      ])));
    } else {
      return Container();
    }
  }
}
