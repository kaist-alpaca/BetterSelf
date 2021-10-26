import 'package:flutter/material.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

import 'package:betterme/betterme/home/functions/ConstructTabBar.dart';

import 'package:betterme/betterme/login/functions/SettingBar.dart';

import 'package:get/get.dart';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'BasicIllScreen.dart';

class InitialSettingScreen extends StatelessWidget {
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: false,
      actions: [
        KeyboardActionsItem(focusNode: _nodeText1),
        KeyboardActionsItem(focusNode: _nodeText2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text('설정'),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "내 정보",
                        style: TextStyle(
                          fontSize: defaultSize * 20,
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(valWidth * 0.01,
                          valHeight * 0.015, 0, valHeight * 0.03),
                    ),
                    Row(
                      //내 정보 설정
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              //프사 위 여백
                              height: valHeight * 0.07,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await controller.pickImage();
                                print("change image");
                                var save = await controller.save();
                                print(save);
                              },
                              child: Obx(
                                () => Container(
                                    //여기에 아마도 프사설정
                                    width: valHeight * 0.15,
                                    height: valHeight * 0.15,
                                    // color: Colors.grey,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        child: controller.myProfile.value
                                                    .profileImage ==
                                                null
                                            ? controller.myProfile.value
                                                        .profileUrl !=
                                                    null
                                                ? Image.network(
                                                    controller.myProfile.value
                                                        .profileUrl!,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Container(
                                                    // color: Colors.red,
                                                    )
                                            : Image.file(
                                                controller.myProfile.value
                                                    .profileImage!,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                    margin: EdgeInsets.fromLTRB(
                                        valWidth * 0.025,
                                        0,
                                        valWidth * 0.025,
                                        0)),
                              ),
                            ),
                            SizedBox(
                              height: valHeight * 0.1,
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    child: Text(
                                  "email",
                                  style: TextStyle(fontSize: defaultSize * 15),
                                )),
                                Container(
                                  //ID 입력란
                                  height: valHeight * 0.06,
                                  width: valWidth * 0.34,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 3)),
                                  margin: EdgeInsets.fromLTRB(valWidth * 0.02,
                                      0, valWidth * 0.02, valWidth * 0.015),
                                  child: Text(
                                    controller.myProfile.value.email == null
                                        ? ''
                                        : controller.myProfile.value.email!,
                                    style:
                                        TextStyle(fontSize: defaultSize * 15),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    child: Text(
                                  "성별",
                                  style: TextStyle(fontSize: defaultSize * 15),
                                )),
                                Container(
                                  //성별 입력란
                                  height: valHeight * 0.06,
                                  width: valWidth * 0.34,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 3)),
                                  margin: EdgeInsets.fromLTRB(valWidth * 0.02,
                                      0, valWidth * 0.02, valWidth * 0.015),
                                  child: DropdownButton<String>(
                                      hint: Text('성별'),
                                      value: controller.gender,
                                      onChanged: (newValue) {
                                        controller.genderSelected(newValue!);
                                      },
                                      elevation: 10,
                                      items: [
                                        DropdownMenuItem(
                                          child: Text("남성"),
                                          value: '남성',
                                        ),
                                        DropdownMenuItem(
                                          child: Text("여성"),
                                          value: '여성',
                                        ),
                                      ]),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    child: Text(
                                  "생년월일",
                                  style: TextStyle(fontSize: 15),
                                )),
                                GestureDetector(
                                  onTap: () {
                                    // _openDatePicker(context);
                                    BottomPicker.date(
                                            title: "Set your Birthday",
                                            titleStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.blue),
                                            onChange: (index) {
                                              print(index);
                                            },
                                            onSubmit: (index) {
                                              print(index);
                                              controller.birthdaySelected(index
                                                  .toString()
                                                  .substring(0, 10));
                                            },
                                            bottomPickerTheme:
                                                BOTTOM_PICKER_THEME.PLUM_PLATE)
                                        .show(context);
                                  },
                                  child: Container(
                                      //생년월일 입력란
                                      height: valHeight * 0.06,
                                      width: valWidth * 0.34,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 3)),
                                      margin: EdgeInsets.fromLTRB(
                                          valWidth * 0.02,
                                          0,
                                          valWidth * 0.02,
                                          valWidth * 0.015),
                                      child: Text(
                                        controller.birthday == null
                                            ? "생년월일"
                                            : controller.birthday.toString(),
                                        style: TextStyle(
                                            fontSize: defaultSize * 15),
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    child: Text(
                                  "키",
                                  style: TextStyle(fontSize: defaultSize * 15),
                                )),
                                Container(
                                  //키 입력란
                                  height: valHeight * 0.06,
                                  width: valWidth * 0.34,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 3)),
                                  margin: EdgeInsets.fromLTRB(valWidth * 0.02,
                                      0, valWidth * 0.02, valWidth * 0.015),
                                  child: KeyboardActions(
                                    disableScroll: true,
                                    config: _buildConfig(context),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      focusNode: _nodeText1,
                                      decoration: InputDecoration(
                                        hintText: controller.height == null ||
                                                controller.height == ""
                                            ? "키"
                                            : controller.height,
                                      ),
                                      onChanged: (text) {
                                        controller.heightSelected(text);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    child: Text(
                                  "체중",
                                  style: TextStyle(fontSize: defaultSize * 15),
                                )),
                                Container(
                                  //키 입력란
                                  height: valHeight * 0.06,
                                  width: valWidth * 0.34,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 3)),
                                  margin: EdgeInsets.fromLTRB(valWidth * 0.02,
                                      0, valWidth * 0.02, valWidth * 0.015),
                                  child: KeyboardActions(
                                    disableScroll: true,
                                    config: _buildConfig(context),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      focusNode: _nodeText2,
                                      decoration: InputDecoration(
                                        hintText: controller.weight == null ||
                                                controller.weight == ""
                                            ? "몸무게"
                                            : controller.weight,
                                      ),
                                      onChanged: (text) {
                                        controller.weightSelected(text);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    SettingBar(
                        name: '질병 기초 정보 입력',
                        screen: BasicIllScreen()), //질병 기초 입력으로 넘어감
                    SizedBox(
                      height: valHeight * 0.05,
                    ),
                    GestureDetector(
                      // 저장 후 다음 페이지로 넘어감.
                      onTap: () {
                        Get.offAll(() => ConstructTabBar());
                      }, //여기에 저장 기능 구현
                      child: Container(
                        width: valWidth * 0.7,
                        height: valHeight * 0.07,
                        margin: EdgeInsets.only(left: 0.15 * valWidth),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 3)),
                        child: Text(
                          "저장",
                          style: TextStyle(
                            fontSize: defaultSize * 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
