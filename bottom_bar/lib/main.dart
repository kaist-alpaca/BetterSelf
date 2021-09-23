import 'package:bottom_bar/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigation(),
    );
  }
}
