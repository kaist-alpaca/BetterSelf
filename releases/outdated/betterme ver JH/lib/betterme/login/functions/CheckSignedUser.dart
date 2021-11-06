import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:betterme/betterme/home/functions/ConstructTabBar.dart';
import 'package:betterme/functions/Server/ServerConnectionMethods.dart';

import '../initialsetting/InitialSettingScreen.dart';

class CheckSignedUser extends StatelessWidget {
  final String uid;
  // String tmp;
  const CheckSignedUser({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("sdfsdf");
    // print(uid);
    // var check = ServerConnection.checkUser(uid);
    // print(check);
    // var tmp = check;
    // if (tmp == '1') {
    //   return ConstructTabBar();
    // } else {
    //   return InitialSettingScreen();
    // }
    return FutureBuilder<String>(
        future: ServerConnectionMethods.AuthSignedUser(uid),
        builder: (context, AsyncSnapshot<String> snapshot) {
          ProfileController.to.authStateChanges(snapshot.data);
          if (snapshot.hasData) {
            print(snapshot.data!);
            if (snapshot.data! == "1") {
              print('good');
              return ConstructTabBar();
              // return InitialSettingScreen();
            } else {
              // return ConstructTabBar();
              return InitialSettingScreen();
            }
            // return Text(snapshot.data!);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
