import 'package:flutter/material.dart';

class AgreementScreen extends StatefulWidget {
  @override
  _AgreementScreen createState() => _AgreementScreen();
}

class _AgreementScreen extends State<AgreementScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비

    return Scaffold(
        appBar: AppBar(
          title: Text("개인정보 처리방침 및 이용약관"),
        ),
        body: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: valHeight * 0.1,
                  ),
                  Container(
                    child: Text(
                      "App 이용약관",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  ),
                  Container(
                    //이용약관 들어갈 곳
                    child: Text("여기에 이용약관이 적혀야 합니다."),
                    color: Colors.grey,
                    height: valHeight * 0.3,
                    width: valWidth * 0.8,
                  ),
                  SizedBox(
                    height: valHeight * 0.1,
                  ),
                  Container(
                    child: Text(
                      "개인정보 처리방침",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  ),
                  Container(
                      //개인정보 처리방침 들어갈 곳
                      child: Text("여기에 개인정보 처리방침이 적혀야 합니다."),
                      color: Colors.grey,
                      height: valHeight * 0.3,
                      width: valWidth * 0.8),
                  SizedBox(
                    height: valHeight * 0.1,
                  ),
                  Container(
                      child: Text(
                        "개인(신용)정보 수집 및 이용동의",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 5)),
                  Container(
                      //개인정보 수집 및 이용동의 들어갈 곳
                      child: Text("여기에 개인정보 수집 및 이용동의가 적혀야 합니다."),
                      color: Colors.grey,
                      height: valHeight * 0.3,
                      width: valWidth * 0.8),
                ],
              ),
            ],
          ),
        ));
  }
}
