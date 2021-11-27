
import 'package:betterself_trainer/functions/Server/ServerConnectionMethods.dart';
import 'package:flutter/material.dart';

import 'CheckSignedUser2.dart';


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
            return checkSignedUser2(num: snapshot.data!, data: snapshot.data);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
