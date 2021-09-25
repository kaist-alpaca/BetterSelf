import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionAnswerScreen extends StatefulWidget {
  @override
  _QuestionAnswerScreen createState() => _QuestionAnswerScreen();
}

class _QuestionAnswerScreen extends State<QuestionAnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Q&A',
            )
          ],
        ),
      ),
    );
  }
}
