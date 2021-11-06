import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

import 'functions/Widgets/ActivityGraph.dart';
import 'functions/Widgets/Coaching.dart';
import 'functions/Widgets/ExerciseDaily.dart';
import 'functions/Widgets/ExerciseGraph.dart';
import 'functions/Widgets/FoodDaily.dart';
import 'functions/Widgets/FoodGraph.dart';
import 'functions/Widgets/ExerciseGraph.dart';
import 'functions/Widgets/FoodDaily.dart';
import 'functions/Widgets/FoodGraph.dart';
import 'functions/Widgets/InbodyGraph.dart';
import 'functions/Widgets/RecordWeight.dart';
import 'functions/Widgets/Reminder.dart';
import 'functions/Widgets/SleepGraph.dart';
import 'functions/Widgets/SleepTimeGraph.dart';
import 'functions/Widgets/StressDaily.dart';
import 'functions/Widgets/StressGraph.dart';
import 'package:betterme/betterme/login/initialsetting/InitialSettingScreen.dart';

import 'package:betterme/betterme/login/initialsetting/InitialSettingScreen.dart';

import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:get/get.dart';

// import 'functions/home_add_1.dart';
// import 'functions/home_add_2.dart';

// import 'package:timeline_tile/timeline_tile.dart';
// import 'package:flutter_svg/svg.dart';

final FocusNode _nodeText1 = FocusNode();
final FocusNode _nodeText2 = FocusNode();

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
    double defaultSize = valWidth * 0.0025;
    return GetBuilder<ProfileController>(builder: (controller) {
      return Container(
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
                        'Hi, ' + 'Kyungbin' + '!',
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
                          builder: (BuildContext context) => AlertDialog(
                                backgroundColor: bgColor,
                                title: Text(
                                  '체중을 입력하세요',
                                  style: TextStyle(
                                      color: txtColor,
                                      fontSize: defaultSize * 15),
                                ),
                                content: SizedBox(
                                  height: valHeight * 0.15,
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
                                          margin: EdgeInsets.only(
                                              top: valHeight * 0.022),
                                          child: Text(
                                            '시간',
                                            style: TextStyle(
                                                color: txtColor,
                                                fontSize: defaultSize * 15),
                                          ),
                                        ),
                                        Container(
                                          height: valHeight * 0.05,
                                          width: valWidth * 0.2,
                                          child: KeyboardActions(
                                            // 팝업 내용
                                            disableScroll: true,
                                            config: _buildConfig(context),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: txtColor,
                                                  fontSize: defaultSize * 15),
                                              keyboardType:
                                                  TextInputType.number,
                                              focusNode: _nodeText2,
                                              decoration: InputDecoration(
                                                  hintStyle: TextStyle(
                                                      color: txtColor,
                                                      fontSize:
                                                          defaultSize * 15)),
                                              onChanged: (text) {
                                                //여기에 시간 저장
                                              },
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: valHeight * 0.03,
                                          width: valWidth * 0.05,
                                          margin: EdgeInsets.only(
                                              top: valHeight * 0.022),
                                        ),
                                      ],
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
                                        Container(
                                          height: valHeight * 0.05,
                                          width: valWidth * 0.2,
                                          child: KeyboardActions(
                                            // 팝업 내용
                                            disableScroll: true,
                                            config: _buildConfig(context),
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: txtColor,
                                                  fontSize: defaultSize * 15),
                                              keyboardType:
                                                  TextInputType.number,
                                              focusNode: _nodeText2,
                                              decoration: InputDecoration(
                                                  hintStyle: TextStyle(
                                                      color: txtColor,
                                                      fontSize:
                                                          defaultSize * 15)),
                                              onChanged: (text) {
                                                controller.weightSelected(text);
                                              },
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: valHeight * 0.03,
                                          width: valWidth * 0.05,
                                          margin: EdgeInsets.only(
                                              top: valHeight * 0.022),
                                          child: Text(
                                            'kg',
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
                                  TextButton(
                                    onPressed: () {
                                      // 여기에 저장 구현
                                      Navigator.pop(context, '저장');
                                    },
                                    child: Text(
                                      '저장',
                                      style: TextStyle(
                                          color: txtColor,
                                          fontSize: defaultSize * 12),
                                    ),
                                  )
                                ],
                              )),
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
                          child:
                              SvgPicture.asset('images/weightscale_icon.svg')),
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
                  //위젯들 구성하는 화면 여기부터
                  height: screenHeight,
                  width: screenWidth,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SleepGraph(gridHeight * 2, gridWidth * 2),
                            ActivityGraph(gridHeight * 2, gridWidth * 4),
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
                        Row(
                          children: [
                            StressGraph(gridHeight * 2, gridWidth * 3),
                            InbodyGraph(gridHeight * 2, gridWidth * 3),
                          ],
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
