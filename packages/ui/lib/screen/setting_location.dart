import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingLocationScreen extends StatefulWidget {
  @override
  _SettingLocationScreen createState() => _SettingLocationScreen();
}

class _SettingLocationScreen extends State<SettingLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Setting Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Setting Location',
            )
          ],
        ),
      ),
    );
  }
}
