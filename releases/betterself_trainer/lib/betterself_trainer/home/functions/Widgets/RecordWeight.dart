import 'package:betterself_trainer/functions/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'package:get/get.dart';

double? widgetHeight2;
double? widgetWidth2;
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

class RecordWeight extends StatefulWidget {
  RecordWeight(double widgetHeight1, double widgetWidth1) {
    widgetHeight2 = widgetHeight1;
    widgetWidth2 = widgetWidth1;
  }
  @override
  _RecordWeight createState() => _RecordWeight();
}

class _RecordWeight extends State<RecordWeight> {
  @override
  Widget build(BuildContext context) {
    double widgetWidth = widgetWidth2!;
    double widgetHeight = widgetHeight2!;
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    final outTopBlank = valHeight * 0.007; //바깥쪽 여백
    final outLeftBlank = valWidth * 0.012;
    final inTopBlank = valHeight * 0.008; //안쪽 여백
    final inLeftBlank = valWidth * 0.03;

    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    double defaultSize = valWidth * 0.0025;

    return GetBuilder<ProfileController>(builder: (controller) {
      return Container(
          height: widgetHeight,
          width: widgetWidth,
          padding: EdgeInsets.fromLTRB(
              outLeftBlank, outTopBlank, outLeftBlank, outTopBlank), //바깥쪽 여백
          child: Container(
              decoration: BoxDecoration(
                color: Color(0xff333C47),
                borderRadius: BorderRadius.circular(valWidth * 0.03),
              ),
              padding: EdgeInsets.fromLTRB(
                  inLeftBlank, inTopBlank, inLeftBlank, inTopBlank), //안쪽 여백
              child: Column(
                // 내용물
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // 좌측 상단 작은 박스
                    height: valHeight * 0.02,
                    width: valWidth * 0.24,
                    decoration: BoxDecoration(
                        color: Color(0xff53525E),
                        borderRadius: BorderRadius.circular(valWidth * 0.01)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '오늘의 체중 기록',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: txtColor, fontSize: defaultSize * 10),
                      ),
                    ),
                  ),
                  SizedBox(height: valHeight * 0.016),
                  Container(
                    width: widgetWidth - outLeftBlank * 2 - inLeftBlank * 2,
                    height: widgetHeight * 0.6,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Container(
                          //체중 입력란
                          height: widgetHeight * 0.15,
                          width: widgetWidth * 0.6,
                          decoration: BoxDecoration(
                              color: Color(0xff53525E),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(valWidth * 0.015))),

                          child: KeyboardActions(
                            disableScroll: true,
                            config: _buildConfig(context),
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: txtColor, fontSize: defaultSize * 15),
                              keyboardType: TextInputType.number,
                              focusNode: _nodeText2,
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: txtColor,
                                      fontSize: defaultSize * 15)),
                              onChanged: (text) {
                                controller.weightSelected(text);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )));
    });
  }
}
