import 'package:flutter/material.dart';
import '../../SearchFood/FoodSearchScreen.dart';

double? widgetHeight2;
double? widgetWidth2;
int? type; //type이 0: 아직 기록 전, type이1: 이미 기록됨

class FoodDailyMenu2 extends StatefulWidget {
  FoodDailyMenu2(int type1, double widgetHeight1, double widgetWidth1) {
    widgetHeight2 = widgetHeight1;
    widgetWidth2 = widgetWidth1;
    type = type1;
  }
  @override
  _FoodDailyMenu2 createState() => _FoodDailyMenu2();
}

class _FoodDailyMenu2 extends State<FoodDailyMenu2> {
  @override
  Widget build(BuildContext context) {
    double widgetWidth = widgetWidth2!;
    double widgetHeight = widgetHeight2!;
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    double defaultSize = valWidth * 0.0025;
    if (type == 0) {
      return Container(
          height: widgetHeight,
          width: widgetWidth,
          padding: EdgeInsets.only(
              left: widgetWidth * 0.05, right: widgetWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //사진 들어가는 박스
                height: widgetHeight * 0.55,
                width: widgetWidth * 0.9,
                decoration: BoxDecoration(
                  color: Color(0xff373B42),
                  borderRadius: BorderRadius.circular(valWidth * 0.015),
                ),
                padding: EdgeInsets.all(widgetHeight * 0.08), // 안 버튼 크기 조절

                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodSearchScreen()));
                    },
                    child: Text('+',
                        style: TextStyle(
                            color: Color(0xffFBF5F6),
                            fontSize: defaultSize * 22)),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), primary: Color(0xff4B4D58))),
              ),
              SizedBox(height: widgetHeight * 0.08),
              Text(
                '',
                style: TextStyle(fontSize: defaultSize * 10, color: txtColor),
                textAlign: TextAlign.center,
              )
            ],
          ));
    } else if (type == 1) {
      return Container(
          height: widgetHeight,
          width: widgetWidth,
          padding: EdgeInsets.only(
              left: widgetWidth * 0.05, right: widgetWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodSearchScreen()));
                },
                child: Container(
                  //사진 들어가는 박스
                  height: widgetHeight * 0.55,
                  width: widgetWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Color(0xff373B42),
                    borderRadius: BorderRadius.circular(valWidth * 0.015),
                  ),
                  child: Text('여기에 음식 사진, 사진 없으면 아이콘',
                      style: TextStyle(
                          color: Colors.white, fontSize: defaultSize * 10)),
                ),
              ),
              SizedBox(height: widgetHeight * 0.08),
              Text(
                "식단 내용은 여기에" + '\n' + '여기에',
                style: TextStyle(fontSize: defaultSize * 10, color: txtColor),
                textAlign: TextAlign.center,
              )
            ],
          ));
    } else {
      return Container();
    }
  }
}
