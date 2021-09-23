import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommunicationScreen extends StatefulWidget {
  @override
  _CommunicationScreen createState() => _CommunicationScreen();
}

class _CommunicationScreen extends State<CommunicationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Communication',
            )
          ],
        ),
      ),
    );
  }
}
