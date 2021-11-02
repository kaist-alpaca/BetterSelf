import 'package:betterme/betterme/home/functions/ConstructTabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:betterme/functions/Widgets/DividewithObj.dart';
import 'package:betterme/betterme/report/Widgets/MiniBox.dart';

import 'package:csv/csv.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';

class RecordFoodScreen extends StatefulWidget {

  final String food;

  RecordFoodScreen({Key? key, required this.food}) : super(key: key);

  @override
  _RecordFoodScreen createState() => _RecordFoodScreen();
}

class _RecordFoodScreen extends State<RecordFoodScreen> {

  final bgColor = Color(0xff0B202A); //배경색
  final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
  final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
  final blockColor = Color(0xff333C47); // 여러 블럭들 색


  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController searching = TextEditingController();

  bool isSearching = false;
  List<String> suggestion = [];

  loadData() async{
    final myData = await rootBundle.loadString('data/NutritionalComponents.csv');
    List<List<dynamic>> FoodData = const CsvToListConverter().convert(myData);
    suggestion = [];
    for(int i = 1 ; i < FoodData.length - 1 ; i++){
      if(FoodData[i][0] == widget.food){
        suggestion.add(FoodData[i][0]);
      }
    }
    print("${suggestion[0]}");
    return suggestion;
  }


  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    final blockColor = Color(0xff333C47); // 여러 블럭들 색
    double defaultSize = valWidth * 0.0025;

    loadData();

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("식단 기록",
              style: TextStyle(color: txtColor, fontSize: defaultSize * 15)),
          backgroundColor: bgColor,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: valHeight * 0.03,
                ),
                DividewithObj(
                    context,
                    Container(
                      width: valWidth * 0.36,
                      child: Text(
                        "${widget.food}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: linetxtColor, fontSize: defaultSize * 14),
                      ),
                    ),
                    0.32,
                    0.32),
                SizedBox(height: valHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //     height: valHeight * 0.04,
                    //     width: valWidth * 0.15,
                    //     decoration: BoxDecoration(
                    //       color: blockColor,
                    //       borderRadius: BorderRadius.circular(valWidth * 0.015),
                    //     ),
                    //     child: Text('용량', style: TextStyle(color: txtColor))),
                    // SizedBox(
                    //   width: valWidth * 0.008,
                    // ),
                    // Container(
                    //     height: valHeight * 0.04,
                    //     width: valWidth * 0.15,
                    //     decoration: BoxDecoration(
                    //       color: bgColor,
                    //       border: Border.all(
                    //           color: Color(0xff546269), width: defaultSize * 1),
                    //       borderRadius: BorderRadius.circular(valWidth * 0.015),
                    //     ),
                    //     child: Text('단위', style: TextStyle(color: txtColor))),
                    // Container(
                    //     height: valHeight * 0.04,
                    //     width: valWidth * 0.08,
                    //     child: Align(
                    //       alignment: Alignment.center,
                    //       child: Text(
                    //         'x',
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //             color: txtColor, fontSize: defaultSize * 14),
                    //       ),
                    //     )),
                    Container(
                        //몇인분인지 여기에 입력
                        height: valHeight * 0.04,
                        width: valWidth * 0.1,
                        decoration: BoxDecoration(
                          color: blockColor,
                          borderRadius: BorderRadius.circular(valWidth * 0.015),
                        ),
                        child: Text('n', style: TextStyle(color: txtColor))),
                    Container(
                        height: valHeight * 0.04,
                        width: valWidth * 0.3,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                              '인분  =  ' + '  ' + 'kcal', //nn에 칼로리 계산값 삽입
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: txtColor, fontSize: defaultSize * 14)),
                        )),
                  ],
                ),
                SizedBox(height: valHeight * 0.07),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 여기에 섭취 시간
                    Container(
                        height: 100,
                        width: valWidth * 0.43,
                        decoration: BoxDecoration(
                          color: blockColor,
                          borderRadius: BorderRadius.circular(valWidth * 0.03),
                        ),
                        child: TimePickerSpinner(
                          is24HourMode: false,
                          normalTextStyle: TextStyle(
                              fontSize: 12,
                              color: Color(0xffFFFDFD)
                          ),
                          highlightedTextStyle: TextStyle(
                              fontSize: 12,
                              color: Color(0xffFFFDFD)
                          ),
                          spacing: 30,
                          itemHeight: 30,
                          itemWidth: valWidth * 0.05,
                          isForce2Digits: false,
                        )),

                    SizedBox(width: valWidth * 0.03),

                    Container(
                        height: valHeight * 0.04,
                        width: valWidth * 0.3,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '에 섭취하였습니다.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: txtColor, fontSize: defaultSize * 14),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: valHeight * 0.08),
                Container(
                  height: valHeight * 0.2,
                  width: valWidth * 0.7,
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: Border.all(
                        color: Color(0xff333C47), width: defaultSize * 1),
                    borderRadius: BorderRadius.circular(valWidth * 0.03),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: valHeight * 0.18,
                        width: valWidth * 0.4,
                        margin: EdgeInsets.only(right: valWidth * 0.02),
                        color: Colors.grey,
                      ),
                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MiniBox(context, Color(0xffA0B1DF), 0.012, 0.2,
                                  10, '탄수화물 ' + 'nnn' + 'g'),
                              SizedBox(height: valHeight * 0.008),
                              MiniBox(context, Color(0xffF1D7A7), 0.012, 0.176,
                                  10, '단백질 ' + 'nnn' + 'g'),
                              SizedBox(height: valHeight * 0.008),
                              MiniBox(context, Color(0xffDBB9C7), 0.012, 0.15,
                                  10, '지방 ' + 'nnn' + 'g'),
                              SizedBox(height: valHeight * 0.008),
                              MiniBox(context, Color(0xffA0B1DF), 0.012, 0.2,
                                  10, '콜레스테롤' + 'nnn' + 'g'),
                              SizedBox(height: valHeight * 0.008),    
                              MiniBox(context, Color(0xffA0B1DF), 0.012, 0.2,
                                  10, '식이섬유' + 'nnn' + 'g'),
                              SizedBox(height: valHeight * 0.008),
                              MiniBox(context, txtColor, 0.012, 0.176, 10,
                                  '나트륨 ' + 'nnn' + 'g'),
                            ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: valHeight * 0.08),
                Container(
                  width: valWidth * 0.6,
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color(0xff999CA2),
                      ),
                      color: Color(0xff333C47),
                      borderRadius:
                          BorderRadius.all(Radius.circular(valWidth * 0.02))),
                  child: Align(
                      alignment: FractionalOffset(0.5, 0.5),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(()=>ConstructTabBar());
                        },
                        child: Text("저장",
                            style: TextStyle(
                                fontSize: defaultSize * 15, color: txtColor),
                            textAlign: TextAlign.center)),
                      ),
                ),
              ],
            ),
          ),
        ));
  }
}
