import 'package:betterme/functions/Server/ServerConnectionMethods.dart';
import 'package:betterme/functions/Widgets/DividewithObj.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

import 'package:betterme/betterme/home/functions/ConstructTabBar.dart';

import 'package:betterme/betterme/login/functions/SettingBar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../basicillscreen/BasicIllScreen.dart';

class InitialSettingScreen extends StatelessWidget {
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();

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
    print("\n\ndebug : accesing initset screen");

    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD);
    final redtxtColor = Color(0xffD2363A);
    final txtFeildColor = Color(0xff333C47); //텍스트
    final txtFeildBorderColor = Color(0xff999CA2);

    final genderList = [Text("남"), Text("여"), Text("선택안함")];

    final double TextfieldSize = valHeight * 0.04;

    double defaultSize = valWidth * 0.0025;

    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text('계정 설정',
              style: TextStyle(color: txtColor, fontSize: defaultSize * 15)),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: valHeight * 0.015,
                ),
                DividewithObj(
                    context,
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: valWidth * 0.29,
                          width: valWidth * 0.29,
                          child: SvgPicture.asset('images/ring_icon.svg'),
                        ),
                        Center(
                          child: Container(
                            width: valWidth * 0.3,
                            child: Row(
                              //내 정보 설정
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        showCupertinoModalPopup(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              CupertinoActionSheet(
                                            title: const Text('프로필 이미지 수정'),
                                            message:
                                                const Text('Your options are '),
                                            actions: <Widget>[
                                              CupertinoActionSheetAction(
                                                child: const Text('사진 촬영'),
                                                onPressed: () async {
                                                  await controller.pickImage(
                                                      type: 'camera',
                                                      use: 'profile');
                                                  print("change image");
                                                  Navigator.pop(
                                                      context, 'Cancel');
                                                  var save =
                                                      await controller.save();
                                                  print(save);
                                                },
                                              ),
                                              CupertinoActionSheetAction(
                                                child:
                                                    const Text('갤러리에서 사진 선택'),
                                                onPressed: () async {
                                                  await controller.pickImage(
                                                      type: 'gallery',
                                                      use: 'profile');
                                                  print("change image");
                                                  Navigator.pop(
                                                      context, 'Cancel');
                                                  var save =
                                                      await controller.save();
                                                  print(save);
                                                },
                                              )
                                            ],
                                            cancelButton:
                                                CupertinoActionSheetAction(
                                              child: const Text('취소'),
                                              isDefaultAction: true,
                                              onPressed: () {
                                                Navigator.pop(
                                                    context, 'Cancel');
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      child: Obx(
                                        () => Container(
                                            //여기에 아마도 프사설정
                                            width: valWidth * 0.18,
                                            height: valWidth * 0.18,
                                            // color: Colors.grey,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Container(
                                                width: valWidth * 0.18,
                                                height: valWidth * 0.18,
                                                child: controller
                                                            .myProfile
                                                            .value
                                                            .profileImage ==
                                                        null
                                                    ? Image.network(
                                                        controller.myProfile
                                                            .value.profileUrl!,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.file(
                                                        controller
                                                            .myProfile
                                                            .value
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
                                  ],
                                ),
                              ],
                            ), //ProfileImage
                          ),
                        ),
                      ],
                    ),
                    0.345,
                    0.345), //ProfileImage

                SizedBox(
                  height: 10,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.myProfile.value.name!,
                      style: TextStyle(
                          color: txtColor, fontSize: defaultSize * 15),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ), //Name
                SizedBox(
                  height: 40,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: valWidth * 0.25,
                            child: Text("성별",
                                style: TextStyle(
                                    color: txtColor,
                                    fontSize: defaultSize * 14),
                                textAlign: TextAlign.center)),
                        GestureDetector(
                          onTap: () {
                            // _openDatePicker(context);
                            BottomPicker(
                                    items: genderList,
                                    title: "성별",
                                    titleStyle: TextStyle(
                                        color: txtColor,
                                        fontSize: defaultSize * 15),
                                    onChange: (index) {
                                      print(index);
                                    },
                                    onSubmit: (index) {
                                      print(genderList[index].data);
                                      controller.genderSelected(
                                          genderList[index].data.toString());
                                    },
                                    bottomPickerTheme:
                                        BOTTOM_PICKER_THEME.PLUM_PLATE)
                                .show(context);
                          },
                          child: Container(
                              //생년월일 입력란
                              width: valWidth * 0.35,
                              height: TextfieldSize, //valHeight * 0.06,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: txtFeildColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(valWidth * 0.015))),
                              margin: EdgeInsets.fromLTRB(valWidth * 0.02, 0,
                                  valWidth * 0.02, valWidth * 0.015),
                              child: Text(
                                controller.gender == null
                                    ? ""
                                    : controller.gender.toString(),
                                style: TextStyle(
                                    color: txtColor,
                                    fontSize: defaultSize * 15),
                              )),
                        ), //margin
                        Container(
                          width: valWidth * 0.15,
                        ),
                      ],
                    ), //gender
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: valWidth * 0.25,
                            padding: EdgeInsets.fromLTRB(0, 3, 0, 10),
                            child: Text("생년월일",
                                style: TextStyle(
                                    color: txtColor,
                                    fontSize: defaultSize * 14),
                                textAlign: TextAlign.center)),
                        GestureDetector(
                          onTap: () {
                            // _openDatePicker(context);
                            BottomPicker.date(
                                    title: "생년월일",
                                    titleStyle: TextStyle(
                                        color: txtColor,
                                        fontSize: defaultSize * 15),
                                    onChange: (index) {
                                      print(index);
                                    },
                                    onSubmit: (index) {
                                      print(index);
                                      controller.birthdaySelected(
                                          index.toString().substring(0, 10));
                                    },
                                    bottomPickerTheme:
                                        BOTTOM_PICKER_THEME.PLUM_PLATE)
                                .show(context);
                          },
                          child: Container(
                              //생년월일 입력란
                              width: valWidth * 0.35,
                              height: TextfieldSize, //valHeight * 0.06,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: txtFeildColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(valWidth * 0.015))),
                              margin: EdgeInsets.fromLTRB(valWidth * 0.02, 0,
                                  valWidth * 0.02, valWidth * 0.015),
                              child: Text(
                                controller.birthday == null
                                    ? ""
                                    : controller.birthday.toString(),
                                style: TextStyle(
                                    color: txtColor,
                                    fontSize: defaultSize * 15),
                              )),
                        ),
                        Container(
                          width: valWidth * 0.15,
                        ), //margin
                      ],
                    ),
                    SizedBox(height: 16), //birthday
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: valWidth * 0.25,
                            child: Text("키",
                                style: TextStyle(
                                    color: txtColor,
                                    fontSize: defaultSize * 14),
                                textAlign: TextAlign.center)),
                        Container(
                          //키 입력란
                          width: valWidth * 0.35,
                          height: TextfieldSize, //valHeight * 0.06,
                          decoration: BoxDecoration(
                              color: txtFeildColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(valWidth * 0.015))),
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 1.5),
                              child: KeyboardActions(
                                disableScroll: true,
                                config: _buildConfig(context),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: txtColor,
                                      fontSize: defaultSize * 15),
                                  keyboardType: TextInputType.number,
                                  focusNode: _nodeText1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: controller.height,
                                      hintStyle: TextStyle(
                                          color: txtColor,
                                          fontSize: defaultSize * 15)),
                                  onChanged: (text) {
                                    controller.heightSelected(text);
                                  },
                                ),
                              )),
                        ),
                        Container(
                            width: valWidth * 0.15,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [])), //margin
                      ],
                    ),
                    SizedBox(height: 16), //height
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: valWidth * 0.25,
                            child: Text("체중",
                                style: TextStyle(
                                    color: txtColor,
                                    fontSize: defaultSize * 14),
                                textAlign: TextAlign.center)),
                        Container(
                          //체중 입력란
                          width: valWidth * 0.35,
                          height: TextfieldSize, //valHeight * 0.06,
                          decoration: BoxDecoration(
                              color: txtFeildColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(valWidth * 0.015))),
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 1.5),
                              child: KeyboardActions(
                                  disableScroll: true,
                                  config: _buildConfig(context),
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: txtColor,
                                        fontSize: defaultSize * 15),
                                    keyboardType: TextInputType.number,
                                    focusNode: _nodeText2,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        hintText: controller.weight,
                                        hintStyle: TextStyle(
                                            color: txtColor,
                                            fontSize: defaultSize * 15)),
                                    onChanged: (text) {
                                      controller.weightSelected(text);
                                    },
                                  ))),
                        ),
                        Container(
                            width: valWidth * 0.15,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [])), //margin
                      ],
                    ),
                    Container(
                      width: valWidth * 0.15,
                    ), //margin
                  ],
                ), // weight

                SizedBox(
                  height: 50,
                ),

                Container(
                  height: 50,
                  width: valWidth * 0.75,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: txtFeildColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(valWidth * 0.02))),
                  child: KeyboardActions(
                    disableScroll: true,
                    config: _buildConfig(context),
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: txtColor, fontSize: defaultSize * 15),
                      keyboardType: TextInputType.text,
                      focusNode: _nodeText3,
                      decoration: InputDecoration(
                          hintText: controller.disease == null ||
                                  controller.disease == ""
                              ? "   질병기초 정보 입력"
                              : controller.disease,
                          hintStyle: TextStyle(
                              fontSize: defaultSize * 14, color: txtColor)),
                      onChanged: (text) {
                        controller.diseaseSelected(text);
                      },
                    ),
                  ),
                ), //disease
                SizedBox(
                  height: 35,
                ),

                GestureDetector(
                  // 저장기능 추가해주세요
                  onTap: () {
                    Get.to(() => ConstructTabBar());
                    // return Home();
                  }, //여기에 로그아웃 기능 구현
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: valWidth * 0.5,
                        height: 35,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.7,
                              color: txtFeildBorderColor,
                            ),
                            color: txtFeildColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(valWidth * 0.025))),
                        child: Align(
                            alignment: FractionalOffset(0.5, 0.5),
                            child: Text("저장",
                                style: TextStyle(
                                    fontSize: defaultSize * 15,
                                    color: txtColor),
                                textAlign: TextAlign.center)),
                      ),
                    ],
                  ),
                ), //저장기능_추가해주세요
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
