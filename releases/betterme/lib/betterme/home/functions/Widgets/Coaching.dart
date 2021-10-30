import 'package:flutter/material.dart';

int buttonCase = 0; // 버튼 상태 확인용

double? widgetHeight;
double? widgetWidth;

class Coaching extends StatefulWidget {
  Coaching(double widgetHeight, double widgetWidth) {
    widgetHeight = widgetHeight;
    widgetWidth = widgetWidth;
  }
  @override
  _Coaching createState() => _Coaching();
}

class _Coaching extends State<Coaching> {
  Color button1Color = Color(0xff827380);
  Color button2Color = Color(0xff0B202A);
  Color button3Color = Color(0xff0B202A);

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    final outTopBlank = valHeight * 0.007; //바깥쪽 여백
    final outLeftBlank = valWidth * 0.012;

    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    double defaultSize = valWidth * 0.0025;

    return Container(
        height: widgetHeight,
        width: widgetWidth,
        padding: EdgeInsets.fromLTRB(
            outLeftBlank, outTopBlank, outLeftBlank, outTopBlank),
        child: Column(
          children: [
            Row(
              // 여기서부터 버튼
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(valWidth * 0.015),
                      ),
                      primary: button1Color,
                      minimumSize: Size(valWidth * 0.27, valHeight * 0.04)),
                  child: Text(
                    '7일',
                    style: TextStyle(
                      color: txtColor,
                      fontSize: defaultSize * 14,
                    ),
                  ),
                  onPressed: () {
                    buttonCase = 0;
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
                        borderRadius: BorderRadius.circular(valWidth * 0.015),
                      ),
                      primary: button2Color,
                      minimumSize: Size(valWidth * 0.27, valHeight * 0.04)),
                  child: Text(
                    '31일',
                    style: TextStyle(
                      color: txtColor,
                      fontSize: defaultSize * 14,
                    ),
                  ),
                  onPressed: () {
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
                        borderRadius: BorderRadius.circular(valWidth * 0.015),
                      ),
                      primary: button3Color,
                      minimumSize: Size(valWidth * 0.27, valHeight * 0.04)),
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

                    setState(() {
                      button3Color = Color(0xff827380);
                      button2Color = Color(0xff0B202A);
                      button1Color = Color(0xff0B202A);
                    });
                  },
                )
              ],
            ),
          ],
        ));
  }
}
