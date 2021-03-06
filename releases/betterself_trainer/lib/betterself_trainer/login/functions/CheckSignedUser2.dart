
import 'package:betterself_trainer/betterself_trainer/home/functions/ConstructTabBar.dart';
import 'package:betterself_trainer/betterself_trainer/login/initialsetting/InitialSettingScreen.dart';
import 'package:betterself_trainer/functions/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';

class checkSignedUser2 extends StatefulWidget {
  late var num;
  late var data;
  checkSignedUser2({Key? key, required this.num, required this.data})
      : super(key: key);

  @override
  State<checkSignedUser2> createState() => _checkSignedUser2State();
}

class _checkSignedUser2State extends State<checkSignedUser2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: ProfileController.to.authStateChanges(widget.data),
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
