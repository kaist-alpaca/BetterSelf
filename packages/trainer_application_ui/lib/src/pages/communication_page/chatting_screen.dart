import 'package:flutter/material.dart';

class ChattingScreen extends StatefulWidget {
  @override
  _ChattingScreen createState() => _ChattingScreen();
}

class _ChattingScreen extends State<ChattingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('트레이너 프사랑 이름'),
        ),
        body: Center(
          child: Column(
            children: [Text('여기에 채팅 화면 구현. 화이팅.')],
          ),
        ));
  }
}
