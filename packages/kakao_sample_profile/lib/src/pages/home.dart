import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_sample_profile/src/controller/profile_controller.dart';
import 'package:kakao_sample_profile/src/pages/profile.dart';

import 'login.dart';

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   // Widget build(BuildContext context) {
//   //   return FutureBuilder(
//   //     future: _initialization,
//   //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {},
//   //   );
//   // }
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//         if (!snapshot.hasData) {
//           return LoginWidget();
//         } else {
//           return Profile();
//         }
//       },
//     );
//   }
// }

class Home {
  //Determine if the user is authenticated and redirect accordingly
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          // print(FirebaseAuth.instance.currentUser!.displayName);
          ProfileController.to.authStateChanges(snapshot.data);
          if (snapshot.hasData) {
            // user is authorozed hence redirect to home screen
            return Profile();
          } else
            // user not authorized hence redirect to login page
            return LoginWidget();
        });
  }
}
