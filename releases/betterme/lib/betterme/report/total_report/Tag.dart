import 'package:betterme/functions/Widgets/WidgetInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<bool> graphTypes = [true, true, true, true, true, true];
List<String> tagTitle = ['전체', '체중', '수면', '스트레스', '섭취', '소모'];
List<String> tagsubTitle = ['', '(kg)', '(시간)', '', '(kcal)', '(kcal)'];

//태그의 모서리를 리턴하는 위젯
BoxDecoration TagBoundary(HomeGraphInfo homeinfo, int number) {
  return BoxDecoration(
    borderRadius: BorderRadius.all(homeinfo.tag_boundaryRad),
    border: Border.all(
      color: homeinfo.tag_boundaryColor[number],
      width: homeinfo.tag_boundaryWid,
    ),
  );
}

//태그에 들어갈 제목+부제목을 리턴하는 위젯
Widget TagText(HomeGraphInfo homeinfo, int number) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            tagTitle[number],
            style: homeinfo.text_tag,
          ),
          Text(
            tagsubTitle[number],
            style: homeinfo.text_subtag,
          ),
        ],
      ),
    ],
  );
}
