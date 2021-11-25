import 'package:betterme/betterme/report/Widgets/total_report/CoachingSet.dart';
import 'package:betterme/functions/Widgets/DividewithObj.dart';
import 'package:betterme/betterme/report/Widgets/total_report/ReportSet.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';
import '../home/CameraScreen/CameraScreen.dart';

import 'package:camera/camera.dart';

import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';

import 'package:flutter_picker/flutter_picker.dart';

import '../home/functions/WriteAppleHealth.dart';

final FocusNode _nodeText1 = FocusNode();
final FocusNode _nodeText2 = FocusNode();
DateTime date = DateTime.now();

KeyboardActionsConfig _buildConfig(BuildContext context) {
  return KeyboardActionsConfig(
    keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
    keyboardBarColor: Colors.grey[200],
    nextFocus: false,
    actions: [
      KeyboardActionsItem(focusNode: _nodeText2),
    ],
  );
}

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreen createState() => _ReportScreen();
}

int buttonCase = 0; // 7일/31일/12개월 버튼 상태 확인용

class _ReportScreen extends State<ReportScreen> {
  List<bool> GraphTypes = [true, true, true, true, true];
  Color button1Color = Color(0xff827380);
  Color button2Color = Color(0xff0B202A);
  Color button3Color = Color(0xff0B202A);
  DateTime record_date = DateTime.now();

