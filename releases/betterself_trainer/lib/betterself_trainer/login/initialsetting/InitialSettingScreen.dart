
import 'package:betterself_trainer/betterself_trainer/home/functions/ConstructTabBar.dart';
import 'package:betterself_trainer/functions/Controllers/profile_controller.dart';
import 'package:betterself_trainer/functions/Widgets/DividewithObj.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

import '../basicillscreen/BasicIllScreen.dart';

class InitialSettingScreen extends StatefulWidget {
  @override
  State<InitialSettingScreen> createState() => _InitialSettingScreenState();
}

class _InitialSettingScreenState extends State<InitialSettingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  final FocusNode _nodeText1 = FocusNode();

  final FocusNode _nodeText2 = FocusNode();

  final FocusNode _nodeText3 = FocusNode();

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Color.fromRGBO(40, 51, 55, 1),
      nextFocus: false,
      actions: [
        KeyboardActionsItem(focusNode: _nodeText1),
        KeyboardActionsItem(focusNode: _nodeText2),
      ],
    );
  }

  TextEditingController KeyBoard = TextEditingController();
  TextEditingController KeyBoard1 = TextEditingController();
  TextEditingController KeyBoard2 = TextEditingController();
  FocusNode phoneNumberFocusNode = new FocusNode();
  FocusNode phoneNumberFocusNode1 = new FocusNode();
  FocusNode phoneNumberFocusNode2 = new FocusNode();
  var overlayEntry;

  String height = '';
  String weight = ProfileController.to.weight;
  String disease = '';
  String gender = '???';
  String birth = '';

  showOverlay(BuildContext context) {
    if (overlayEntry != null) return;
    OverlayState? overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        right: 0.0,
        left: 0.0,
        bottom: MediaQuery.of(context).viewInsets.bottom,
        child: InputDoneView(
            height, weight, disease, KeyBoard, KeyBoard1, KeyBoard2),
      );
    });

    overlayState!.insert(overlayEntry);
  }

  removeOverlay() {
    if (overlayEntry != null) {
      overlayEntry.remove();
      overlayEntry = null;
    }
  }

  _showAlert({required String title, required String message}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return Theme(
            data: ThemeData.dark(),
            child: CupertinoAlertDialog(
              title: Text(title),
              content: Text(message),
              actions: [
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text("??????"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    KeyBoard1.value = TextEditingValue(text: weight);
    super.initState();
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
      if (hasFocus) {
        showOverlay(context);
      } else {
        removeOverlay();
      }
    });
    phoneNumberFocusNode1.addListener(() {
      bool hasFocus1 = phoneNumberFocusNode1.hasFocus;
      if (hasFocus1)
        showOverlay(context);
      else
        removeOverlay();
    });
    phoneNumberFocusNode2.addListener(() {
      bool hasFocus2 = phoneNumberFocusNode2.hasFocus;
      if (hasFocus2)
        showOverlay(context);
      else
        removeOverlay();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("\n\ndebug : accesing initset screen");

    final valHeight = MediaQuery.of(context).size.height; //?????? ??????
    final valWidth = MediaQuery.of(context).size.width; //?????? ??????
    final bgColor = Color(0xff0B202A); //?????????
    final txtColor = Color(0xffFFFDFD);
    final redtxtColor = Color(0xffD2363A);
    final txtFeildColor = Color(0xff333C47); //?????????
    final txtFeildBorderColor = Color(0xff999CA2);

    final genderList = [
      Center(
          child: Text("???",
              style: TextStyle(
                color: txtColor,
              ))),
      Center(
          child: Text("???",
              style: TextStyle(
                color: txtColor,
              )))
    ];

    final double TextfieldSize = valHeight * 0.04;

    double defaultSize = valWidth * 0.0025;

    bool hasFocus = phoneNumberFocusNode.hasFocus;
    bool hasFocus1 = phoneNumberFocusNode1.hasFocus;
    bool hasFocus2 = phoneNumberFocusNode1.hasFocus;

    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text('?????? ??????',
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
                              //??? ?????? ??????
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
                                            title: const Text('????????? ????????? ??????'),
                                            message:
                                                const Text('Your options are '),
                                            actions: <Widget>[
                                              CupertinoActionSheetAction(
                                                child: const Text('?????? ??????'),
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
                                                    const Text('??????????????? ?????? ??????'),
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
                                              child: const Text('??????'),
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
                                            //????????? ????????? ????????????
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
                            child: Text("??????",
                                style: TextStyle(
                                    color: txtColor,
                                    fontSize: defaultSize * 14),
                                textAlign: TextAlign.center)),
                        GestureDetector(
                          onTap: () {
                            gender = controller.gender == '???' ? '???' : '???';
                            // _openDatePicker(context);
                            // BottomPicker(
                            //         items: genderList,
                            //         title: "??????",
                            //         titleStyle: TextStyle(
                            //             color: txtColor,
                            //             fontSize: defaultSize * 15),
                            //         onSubmit: (index) {
                            //           print(genderList[index].data);
                            // controller.genderSelected(
                            //     genderList[index].data.toString());
                            //         },
                            //         bottomPickerTheme:
                            //             BOTTOM_PICKER_THEME.PLUM_PLATE)
                            //     .show(context);
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        // color: Color(0xffffffff),
                                        color: Color.fromRGBO(40, 51, 55, 1),
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xff999999),
                                            width: 0.0,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          CupertinoButton(
                                            child: Text('??????'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                              vertical: 5.0,
                                            ),
                                          ),
                                          CupertinoButton(
                                            child: Text('??????'),
                                            onPressed: () {
                                              print(gender);
                                              controller.genderSelected(gender);
                                              Navigator.pop(context);
                                            },
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                              vertical: 5.0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 35),
                                      height: 150.0,
                                      color: Color.fromRGBO(40, 51, 55, 1),
                                      child: CupertinoPicker(
                                        scrollController:
                                            FixedExtentScrollController(
                                                initialItem: ProfileController
                                                            .to.gender ==
                                                        '???'
                                                    ? 1
                                                    : 0),
                                        itemExtent: 40,
                                        onSelectedItemChanged: (int value) {
                                          // print(genderList[value].child.key);
                                          print(genderList[value]
                                              .child
                                              .toString()
                                              .contains("???"));
                                          gender = genderList[value]
                                                  .child
                                                  .toString()
                                                  .contains("???")
                                              ? '???'
                                              : '???';
                                        },
                                        children: genderList,
                                        /* the rest of the picker */
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                              //??? ?????????
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
                            child: Text("????????????",
                                style: TextStyle(
                                    color: txtColor,
                                    fontSize: defaultSize * 14),
                                textAlign: TextAlign.center)),
                        GestureDetector(
                          onTap: () {
                            birth = controller.birthday == '/00/00'
                                ? "2000-01-01"
                                : controller.birthday!;
                            // _openDatePicker(context);
                            // DatePicker.showDatePicker(context,
                            //     showTitleActions: true,
                            //     minTime: DateTime(1900, 1, 1),
                            //     maxTime: DateTime.now(), onChanged: (date) {
                            //   print('change $date');
                            // }, onConfirm: (date) {
                            //   print('confirm $date');
                            //   controller.birthdaySelected(date
                            //       .toString()
                            //       .substring(0, 10)
                            //       .replaceAll('-', '/'));
                            // },
                            //     // currentTime: DateTime.now(),
                            // currentTime: DateTime.parse(
                            //     controller.birthday! == "/00/00"
                            //         ? "2000-01-01"
                            //         : controller.birthday!
                            //             .replaceAll('/', '-')),
                            //     locale: LocaleType.ko);
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        // color: Color(0xffffffff),
                                        color: Color.fromRGBO(40, 51, 55, 1),
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xff999999),
                                            width: 0.0,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          CupertinoButton(
                                            child: Text('??????'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                              vertical: 5.0,
                                            ),
                                          ),
                                          CupertinoButton(
                                            child: Text('??????'),
                                            onPressed: () {
                                              controller
                                                  .birthdaySelected(birth);
                                              Navigator.pop(context);
                                            },
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0,
                                              vertical: 5.0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 35),
                                      height: 300.0,
                                      width: valWidth,
                                      color: Color.fromRGBO(40, 51, 55, 1),
                                      child: CupertinoTheme(
                                        data: CupertinoThemeData(
                                          textTheme: CupertinoTextThemeData(
                                            textStyle:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        child: CupertinoDatePicker(
                                          dateOrder: DatePickerDateOrder.ymd,
                                          minimumYear: 1900,
                                          maximumYear: DateTime.now().year,
                                          initialDateTime: DateTime.parse(
                                              controller.birthday! == "/00/00"
                                                  ? "2000-01-01"
                                                  : controller.birthday!
                                                      .replaceAll('/', '-')),
                                          maximumDate: DateTime.now(),
                                          onDateTimeChanged: (e) {
                                            print(e);
                                            birth = e
                                                .toString()
                                                .substring(0, 10)
                                                .replaceAll('-', '/');
                                          },
                                          mode: CupertinoDatePickerMode.date,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                            // CupertinoDatePicker(
                            //   minimumYear: 1900,
                            //   maximumYear: DateTime.now().year,
                            //   initialDateTime: DateTime.parse(
                            //       controller.birthday! == "/00/00"
                            //           ? "2000-01-01"
                            //           : controller.birthday!
                            //               .replaceAll('/', '-')),
                            //   maximumDate: DateTime.now(),
                            //   onDateTimeChanged: (e) {},
                            //   mode: CupertinoDatePickerMode.date,
                            // );
                          },
                          child: Container(
                              //???????????? ?????????
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
                                controller.birthday == "/00/00"
                                    ? "?????? ??????"
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
                            child: Text("???",
                                style: TextStyle(
                                    color: txtColor,
                                    fontSize: defaultSize * 14),
                                textAlign: TextAlign.center)),
                        Container(
                          //??????????????? ????????? ??????
                          width: valWidth * 0.35,
                          height: TextfieldSize,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: txtFeildColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(valWidth * 0.015))),
                          margin: EdgeInsets.fromLTRB(valWidth * 0.02, 0,
                              valWidth * 0.02, valWidth * 0.015),
                          child: Center(
                            child: CupertinoTextField(
                              showCursor: false,
                              keyboardAppearance: Brightness.dark,
                              style: TextStyle(
                                  color: txtColor, fontSize: defaultSize * 15),
                              decoration: BoxDecoration(
                                  color: txtFeildColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(valWidth * 0.015))),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              maxLength: 5,
                              focusNode: phoneNumberFocusNode,
                              controller: KeyBoard,
                              onChanged: (value) {
                                height = value;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9.]')),
                              ],
                              placeholder: controller.height == ''
                                  ? '??? ??????'
                                  : controller.height,
                              placeholderStyle: TextStyle(
                                fontSize: defaultSize * 15,
                                color: hasFocus
                                    ? CupertinoColors.placeholderText
                                    : txtColor,
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   //??? ?????????
                        //   width: valWidth * 0.35,
                        //   height: TextfieldSize, //valHeight * 0.06,
                        //   decoration: BoxDecoration(
                        //       color: txtFeildColor,
                        //       borderRadius: BorderRadius.all(
                        //           Radius.circular(valWidth * 0.015))),
                        //   child: Padding(
                        //       padding: EdgeInsets.only(bottom: 1.5),
                        //       child: KeyboardActions(
                        //         disableScroll: true,
                        //         config: _buildConfig(context),
                        //         child: TextField(
                        //           textAlign: TextAlign.center,
                        // style: TextStyle(
                        //     color: txtColor,
                        //     fontSize: defaultSize * 15),
                        //           // keyboardType: TextInputType.number,
                        //           keyboardType: TextInputType.numberWithOptions(
                        //               decimal: true),
                        //           focusNode: _nodeText1,
                        //           decoration: InputDecoration(
                        //               border: InputBorder.none,
                        //               focusedBorder: InputBorder.none,
                        //               enabledBorder: InputBorder.none,
                        //               errorBorder: InputBorder.none,
                        //               disabledBorder: InputBorder.none,
                        // hintText: controller.height == ''
                        //     ? '??? ??????'
                        //     : controller.height,
                        //               hintStyle: TextStyle(
                        //                   color: txtColor,
                        //                   fontSize: defaultSize * 15)),
                        //           onChanged: (text) {
                        //             controller.heightSelected(text);
                        //           },
                        //         ),
                        //       )),
                        // ),
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
                            child: Text("??????",
                                style: TextStyle(
                                    color: txtColor,
                                    fontSize: defaultSize * 14),
                                textAlign: TextAlign.center)),
                        Container(
                          width: valWidth * 0.35,
                          height: TextfieldSize,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: txtFeildColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(valWidth * 0.015))),
                          margin: EdgeInsets.fromLTRB(valWidth * 0.02, 0,
                              valWidth * 0.02, valWidth * 0.015),
                          child: Center(
                            child: CupertinoTextField(
                              showCursor: false,
                              keyboardAppearance: Brightness.dark,
                              style: TextStyle(
                                  color: txtColor, fontSize: defaultSize * 15),
                              decoration: BoxDecoration(
                                  color: txtFeildColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(valWidth * 0.015))),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              maxLength: 4,
                              focusNode: phoneNumberFocusNode1,
                              controller: KeyBoard1,
                              onChanged: (value) {
                                weight = value;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9.]')),
                              ],
                              placeholder: controller.weight == '0.0'
                                  ? '?????? ??????'
                                  : controller.weight,
                              placeholderStyle: TextStyle(
                                fontSize: defaultSize * 15,
                                // color: Colors.red,
                                color: hasFocus1
                                    ? CupertinoColors.placeholderText
                                    : txtColor,
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   //?????? ?????????
                        //   width: valWidth * 0.35,
                        //   height: TextfieldSize, //valHeight * 0.06,
                        //   decoration: BoxDecoration(
                        //       color: txtFeildColor,
                        //       borderRadius: BorderRadius.all(
                        //           Radius.circular(valWidth * 0.015))),
                        //   child: Padding(
                        //       padding: EdgeInsets.only(bottom: 1.5),
                        //       child: KeyboardActions(
                        //           disableScroll: true,
                        //           config: _buildConfig(context),
                        //           child: TextField(
                        //             textAlign: TextAlign.center,
                        //             style: TextStyle(
                        //                 color: txtColor,
                        //                 fontSize: defaultSize * 15),
                        //             keyboardType: TextInputType.number,
                        //             focusNode: _nodeText2,
                        //             decoration: InputDecoration(
                        //                 border: InputBorder.none,
                        //                 focusedBorder: InputBorder.none,
                        //                 enabledBorder: InputBorder.none,
                        //                 errorBorder: InputBorder.none,
                        //                 disabledBorder: InputBorder.none,
                        //                 hintText: controller.weight,
                        //                 hintStyle: TextStyle(
                        //                     color: txtColor,
                        //                     fontSize: defaultSize * 15)),
                        //             onChanged: (text) {
                        //               controller.weightSelected(text);
                        //             },
                        //           ))),
                        // ),
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
                  width: valWidth * 0.75,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: txtFeildColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(valWidth * 0.02))),
                  child: Center(
                    child: CupertinoTextField(
                      showCursor: false,
                      keyboardAppearance: Brightness.dark,
                      style: TextStyle(
                          color: txtColor, fontSize: defaultSize * 15),
                      decoration: BoxDecoration(
                          color: txtFeildColor,
                          borderRadius: BorderRadius.all(
                              Radius.circular(valWidth * 0.015))),
                      textAlign: TextAlign.center,
                      padding: EdgeInsets.zero,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.multiline,
                      maxLines: 1,
                      focusNode: phoneNumberFocusNode2,
                      controller: KeyBoard2,
                      onChanged: (value) {
                        disease = value;
                      },
                      placeholder:
                          controller.disease == null || controller.disease == ""
                              ? "   ???????????? ?????? ??????"
                              : controller.disease,
                      placeholderStyle: TextStyle(
                          fontSize: defaultSize * 14, color: txtColor),
                    ),
                  ),
                ),
                // Container(
                //   height: 50,
                //   width: valWidth * 0.75,
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //       color: txtFeildColor,
                //       borderRadius:
                //           BorderRadius.all(Radius.circular(valWidth * 0.02))),
                //   child: KeyboardActions(
                //     disableScroll: true,
                //     config: _buildConfig(context),
                //     child: TextField(
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //           color: txtColor, fontSize: defaultSize * 15),
                //       keyboardType: TextInputType.text,
                //       focusNode: _nodeText3,
                //       decoration: InputDecoration(
                //           hintText: controller.disease == null ||
                //                   controller.disease == ""
                //               ? "   ???????????? ?????? ??????"
                //               : controller.disease,
                //           hintStyle: TextStyle(
                //               fontSize: defaultSize * 14, color: txtColor)),
                //       onChanged: (text) {
                //         controller.diseaseSelected(text);
                //       },
                //     ),
                //   ),
                // ), //disease
                SizedBox(
                  height: 35,
                ),

                GestureDetector(
                  // ???????????? ??????????????????
                  onTap: () {
                    String text = '';
                    text += controller.gender == '????????????' ? '?????? ' : '';
                    text += controller.birthday == "/00/00" ? '???????????? ' : '';
                    text += controller.height == '' ? '??? ' : '';

                    if (text != '') {
                      _showAlert(title: '?????? ????????? ????????? ?????????', message: text);
                    } else {
                      controller.updateProfile();
                      Get.offAll(() => ConstructTabBar());
                    }
                    // return Home();
                  }, //????????? ???????????? ?????? ??????
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
                            child: Text("??????",
                                style: TextStyle(
                                    fontSize: defaultSize * 15,
                                    color: txtColor),
                                textAlign: TextAlign.center)),
                      ),
                    ],
                  ),
                ), //????????????_??????????????????
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

class InputDoneView extends StatelessWidget {
  InputDoneView(this.height, this.weight, this.disease, this.KeyBoard,
      this.KeyBoard1, this.KeyBoard2);

  final String height;
  final String weight;
  final String disease;
  final TextEditingController KeyBoard;
  final TextEditingController KeyBoard1;
  final TextEditingController KeyBoard2;

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

              if (height != ProfileController.to.height) {
                if (double.tryParse(height) != null) {
                  ProfileController.to.heightSelected(
                      ((double.parse(height) * 10).round() / 10).toString());
                  // NumFood.value = double.parse(height).toString();
                  KeyBoard.value = TextEditingValue(
                      text: ((double.parse(height) * 10).round() / 10)
                          .toString());
                } else {
                  KeyBoard.clear();
                }
              }

              if (weight != ProfileController.to.weight) {
                if (double.tryParse(weight) != null) {
                  ProfileController.to.weightSelected(
                      ((double.parse(weight) * 10).round() / 10).toString());
                  // NumFood.value = double.parse(height).toString();
                  KeyBoard1.value = TextEditingValue(
                      text: ((double.parse(weight) * 10).round() / 10)
                          .toString());
                } else {
                  KeyBoard1.clear();
                }
              }

              if (disease != ProfileController.to.disease) {
                ProfileController.to.diseaseSelected(disease);
              }
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
