import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import '../pages/login_page/agreement_screen.dart'; // 이용약관 스크린
import 'package:google_sign_in/google_sign_in.dart';
import 'agreementScreen/AgreementScreen.dart';
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
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    double defaultSize = valWidth * 0.0025; //폰트사이즈용
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: valHeight * 0.27,
          ), // 가장 위 빈 공간
          CircleAvatar(
            radius: valWidth * 0.12,
            child: Image.asset('images/app_logo.png'), //나중 여기에 앱아이콘
          ),
          SizedBox(
            height: 131,
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
                height: 41,
                width: valWidth * 0.73,
                alignment: Alignment(0, -0.2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(valWidth * 0.015),
                  color: Color(0xff333C47),
                ),
                child: Text(
                  "Google 계정으로 로그인",
                  style: TextStyle(
                      color: txtColor, fontSize: defaultSize * 15, height: 1.8),
                  textAlign: TextAlign.center,
                ) //구글 계정 로그인 버튼
                ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            // 개인정보 처리방침 및 이용약관
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  //여기 누르면 개인정보 처리방침 및 이용약관으로
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgreementScreen()));
                  },
                  child: Container(
                      width: valWidth * 0.55,
                      // height: valHeight * 0.06,
                      child: Text(
                        "개인정보 처리방침 및 이용약관",
                        style: TextStyle(
                          color: txtColor,
                          fontSize: defaultSize * 14,
                        ),
                        textAlign: TextAlign.center,
                      )),
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
                    width: valWidth * 0.21,
                    height: valHeight * 0.06,
                    child: Row(
                      children: [
                        Text(
                          "동의",
                          style: TextStyle(
                              color: txtColor, fontSize: defaultSize * 14),
                        ),
                        Theme(
                          data: ThemeData(
                              unselectedWidgetColor: Color(0xff333C47)),
                          child: Checkbox(
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
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
