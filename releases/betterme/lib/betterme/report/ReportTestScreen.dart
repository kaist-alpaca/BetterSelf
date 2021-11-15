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

  List<bool> GraphTypes = [true, true, true, true, true];

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
        SizedBox(height: 13,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  GraphTypes[0] ? GraphTypes[0] = false : GraphTypes[0] = true;
                });
              },
              child: Container(
                height: 20,
                width: valWidth/7,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(
                      color: Color(0xffFFFDFD),
                      width: 1
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children : [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('체중', style: TextStyle(fontSize: 12, color: Color(0xffFFFDFD)),),
                          Text(' (kg)', style: TextStyle(fontSize: 9, color: Color(0xffFFFDFD)),)
                        ],
                      ),
                    ]
                  )
                ),
              ),
            ),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                setState(() {
                  GraphTypes[1] ? GraphTypes[1] = false : GraphTypes[1] = true;
                });
              },
              child: Container(
                height: 20,
                width: valWidth/7,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        border: Border.all(
                            color: Color(0xffA0B1DF),
                            width: 1
                        )
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children : [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('수면', style: TextStyle(fontSize: 12, color: Color(0xffFFFDFD)),),
                              Text(' (시간)', style: TextStyle(fontSize: 9, color: Color(0xffFFFDFD)),)
                            ],
                          ),
                        ]
                    )
                ),
              ),
            ),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                setState(() {
                  GraphTypes[2] ? GraphTypes[2] = false : GraphTypes[2] = true;
                });
              },
              child: Container(
                height: 20,
                width: valWidth/7,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        border: Border.all(
                            color: Color(0xffF2D8A7),
                            width: 1
                        )
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children : [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('스트레스', style: TextStyle(fontSize: 12, color: Color(0xffFFFDFD)),),
                            ],
                          ),
                        ]
                    )
                ),
              )
            ),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                setState(() {
                  GraphTypes[3] ? GraphTypes[3] = false : GraphTypes[3] = true;
                });
              },
              child: Container(
                height: 20,
                width: valWidth/7,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        border: Border.all(
                            color: Color(0xffD2ABBA),
                            width: 1
                        )
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children : [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('섭취', style: TextStyle(fontSize: 12, color: Color(0xffFFFDFD)),),
                              Text(' (kcal)', style: TextStyle(fontSize: 9, color: Color(0xffFFFDFD)),)
                            ],
                          ),
                        ]
                    )
                ),
              )
            ),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                setState(() {
                  GraphTypes[4] ? GraphTypes[4] = false : GraphTypes[4] = true;
                });
              },
              child: Container(
                height: 20,
                width: valWidth/7,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        border: Border.all(
                            color: Color(0xff8DBFBC),
                            width: 1
                        )
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children : [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('소모', style: TextStyle(fontSize: 12, color: Color(0xffFFFDFD)),),
                              Text(' (kcal)', style: TextStyle(fontSize: 9, color: Color(0xffFFFDFD)),)
                            ],
                          ),
                        ]
                    )
                ),
              )
            ),
          ],
        ),
        SizedBox(height: 20,),

        TotalGraphs(GraphTypes: GraphTypes,),

        SizedBox(height: 7,),

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
