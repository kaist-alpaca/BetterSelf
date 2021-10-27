import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BioTabs.dart';

int buttonCase = 0; // 버튼 상태 확인용

class BioScreen extends StatefulWidget {
  @override
  _BioScreen createState() => _BioScreen();
}

class _BioScreen extends State<BioScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    double defaultSize = valWidth * 0.0025; //폰트사이즈용
    double graphWidth = valWidth * 0.86;

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          title: Text(
            '생체 데이터',
            style: TextStyle(color: txtColor),
          ),
        ),
        body: ListView(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: valHeight * 0.015,
                ),
                Container(
                  child: Text(
                    '데이터',
                    style: TextStyle(fontSize: defaultSize * 12),
                  ),
                  height: valHeight * 0.05,
                  width: graphWidth,
                  margin: EdgeInsets.only(
                      left: valWidth * 0.14, top: valHeight * 0.03),
                ),
                Row(
                  // 여기서부터 버튼(7일/31일/12개월 구분)
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        buttonCase = 0;
                        setState(() {});
                      },
                      child: Text('7일'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            buttonCase = 1;
                            print('button case here is $buttonCase');
                          });
                        },
                        child: Text('31일')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            buttonCase = 2;
                          });
                          print('button case here is $buttonCase');
                        },
                        child: Text('12개월'))
                  ],
                ),
                BioTabs(buttonCase)
              ],
            ),
          ),
        ]));
  }
}
