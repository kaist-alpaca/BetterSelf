import 'package:flutter/material.dart';
import '../data_page/food_screen.dart';

class FoodFeedbackScreen extends StatefulWidget {
  @override
  _FoodFeedbackScreen createState() => _FoodFeedbackScreen();
}

int foodButton = 1;

class _FoodFeedbackScreen extends State<FoodFeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    double graphWidth = valWidth * 0.86; //그래프들 너비
    double barHeight = valHeight * 0.08;
    double barFontSize = defaultSize * 18;
    return Scaffold(
        appBar: AppBar(
            title: Text(
          '식단 데이터',
        )),
        body: ListView(children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: valHeight * 0.05,
                  width: valWidth * 0.8,
                  margin: EdgeInsets.only(
                      bottom: valHeight * 0.028, top: valHeight * 0.028),
                  child: Text(
                    '데이터',
                    style: TextStyle(fontSize: defaultSize * 12),
                  ),
                ),
                Row(
                  // 식단 데이터 버튼(7일/31일/12개월 구분)
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          foodButton = 0;
                        });
                      },
                      child: Text('7일'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            foodButton = 1;
                          });
                        },
                        child: Text('31일')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            foodButton = 2;
                          });
                        },
                        child: Text('12개월'))
                  ],
                ),
                FoodScreen(foodButton),
              ],
            ),
          ),
        ]));
  }
}
