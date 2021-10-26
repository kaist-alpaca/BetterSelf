import 'package:flutter/material.dart';
import '../screen/user_info_screen.dart';
import '../pages/communication_page/chatting_screen.dart';

class UserSelectScreen extends StatefulWidget {
  @override
  _UserSelectScreen createState() => _UserSelectScreen();
}

class _UserSelectScreen extends State<UserSelectScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    return Scaffold(
        appBar: AppBar(
          title: Text('트레이너 프사랑 이름'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: valHeight * 0.008,
              ),
              Container(
                height: valHeight * 0.03,
                child: Text(
                  '회원 정보',
                  style: TextStyle(fontSize: defaultSize * 8),
                ),
                margin: EdgeInsets.only(bottom: valHeight * 0.006),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserInfoScreen()));
                },
                child: Container(
                  height: valHeight * 0.2,
                  width: valWidth * 0.8,
                  child: Text('여기에 각 유저 명단이 있으면 됨.'),
                  color: Colors.grey,
                  margin: EdgeInsets.only(bottom: valHeight * 0.05),
                ),
              ),
              Container(
                height: valHeight * 0.03,
                child: Text(
                  '새로운 메시지',
                  style: TextStyle(fontSize: defaultSize * 8),
                ),
                margin: EdgeInsets.only(bottom: valHeight * 0.006),
              ),
              GestureDetector(
                onTap: () {
                  //여기 메시지 화면으로 넘겨야함.
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChattingScreen()));
                },
                child: Container(
                  height: valHeight * 0.2,
                  width: valWidth * 0.8,
                  child: Text('여기에 각 유저 메시지 명단이 있으면 됨.'),
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ));
  }
}
