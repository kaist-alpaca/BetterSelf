import 'package:betterme/betterme/login/functions/CheckSignedUser2.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:betterme/betterme/home/functions/ConstructTabBar.dart';
import 'package:betterme/functions/Server/ServerConnectionMethods.dart';

import '../initialsetting/InitialSettingScreen.dart';

class CheckSignedUser extends StatelessWidget {
  final String uid;
  const CheckSignedUser({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: ServerConnectionMethods.AuthSignedUser(uid),
        builder: (context, AsyncSnapshot<String> snapshot) {
          print("debug : ${snapshot.data}");
          if (snapshot.hasData) {
            return CheckSignedUser2(num: snapshot.data!, data: snapshot.data);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
