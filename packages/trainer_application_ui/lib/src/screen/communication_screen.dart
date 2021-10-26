import 'package:flutter/material.dart';
import '../pages/communication_page/chatting_screen.dart';

class CommunicationScreen extends StatefulWidget {
  @override
  _CommunicationScreen createState() => _CommunicationScreen();
}

class _CommunicationScreen extends State<CommunicationScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025; //폰트사이즈용
    return Scaffold(
        appBar: AppBar(
          title: Text('트레이너 프사랑 이름'),
        ),
        body: ListView(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: valHeight * 0.03,
                  width: valWidth * 0.21,
                  margin: EdgeInsets.only(
                      top: valHeight * 0.012, bottom: valHeight * 0.012),
                  child: Text(
                    '메시지',
                    style: TextStyle(fontSize: defaultSize * 12),
                  ),
                ),

                ///이 아래로 각각의 사용자 채팅 화면으로 넘어가야 함.
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChattingScreen()));
                  },
                  child: Container(
                    height: valHeight * 0.1,
                    width: valWidth * 0.86,
                    margin: EdgeInsets.only(bottom: valHeight * 0.003),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Text('여기에 각 사용자의 채팅이 떠야함.'),
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
