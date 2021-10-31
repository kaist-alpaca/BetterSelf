import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:betterme/functions/Firestore/AuthMethods.dart';
import 'package:betterme/functions/Firestore/DatabaseMethods.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'FindTrainerScreen/FindTrainerScreen.dart';
import 'chatroom/ChatroomScreen.dart';
import 'functions/Widgets.dart';

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
    TrainerName = [];
    TrainerImg = [];
    TrainerUserName = [];

    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return snapshot.hasData? ListView(
              children : snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 20.0),
                  child: Card(
                    color: Colors.black12,
                    child: GestureDetector(
                        onTap: () {
                          var chatroomId = getchatroomid(user, data['username']);
                          Map<String, dynamic> chatroomInfo = {
                            "users": [user, data['name']]
                          };
                          DatabaseMethos().createChatroom(chatroomId, chatroomInfo);
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ChatroomScreen(data['name'], data['username'])));
                        },
                        child: ListTile(
                          leading: Image.network(data['imgUrl']), // 사용자 이미지 불러오는 코드
                          title: Text(
                            data['name'],
                            style: TextStyle(
                            color: Colors.black,
                            ),
                          ),
                        )
                    ),
                  )
                );
              }).toList(),
          ) : Center(child: CircularProgressIndicator());
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    
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
        backgroundColor: bgColor,
        title: Text(
          'Chatroom',
          style: TextStyle(color: txtColor),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => FindTrainerScreen()));
                },
                child: Icon(
                    Icons.add
                ),
              )
          ),
        ],
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: TrainersList(context, usersStream)
      )
    );
  }
}