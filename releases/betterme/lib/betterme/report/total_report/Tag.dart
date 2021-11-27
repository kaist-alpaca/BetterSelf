import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Row getTags(double tagWidth, double leftBlank, double blankInterval,
    Color txtColor, List<bool> graphTypes) {
  return Row(
    children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(width: leftBlank),
        wholeTag(graphTypes, tagWidth, Color(0xff858E93), txtColor),
        SizedBox(width: blankInterval),
        Tag(graphTypes, tagWidth, 0, Color(0xffFFFDFD), [
          Text(
            '체중',
            style: TextStyle(fontSize: 12, color: txtColor),
          ),
          Text(
            ' (kg)',
            style: TextStyle(fontSize: 9, color: txtColor),
          )
        ]),
      ]),
      SizedBox(
        height: 10,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(width: leftBlank),
        Tag(graphTypes, tagWidth, 1, Color(0xffA0B1DF), [
          Text(
            '수면',
            style: TextStyle(fontSize: 12, color: txtColor),
          ),
          Text(
            ' (시간)',
            style: TextStyle(fontSize: 9, color: txtColor),
          ),
        ]),
        SizedBox(
          width: blankInterval,
        ),
        Tag(graphTypes, tagWidth, 2, Color(0xffF2D8A7), [
          Text(
            '스트레스',
            style: TextStyle(fontSize: 12, color: txtColor),
          ),
        ]),
        SizedBox(
          width: blankInterval,
        ),
        Tag(graphTypes, tagWidth, 3, Color(0xffD2ABBA), [
          Text(
            '섭취',
            style: TextStyle(fontSize: 12, color: txtColor),
          ),
          Text(
            ' (kcal)',
            style: TextStyle(fontSize: 9, color: txtColor),
          )
        ]),
        SizedBox(
          width: blankInterval,
        ),
        Tag(graphTypes, tagWidth, 4, Color(0xff8DBFBC), [
          Text(
            '소모',
            style: TextStyle(fontSize: 12, color: txtColor),
          ),
          Text(
            ' (kcal)',
            style: TextStyle(fontSize: 9, color: txtColor),
          )
        ]),
      ]),
    ],
  );
}

GestureDetector wholeTag(List<bool> graphTypes, double tagWidth,
    Color boundaryColor, Color txtColor) {
  return GestureDetector(
      onTap: () {
        setState() {
          if (graphTypes.contains(true)) {
            //하나 이상의 태그가 켜져있을 경우

            for (var i = 0; i < graphTypes.length; i++) {
              graphTypes[i] = false;
            } //모두 끈다

          } else {
            //하나 이상의 태그가 꺼져있을 경우

            for (var i = 0; i < graphTypes.length; i++) {
              graphTypes[i] = true;
            }
            //모두 켠다
            ;
          }
        }

        ;
      },
      child: Container(
        height: 22,
        width: tagWidth,
        color: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(color: boundaryColor, width: 1)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '전체',
                    style: TextStyle(fontSize: 12, color: txtColor),
                  ),
                ],
              ),
            ])),
      ));
}

GestureDetector Tag(List<bool> graphTypes, double tagWidth, int graphNum,
    Color boundaryColor, List<Text> text) {
  return GestureDetector(
      onTap: () {
        setState() {
          graphTypes[graphNum]
              ? graphTypes[graphNum] = false
              : graphTypes[graphNum] = true;
        }

        ;
      },
      child: Container(
        height: 22,
        width: tagWidth,
        color: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(color: boundaryColor, width: 1)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: text,
              ),
            ])),
      ));
}
