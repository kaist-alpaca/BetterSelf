import 'package:flutter/material.dart';
import 'FoodNote.dart';

class FoodSearchScreen extends StatefulWidget {
  @override
  _FoodSearchScreen createState() => _FoodSearchScreen();
}

class _FoodSearchScreen extends State<FoodSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    final blockColor = Color(0xff333C47); // 여러 블럭들 색
    double defaultSize = valWidth * 0.0025;
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("음식 검색",
              style: TextStyle(color: txtColor, fontSize: defaultSize * 15)),
          backgroundColor: bgColor,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: valHeight * 0.02),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  //검색박스
                  height: valHeight * 0.045,
                  width: valWidth * 0.74,
                  decoration: BoxDecoration(
                    color: blockColor,
                    borderRadius: BorderRadius.circular(valWidth * 0.015),
                  ),
                  child: Row(
                    children: [
                      Container(
                          width: valWidth * 0.08,
                          height: valHeight * 0.045,
                          child: Image.asset('images/search_icon.png')),
                      Container()

                      ///여기에 텍스트 입력받고 검색구현
                    ],
                  )),
              SizedBox(width: valWidth * 0.02),
              ElevatedButton(
                  //검색 버튼
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodNoteScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: blockColor,
                      minimumSize: Size(valWidth * 0.12, valHeight * 0.045),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(valWidth * 0.015))),
                  child: Text('검색',
                      style: TextStyle(
                          fontSize: defaultSize * 15, color: txtColor)))
            ]),
            SizedBox(height: valHeight * 0.012),
            Container(
                //검색된 항목 위젯. 따로 위젯으로 빼는게 좋을수도.
                height: valHeight * 0.055,
                width: valWidth * 0.907,
                margin: EdgeInsets.only(left: valWidth * 0.041),
                decoration: BoxDecoration(
                  color: blockColor,
                  borderRadius: BorderRadius.circular(valWidth * 0.015),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: valWidth * 0.65,
                      child: Text(
                        '음식 이름',
                        style: TextStyle(
                            color: txtColor, fontSize: defaultSize * 15),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: valWidth * 0.15,
                          height: valHeight * 0.02,
                          margin: EdgeInsets.only(top: valHeight * 0.01),
                          child: Text(
                            '1회 제공량',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: txtColor, fontSize: defaultSize * 10),
                          ),
                        ),
                        Container(
                          width: valWidth * 0.15,
                          height: valHeight * 0.02,
                          child: Text(
                            '칼로리',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: txtColor, fontSize: defaultSize * 10),
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        )));
  }
}
