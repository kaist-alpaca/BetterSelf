import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingIDScreen extends StatefulWidget {
  @override
  _SettingIDScreen createState() => _SettingIDScreen();
}

class _SettingIDScreen extends State<SettingIDScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Setting ID"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Setting ID',
            )
          ],
        ),
      ),
    );
  }
}
