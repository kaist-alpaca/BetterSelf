import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

import 'package:betterme/functions/Firestore/AuthMethods.dart';
import 'package:betterme/functions/Firestore/DatabaseMethods.dart';

import '../CommunicationScreen.dart';

class ChatroomScreen extends StatefulWidget {
  final String userchatwith;
  const ChatroomScreen(this.userchatwith);

  @override
  _ChatroomScreen createState() => _ChatroomScreen();
}

class _ChatroomScreen extends State<ChatroomScreen> {
  var user = AuthMethods()
      .auth
      .currentUser!
      .email
      .toString()
      .replaceAll("@gmail.com", "");
  TextEditingController textmessage = TextEditingController();

  getchatroomid(String a, String b) {
    if (a.compareTo(b) < 0) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  constructMessage(bool sendClicked) {
    if (textmessage.text != "") {
      String message = textmessage.text;
      var messageId = randomAlphaNumeric(12);
      var messagetime = DateTime.now();

      Map<String, dynamic> messageInfo = {
        "message": message,
        "sendby": user,
        "time": messagetime,
      };

      DatabaseMethos().addMessage(
          getchatroomid(user, widget.userchatwith), messageId, messageInfo);

      if (sendClicked) {
        textmessage.text = "";
        messageId = "";
        setState(() {});
      }
    }
  }

  Widget chatmessages(
    BuildContext context,
  ) {
    Stream<QuerySnapshot> messagestream = FirebaseFirestore.instance
        .collection("Chatrooms")
        .doc(getchatroomid(user, widget.userchatwith))
        .collection("chats")
        .orderBy("time")
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: messagestream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return snapshot.hasData
              ? ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    print('debug2 : ${snapshot.data!.docs.length}');
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    print('sendby : ${data['sendby'].toString()}');
                    print('user : ${user.toString()}');
                    if (data['sendby'].toString().compareTo(user.toString()) ==
                            0
                        ? true
                        : false) {
                      print('debug4: right');
                      return ListTile(
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                            Text(data['message'],
                                style: TextStyle(color: Colors.black)),
                          ]));
                    } else {
                      print('debug4: left');
                      return ListTile(
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                            Text(data['message'],
                                style: TextStyle(color: Colors.black)),
                          ]));
                    }
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
    print('debug: ${getchatroomid(user, widget.userchatwith)}');

    return WillPopScope(
        onWillPop: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const CommunicationScreen()));
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('${widget.userchatwith} + $user'),
          ),
          body: Container(
            child: Stack(
              children: [
                chatmessages(context),
                Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white10,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            style: TextStyle(color: Colors.white),
                            controller: textmessage,
                            decoration: const InputDecoration(
                                hintText: "message...",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          )),
                          GestureDetector(
                              onTap: () {
                                print('debug: clicked');
                                print(
                                    "debug: textmessage_ ${textmessage.text}");
                                constructMessage(true);
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.message,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
