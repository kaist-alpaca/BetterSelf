import 'package:flutter/material.dart';
import 'agreement_screen.dart'; // 이용약관 스크린
import 'basic_info_screen.dart'; //초기정보 설정 스크린

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
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
              //터치하면 여기에 구글 로그인 구현.
              // 한 번 초기정보 설정했으면(초기정보가 저장되어있으면 바로 홈페이지로 이동 구현)
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BasicInfoScreen()));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AgreementScreen()));
                },
                child: Container(
                    width: valWidth * 0.75,
                    height: valHeight * 0.06,
                    child: Text("개인정보 처리방침 및 이용약관")),
              ),
              GestureDetector(
                onTap: () {}, // 여기 누르면 동의에 체크되고, 로그인 가능해야함.
                child: Container(
                  width: valWidth * 0.07,
                  height: valHeight * 0.06,
                  child: Row(
                    children: [
                      Text("동의"),
                      Container(
                        color: Colors.grey, //여기에 체크 이미지 들어와야함
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
        ],
      )),
    );
  }
}
