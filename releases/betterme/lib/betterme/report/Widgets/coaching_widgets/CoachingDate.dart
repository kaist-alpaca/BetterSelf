import 'package:flutter/material.dart';
import 'package:betterme/functions/Widgets/WidgetInfo.dart';

//월간 코칭, 월간 코칭 일자, 6달 코칭, 6달 코칭 일자를 표시하는 위젯

Widget CoachingDate(
  BuildContext context,
  String title,
  String date,
) {
  final valWidth = MediaQuery.of(context).size.width;
  final HomeCoachingInfo homeInfo = HomeCoachingInfo(valWidth);

  return Container(
    width: valWidth,
    child: Column(
      children: [
        //"oo데이터 코칭 + 선택한 날짜" 텍스트
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //"oo데이터 코칭"
            Container(
              width: homeInfo.box_coaching,
              margin: EdgeInsets.only(left: homeInfo.indent_coaching),
              child: Text(
                title, //ㅇㅇ데이터 코칭
                textAlign: TextAlign.left,
                style: homeInfo.text_coaching,
              ),
            ),

            //선택한 날짜
            Container(
                width: homeInfo.box_selectedDate,
                margin: EdgeInsets.only(right: homeInfo.indent_coaching),
                child: Text(
                  date, //선택한 날짜
                  textAlign: TextAlign.right,
                  style: homeInfo.text_selectedDate,
                )),
          ],
        ),

        //텍스트와 디바이더 사이 간격
        SizedBox(height: homeInfo.blank_coachingInfo),

        //코칭 디바이더
        homeInfo.coachingDivider,
      ],
    ),
  );
}
