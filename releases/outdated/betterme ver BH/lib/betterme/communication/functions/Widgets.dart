import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  final valHeight = MediaQuery.of(context).size.height; //화면 높이
  final valWidth = MediaQuery.of(context).size.width; //화면 너비
  final bgColor = Color(0xff0B202A); //배경색
  final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
  final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
  return AppBar(
    title: Text('A Title'),
  );
}

InputDecoration textFieldInput(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.black,
      ),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)));
}
