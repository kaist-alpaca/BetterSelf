import 'package:flutter/material.dart';

class FoodSearchScreen extends StatefulWidget {
  @override
  _FoodSearchScreen createState() => _FoodSearchScreen();
}

class _FoodSearchScreen extends State<FoodSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;

    return Scaffold(
        appBar: AppBar(
          title: Text("음식 검색"),
        ),
        body: Container());
  }
}
