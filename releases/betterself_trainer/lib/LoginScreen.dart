// ignore_for_file: file_names

import 'package:betterself_trainer/HomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    UserCredential result =
    await FirebaseAuth.instance.signInWithCredential(credential);
    User? userDetails = result.user;
    Map<String, dynamic> userInfoMap = {
      "profileUrl": "",
      "email": userDetails!.email,
      "username": userDetails.email!.replaceAll("@gmail.com", ""),
      "name": userDetails.displayName,
      "imgUrl": userDetails.photoURL
    };
    FirebaseFirestore.instance
        .collection("users")
        .doc(userDetails.uid)
        .set(userInfoMap);
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {

    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final bgColor = Color(0xff0B202A); //배경색

    return Container(
      color: bgColor,
      child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return HomeScreen();
            } else{
              return GestureDetector(
                onTap: () {
                  signInWithGoogle();
                },
                child: Container(
                    height: 41,
                    width: valWidth * 0.73,
                    alignment: Alignment(0, -0.2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(valWidth * 0.015),
                    ),
                    child: Text(
                      "Google 계정으로 로그인",
                      style: TextStyle(
                          color: txtColor, fontSize: 15, height: 1.8),
                      textAlign: TextAlign.center,
                    )
                ),
              );
            }

          } // builderend

      ),
    );
  }
}
