import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_picker/flutter_picker.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

import 'CameraScreen/CameraScreen.dart';
import 'functions/Widgets/ActivityGraph.dart';
import 'functions/Widgets/Coaching.dart';
import 'functions/Widgets/FoodDaily.dart';
import 'functions/Widgets/InbodyGraph.dart';
import 'functions/Widgets/SleepGraph.dart';
import 'functions/Widgets/StressGraph.dart';
import 'functions/Widgets/ExerciseGraph.dart';

import 'package:keyboard_actions/keyboard_actions.dart';

import 'functions/WriteAppleHealth.dart';

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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final screenHeight = valHeight * 0.78;
    final screenWidth = valWidth * 0.9;

    final gridHeight = screenHeight / 8;
    final gridWidth = screenWidth / 6;

    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    final txtFeildColor = Color(0xff333C47); //텍스트
    final double TextfieldSize = 40;
    double defaultSize = valWidth * 0.0025;

    return GetBuilder<ProfileController>(builder: (controller) {
      return GestureDetector(
        onHorizontalDragUpdate: (details) async {
          if (details.delta.direction <= 0) {
            print("left");
            var _cameras = await availableCameras();
            Get.to(
              CameraScreen(),
              fullscreenDialog: true,
              transition: Transition.leftToRight,
              duration: Duration(milliseconds: 500),
              arguments: _cameras,
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF004E92),
                Color(0xFF000428),
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: bgColor,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: valHeight * 0.08,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: valWidth * 0.08,
                      ),
                      Container(
                        width: valWidth * 0.38,
                        child: Text(
                          'Hi, ' + controller.myProfile.value.name! + '!',
                          style: TextStyle(
                            fontSize: defaultSize * 19,
                            color: Color(0xffFFFDFD),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: valWidth * 0.34,
                      ), ////이 아래로 체중 입력 팝업
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
                                                BottomPicker.date(
                                                        title: "날짜",
                                                        titleStyle: TextStyle(
                                                            color: txtColor,
                                                            fontSize:
                                                                defaultSize *
                                                                    15),
                                                        onChange: (index) {
                                                          print(index);
                                                        },
                                                        onSubmit: (index) {
                                                          print(index);
                                                          controller
                                                              .weightdaySelected(
                                                                  index
                                                                      .toString()
                                                                      .substring(
                                                                          0,
                                                                          10));
                                                        },
                                                        bottomPickerTheme:
                                                            BOTTOM_PICKER_THEME
                                                                .PLUM_PLATE)
                                                    .show(context);
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
                                                    controller.weightday == null
                                                        ? ""
                                                        : controller.weightday
                                                            .toString(),
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
                                                  adapter: NumberPickerAdapter(
                                                      data: [
                                                        NumberPickerColumn(
                                                          begin: 0,
                                                          end: 23,
                                                          initValue:
                                                              date.hour.toInt(),
                                                        ),
                                                        NumberPickerColumn(
                                                          begin: 00,
                                                          end: 59,
                                                          initValue: date.minute
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
                                                  selectedTextStyle: TextStyle(
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
                                                  adapter: NumberPickerAdapter(
                                                      data: [
                                                        NumberPickerColumn(
                                                          begin: 0,
                                                          end: 200,
                                                          // initValue: weight!.toInt(),
                                                          initValue: int.parse(
                                                              controller.weight
                                                                  .split(
                                                                      ".")[0]),
                                                        ),
                                                        NumberPickerColumn(
                                                          begin: 00,
                                                          end: 99,
                                                          initValue:
                                                              ((double.parse(controller
                                                                              .weight) %
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
                                                  selectedTextStyle: TextStyle(
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
                                                            (selectedValues[0] +
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
                                              minimumSize: Size(valWidth * 0.27,
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
                            width: valWidth * 0.1,
                            height: valWidth * 0.1,
                            padding: EdgeInsets.fromLTRB(
                                valWidth * 0.01,
                                valWidth * 0.01,
                                valWidth * 0.01,
                                valWidth * 0.001),
                            decoration: BoxDecoration(
                                color: Color(0xff333C47),
                                borderRadius:
                                    BorderRadius.circular(valWidth * 0.02)),
                            child: SvgPicture.asset(
                                'images/weightscale_icon.svg')),
                      ),
                      SizedBox(
                        width: valWidth * 0.05,
                      )
                    ],
                  ),
                  SizedBox(
                    height: valHeight * 0.015,
                  ),
                  Container(
                    //위젯들 구성하는 화면 여기부터////////
                    height: screenHeight,
                    width: screenWidth,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SleepGraph(gridHeight * 2, gridWidth * 3),
                              StressGraph(gridHeight * 2, gridWidth * 3),
                            ],
                          ),
                          Row(
                            children: [
                              ExerciseGraph(gridHeight * 2, gridWidth * 3),
                              InbodyGraph(gridHeight * 2, gridWidth * 3),
                            ],
                          ),
                          Row(
                            children: [Coaching(gridHeight * 2, gridWidth * 6)],
                          ),
                          Row(
                            children: [
                              FoodDaily(gridHeight * 2, gridWidth * 6),
                            ],
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
