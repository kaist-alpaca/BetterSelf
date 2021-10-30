import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

import 'functions/home_add_1.dart';
import 'functions/home_add_2.dart';

import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final screenHeight = valHeight * 0.78;
    final scrrenWidth = valWidth * 0.9;

    final gridHeight = valHeight / 8;
    final gridWidth = valWidth / 6;

    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
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
          backgroundColor: bgColor,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: valHeight * 0.08,
                ),
                Row(
                  children: [
                    Container(
                      width: valWidth * 0.08,
                      child: Divider(
                        color: Color(0xffD2ABBA),
                        thickness: 0.6,
                      ),
                    ),
                    Container(
                      width: valWidth * 0.38,
                      child: Text(
                        'Hi, ' + 'Name' + '!',
                        style: TextStyle(
                          fontSize: defaultSize * 19,
                          color: Color(0xffFFFDFD),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: valWidth * 0.54,
                      child: Divider(
                        color: Color(0xffD2ABBA),
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: valHeight * 0.025,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
