import 'package:flutter/material.dart';
// import '../pages/login_page/agreement_screen.dart'; // 이용약관 스크린
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool _isChecked = false;

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

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: valHeight * 0.15,
          ), // 가장 위 빈 공간
          Container(
            color: Colors.grey,
            height: valHeight * 0.15,
            width: valHeight * 0.15,
          ),
          SizedBox(
            height: valHeight * 0.2,
          ),
          GestureDetector(
            onTap: () {
              print(_isChecked);
              if (_isChecked) {
                signInWithGoogle();
              }
              //터치하면 여기에 구글 로그인 구현.
              // 한 번 초기정보 설정했으면(초기정보가 저장되어있으면 바로 홈페이지로 이동 구현)
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => BasicInfoScreen()));
              /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AppMain()));*/ //바로 홈페이지로 이동하는 코드
            },
            child: Container(
                height: valHeight * 0.08,
                width: valWidth * 0.7,
                color: Colors.grey,
                child: Text("Google 계정으로 로그인") //구글 계정 로그인 버튼
                ),
          ),
          SizedBox(
            height: valHeight * 0.1,
          ),
          Container(
            // 개인정보 처리방침 및 이용약관
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  //여기 누르면 개인정보 처리방침 및 이용약관으로
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => AgreementScreen()));
                  },
                  child: Container(
                      width: valWidth * 0.75,
                      // height: valHeight * 0.06,
                      child: Text("개인정보 처리방침 및 이용약관")),
                ),
                // Checkbox(
                //   value: _isChecked,
                //   onChanged: (value) {
                //     setState(() {
                //       _isChecked = value!;
                //     });
                //   },
                // ),
                GestureDetector(
                  onTap: () {}, // 여기 누르면 동의에 체크되고, 로그인 가능해야함.
                  child: Container(
                    width: valWidth * 0.2,
                    height: valHeight * 0.06,
                    child: Row(
                      children: [
                        Text("동의"),
                        Checkbox(
                          value: _isChecked,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
