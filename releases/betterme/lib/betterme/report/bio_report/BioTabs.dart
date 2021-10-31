import 'package:flutter/material.dart';
import 'package:betterme/functions/Widgets/DividewithObj.dart';
import '../Widgets/MiniBox.dart';
import '../Widgets/CoachingTxtBox.dart';

int? buttonCase;

class BioTabs extends StatefulWidget {
  BioTabs(int a) {
    buttonCase = a;
  }

  @override
  _BioTabs createState() => _BioTabs();
}

class _BioTabs extends State<BioTabs> {
  Color dayButton1Color = Color(0xff0B202A);
  Color dayButton2Color = Color(0xff0B202A);
  Color dayButton3Color = Color(0xff474A55);
  Color dayButton4Color = Color(0xff0B202A);
  Color dayButton5Color = Color(0xff0B202A);
  Color dayButton6Color = Color(0xff0B202A);
  Color dayButton7Color = Color(0xff0B202A);
  int dayButtonCase = 0;

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

    double dayButtonHeight = valHeight * 0.06;
    double dayButtonWidth = valWidth * 0.124; //버튼크기
    double blankBetweenButton = valHeight * 0.005; //버튼사이 여백

    double miniBoxSize = 0.015;
    double defaultSize = valWidth * 0.0025; //폰트사이즈용
    double graphWidth = valWidth * 0.88; // 그래프들 너비

