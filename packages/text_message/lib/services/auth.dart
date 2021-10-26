import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:message/helperfunctions/sharedpref_helper.dart';
import 'package:message/view/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database.dart';


class AuthMethods{
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async{
    final FirebaseAuth local = FirebaseAuth.instance;
    return local.currentUser;
  }

  signInWithGoogle(BuildContext context) async{
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken
    );

    UserCredential result = await _firebaseAuth.signInWithCredential(credential);

    User? userDetails = result.user;

    if(result != null){
      SharedPreferenceHelper().saveUserEmail(userDetails!.email);
      SharedPreferenceHelper().saveUserId(userDetails.uid);
      SharedPreferenceHelper().saveUserName(userDetails.email!.replaceAll("@gmail.com", ""));
      SharedPreferenceHelper().saveDisplayName(userDetails.displayName);
      SharedPreferenceHelper().saveUserProfileUrl(userDetails.photoURL);

      Map<String, dynamic> userInfoMap = {
        "profileUrl" : "",
        "email": userDetails.email,
        "username" : userDetails.email!.replaceAll("@gmail.com", ""),
        "name": userDetails.displayName,
        "imgUrl" : userDetails.photoURL
      };

      DatabaseMethos().addUserInfoRoDB(userDetails.uid, userInfoMap).then(
      (value){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
       });
    }
  }

  Future signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await auth.signOut();
  }

}
