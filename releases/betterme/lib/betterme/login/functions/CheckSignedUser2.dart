import 'package:betterme/betterme/home/functions/ConstructTabBar.dart';
import 'package:betterme/betterme/login/initialsetting/InitialSettingScreen.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';

class CheckSignedUser2 extends StatelessWidget {
  late var num;
  late var data;
  CheckSignedUser2({Key? key, required this.num, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: ProfileController.to.authStateChanges(data),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data! == "0") {
              return ConstructTabBar();
            } else {
              return InitialSettingScreen();
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
