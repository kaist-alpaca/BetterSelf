import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:betterme/functions/Graphs/pie_chart_hole.dart';
import 'package:csv/csv_settings_autodetection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:betterme/functions/Widgets/DividewithObj.dart';
import 'package:betterme/betterme/report/Widgets/MiniBox.dart';

import 'package:csv/csv.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import 'package:get/get.dart';

import 'SaveFoodScreen.dart';

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
  List Nutrition = [];

  TextEditingController NumFood = TextEditingController();

  bool isSearching = false;
  String dropdownvalue = '아침';
  FocusNode phoneNumberFocusNode = new FocusNode();
  double amount = 1.0;
  DateTime now = DateTime.now();
  DateTime time = DateTime.now();

  loadData() async {
    final myData =
        await rootBundle.loadString('data/NutritionalComponents.csv');
    List<List<dynamic>> FoodData = const CsvToListConverter(
            csvSettingsDetector:
                FirstOccurrenceSettingsDetector(eols: ['\r\n', '\n']))
        .convert(myData);
    Nutrition = [];
    for (int i = 1; i < FoodData.length - 1; i++) {
      if (FoodData[i][0] == widget.food) {
        FoodData[i].forEach((element) {
          Nutrition.add(element);
        });
      }
    }
    print("debug : ${Nutrition}");
    return Nutrition;
  }

  var overlayEntry;

  showOverlay(BuildContext context) {
    if (overlayEntry != null) return;
    OverlayState? overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 0.0,
          left: 0.0,
          child: InputDoneView());
    });

    overlayState!.insert(overlayEntry);
  }

  removeOverlay() {
    if (overlayEntry != null) {
      overlayEntry.remove();
      overlayEntry = null;
    }
  }

  @override
  void initState() {
    super.initState();
    ServerConnection.write_log('RecordFoodScreen', 'start', '');
    KeyboardVisibilityNotification().addNewListener(
      onShow: () {
        print("show");
        showOverlay(context);
      },
      onHide: () {
        print("hide");
        removeOverlay();
      },
    );
    phoneNumberFocusNode.addListener(() {
      bool hasFocus = phoneNumberFocusNode.hasFocus;
      if (hasFocus)
        showOverlay(context);
      else
        removeOverlay();
    });
    if (Get.arguments[0].length != 0) {
      print('arguemnt is not 0');
      dropdownvalue = Get.arguments[0][0][1];
    }
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
    bool hasFocus = phoneNumberFocusNode.hasFocus;

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("식단 기록",
              style: TextStyle(
                color: txtColor,
                fontSize: defaultSize * 17,
                fontWeight: FontWeight.w400,
              )),
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
                    width: valWidth * 0.18,
                    child: Text(
                      "식사 시간",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: linetxtColor,
                        fontSize: defaultSize * 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  0.12,
                  0.70,
                ),
                SizedBox(height: valHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton(
                      borderRadius: BorderRadius.circular(15),
                      // border: const BorderSide(color: Colors.black12, width: 1),
                      underline: SizedBox.shrink(),
                      value: dropdownvalue,
                      style: TextStyle(color: Colors.white),
                      elevation: Get.arguments[0].length == 0 ? 8 : -3,
                      // iconSize: Get.arguments.length == 0 ? 24 : 0,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Get.arguments[0].length == 0
                            ? Color(0XFFFFFDFD)
                            : Color.fromRGBO(0, 0, 0, 0),
                      ),
                      // dropdownColor: Colors.black,
                      dropdownColor: Get.arguments[0].length == 0
                          ? Colors.black
                          : Color.fromRGBO(0, 0, 0, 0),
                      items: Get.arguments[0].length == 0
                          ? <String>['아침', '점심', '저녁', '간식']
                              .map((String items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList()
                          : <String>[Get.arguments[0][0][1]]
                              .map((String items) {
                              return DropdownMenuItem(
                                  value: items, child: Text(items));
                            }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                    Container(
                      height: 80,
                      width: valWidth * 0.43,
                      margin: EdgeInsets.only(left: valWidth * 0.1),
                      decoration: BoxDecoration(
                        color: Color(0x51D2ABBA),
                        borderRadius: BorderRadius.circular(valWidth * 0.03),
                      ),
                      child: CupertinoTheme(
                        data: CupertinoThemeData(
                          textTheme: CupertinoTextThemeData(
                            dateTimePickerTextStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.time,
                          initialDateTime: now,
                          onDateTimeChanged: (DateTime newDateTime) {
                            time = newDateTime;
                          },
                          use24hFormat: false,
                          minuteInterval: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: valHeight * 0.07),
                DividewithObj(
                  context,
                  Container(
                    width: valWidth * 0.18,
                    child: Text(
                      "섭취 정보",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: linetxtColor,
                        fontSize: defaultSize * 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  0.12,
                  0.70,
                ),
                FutureBuilder(
                    future: loadData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Error: ${snapshot.error}',
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            SizedBox(height: valHeight * 0.03),
                            Text(
                              Nutrition[0],
                              style: TextStyle(
                                color: linetxtColor,
                                fontSize: defaultSize * 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: valHeight * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  //몇인분인지 여기에 입력
                                  height: valHeight * 0.04,
                                  width: valWidth * 0.12,
                                  child: Center(
                                    child: CupertinoTextField(
                                      showCursor: true,
                                      cursorColor:
                                          Color.fromRGBO(160, 177, 233, 1),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: defaultSize * 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0x51D2ABBA),
                                        borderRadius: BorderRadius.circular(
                                            valWidth * 0.015),
                                      ),
                                      textAlign: TextAlign.center,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: true),
                                      maxLength: 10,
                                      focusNode: phoneNumberFocusNode,
                                      controller: NumFood,
                                      onChanged: (value) {
                                        try {
                                          setState(() {
                                            amount = double.parse(value);
                                          });
                                          if (amount > 10) {
                                            setState(() {
                                              amount = 10;
                                            });
                                            NumFood.value =
                                                TextEditingValue(text: '10');
                                          }
                                        } catch (e) {
                                          if (value != '') {
                                            setState(() {
                                              amount = 1;
                                            });
                                            NumFood.value =
                                                TextEditingValue(text: '1');
                                          }
                                        }
                                        print(value);
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9.]')),
                                      ],
                                      placeholder: "1",
                                      placeholderStyle: TextStyle(
                                        color: hasFocus
                                            ? CupertinoColors.placeholderText
                                            : Colors.white,
                                        fontSize: defaultSize * 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: valHeight * 0.04,
                                  width: valWidth * 0.3,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                        '인분  =  ' +
                                            (Nutrition[1] * amount)
                                                .round()
                                                .toString() +
                                            ' kcal', //nn에 칼로리 계산값 삽입
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: txtColor,
                                          fontSize: defaultSize * 14,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: valHeight * 0.03),
                            Container(
                              height: valHeight * 0.2,
                              width: valWidth * 0.7,
                              decoration: BoxDecoration(
                                color: bgColor,
                                border: Border.all(
                                    color: Color(0xff333C47),
                                    width: defaultSize * 1),
                                borderRadius:
                                    BorderRadius.circular(valWidth * 0.03),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: valHeight * 0.18,
                                    width: valWidth * 0.4,
                                    // margin:
                                    //     EdgeInsets.only(right: valWidth * 0.0),
                                    child: Container(
                                      width: valWidth * 0.4,
                                      height: valHeight * 0.2,
                                      child: CustomPaint(
                                        // CustomPaint를 그리고 이 안에 차트를 그려줍니다..
                                        size: Size(150,
                                            150), // CustomPaint의 크기는 가로 세로 150, 150으로 합니다.
                                        painter: MadePieChartHole(
                                          percentage1: Nutrition[2] /
                                              (Nutrition[2] +
                                                  Nutrition[3] +
                                                  Nutrition[4]) *
                                              100,
                                          percentage2: Nutrition[3] /
                                              (Nutrition[2] +
                                                  Nutrition[3] +
                                                  Nutrition[4]) *
                                              100,
                                          text:
                                              "${(Nutrition[1] * amount).round()}",
                                          type: 'food',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                        // 식단데이터
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MiniBox(
                                              context,
                                              Color(0xffA0B1DF),
                                              0.012,
                                              0.21,
                                              defaultSize * 12,
                                              '탄수화물 ${(Nutrition[2] * amount).toStringAsFixed(1)} g'), //
                                          SizedBox(height: valHeight * 0.008),
                                          MiniBox(
                                              context,
                                              Color(0xffF1D7A7),
                                              0.012,
                                              0.21,
                                              defaultSize * 12,
                                              '단백질 ${(Nutrition[3] * amount).toStringAsFixed(1)} g'),
                                          SizedBox(height: valHeight * 0.008),
                                          MiniBox(
                                              context,
                                              Color(0xffDBB9C7),
                                              0.012,
                                              0.21,
                                              defaultSize * 12,
                                              '지방 ${(Nutrition[4] * amount).toStringAsFixed(1)} g'),
                                          // SizedBox(height: valHeight * 0.008),
                                          // MiniBox(
                                          //     context,
                                          //     Color(0xffA0B1DF),
                                          //     0.012,
                                          //     0.2,
                                          //     10,
                                          //     '콜레스테롤 ${(Nutrition[5] * amount).toStringAsFixed(1)} g'),
                                          // SizedBox(height: valHeight * 0.008),
                                          // MiniBox(
                                          //     context,
                                          //     Color(0xffA0B1DF),
                                          //     0.012,
                                          //     0.2,
                                          //     10,
                                          //     '식이섬유 ${(Nutrition[6] * amount).toStringAsFixed(1)} g'),
                                          SizedBox(height: valHeight * 0.008),
                                          MiniBox(
                                              context,
                                              txtColor,
                                              0.012,
                                              0.21,
                                              defaultSize * 12,
                                              '나트륨 ${(Nutrition[7] * amount).toStringAsFixed(1)} mg'),
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    }),
                SizedBox(height: valHeight * 0.08),
                GestureDetector(
                  onTap: () {
                    Get.arguments[0].add([
                      time,
                      dropdownvalue,
                      Nutrition,
                      amount,
                    ]);
                    Get.arguments[0].sort(
                        (a, b) => a[0].toString().compareTo(b[0].toString()));
                    // print(Get.arguments);
                    ServerConnection.write_log(
                        'RecordFoodScreen', 'end', 'SaveFoodScreen');
                    Get.offAll(() => SaveFoodScreen(),
                        arguments: Get.arguments);
                  },
                  child: Container(
                    width: valWidth * 0.47,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Color(0xff999CA2),
                      ),
                      color: Color(0xff333C47),
                      borderRadius:
                          BorderRadius.all(Radius.circular(valWidth * 0.04)),
                    ),
                    child: Align(
                      alignment: FractionalOffset(0.5, 0.5),
                      child: Text(
                        "기록",
                        style: TextStyle(
                          fontSize: defaultSize * 14,
                          color: txtColor,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class InputDoneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color.fromRGBO(40, 51, 55, 1),
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: CupertinoButton(
            padding: EdgeInsets.only(right: 24.0, top: 8.0, bottom: 8.0),
            onPressed: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Text(
              "Done",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
