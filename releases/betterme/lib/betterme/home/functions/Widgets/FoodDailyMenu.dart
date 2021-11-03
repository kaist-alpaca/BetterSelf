import 'package:betterme/betterme/home/SearchFoodScreen/SearchFoodScreen.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDailyMenu extends StatefulWidget {
  final double widgetHeight;
  final double widgetWidth;
  final int type;
  final int index;
  const FoodDailyMenu({
    Key? key,
    required this.type,
    required this.widgetHeight,
    required this.widgetWidth,
    required this.index,
  }) : super(key: key);

  @override
  _FoodDailyMenu createState() => _FoodDailyMenu();
}

class _FoodDailyMenu extends State<FoodDailyMenu> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    double defaultSize = valWidth * 0.0025;
    print(widget.type);

    if (widget.type == 0) {
      return GetBuilder<ProfileController>(builder: (controller) {
        return Container(
            height: widget.widgetHeight,
            width: widget.widgetWidth,
            padding: EdgeInsets.only(
                left: widget.widgetWidth * 0.05,
                right: widget.widgetWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //사진 들어가는 박스
                  height: widget.widgetHeight * 0.55,
                  width: widget.widgetWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Color(0xff373B42),
                    borderRadius: BorderRadius.circular(valWidth * 0.015),
                  ),
                  padding:
                      EdgeInsets.all(widget.widgetHeight * 0.08), // 안 버튼 크기 조절

                  child: ElevatedButton(
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) =>
                              CupertinoActionSheet(
                            title: const Text('프로필 이미지 선택'),
                            message: const Text('Your options are '),
                            actions: <Widget>[
                              CupertinoActionSheetAction(
                                child: const Text('사진 촬영'),
                                onPressed: () async {
                                  await controller.pickImage(
                                      type: 'camera', use: 'food');
                                  // print("change image");
                                  // var save = await controller.save();
                                  // print(save);
                                  Navigator.pop(context, 'Cancel');
                                  if (ProfileController.to.food != null) {
                                    controller.uploadFoodImage(
                                        uid: controller.myProfile.value.uid!,
                                        index: widget.index.toString(),
                                        file: ProfileController.to.food!);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchFoodScreen()));
                                  }
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: const Text('갤러리에서 사진 선택'),
                                onPressed: () async {
                                  await controller.pickImage(
                                      type: 'gallery', use: 'food');
                                  Navigator.pop(context, 'Cancel');
                                  if (ProfileController.to.food != null) {
                                    controller.uploadFoodImage(
                                        uid: controller.myProfile.value.uid!,
                                        index: widget.index.toString(),
                                        file: ProfileController.to.food!);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchFoodScreen()));
                                  }
                                },
                              )
                            ],
                            cancelButton: CupertinoActionSheetAction(
                              child: const Text('취소'),
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                              },
                            ),
                          ),
                        );
                      },
                      // child: Text('+',
                      //     style: TextStyle(
                      //         color: Color(0xffFBF5F6),
                      //         fontSize: defaultSize * 22)),
                      child: Container(
                          //여기에 아마도 프사설정
                          width: valWidth * 0.25,
                          height: valWidth * 0.25,
                          // color: Colors.grey,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: 100,
                              height: 100,
                              // child: Image.network(
                              //   "http://kaistuser.iptime.org:8080/img/profile/4fT7dL3H8CUkLKBx9bB3Pqjp3bi1121.jpg",
                              //   fit: BoxFit.cover,
                              // ),
                              child: Image.network(
                                'http://kaistuser.iptime.org:8080/img/food/4fT7dL3H8CUkLKBx9bB3Pqjp3bi1.2021_11_3_3.jpg', // this image doesn't exist
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.amber,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Whoops!',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  );
                                },
                              ),
                              // child: Image.network(
                              //   'Your image url...',
                              //   errorBuilder: (BuildContext context,
                              //       Object exception, StackTrace stackTrace) {
                              //     return Text('Your error widget...');
                              //   },
                              // ),
                              // child:
                              //     controller.myProfile.value.profileImage ==
                              //             null
                              //         ? Image.network(
                              //             "http://kaistuser.iptime.org:8080/img/profile/4fT7dL3H8CUkLKBx9bB3Pqjp3bi1121.jpg",
                              //             fit: BoxFit.cover,
                              //           )
                              //         : Image.file(
                              //             controller
                              //                 .myProfile.value.profileImage!,
                              //             fit: BoxFit.cover,
                              //           ),
                            ),
                          ),
                          margin: EdgeInsets.fromLTRB(
                              valWidth * 0.025, 0, valWidth * 0.025, 0)),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), primary: Color(0xff4B4D58))),
                ),
                SizedBox(height: widget.widgetHeight * 0.08),
                Text(
                  '',
                  style: TextStyle(fontSize: defaultSize * 10, color: txtColor),
                  textAlign: TextAlign.center,
                )
              ],
            ));
      });
    } else if (widget.type == 1) {
      return Container(
          height: widget.widgetHeight,
          width: widget.widgetWidth,
          padding: EdgeInsets.only(
              left: widget.widgetWidth * 0.05,
              right: widget.widgetWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchFoodScreen()));
                },
                child: Container(
                  //사진 들어가는 박스
                  height: widget.widgetHeight * 0.55,
                  width: widget.widgetWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Color(0xff373B42),
                    borderRadius: BorderRadius.circular(valWidth * 0.015),
                  ),
                  child: Text('여기에 음식 사진, 사진 없으면 아이콘',
                      style: TextStyle(
                          color: Colors.white, fontSize: defaultSize * 10)),
                ),
              ),
              SizedBox(height: widget.widgetHeight * 0.08),
              Text(
                "식단 내용은 여기에" + '\n' + '여기에',
                style: TextStyle(fontSize: defaultSize * 10, color: txtColor),
                textAlign: TextAlign.center,
              )
            ],
          ));
    } else {
      return Container();
    }
  }
}
