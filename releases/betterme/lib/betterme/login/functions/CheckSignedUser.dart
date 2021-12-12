import 'package:betterme/betterme/login/functions/CheckSignedUser2.dart';
import 'package:flutter/material.dart';
import 'package:betterme/functions/Server/ServerConnectionMethods.dart';

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
            return Material(
              type: MaterialType.transparency,
              child: Container(
                color: Color(0xff0B202A),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Text(
                        "로그인 중입니다....",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
