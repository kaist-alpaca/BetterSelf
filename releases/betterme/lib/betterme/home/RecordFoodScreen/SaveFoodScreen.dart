import 'package:betterme/betterme/home/SearchFoodScreen/SearchFoodScreen.dart';
import 'package:betterme/betterme/home/functions/ConstructTabBar.dart';
import 'package:betterme/betterme/report/ReportScreen.dart';
import 'package:betterme/betterme/report/Widgets/MiniBox.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:betterme/functions/Widgets/DividewithObj.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveFoodScreen extends StatefulWidget {
  const SaveFoodScreen({Key? key}) : super(key: key);

  @override
  _SaveFoodScreenState createState() => _SaveFoodScreenState();
}

class _SaveFoodScreenState extends State<SaveFoodScreen> {
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
        title: Text("식단 저장",
            style: TextStyle(color: txtColor, fontSize: defaultSize * 15)),
        backgroundColor: bgColor,
      ),
      body: Column(
        children: [
          SizedBox(height: valHeight * 0.03),
          DividewithObj(
            context,
            Container(
              width: valWidth * 0.18,
              child: Text(
                "식단",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: linetxtColor,
                  fontSize: defaultSize * 14,
                ),
              ),
            ),
            0.12,
            0.70,
          ),
          SizedBox(height: valHeight * 0.01),
          Container(
            height: 500,
            width: valWidth,
            child: ListView.builder(
              itemCount: Get.arguments[0].length + 1,
              itemBuilder: (BuildContext context, int i) {
                return Material(
                  color: bgColor,
                  child: i == Get.arguments[0].length
                      ? GestureDetector(
                          onTap: () {
                            Get.to(
                              () => SearchFoodScreen(),
                              arguments: Get.arguments,
                            );
                            //print(Get.arguments);
                            //print(Get.arguments[0][1]);
                          },
                          child: Column(
                            children: [
                              Container(
                                width: valWidth * 0.95,
                                child: Divider(
                                  color: Color(0xFF6E6572),
                                  thickness: 0.6,
                                ),
                              ),
                              Container(
                                // height: valHeight * 0.03,
                                width: valWidth,
                                margin: EdgeInsets.fromLTRB(
                                    0, valHeight * 0.01, 0, valHeight * 0.01),
                                child: Text(
                                  '+ 추가하기',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFFFFDFD),
                                    fontSize: defaultSize * 14,
                                  ),
                                ),
                              ),
                              Container(
                                width: valWidth * 0.95,
                                child: Divider(
                                  color: Color(0xFF6E6572),
                                  thickness: 0.6,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: (i == Get.arguments[0].length - 1)
                              ? valHeight * 0.21
                              : valHeight * 0.23,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: valWidth * 0.04),
                                    height: valHeight * 0.04,
                                    child: Center(
                                      child: Text(
                                        '${Get.arguments[0][i][2][0]} / ${Get.arguments[0][i][1]}',
                                        style: TextStyle(
                                          color: linetxtColor,
                                          fontSize: defaultSize * 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.clear_rounded),
                                    padding: EdgeInsets.only(
                                        right: valWidth * 0.025),
                                    color: Color(0xFFFFFDFD),
                                    onPressed: () {
                                      print(i);
                                      setState(() {
                                        Get.arguments[0].removeAt(i);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Container(
                                width: valWidth * 0.9,
                                margin: EdgeInsets.only(left: valWidth * 0.04),
                                child: Column(
                                  // 식단데이터
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MiniBox(
                                        context,
                                        Color(0xffA0B1DF),
                                        0.012,
                                        0.2,
                                        10,
                                        '탄수화물 ${(Get.arguments[0][i][2][2] * Get.arguments[0][i][3]).toStringAsFixed(1)} g'), //
                                    SizedBox(height: valHeight * 0.008),
                                    MiniBox(
                                        context,
                                        Color(0xffF1D7A7),
                                        0.012,
                                        0.176,
                                        10,
                                        '단백질 ${(Get.arguments[0][i][2][3] * Get.arguments[0][i][3]).toStringAsFixed(1)} g'),
                                    SizedBox(height: valHeight * 0.008),
                                    MiniBox(
                                        context,
                                        Color(0xffDBB9C7),
                                        0.012,
                                        0.15,
                                        10,
                                        '지방 ${(Get.arguments[0][i][2][4] * Get.arguments[0][i][3]).toStringAsFixed(1)} g'),
                                    SizedBox(height: valHeight * 0.008),
                                    MiniBox(
                                        context,
                                        Color(0xffA0B1DF),
                                        0.012,
                                        0.2,
                                        10,
                                        '콜레스테롤 ${(Get.arguments[0][i][2][5] * Get.arguments[0][i][3]).toStringAsFixed(1)} g'),
                                    SizedBox(height: valHeight * 0.008),
                                    MiniBox(
                                        context,
                                        Color(0xffA0B1DF),
                                        0.012,
                                        0.2,
                                        10,
                                        '식이섬유 ${(Get.arguments[0][i][2][6] * Get.arguments[0][i][3]).toStringAsFixed(1)} g'),
                                    SizedBox(height: valHeight * 0.008),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        MiniBox(
                                            context,
                                            txtColor,
                                            0.012,
                                            0.176,
                                            10,
                                            '나트륨 ${(Get.arguments[0][i][2][7] * Get.arguments[0][i][3]).toStringAsFixed(1)} mg'),
                                        Text(
                                          '${(Get.arguments[0][i][2][1] * Get.arguments[0][i][3]).round()} kcal',
                                          style: TextStyle(
                                            color: Color(0xFFFFFDFD),
                                            fontSize: defaultSize * 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: valHeight * 0.015),
                              (i == Get.arguments[0].length - 1)
                                  ? Container()
                                  : Container(
                                      width: valWidth * 0.95,
                                      child: Divider(
                                        color: Color(0xFF333C47),
                                        thickness: 0.6,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () async {
              // print(Get.arguments);
              String time = await ServerConnection.save_food(
                ProfileController.to.originMyProfile.uid!,
                Get.arguments[0],
              );
              print(Get.arguments[1]);
              print(time);
              if (Get.arguments[1] != 0) {
                await ProfileController.to.uploadFoodImage(
                  uid: ProfileController.to.myProfile.value.uid!,
                  file: Get.arguments[1],
                  time:
                      time.toString().replaceAll(" ", "").replaceAll("-", "_"),
                );
              }
              // Get.to(() => SaveFoodScreen(), arguments: Get.arguments);
              Get.offAll(() => ConstructTabBar());
            },
            child: Container(
              width: valWidth * 0.6,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color(0xff999CA2),
                ),
                color: Color(0xff333C47),
                borderRadius:
                    BorderRadius.all(Radius.circular(valWidth * 0.02)),
              ),
              child: Align(
                alignment: FractionalOffset(0.5, 0.5),
                child: Text(
                  "저장",
                  style: TextStyle(fontSize: defaultSize * 15, color: txtColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
