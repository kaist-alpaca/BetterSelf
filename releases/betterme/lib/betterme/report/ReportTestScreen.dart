import 'package:betterme/betterme/report/functions/TotalGraphs.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:betterme/functions/Widgets/DividewithObj.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ReportTestScreen extends StatefulWidget {
  const ReportTestScreen({Key? key}) : super(key: key);

  @override
  _ReportTestScreenState createState() => _ReportTestScreenState();
}

class _ReportTestScreenState extends State<ReportTestScreen> {

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색

    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: bgColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(valHeight * 0.08),
          child: AppBar(
            backgroundColor: bgColor,
            elevation: 0.0,
            title: Align(
              alignment: Alignment.center,
              child: Container(
                height: valHeight * 0.08,
                padding: EdgeInsets.only(top: valHeight * 0.03, right: valWidth * 0.1),
                child: Text(
                    "데이터",
                    style: TextStyle(fontSize: 17, color: txtColor),
                    textAlign: TextAlign.center),
              ),
            ),
            leading: Container(
              height: valHeight * 0.08,
              padding: EdgeInsets.only(top: valHeight * 0.022),
              child: IconButton(
                icon: SvgPicture.asset('images/arrow towards left_icon.svg'),
                onPressed: () {
                  controller.dateMinus7(controller.date);
                },
              ),
            ),
          ),
        ),
      body: ListView(children: [
        DividewithObj(context,
          Container(
            width: valWidth * 0.25,
            child : Text("데이터", style: TextStyle(fontSize : 14, color: Colors.pink[100],), textAlign: TextAlign.center,)
          ), 0.15, 0.6
        ),

        TotalGraphs(),

        DividewithObj(context,
          Container(
              width: valWidth * 0.25,
              child : Text("코칭", style: TextStyle(fontSize : 14, color: Colors.pink[100],), textAlign: TextAlign.center,)
          ), 0.15, 0.6
        ),

        ]),
      );
    });
  }
}
