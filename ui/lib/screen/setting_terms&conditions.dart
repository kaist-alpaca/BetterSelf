import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingTermsScreen extends StatefulWidget {
  @override
  _SettingTermsScreen createState() => _SettingTermsScreen();
}

class _SettingTermsScreen extends State<SettingTermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Setting Terms & Conditions"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Setting Terms & Conditions',
            )
          ],
        ),
      ),
    );
  }
}