    if (buttonCase == 0) {
      //7일로 선택되었을 때 표현될 위젯들은 여기에.
      return Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      '신체 변화',
                      style: TextStyle(
                          fontSize: defaultSize * 14, color: txtColor),
                    ),
                  ),
                ),
                SizedBox(width: valWidth * 0.05),
                Row(
                  children: [
                    MiniBox(context, txtColor, miniBoxSize, 0.12, 10, '체중(kg)'),
                    SizedBox(
                      width: valWidth * 0.008,
                    ),
                    MiniBox(context, Color(0xffDBB9C7), miniBoxSize, 0.18, 10,
                        '골격근량(kg)'),
                    SizedBox(
                      width: valWidth * 0.008,
                    ),
                    MiniBox(context, Color(0xFFA0B1DF), miniBoxSize, 0.18, 10,
                        '체지방량(kg)'),
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
              child: Text('여기에 7일짜리 신체변화 그래프 들어가야 함.'),
            ),
            SizedBox(
              height: valHeight * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: valWidth * 0.07,
                ),
                Container(
                  height: valHeight * 0.05,
                  width: valWidth * 0.2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '스트레스',
                      style: TextStyle(
                          fontSize: defaultSize * 14, color: txtColor),
                    ),
                  ),
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
              child: Text('여기에 7일짜리 스트레스 그래프 들어가야 함.'),
            ),
            SizedBox(
              height: valHeight * 0.015,
            ),
            Row(
              children: [
                SizedBox(
                  width: valWidth * 0.07,
                ),
                Container(
                  height: valHeight * 0.05,
                  width: valWidth * 0.2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '수면',
                      style: TextStyle(
                          fontSize: defaultSize * 14, color: txtColor),
                    ),
                  ),
                ),
                SizedBox(width: valWidth * 0.13),
                Row(
                  children: [
                    MiniBox(context, Color(0xffF2D8A7), miniBoxSize, 0.08, 10,
                        'light'),
                    SizedBox(
                      width: valWidth * 0.022,
                    ),
                    MiniBox(context, Color(0xffDBB9C7), miniBoxSize, 0.11, 10,
                        'awake'),
                    SizedBox(
                      width: valWidth * 0.018,
                    ),
                    MiniBox(context, Color(0xFFA0B1DF), miniBoxSize, 0.12, 10,
                        'relaxed'),
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
              child: Text('여기에 7일짜리 수면 시간 그래프 들어가야 함.'),
            ),
            SizedBox(
              height: valHeight * 0.015,
            ),
            Row(
              children: [
                SizedBox(
                  width: valWidth * 0.07,
                ),
                Container(
                  height: valHeight * 0.05,
                  width: valWidth * 0.2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '수면 시간대',
                      style: TextStyle(
                          fontSize: defaultSize * 14, color: txtColor),
                    ),
                  ),
                ),
                SizedBox(width: valWidth * 0.13),
                Container(
                    width: valWidth * 0.08,
                    child: Text("light",
                        style: TextStyle(
                          fontSize: defaultSize * 10,
                          color: txtColor,
                        ))),
                Container(
                    width: valWidth * 0.25,
                    height: valHeight * 0.01,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xffA0B1DF), Color(0xff475B72)]))),
                Container(
                    width: valWidth * 0.15,
                    child: Text("relaxed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: defaultSize * 10, color: txtColor)))
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
              child: Text('여기에 7일짜리 수면 시간대 그래프 들어가야 함.'),
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
              height: valHeight * 0.02,
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
            SizedBox(
              height: valHeight * 0.03,
            ),
            Container(
              height: 7 * dayButtonHeight + 6 * blankBetweenButton,
              width: graphWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //여기에 좌측 버튼/////////////////////////////
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
                              '2',
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
                              '30',
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
                              '31',
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
                              '44',
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
                              '55',
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
                              '66',
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
                              '77',
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
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: valWidth * 0.015),
                  Container(
                    //여기에 코칭 텍스트 들어감.
                    height: dayButtonHeight * 7 + blankBetweenButton * 6,
                    width: graphWidth - dayButtonWidth - valWidth * 0.015,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(valWidth * 0.02),
                          bottomRight: Radius.circular(valWidth * 0.02)),
                      color: Color(0xff333C47),
                      boxShadow: [
                        BoxShadow(color: Color(0xffD2ABBA), blurRadius: 0.4),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(valWidth * 0.033,
                        valHeight * 0.035, valWidth * 0.033, valHeight * 0.35),
                    child: Text(
                      '여기에 코칭 내용adfadfasdfㅁㄴㅇㄻㅇㄹㄴㅁㅇㄻㄴㅇㄹㄴ',
                      softWrap: true,
                      style: TextStyle(
                          color: txtColor, fontSize: defaultSize * 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: valHeight * 0.1,
            )
          ])));
    } else if (buttonCase == 1) {
      //31일로 선택되었을 때 표현될 위젯들은 여기에/////////////////////////
      ////////////////////////////////////////////////////
      return Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      '신체 변화',
                      style: TextStyle(
                          fontSize: defaultSize * 14, color: txtColor),
                    ),
                  ),
                ),
                SizedBox(width: valWidth * 0.05),
                Row(
                  children: [
                    MiniBox(context, txtColor, miniBoxSize, 0.12, 10, '체중(kg)'),
                    SizedBox(
                      width: valWidth * 0.008,
                    ),
                    MiniBox(context, Color(0xffDBB9C7), miniBoxSize, 0.18, 10,
                        '골격근량(kg)'),
                    SizedBox(
                      width: valWidth * 0.008,
                    ),
                    MiniBox(context, Color(0xFFA0B1DF), miniBoxSize, 0.18, 10,
                        '체지방량(kg)'),
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
              child: Text('여기에 31일짜리 신체변화 그래프 들어가야 함.'),
            ),
            SizedBox(
              height: valHeight * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: valWidth * 0.07,
                ),
                Container(
                  height: valHeight * 0.05,
                  width: valWidth * 0.2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '스트레스',
                      style: TextStyle(
                          fontSize: defaultSize * 14, color: txtColor),
                    ),
                  ),
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
              child: Text('여기에 31일짜리 스트레스 그래프 들어가야 함.'),
            ),
            SizedBox(
              height: valHeight * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: valWidth * 0.07,
                ),
                Container(
                  height: valHeight * 0.05,
                  width: valWidth * 0.2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '수면',
                      style: TextStyle(
                          fontSize: defaultSize * 14, color: txtColor),
                    ),
                  ),
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
              child: Text('여기에 31일짜리 수면 그래프 들어가야 함.'),
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
              height: valHeight * 0.02,
            ),
            Row(
              //기간(월) 선택하는 bar.
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
            SizedBox(
              height: valHeight * 0.03,
            ),
            Container(
              height: valHeight * 0.5,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 해당 달의 달력'),
            ),
            SizedBox(
              height: valHeight * 0.02,
            ),
            CoachingTxtBox(
                context, 0, '생체 데이터 코칭\n' + '[2021/MM/dd]', '코칭 내용', 0.25),
            SizedBox(
              height: valHeight * 0.08,
            )
          ])));
    } else if (buttonCase == 2) {
      //12개월로 선택되었을 때 표현될 위젯들은 여기에.///////////////////////
      //////////////////////////////////////////////////
      return Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      '신체 변화',
                      style: TextStyle(
                          fontSize: defaultSize * 14, color: txtColor),
                    ),
                  ),
                ),
                SizedBox(width: valWidth * 0.05),
                Row(
                  children: [
                    MiniBox(context, txtColor, miniBoxSize, 0.12, 10, '체중(kg)'),
                    SizedBox(
                      width: valWidth * 0.008,
                    ),
                    MiniBox(context, Color(0xffDBB9C7), miniBoxSize, 0.18, 10,
                        '골격근량(kg)'),
                    SizedBox(
                      width: valWidth * 0.008,
                    ),
                    MiniBox(context, Color(0xFFA0B1DF), miniBoxSize, 0.18, 10,
                        '체지방량(kg)'),
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
              child: Text('여기에 12개월짜리 신체변화 그래프 들어가야 함.',
                  style: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: valHeight * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: valWidth * 0.07,
                ),
                Container(
                  height: valHeight * 0.05,
                  width: valWidth * 0.2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '스트레스',
                      style: TextStyle(
                          fontSize: defaultSize * 14, color: txtColor),
                    ),
                  ),
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
              child: Text('여기에 12개월짜리 스트레스 그래프 들어가야 함.'),
            ),
            SizedBox(
              height: valHeight * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: valWidth * 0.07,
                ),
                Container(
                  height: valHeight * 0.05,
                  width: valWidth * 0.2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '수면',
                      style: TextStyle(
                          fontSize: defaultSize * 14, color: txtColor),
                    ),
                  ),
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
              child: Text('여기에 12개월짜리 수면 그래프 들어가야 함.'),
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
            SizedBox(
              height: valHeight * 0.03,
            ),
            Container(
              height: valHeight * 0.5,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 해당 달의 달력'),
            ),
            SizedBox(
              height: valHeight * 0.02,
            ),
            CoachingTxtBox(
                context, 0, '생체 데이터 코칭\n' + '[2021/MM/dd]', '코칭 내용', 0.25),
            SizedBox(
              height: valHeight * 0.08,
            )
          ])));
    } else {
      return Container();
    }
  }
}
