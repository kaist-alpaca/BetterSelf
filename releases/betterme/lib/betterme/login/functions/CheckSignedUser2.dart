import 'package:betterme/betterme/home/functions/ConstructTabBar.dart';
import 'package:betterme/betterme/login/initialsetting/InitialSettingScreen.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';

class checkSignedUser2 extends StatelessWidget {
  late var num;
  late var data;
  checkSignedUser2({Key? key, required this.num, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: ProfileController.to.authStateChanges(data),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data! == "0") {
              return ConstructTabBar();
              // return Container(child: Text("안녕1"));
            } else {
              return InitialSettingScreen();
              // return Container(child: Text("안녕"));
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
