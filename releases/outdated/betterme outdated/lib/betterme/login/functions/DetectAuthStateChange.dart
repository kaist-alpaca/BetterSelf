import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';

import '../LoginScreen.dart';
import 'CheckSignedUser.dart';

class DetectAuthStateChange extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          // print(FirebaseAuth.instance.currentUser!.displayName);
          ProfileController.to.authStateChanges(snapshot.data);
          if (snapshot.hasData) {
            // user is authorozed hence redirect to home screen
            // return Profile();
            // return Test();
            // print("uid is?");
            String _data = snapshot.data.toString();
            // print(_data.substring(
            //     _data.lastIndexOf("uid: ") + 5, _data.length - 1));
            // return BuildHome();
            return CheckSignedUser(
                uid: _data.substring(
                    _data.lastIndexOf("uid: ") + 5, _data.length - 1));
            // Get.off(BasicInfoScreen());
          } else
            // user not authorized hence redirect to login page
            // return LoginWidget();
            return LoginScreen();
        });
  }
}