  void initState() {
    super.initState();
    buttonCase = 0;
    print('init at report');
    ProfileController.to.initalDatelist(7);
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    final shadowColor = Color(0xffD2ABBA);
    double defaultSize = valWidth * 0.0025;

    final txtFeildColor = Color(0xff333C47); //텍스트
    final double TextfieldSize = 40;

    return GetBuilder<ProfileController>(builder: (controller) {
      return GestureDetector(
        onHorizontalDragUpdate: (details) async {
          // print(details.delta.distance);
          if (details.delta.direction <= 0 && details.delta.distance >= 7.5) {
            print("left");
            print(details.delta.direction);
            var _cameras = await availableCameras();
            Get.to(
              () => CameraScreen(),
              fullscreenDialog: true,
              transition: Transition.leftToRight,
              duration: Duration(milliseconds: 500),
              arguments: _cameras,
            );
          }
        },
        child: Container(
          color: bgColor,
          child: Scaffold(
            backgroundColor: bgColor,
            body: ListView(children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          width: valWidth * 0.1,
                        ),
                        Container(
                            height: 32,
                            width: valWidth * 0.45,
                            padding: EdgeInsets.only(top: 13),
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Image.asset('images/app_title.png'))),
                        SizedBox(
                          width: valWidth * 0.255,
                        ),
                        GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    backgroundColor: bgColor,
                                    content: SizedBox(
                                      height: valHeight * 0.24,
                                      child: Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: valHeight * 0.03,
                                              width: valWidth * 0.1,
                                              child: Text(
                                                '날짜',
                                                style: TextStyle(
                                                    color: txtColor,
                                                    fontSize: defaultSize * 15),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: GestureDetector(
                                                onTap: () {
                                                  // _openDatePicker(context);
                                                  // BottomPicker.date(
                                                  //         title: "날짜",
                                                  //         titleStyle: TextStyle(
                                                  //             color: txtColor,
                                                  //             fontSize:
                                                  //                 defaultSize *
                                                  //                     15),
                                                  //         onChange: (index) {
                                                  //           print(index);
                                                  //         },
                                                  //         onSubmit: (index) {
                                                  //           print(index);
                                                  //           controller
                                                  //               .weightdaySelected(index
                                                  //                   .toString()
                                                  //                   .substring(
                                                  //                       0, 10));
                                                  //         },
                                                  //         bottomPickerTheme:
                                                  //             BOTTOM_PICKER_THEME
                                                  //                 .PLUM_PLATE)
                                                  //     .show(context);

                                                  showCupertinoModalPopup(
                                                    context: context,
                                                    builder: (context) {
                                                      return Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              // color: Color(0xffffffff),
                                                              color: Color
                                                                  .fromRGBO(
                                                                      40,
                                                                      51,
                                                                      55,
                                                                      1),
                                                              border: Border(
                                                                bottom:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xff999999),
                                                                  width: 0.0,
                                                                ),
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                CupertinoButton(
                                                                  child: Text(
                                                                      '취소'),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    horizontal:
                                                                        16.0,
                                                                    vertical:
                                                                        5.0,
                                                                  ),
                                                                ),
                                                                CupertinoButton(
                                                                  child: Text(
                                                                      '완료'),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .symmetric(
                                                                    horizontal:
                                                                        16.0,
                                                                    vertical:
                                                                        5.0,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom: 35),
                                                            height: 300.0,
                                                            width: valWidth,
                                                            color:
                                                                Color.fromRGBO(
                                                                    40,
                                                                    51,
                                                                    55,
                                                                    1),
                                                            child:
                                                                CupertinoTheme(
                                                              data:
                                                                  CupertinoThemeData(
                                                                textTheme:
                                                                    CupertinoTextThemeData(
                                                                  textStyle: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                              child:
                                                                  CupertinoDatePicker(
                                                                dateOrder:
                                                                    DatePickerDateOrder
                                                                        .ymd,
                                                                minimumDate: DateTime
                                                                        .now()
                                                                    .add(Duration(
                                                                        days:
                                                                            -7)),
                                                                maximumDate:
                                                                    DateTime
                                                                        .now(),
                                                                initialDateTime:
                                                                    record_date,
                                                                onDateTimeChanged:
                                                                    (e) {
                                                                  print(e);
                                                                },
                                                                mode:
                                                                    CupertinoDatePickerMode
                                                                        .date,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                    //날짜
                                                    width: valWidth * 0.2,
                                                    height: valHeight *
                                                        0.04, //valHeight * 0.06,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: txtFeildColor,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    valWidth *
                                                                        0.015))),
                                                    child: Text(
                                                      record_date.toString(),
                                                      style: TextStyle(
                                                          color: txtColor,
                                                          fontSize:
                                                              defaultSize * 15),
                                                    )),
                                              ),
                                            ),
                                            Container(
                                              height: valHeight * 0.03,
                                              width: valWidth * 0.05,
                                              margin: EdgeInsets.only(
                                                  top: valHeight * 0.022),
                                            ) //margin
                                          ],
                                        ),
                                        SizedBox(
                                          height: valHeight * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: valHeight * 0.03,
                                              width: valWidth * 0.1,
                                              child: Text(
                                                '시간',
                                                style: TextStyle(
                                                    color: txtColor,
                                                    fontSize: defaultSize * 15),
                                              ),
                                            ),
                                            GestureDetector(
                                              child: Container(
                                                height: valHeight * 0.04,
                                                width: valWidth * 0.2,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff333C47),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          valWidth * 0.015),
                                                ),
                                                margin: EdgeInsets.only(
                                                    top: valHeight * 0.0153),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    '${date.hour}:' +
                                                        '${date.minute}'
                                                            .padLeft(2, '0'),
                                                    style: TextStyle(
                                                        color: txtColor),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                Picker(
                                                    adapter:
                                                        NumberPickerAdapter(
                                                            data: [
                                                          NumberPickerColumn(
                                                            begin: 0,
                                                            end: 23,
                                                            initValue: date.hour
                                                                .toInt(),
                                                          ),
                                                          NumberPickerColumn(
                                                            begin: 00,
                                                            end: 59,
                                                            initValue: date
                                                                .minute
                                                                .toInt(),
                                                          ),
                                                        ]),
                                                    delimiter: [
                                                      PickerDelimiter(
                                                          child: Container(
                                                        width: 10,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(':'),
                                                      ))
                                                    ],
                                                    hideHeader: true,
                                                    title: Text("시간을 입력해주세요."),
                                                    selectedTextStyle:
                                                        TextStyle(
                                                            color: Colors.blue),
                                                    onConfirm: (Picker picker,
                                                        List value) {
                                                      print(value.toString());
                                                      print(picker
                                                          .getSelectedValues());
                                                      List selectedValues = [];
                                                      selectedValues = picker
                                                          .getSelectedValues();
                                                      date = DateTime(
                                                          DateTime.now().year,
                                                          DateTime.now().month,
                                                          DateTime.now().day,
                                                          selectedValues[0],
                                                          selectedValues[1]);
                                                      setState(() {});
                                                    }).showDialog(context);
                                              },
                                            ),
                                            Container(
                                              height: valHeight * 0.03,
                                              width: valWidth * 0.05,
                                              margin: EdgeInsets.only(
                                                  top: valHeight * 0.022),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: valHeight * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: valWidth * 0.018,
                                            ),
                                            Container(
                                              height: valHeight * 0.03,
                                              width: valWidth * 0.1,
                                              margin: EdgeInsets.only(
                                                  top: valHeight * 0.022),
                                              child: Text(
                                                '체중',
                                                style: TextStyle(
                                                    color: txtColor,
                                                    fontSize: defaultSize * 15),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Picker(
                                                    adapter:
                                                        NumberPickerAdapter(
                                                            data: [
                                                          NumberPickerColumn(
                                                            begin: 0,
                                                            end: 200,
                                                            // initValue: weight!.toInt(),
                                                            initValue: int.parse(
                                                                controller
                                                                    .weight
                                                                    .split(
                                                                        ".")[0]),
                                                          ),
                                                          NumberPickerColumn(
                                                            begin: 00,
                                                            end: 99,
                                                            initValue:
                                                                ((double.parse(controller.weight) %
                                                                            1) *
                                                                        100)
                                                                    .toInt(),
                                                          ),
                                                        ]),
                                                    delimiter: [
                                                      PickerDelimiter(
                                                          child: Container(
                                                        width: 10,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text('.'),
                                                      ))
                                                    ],
                                                    hideHeader: true,
                                                    title:
                                                        Text("체중(kg)을 입력해주세요."),
                                                    selectedTextStyle:
                                                        TextStyle(
                                                            color: Colors.blue),
                                                    onConfirm: (Picker picker,
                                                        List value) {
                                                      print(value.toString());
                                                      print(picker
                                                          .getSelectedValues());
                                                      List selectedValues = [];
                                                      selectedValues = picker
                                                          .getSelectedValues();
                                                      ProfileController.to
                                                          .weightSelected(
                                                              (selectedValues[
                                                                          0] +
                                                                      selectedValues[
                                                                              1] *
                                                                          0.01)
                                                                  .toString());
                                                      setState(() {});
                                                    }).showDialog(context);
                                              },
                                              child: Container(
                                                height: valHeight * 0.04,
                                                width: valWidth * 0.2,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff333C47),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          valWidth * 0.015),
                                                ),
                                                margin: EdgeInsets.only(
                                                    top: valHeight * 0.0153),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    // weight.toString(),
                                                    controller.weight,
                                                    style: TextStyle(
                                                        color: txtColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: valHeight * 0.03,
                                              width: valWidth * 0.07,
                                              margin: EdgeInsets.only(
                                                  top: valHeight * 0.022),
                                              child: Text(
                                                '  kg',
                                                style: TextStyle(
                                                    color: txtColor,
                                                    fontSize: defaultSize * 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                primary: Color(0xff333C47),
                                                minimumSize: Size(
                                                    valWidth * 0.27,
                                                    valHeight * 0.035),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            valWidth * 0.03)),
                                                side: BorderSide(
                                                    color: Color(0xff999CA2),
                                                    width: defaultSize * 0.7),
                                              ),
                                              onPressed: () {
                                                WriteAppleHealth.writeWeight();
                                                Navigator.pop(context, '저장');
                                              },
                                              child: Text(
                                                '저장',
                                                style: TextStyle(
                                                    color: txtColor,
                                                    fontSize: defaultSize * 12),
                                              )),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          child: Container(
                              //여기가 입력 버튼
                              width: 37,
                              height: 37,
                              margin: EdgeInsets.only(top: 5),
                              padding: EdgeInsets.fromLTRB(4, 4, 4, 1),
                              decoration: BoxDecoration(
                                  color: Color(0xff333C47),
                                  borderRadius: BorderRadius.circular(5)),
                              child: SvgPicture.asset(
                                  'images/weightscale_icon.svg')),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: valWidth * 0.81,
                      height: valHeight * 0.04,
                      margin: EdgeInsets.only(left: 0.095 * valWidth),
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(valWidth * 0.015),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffD2ABBA), blurRadius: 1.2),
                          ]),
                      child: Row(
                        // 여기서부터 버튼(7일/31일/12개월 구분)
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(valWidth * 0.015),
                                ),
                                primary: button1Color,
                                minimumSize:
                                    Size(valWidth * 0.27, valHeight * 0.04)),
                            child: Text(
                              '7일',
                              style: TextStyle(
                                color: txtColor,
                                fontSize: defaultSize * 14,
                              ),
                            ),
                            onPressed: () {
                              buttonCase = 0;
                              ProfileController.to.initalDatelist(7);
                              setState(() {
                                button1Color = Color(0xff827380);
                                button2Color = Color(0xff0B202A);
                                button3Color = Color(0xff0B202A);
                              });
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(valWidth * 0.015),
                                ),
                                primary: button2Color,
                                minimumSize:
                                    Size(valWidth * 0.27, valHeight * 0.04)),
                            child: Text(
                              '31일',
                              style: TextStyle(
                                color: txtColor,
                                fontSize: defaultSize * 14,
                              ),
                            ),
                            onPressed: () {
                              ProfileController.to.initalDatelist(31);
                              setState(() {
                                buttonCase = 1;
                                setState(() {
                                  button2Color = Color(0xff827380);
                                  button1Color = Color(0xff0B202A);
                                  button3Color = Color(0xff0B202A);
                                });
                              });
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(valWidth * 0.015),
                                ),
                                primary: button3Color,
                                minimumSize:
                                    Size(valWidth * 0.27, valHeight * 0.04)),
                            child: Text(
                              '12개월',
                              style: TextStyle(
                                color: txtColor,
                                fontSize: defaultSize * 14,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                buttonCase = 2;
                              });
                              ProfileController.to.initalDatelist(365);
                              setState(() {
                                button3Color = Color(0xff827380);
                                button2Color = Color(0xff0B202A);
                                button1Color = Color(0xff0B202A);
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Row(
                      //기간(날짜) 선택하는 bar.
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: valWidth * 0.15,
                          height: valHeight * 0.055,
                          child: IconButton(
                            icon: SvgPicture.asset(
                                'images/arrow towards left_icon.svg'),
                            onPressed: () {
                              controller.minusDatelist(controller.duration);
                            },
                          ),
                        ),
                        Container(
                          width: valWidth * 0.70,
                          height: valHeight * 0.05,
                          child: Align(
                            alignment: Alignment.center,
                            child: controller.duration == 365
                                ? Text(
                                    controller.totaldate.add(Duration(days: -(controller.duration - 1))).year.toString() +
                                        "년 " +
                                        controller.totaldate
                                            .add(Duration(
                                                days:
                                                    -(controller.duration - 1)))
                                            .month
                                            .toString() +
                                        "월 " +
                                        controller.totaldate
                                            .add(Duration(
                                                days:
                                                    -(controller.duration - 1)))
                                            .day
                                            .toString() +
                                        "일 - " +
                                        controller.totaldate.year.toString() +
                                        "년 " +
                                        controller.totaldate.month.toString() +
                                        "월 " +
                                        controller.totaldate.day.toString() +
                                        "일",
                                    style: TextStyle(
                                        fontSize: defaultSize * 17,
                                        color: txtColor),
                                    textAlign: TextAlign.center)
                                : Text(
                                    controller.totaldate
                                            .add(Duration(
                                                days:
                                                    -(controller.duration - 1)))
                                            .month
                                            .toString() +
                                        "월 " +
                                        controller.totaldate
                                            .add(Duration(days: -(controller.duration - 1)))
                                            .day
                                            .toString() +
                                        "일 - " +
                                        controller.totaldate.month.toString() +
                                        "월 " +
                                        controller.totaldate.day.toString() +
                                        "일",
                                    style: TextStyle(fontSize: defaultSize * 17, color: txtColor),
                                    textAlign: TextAlign.center),
                          ),
                        ),
                        //날짜 오른쪽으로 넘기는 버튼
                        (controller.totaldate.day == DateTime.now().day) &&
                                (controller.totaldate.month ==
                                    DateTime.now().month) &&
                                (controller.totaldate.year ==
                                    DateTime.now().year)
                            ? Container(
                                width: valWidth * 0.15,
                                height: valHeight * 0.05,
                              )
                            : Container(
                                width: valWidth * 0.15,
                                height: valHeight * 0.05,
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                      'images/arrow towards right_icon.svg'),
                                  onPressed: () {
                                    controller
                                        .plusDatelist(controller.duration);
                                  },
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReportSet(buttonCase: buttonCase),
                    SizedBox(
                      height: 7,
                    ),
                    DividewithObj(
                        context,
                        Container(
                            width: valWidth * 0.25,
                            child: Text(
                              "코칭",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.pink[100],
                              ),
                              textAlign: TextAlign.center,
                            )),
                        0.15,
                        0.6),
                    SizedBox(
                      height: 10,
                    ),
                    CoachingSet(buttonCase)
                  ],
                ),
              ),
            ]),
          ),
        ),
      );
    });
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
