import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_application_front/src/pages/report_page/inbody_page/inbody_tabs.dart';

int buttonCase = 0; // 버튼 상태 확인용

class InbodyScreen extends StatefulWidget {
  @override
  _InbodyScreen createState() => _InbodyScreen();
}

class _InbodyScreen extends State<InbodyScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025; //폰트사이즈용

    return Scaffold(
      appBar: AppBar(
        title: Text('InBody'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: valHeight * 0.015,
            ),
            Row(
              // 여기서부터 버튼(7일/31일/12개월 구분)
              children: [
                ElevatedButton(
                  onPressed: () {
                    buttonCase = 1;
                    setState(() {});
                  },
                  child: Text('7일'),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        buttonCase = 1;
                        print('button case here is $buttonCase');
                      });
                    },
                    child: Text('31일')),
                ElevatedButton(
                    onPressed: () {
                      buttonCase = 2;
                      print('button case here is $buttonCase');
                    },
                    child: Text('12개월'))
              ],
            ),
            InbodyTabs(buttonCase: buttonCase)
          ],
        ),
      ),
    );
  }
}
