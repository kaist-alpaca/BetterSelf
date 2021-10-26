import 'package:flutter/material.dart';
import 'package:betterme/src/controller/server_connection.dart';

import '../build_home.dart';
import 'basic_info_screen.dart';

class check_user extends StatelessWidget {
  final String uid;
  // String tmp;
  const check_user({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("sdfsdf");
    // print(uid);
    // var check = ServerConnection.checkUser(uid);
    // print(check);
    // var tmp = check;
    // if (tmp == '1') {
    //   return BuildHome();
    // } else {
    //   return BasicInfoScreen();
    // }
    return FutureBuilder<String>(
        future: ServerConnection.checkUser(uid),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!);
            if (snapshot.data! == "1") {
              print('good');
              return BuildHome();
              // return BasicInfoScreen();
            } else {
              return BasicInfoScreen();
            }
            // return Text(snapshot.data!);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
