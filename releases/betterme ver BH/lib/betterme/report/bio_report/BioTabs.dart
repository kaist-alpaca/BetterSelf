import 'package:flutter/material.dart';
import 'package:betterme/functions/Widgets/DividewithObj.dart';
import '../Widgets/MiniBox.dart';

int? buttonCase;

class BioTabs extends StatefulWidget {
  BioTabs(int a) {
    buttonCase = a;
  }

  @override
  _BioTabs createState() => _BioTabs();
}

class _BioTabs extends State<BioTabs> {
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
    double defaultSize = valWidth * 0.0025; //폰트사이즈용
    double graphWidth = valWidth * 0.86; // 그래프들 너비

    if (buttonCase == 0) {
      //7일로 선택되었을 때 표현될 위젯들은 여기에.
      return Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: valWidth * 0.07,
                ),
                Container(
                  height: valHeight * 0.037,
                  width: valWidth * 0.2,
                  margin: EdgeInsets.only(top: valHeight * 0.035),
                  child: Text(
                    '신체 변화',
                    style:
                        TextStyle(fontSize: defaultSize * 14, color: txtColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                MiniBox(context, txtColor, 0.03, 0.12, 12, '체중(kg)')
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: valWidth * 0.07,
                ),
                Container(
                  height: valHeight * 0.037,
                  width: valWidth * 0.2,
                  margin: EdgeInsets.only(top: valHeight * 0.035),
                  child: Text(
                    '스트레스',
                    style:
                        TextStyle(fontSize: defaultSize * 14, color: txtColor),
                    textAlign: TextAlign.center,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: valWidth * 0.07,
                ),
                Container(
                  height: valHeight * 0.037,
                  width: valWidth * 0.2,
                  margin: EdgeInsets.only(top: valHeight * 0.035),
                  child: Text(
                    '수면 시간',
                    style:
                        TextStyle(fontSize: defaultSize * 14, color: txtColor),
                    textAlign: TextAlign.center,
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
              child: Text('여기에 7일짜리 수면 시간 그래프 들어가야 함.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: valWidth * 0.07,
                ),
                Container(
                  height: valHeight * 0.037,
                  width: valWidth * 0.2,
                  margin: EdgeInsets.only(top: valHeight * 0.035),
                  child: Text(
                    '수면 시간대',
                    style:
                        TextStyle(fontSize: defaultSize * 14, color: txtColor),
                    textAlign: TextAlign.center,
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
              child: Text('여기에 7일짜리 수면 시간대 그래프 들어가야 함.'),
            ),
            SizedBox(
              height: valHeight * 0.035,
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            Container(
              height: valHeight * 0.037,
              width: graphWidth - valWidth * 0.05,
              margin: EdgeInsets.only(top: valHeight * 0.03),
              child: Text(
                '신체 변화',
                style: TextStyle(fontSize: defaultSize * 14, color: txtColor),
              ),
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
              child: Text('여기 31일짜리 신체 변화 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.037,
              width: graphWidth - valWidth * 0.05,
              margin: EdgeInsets.only(top: valHeight * 0.03),
              child: Text(
                '스트레스',
                style: TextStyle(fontSize: defaultSize * 14, color: txtColor),
              ),
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
            Container(
              height: valHeight * 0.037,
              width: graphWidth - valWidth * 0.05,
              margin: EdgeInsets.only(top: valHeight * 0.03),
              child: Text(
                '수면',
                style: TextStyle(fontSize: defaultSize * 14, color: txtColor),
              ),
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
              height: valHeight * 0.035,
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
              child: Text('여기에 해당 달의 코칭'),
            ),
            SizedBox(
              height: valHeight * 0.1,
            )
          ])));
    } else if (buttonCase == 2) {
      //12개월로 선택되었을 때 표현될 위젯들은 여기에.
      return Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '신체변화',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.red,
              child: Text('여기에 12개월짜리 신체변화 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '스트레스',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 12개월짜리 스트레스 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '수면 시간',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 12개월짜리 수면 시간 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '수면 시간대',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
            ),
            Container(
              height: valHeight * 0.34,
              width: graphWidth,
              color: Colors.grey,
              child: Text('여기에 12개월짜리 수면 시간대 그래프 들어가야 함.'),
            ),
            Container(
              height: valHeight * 0.05,
              width: graphWidth,
              margin: EdgeInsets.only(
                  top: valHeight * 0.05, bottom: valHeight * 0.03),
              child: Text(
                '코칭',
                style: TextStyle(fontSize: defaultSize * 14),
              ),
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
              child: Text('여기에 해당 월? 년?의 코칭'),
            ),
            SizedBox(
              height: valHeight * 0.1,
            )
          ])));
    } else {
      return Container();
    }
  }
}
