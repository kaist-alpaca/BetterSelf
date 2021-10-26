import 'package:flutter/material.dart';
import 'package:betterme/src/controller/server_connection.dart';

import '../build_home.dart';
import 'basic_info_screen.dart';

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
        future: ServerConnection.AuthSignedUser(uid),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!);
            if (snapshot.data! == "1") {
              print('good');
              return ConstructTabBar();
              // return InitialSettingScreen();
            } else {
              return InitialSettingScreen();
            }
            // return Text(snapshot.data!);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
