import 'package:flutter/material.dart';

import 'package:betterme/functions/Widgets/DividewithObj.dart';
import '../Widgets/CoachingTxtBox.dart';
import '../Widgets/CoachingFoodBox.dart';
import '../Widgets/MiniBox.dart';
import '../Widgets/MiniCircle.dart';

int? buttonCase;

class FoodTabs extends StatefulWidget {
  FoodTabs(int a) {
    buttonCase = a;
  }

  @override
  _FoodTabs createState() => _FoodTabs();
}

int testValue = 0;

class _FoodTabs extends State<FoodTabs> {
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

    double miniBoxSize = 0.015;
    double defaultSize = valWidth * 0.0025; //폰트사이즈용
    double graphWidth = valWidth * 0.88; // 그래프들 너비
    if (buttonCase == 0) {
      //7일로 선택되었을 때 표현될 위젯들은 여기에.
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
                  style: TextStyle(fontSize: defaultSize * 14, color: txtColor),
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
              boxShadow: [BoxShadow(color: shadowColor, blurRadius: graphBlur)],
              borderRadius: BorderRadius.circular(graphBorderRadius)),
          child: Text('여기에 7일짜리 섭취 칼로리 그래프 들어가야 함.',
              style: TextStyle(color: Colors.white)),
        ),
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
                  style: TextStyle(fontSize: defaultSize * 14, color: txtColor),
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
              boxShadow: [BoxShadow(color: shadowColor, blurRadius: graphBlur)],
              borderRadius: BorderRadius.circular(graphBorderRadius)),
          child: Text('여기에 7일짜리 식사 시간 그래프 들어가야 함.',
              style: TextStyle(color: Colors.white)),
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
                style:
                    TextStyle(color: linetxtColor, fontSize: defaultSize * 14),
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
          height: valHeight * 0.5,
          width: graphWidth,
          color: Colors.grey,
          child: Text('여기에 해당 주간의 일주일 코칭'),
        ),
        SizedBox(
          height: valHeight * 0.1,
        )
      ])));
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
              boxShadow: [BoxShadow(color: shadowColor, blurRadius: graphBlur)],
              borderRadius: BorderRadius.circular(graphBorderRadius)),
          child: Text('여기에 31일짜리 섭취 칼로리 그래프 들어가야 함.',
              style: TextStyle(color: txtColor)),
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
        SizedBox(
          height: valHeight * 0.03,
        ),
        Container(
          height: valHeight * 0.4,
          width: graphWidth,
          color: Colors.grey,
          child: Text('여기에 해당 달의 달력'),
          margin: EdgeInsets.only(bottom: valHeight * 0.01),
        ),
        SizedBox(
          height: valHeight * 0.015,
        ),
        CoachingFoodBox(
            context, '식단\n' + '[2021/MM/dd]', '코칭 내용\n\n\n\n\n', 0.4),
        SizedBox(
          height: valHeight * 0.0235,
        ),
        CoachingTxtBox(context, 1, '식단 코칭', '코칭 내용', 0.2),
        SizedBox(
          height: valHeight * 0.09,
        )
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
          child: Text('여기에 12개월짜리 섭취 칼로리 그래프 들어가야 함.',
              style: TextStyle(color: txtColor)),
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
        SizedBox(
          height: valHeight * 0.03,
        ),
        Container(
          height: valHeight * 0.4,
          width: graphWidth,
          color: Colors.grey,
          child: Text('여기에 해당 달의 달력'),
          margin: EdgeInsets.only(bottom: valHeight * 0.01),
        ),
        SizedBox(
          height: valHeight * 0.015,
        ),
        CoachingFoodBox(
            context, '식단\n' + '[2021/MM/dd]', '코칭 내용\n\n\n\n\n', 0.4),
        SizedBox(
          height: valHeight * 0.0235,
        ),
        CoachingTxtBox(context, 1, '식단 코칭', '코칭 내용', 0.2),
        SizedBox(
          height: valHeight * 0.09,
        )
      ])));
    } else {
      return Container();
    }
  }
}
