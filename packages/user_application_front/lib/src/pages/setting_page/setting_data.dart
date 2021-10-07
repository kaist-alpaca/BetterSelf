import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingDataScreen extends StatefulWidget {
  @override
  _SettingDataScreen createState() => _SettingDataScreen();
}

class _SettingDataScreen extends State<SettingDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Setting Data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Setting Data',
            )
          ],
        ),
      ),
    );
  }
}
