/*Container(
                  height: valHeight * 0.06,
                  width: valWidth * 0.12,
                  child: Text(
                    '날짜',
                    style: TextStyle(
                      fontSize: defaultSize * 12,
                    ),
                  ),
                ),
                Container(
                  //여기에 날짜 입력
                  height: valHeight * 0.06,
                  width: valWidth * 0.65,
                  color: Colors.grey,
                )
              ],
            ),
            Container(
              // 여기에 코칭 내용 입력
              height: valHeight * 0.25,
              width: valWidth * 0.84,
              color: Colors.grey,
              margin: EdgeInsets.only(
                  top: valHeight * 0.012, bottom: valHeight * 0.02),
            ),
            GestureDetector(
              onTap: () {}, //여기 누르면 코칭 저장시켜야함.
              child: Container(
                height: valHeight * 0.06,
                width: valWidth * 0.3,
                color: Colors.grey,
                child: Text(
                  '코칭 저장',
                  style: TextStyle(fontSize: defaultSize * 14),
                ),
              ),
            ),
            SizedBox(
              height: valHeight * 0.1,),*/

import 'package:flutter/material.dart';

class AddCoachingScreen extends StatefulWidget {
  @override
  _AddCoachingScreen createState() => _AddCoachingScreen();
}

class _AddCoachingScreen extends State<AddCoachingScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    double graphWidth = valWidth * 0.86;
    return Scaffold(
        appBar: AppBar(
          title: Text('피드백 추가'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: valHeight * 0.042,
              ),
              Row(
                children: [
                  Container(
                    height: valHeight * 0.06,
                    width: valWidth * 0.12,
                    child: Text(
                      '날짜',
                      style: TextStyle(
                        fontSize: defaultSize * 12,
                      ),
                    ),
                  ),
                  Container(
                    //여기에 날짜 입력
                    height: valHeight * 0.06,
                    width: valWidth * 0.65,
                    color: Colors.grey,
                  )
                ],
              ),
              Container(
                // 여기에 코칭 내용 입력
                height: valHeight * 0.25,
                width: valWidth * 0.84,
                color: Colors.grey,
                margin: EdgeInsets.only(
                    top: valHeight * 0.012, bottom: valHeight * 0.02),
              ),
              GestureDetector(
                onTap: () {}, //여기 누르면 코칭 저장시켜야함.
                child: Container(
                  height: valHeight * 0.06,
                  width: valWidth * 0.3,
                  color: Colors.grey,
                  child: Text(
                    '코칭 저장',
                    style: TextStyle(fontSize: defaultSize * 14),
                  ),
                ),
              ),
              SizedBox(
                height: valHeight * 0.1,
              ),
            ],
          ),
        ));
  }
}
