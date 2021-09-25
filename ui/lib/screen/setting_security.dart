import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScurityScreen extends StatefulWidget {
  @override
  _SettingScurityScreen createState() => _SettingScurityScreen();
}

class _SettingScurityScreen extends State<SettingScurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Setting Security"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Setting Security',
            )
          ],
        ),
      ),
    );
  }
}
