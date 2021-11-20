import 'package:betterme/functions/Widgets/DividewithObj.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:betterme/functions/Firestore/AuthMethods.dart';
import 'package:betterme/functions/Firestore/DatabaseMethods.dart';

import '../CommunicationScreen.dart';

class ChatroomScreen extends StatefulWidget {
  final String namechatwith;
  final String usernamechatwith;
  final ChatwithImgurl;
  const ChatroomScreen(
      this.namechatwith, this.usernamechatwith, this.ChatwithImgurl);

  @override
  _ChatroomScreen createState() => _ChatroomScreen();
}

class _ChatroomScreen extends State<ChatroomScreen> {
  final bgColor = Color(0xff0B202A); //배경색
  final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
  final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색

  var user = AuthMethods()
      .auth
      .currentUser!
      .email
      .toString()
      .replaceAll("@gmail.com", "");

  TextEditingController textmessage = TextEditingController();

  ScrollController _scrollController = ScrollController();

  FocusNode _focusNode = FocusNode();

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
          getchatroomid(user, widget.usernamechatwith), messageId, messageInfo);

      if (sendClicked) {
        textmessage.text = "";
        messageId = "";
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;

    print('debug: ${getchatroomid(user, widget.usernamechatwith)}');

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 100,
        leadingWidth: valWidth * 0.25,
        titleSpacing: 0,
        backgroundColor: bgColor,
        elevation: 0.0,
        leading: Row(
          children: [
            Container(
                height: valHeight * 0.08,
                width: valWidth * 0.1,
                margin: EdgeInsets.only(left: valWidth * 0.08),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset('images/arrow towards left_icon.svg'),
                )),
          ],
        ),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.ChatwithImgurl),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.38, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 17,
                    ),
                    Text('${widget.namechatwith}',
                        style:
                            TextStyle(color: Color(0xffFFFDFD), fontSize: 17)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            chatmessages(context),
            Container(child: Text(" ")),
            Container(child: Text(" ")),
            SafeArea(
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: bgColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: valWidth * 0.015),
                      child: Row(
                        children: [
                          Container(
                              width: valWidth * 0.78,
                              height: 40,
                              margin: EdgeInsets.only(
                                  right: valWidth * 0.02, bottom: 7),
                              child: TextField(
                                  style: TextStyle(color: Color(0xffFFFDFD)),
                                  controller: textmessage,
                                  decoration: const InputDecoration(
                                    fillColor: Color(0xff333C47),
                                    filled: true,
                                    hintText: "message...",
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ))),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Color(0xff333C47),
                                    minimumSize: Size(valWidth * 0.13, 40),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            valWidth * 0.015))),
                                onPressed: () {
                                  constructMessage(true);
                                  _scrollController.jumpTo(_scrollController
                                      .position.maxScrollExtent);
                                  setState(() {});
                                },
                                child: Text(
                                  '전송',
                                  style: TextStyle(
                                      color: txtColor,
                                      fontSize: defaultSize * 15),
                                )),
                          ),
                        ],
                      ),
                    ))),
          ],
        ),
      ),
    );
  }

  Widget chatmessages(
    BuildContext context,
  ) {
    Stream<QuerySnapshot> messagestream = FirebaseFirestore.instance
        .collection("Chatrooms")
        .doc(getchatroomid(user, widget.usernamechatwith))
        .collection("chats")
        .orderBy("time")
        .snapshots();

    Stream<QuerySnapshot> userinfo = FirebaseFirestore.instance
        .collection("Chatrooms")
        .doc(getchatroomid(user, widget.usernamechatwith))
        .collection("chats")
        .orderBy("time")
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: messagestream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final valHeight = MediaQuery.of(context).size.height; //화면 높이
          final valWidth = MediaQuery.of(context).size.width; //화면 너비
          final bgColor = Color(0xff0B202A); //배경색
          final txtColor = Color(0xffFFFDFD);
          final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
          final blockColor = Color(0xff333C47); // 여러 블럭들 색
          double defaultSize = valWidth * 0.0025;

          DateTime PrevTime = DateTime(0, 1, 22); //initialize
          bool PrevWhoSended = true;

          if (snapshot.hasData) {
            List<Widget> ChatList =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              bool WhoSended =
                  data['sendby'].toString().compareTo(user.toString()) == 0
                      ? true
                      : false;

              bool SendedUserChanged = (PrevWhoSended == WhoSended);

              PrevWhoSended = WhoSended;

              DateTime ThisMessageTime = data['time'].toDate();

              String messageday = DateFormat.d().format(ThisMessageTime);
              String prevmessageday = DateFormat.d().format(PrevTime);

              PrevTime = data['time'].toDate();

              DateTime Prontime = DateTime(0, 1, 22);
              String formatted = DateFormat.jm().format(ThisMessageTime);

              print("debug :$formatted");

              if (messageday != prevmessageday) {
                if (WhoSended) {
                  return ListTile(
                      title: Column(
                    children: [
                      DividewithObj(
                          context,
                          Container(
                              alignment: Alignment.center,
                              width: valWidth * 0.4,
                              child: Text(
                                  DateFormat('yyyy년 MM월 dd일')
                                      .format(ThisMessageTime),
                                  style: TextStyle(
                                      color: Color(0xffAA8F9D), fontSize: 14))),
                          0.25,
                          0.25),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          //여기가 사용자 채팅
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(formatted,
                                style:
                                    TextStyle(color: txtColor, fontSize: 10)),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: valWidth * 0.02),
                                decoration: BoxDecoration(
                                    color: blockColor,
                                    borderRadius:
                                        BorderRadius.circular(valWidth * 0.02)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(data['message'],
                                      style: TextStyle(
                                          color: txtColor, fontSize: 13)),
                                )),
                          ])
                    ],
                  ));
                } else {
                  if (!SendedUserChanged) {
                    return ListTile(
                        //여기가 트레이너 채팅
                        title: Column(children: [
                      DividewithObj(
                          context,
                          Container(
                              alignment: Alignment.center,
                              width: valWidth * 0.4,
                              child: Text(
                                  DateFormat('yyyy년 MM월 dd일')
                                      .format(ThisMessageTime),
                                  style: TextStyle(
                                      color: Color(0xffAA8F9D), fontSize: 14))),
                          0.25,
                          0.25),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(widget.ChatwithImgurl),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: valWidth * 0.02),
                                decoration: BoxDecoration(
                                    color: blockColor,
                                    borderRadius:
                                        BorderRadius.circular(valWidth * 0.02)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(data['message'],
                                      style: TextStyle(
                                          color: txtColor, fontSize: 13)),
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(formatted,
                                style: TextStyle(color: txtColor, fontSize: 10))
                          ])
                    ]));
                  } else {
                    return ListTile(
                        //여기가 트레이너 채팅
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                          SizedBox(
                            width: 33,
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 6, horizontal: valWidth * 0.02),
                              decoration: BoxDecoration(
                                  color: blockColor,
                                  borderRadius:
                                      BorderRadius.circular(valWidth * 0.02)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(data['message'],
                                    style: TextStyle(
                                        color: txtColor, fontSize: 13)),
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(formatted,
                              style: TextStyle(color: txtColor, fontSize: 10))
                        ]));
                  }
                }
              } else {
                if (WhoSended) {
                  return ListTile(
                      title: Row(
                          //여기가 사용자 채팅
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                        Text(formatted,
                            style: TextStyle(color: txtColor, fontSize: 10)),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: valWidth * 0.02),
                            decoration: BoxDecoration(
                                color: blockColor,
                                borderRadius:
                                    BorderRadius.circular(valWidth * 0.02)),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(data['message'],
                                  style:
                                      TextStyle(color: txtColor, fontSize: 13)),
                            )),
                      ]));
                } else {
                  if (!SendedUserChanged) {
                    return ListTile(
                        //여기가 트레이너 채팅
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(widget.ChatwithImgurl),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 6, horizontal: valWidth * 0.02),
                              decoration: BoxDecoration(
                                  color: blockColor,
                                  borderRadius:
                                      BorderRadius.circular(valWidth * 0.02)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(data['message'],
                                    style: TextStyle(
                                        color: txtColor, fontSize: 13)),
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(formatted,
                              style: TextStyle(color: txtColor, fontSize: 10))
                        ]));
                  } else {
                    return ListTile(
                        //여기가 트레이너 채팅
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                          SizedBox(
                            width: 33,
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 6, horizontal: valWidth * 0.02),
                              decoration: BoxDecoration(
                                  color: blockColor,
                                  borderRadius:
                                      BorderRadius.circular(valWidth * 0.02)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(data['message'],
                                    style: TextStyle(
                                        color: txtColor, fontSize: 13)),
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(formatted,
                              style: TextStyle(color: txtColor, fontSize: 10))
                        ]));
                  }
                }
              }
            }).toList();

            //Padding
            ChatList.add(
              ListTile(
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    Text(" "),
                  ])),
            );
            ChatList.add(
              ListTile(
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    Text(" "),
                  ])),
            );
            return ListView(controller: _scrollController, children: ChatList);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
