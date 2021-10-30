import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:betterme/functions/Firestore/AuthMethods.dart';
import 'package:betterme/functions/Firestore/DatabaseMethods.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

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

  awaitCall(usersStream) async{
    return usersStream.then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        TrainerName.add(doc["name"]);
        TrainerImg.add(doc["imgUrl"]);
        TrainerUserName.add(doc["username"]);
        print('\nname : ${doc["username"]!.toString()}');
        print('\nimg  : ${doc["imgUrl"]!.toString()}\n\n');
      });
      //setState(() {});
    });
  }

  Widget TrainersList() {
    return ListView.builder(
        itemCount: TrainerName.length,
        itemBuilder: (context, index) {
          print("debug : trainer card");
          return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 20.0),
              child: Card(
                color: Colors.black12,
                child: InkWell(
                    onTap: () {
                      var chatroomId =
                          getchatroomid(user, TrainerUserName[index]);
                      Map<String, dynamic> chatroomInfo = {
                        "users": [user, TrainerName[index]]
                      };

                      DatabaseMethos().createChatroom(chatroomId, chatroomInfo);

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChatroomScreen(TrainerUserName[index])));
                    },
                    child: ListTile(
                      leading: Image.network(TrainerImg[index]),
                      title: Text(
                        TrainerName[index],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    )),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {

    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
    
    var currentuser = AuthMethods().auth.currentUser!.uid;
    
    var usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(currentuser)
        .collection('trainers')
        .get();


    awaitCall(usersStream);
    setState(() {});

    isSearching = (TrainerUserName.length == 0);

    return isSearching ? Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          'Chatroom',
          style: TextStyle(color: txtColor),
        ),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(children: [
                isSearching
                    ? GestureDetector(
                        onTap: () {
                          isSearching = false;
                          TrainerName = [];
                          TrainerImg = [];
                          searching.text = "";
                          setState(() {});
                        },
                        child: const Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(Icons.arrow_back, color: Colors.black)))
                    : Container(),
                Expanded(
                    child: TextField(
                        controller: searching,
                        style: const TextStyle(color: Colors.black),
                        decoration: textFieldInput("username"))),
                GestureDetector(
                  onTap: () {
                    if (searching.text != "") {
                      setState(() {
                        TrainerName.clear();
                        TrainerImg.clear();
                      });
                      isSearching = true;
                    }
                  },
                  child: const Icon(Icons.search, color: Colors.black),
                )
              ]),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),
              ),
              isSearching
                  ? SizedBox(height: 300, child: TrainersList())
                  : Container(),
              // isSearching ? SizedBox(
              //   height : 500,
              //   child : searchUsersList(),
              // ) : chatRoomList()
            ],
          )),
    ) : Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          'Chatroom',
          style: TextStyle(color: txtColor),
        ),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 300, child: TrainersList())
            ],
          )
      ),
    );
  }
}
