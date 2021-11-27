import 'package:betterself_trainer/betterself_trainer/coaching/report/functions/TotalGraphs.dart';
import 'package:betterself_trainer/functions/Controllers/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class YearReport extends StatefulWidget {
  YearReport({Key? key, required this.uid}) : super(key: key);

  final uid;
  @override
  _YearReport createState() => _YearReport();
}

class _YearReport extends State<YearReport> {
  List<bool> GraphTypes = [true, true, true, true, true];

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색

    double defaultSize = valWidth * 0.0025;

    return GetBuilder<ProfileController>(builder: (controller) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        GraphTypes[0]
                            ? GraphTypes[0] = false
                            : GraphTypes[0] = true;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: valWidth / 7,
                      color: Colors.transparent,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              border: Border.all(
                                  color: Color(0xffFFFDFD), width: 1)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '체중',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffFFFDFD)),
                                    ),
                                    Text(
                                      ' (kg)',
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xffFFFDFD)),
                                    )
                                  ],
                                ),
                              ])),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        GraphTypes[1]
                            ? GraphTypes[1] = false
                            : GraphTypes[1] = true;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: valWidth / 7,
                      color: Colors.transparent,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              border: Border.all(
                                  color: Color(0xffA0B1DF), width: 1)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '수면',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffFFFDFD)),
                                    ),
                                    Text(
                                      ' (시간)',
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xffFFFDFD)),
                                    )
                                  ],
                                ),
                              ])),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          GraphTypes[2]
                              ? GraphTypes[2] = false
                              : GraphTypes[2] = true;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: valWidth / 7,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(
                                    color: Color(0xffF2D8A7), width: 1)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '스트레스',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffFFFDFD)),
                                      ),
                                    ],
                                  ),
                                ])),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          GraphTypes[3]
                              ? GraphTypes[3] = false
                              : GraphTypes[3] = true;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: valWidth / 7,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(
                                    color: Color(0xffD2ABBA), width: 1)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '섭취',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffFFFDFD)),
                                      ),
                                      Text(
                                        ' (kcal)',
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: Color(0xffFFFDFD)),
                                      )
                                    ],
                                  ),
                                ])),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          GraphTypes[4]
                              ? GraphTypes[4] = false
                              : GraphTypes[4] = true;
                        });
                      },
                      child: Container(
                        height: 20,
                        width: valWidth / 7,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(
                                    color: Color(0xff8DBFBC), width: 1)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '소모',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffFFFDFD)),
                                      ),
                                      Text(
                                        ' (kcal)',
                                        style: TextStyle(
                                            fontSize: 9,
                                            color: Color(0xffFFFDFD)),
                                      )
                                    ],
                                  ),
                                ])),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TotalGraphs(GraphTypes: GraphTypes, Duration: 365, uid: widget.uid),
            ],
          ),
        ),
      );
    });
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
