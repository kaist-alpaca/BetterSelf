import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_sample_profile/src/controller/profile_controller.dart';
import 'package:kakao_sample_profile/src/pages/home_add.dart/home_add_1.dart';
import 'package:kakao_sample_profile/src/pages/home_add.dart/home_add_2.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreenMain extends StatefulWidget {
  @override
  _HomeScreenMainState createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    return GetBuilder<ProfileController>(builder: (controller) {
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF004E92),
              Color(0xFF000428),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(controller.date.month.toString() +
                "월 " +
                controller.date.day.toString() +
                "일"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                controller.dateMinus(controller.date);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  controller.datePlus(controller.date);
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: valWidth * 0.15,
                      child: Divider(
                        color: Colors.pink[100],
                        thickness: 1.0,
                      ),
                    ),
                    Container(
                      width: valWidth * 0.3,
                      child: Text(
                        '오늘의 데이터',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.pink[100],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: valWidth * 0.55,
                      child: Divider(
                        color: Colors.pink[100],
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: valWidth * 0.8,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      width: valWidth * 0.15,
                      child: Divider(
                        color: Colors.pink[100],
                        thickness: 1.0,
                      ),
                    ),
                    Container(
                      width: valWidth * 0.3,
                      child: Text(
                        '타임라인',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.pink[100],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: valWidth * 0.55,
                      child: Divider(
                        color: Colors.pink[100],
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.2,
                  isFirst: true,
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: SvgPicture.asset('images/home_1.svg'),
                    drawGap: true,
                  ),
                  endChild: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '8:33',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            width: 180,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.2,
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: SvgPicture.asset('images/home_4.svg'),
                    drawGap: true,
                  ),
                ),
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0.2,
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: SvgPicture.asset('images/home_1.svg'),
                    drawGap: true,
                  ),
                  endChild: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '12:48',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          GestureDetector(
                            onTap: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoActionSheet(
                                  title: const Text('Choose Options'),
                                  message: const Text('Your options are '),
                                  actions: <Widget>[
                                    CupertinoActionSheetAction(
                                      child: const Text('One'),
                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');
                                        Get.to(() => homeAdd1());
                                      },
                                    ),
                                    CupertinoActionSheetAction(
                                      child: const Text('Two'),
                                      onPressed: () {
                                        Navigator.pop(context, 'Cancel');
                                        Get.to(() => homeAdd2());
                                      },
                                    )
                                  ],
                                  cancelButton: CupertinoActionSheetAction(
                                    child: const Text('Cancel'),
                                    isDefaultAction: true,
                                    onPressed: () {
                                      Navigator.pop(context, 'Cancel');
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              width: 180,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
