import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunicationScreen extends StatefulWidget {
  @override
  _CommunicationScreen createState() => _CommunicationScreen();
}

class _CommunicationScreen extends State<CommunicationScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;

    return Scaffold(
      appBar: AppBar(
        title: Text('메세지'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text("여기에 채팅 부분 구현할 것"),
              height: valHeight * 0.3,
              width: valWidth,
            ),
            Container(
              child: Text('여기에 입력 기능 구현할 것'),
              width: valWidth,
            )
          ],
        ),
      ),
    );
  }
}
