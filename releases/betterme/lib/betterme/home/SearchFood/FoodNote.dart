import 'package:flutter/material.dart';

class FoodNoteScreen extends StatefulWidget {
  @override
  _FoodNoteScreen createState() => _FoodNoteScreen();
}

class _FoodNoteScreen extends State<FoodNoteScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    final blockColor = Color(0xff333C47); // 여러 블럭들 색
    double defaultSize = valWidth * 0.0025;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("식단 기록",
            style: TextStyle(color: txtColor, fontSize: defaultSize * 15)),
        backgroundColor: bgColor,
      ),
    );
  }
}
