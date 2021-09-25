import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPWScreen extends StatefulWidget {
  @override
  _SettingPWScreen createState() => _SettingPWScreen();
}

class _SettingPWScreen extends State<SettingPWScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Setting PW"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Setting PW',
            )
          ],
        ),
      ),
    );
  }
}
