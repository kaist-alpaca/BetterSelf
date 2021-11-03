import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:betterme/functions/Firestore/AuthMethods.dart';
import 'package:betterme/functions/Firestore/DatabaseMethods.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'FindTrainerScreen/FindTrainerScreen.dart';
import 'chatroom/ChatroomScreen.dart';
import 'functions/Widgets.dart';
import 'package:betterme/functions/Widgets/DividewithObj.dart';

class CommunicationScreen extends StatefulWidget {
  const CommunicationScreen({Key? key}) : super(key: key);

  @override
  _CommunicationScreen createState() => _CommunicationScreen();
}

class _CommunicationScreen extends State<CommunicationScreen> {
  // ignore: non_constant_identifier_names
  var TrainerName = [];
  // ignore: non_constant_identifier_names
  var TrainerImg = [];

  var TrainerUserName = [];

  bool isSearching = false;

  TextEditingController searching = TextEditingController();

  var user = AuthMethods()
      .auth
      .currentUser!
      .email
      .toString()
      .replaceAll("@gmail.com", "");

  getchatroomid(String a, String b) {
    if (a.compareTo(b) < 0) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  Widget TrainersList(BuildContext context, stream) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD);
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    final blockColor = Color(0xff333C47); // 여러 블럭들 색
    double defaultSize = valWidth * 0.0025;

    TrainerName = [];
    TrainerImg = [];
    TrainerUserName = [];

    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return snapshot.hasData
              ? ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Padding(
                        ////여기 수정하면 됨.
                        padding: const EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 20.0),
                        child: Card(
                          child: GestureDetector(
                              onTap: () {
                                var chatroomId =
                                    getchatroomid(user, data['username']);
                                Map<String, dynamic> chatroomInfo = {
                                  "users": [user, data['name']]
                                };
                                DatabaseMethos()
                                    .createChatroom(chatroomId, chatroomInfo);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatroomScreen(
                                            data['name'],
                                            data['username'],
                                            data['imgUrl'])));
                              },
                              child: ListTile(
                                tileColor: blockColor,
                                leading: SizedBox(
                                  height: 70,
                                  width: 40,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(data['imgUrl']),
                                      ),
                                    ),
                                  ),
                                ), // 사용자 이미지 불러오는 코드
                                title: Container(
                                  height: 70,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      data['name'],
                                      style: TextStyle(
                                        color: txtColor,
                                        fontSize: defaultSize * 15,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ));
                  }).toList(),
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색

    double defaultSize = valWidth * 0.0025;

    var currentuser = AuthMethods().auth.currentUser!.uid;

    print("\n currentuser : ${currentuser}\n");

    var usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(currentuser)
        .collection('trainers')
        .snapshots();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: bgColor,
        title: Text(
          '메시지',
          style: TextStyle(color: txtColor, fontSize: defaultSize * 15),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FindTrainerScreen()));
                },
                child: Icon(Icons.add),
              )),
        ],
      ),
      body: Container(child: TrainersList(context, usersStream)),
    );
  }
}
