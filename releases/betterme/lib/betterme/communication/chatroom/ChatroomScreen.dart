import 'package:betterme/functions/Controllers/server_connection.dart';
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
  final String trainer_uid;
  const ChatroomScreen(this.namechatwith, this.usernamechatwith,
      this.ChatwithImgurl, this.trainer_uid);

  @override
  _ChatroomScreen createState() => _ChatroomScreen();
}

class _ChatroomScreen extends State<ChatroomScreen> {
  final bgColor = Color(0xff0B202A); //배경색
  final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
  final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
  bool InitalScroll = false;

  var user = AuthMethods().auth.currentUser!.email.toString().split('@')[0];

  TextEditingController textmessage = TextEditingController();

  ScrollController _scrollController = ScrollController();

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
      ServerConnection.write_log('ChatroomScreen', 'send_chat', '');
      ServerConnection.fcm_chat(
          trainer_uid: widget.trainer_uid,
          chat: message,
          namechatwith: widget.namechatwith,
          usernamechatwith: widget.usernamechatwith);
    }
  }

  void initState() {
    super.initState();
    ServerConnection.write_log('ChatroomScreen', 'start', '');
  }

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;

    Stream<QuerySnapshot> messagestream = FirebaseFirestore.instance
        .collection("Chatrooms")
        .doc(getchatroomid(user, widget.usernamechatwith))
        .collection("chats")
        .orderBy("time")
        .snapshots();

    StreamBuilder<QuerySnapshot> message = chatmessages(context, messagestream);

    // print('debug: ${getchatroomid(user, widget.usernamechatwith)}');

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
                    ServerConnection.write_log(
                        'ChatroomScreen', 'end', 'CommunicationScreen');
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
        color: bgColor,
        child: SafeArea(
          child: Stack(
            children: [
              message,
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
                                    _scrollController.jumpTo(0);
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
      ),
    );
  }

  StreamBuilder<QuerySnapshot> chatmessages(
      BuildContext context, Stream<QuerySnapshot> messagestream) {
    return StreamBuilder<QuerySnapshot>(
        stream: messagestream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final valHeight = MediaQuery.of(context).size.height; //화면 높이
          final valWidth = MediaQuery.of(context).size.width; //화면 너비
          final bgColor = Color(0xff0B202A); //배경색
          final txtColor = Color(0xffFFFDFD);
          final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
          final blockColor = Color(0xff333C47); // 여러 블럭들 색
          final maxtxtcontsize = valWidth * 0.55;
          double defaultSize = valWidth * 0.0025;


          DateTime PrevTime = DateTime(0, 1, 22); //initialize
          int PrevWhoSended = 2;
          int cnt = 0;
          List<bool> ptimelist;

          if (snapshot.hasData) {
            print('decrese app badge');
            ServerConnection.app_badge_count(trainer_uid: widget.trainer_uid);

            List result = snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
              document.data()! as Map<String, dynamic>;
              return data['time'].toDate();
            }).toList();

            List<Widget> ChatList = List.from(snapshot.data!.docs
                .map((DocumentSnapshot document) {

                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  int WhoSended =
                      data['sendby'].toString().compareTo(user.toString()) == 0
                          ? 1
                          : 0;

                  bool SendedUserChanged = (PrevWhoSended == WhoSended);

                  PrevWhoSended = WhoSended;

                  DateTime ThisMessageTime = data['time'].toDate();

                  String messageday = DateFormat.d().format(ThisMessageTime);
                  String prevmessageday = DateFormat.d().format(PrevTime);

                  bool time = true;

                  if(cnt < snapshot.data!.docs.length - 1){
                    time = ((result[cnt].day != result[cnt+1].day) ||
                        (result[cnt].hour != result[cnt+1].hour) ||
                        (result[cnt].minute != result[cnt+1].minute));
                  } else{
                    time = true;
                  }

                  PrevTime = ThisMessageTime;

                  String formatted = DateFormat.jm().format(ThisMessageTime);

                  cnt = cnt + 1;

                  if (messageday != prevmessageday) {
                    if (WhoSended == 1) {
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
                                          color: Color(0xffAA8F9D),
                                          fontSize: 14))),
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
                                    style: TextStyle(
                                        color: txtColor, fontSize: 10)),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: valWidth * 0.02),
                                    decoration: BoxDecoration(
                                        color: blockColor,
                                        borderRadius: BorderRadius.circular(
                                            valWidth * 0.02)),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: maxtxtcontsize),
                                          child: Text(
                                            data['message'],
                                            style: TextStyle(
                                                color: txtColor, fontSize: 13),
                                            softWrap: true,
                                          )),
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
                                          color: Color(0xffAA8F9D),
                                          fontSize: 14))),
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
                                      image:
                                          NetworkImage(widget.ChatwithImgurl),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: valWidth * 0.02),
                                    decoration: BoxDecoration(
                                        color: blockColor,
                                        borderRadius: BorderRadius.circular(
                                            valWidth * 0.02)),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: maxtxtcontsize),
                                          child: Text(
                                            data['message'],
                                            style: TextStyle(
                                                color: txtColor, fontSize: 13),
                                            softWrap: true,
                                          )),
                                    )),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(formatted,
                                    style: TextStyle(
                                        color: txtColor, fontSize: 10))
                              ])
                        ]));
                      } else {
                        return ListTile(
                            //여기가 트레이너 채팅
                            title: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  SizedBox(
                                    width: 33,
                                  ),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: valWidth * 0.02),
                                      decoration: BoxDecoration(
                                          color: blockColor,
                                          borderRadius: BorderRadius.circular(
                                              valWidth * 0.02)),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: maxtxtcontsize),
                                            child: Text(
                                              data['message'],
                                              style: TextStyle(
                                                  color: txtColor,
                                                  fontSize: 13),
                                              softWrap: true,
                                            )),
                                      )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(formatted,
                                      style: TextStyle(
                                          color: txtColor, fontSize: 10))
                                ])
                          ],
                        ));
                      }
                    }
                  } else {
                    if (WhoSended == 1) {
                      if (!SendedUserChanged) {
                        return ListTile(
                            title: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  //여기가 사용자 채팅
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(formatted,
                                          style: TextStyle(
                                              color: txtColor, fontSize: 10)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: valWidth * 0.02),
                                          decoration: BoxDecoration(
                                              color: blockColor,
                                              borderRadius: BorderRadius.circular(
                                                  valWidth * 0.02)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: maxtxtcontsize),
                                                child: Text(
                                                  data['message'],
                                                  style: TextStyle(
                                                      color: txtColor, fontSize: 13),
                                                  softWrap: true,
                                                )),
                                          ))
                                    ])
                              ],
                            ));
                      } else{
                        return ListTile(
                            title: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  //여기가 사용자 채팅
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      time? Text(formatted,
                                          style: TextStyle(
                                              color: txtColor, fontSize: 10)) : Container(),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: valWidth * 0.02),
                                          decoration: BoxDecoration(
                                              color: blockColor,
                                              borderRadius: BorderRadius.circular(
                                                  valWidth * 0.02)),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: maxtxtcontsize),
                                                child: Text(
                                                  data['message'],
                                                  style: TextStyle(
                                                      color: txtColor, fontSize: 13),
                                                  softWrap: true,
                                                )),
                                          ))
                                    ])
                              ],
                            ));
                      }
                    } else {
                      if (!SendedUserChanged) {
                        return ListTile(
                            //여기가 트레이너 채팅
                            title: Column(
                          children: [
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
                                        image:
                                            NetworkImage(widget.ChatwithImgurl),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: valWidth * 0.02),
                                      decoration: BoxDecoration(
                                          color: blockColor,
                                          borderRadius: BorderRadius.circular(
                                              valWidth * 0.02)),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: maxtxtcontsize),
                                            child: Text(
                                              data['message'],
                                              style: TextStyle(
                                                  color: txtColor,
                                                  fontSize: 13),
                                              softWrap: true,
                                            )),
                                      )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(formatted,
                                      style: TextStyle(
                                          color: txtColor, fontSize: 10))
                                ])
                          ],
                        ));
                      } else {
                        return ListTile(
                            //여기가 트레이너 채팅
                            title: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  SizedBox(
                                    width: 33,
                                  ),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: valWidth * 0.02),
                                      decoration: BoxDecoration(
                                          color: blockColor,
                                          borderRadius: BorderRadius.circular(
                                              valWidth * 0.02)),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: maxtxtcontsize),
                                            child: Text(
                                              data['message'],
                                              style: TextStyle(
                                                  color: txtColor,
                                                  fontSize: 13),
                                              softWrap: true,
                                            )),
                                      )),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  time ? Text(formatted,
                                      style: TextStyle(
                                          color: txtColor, fontSize: 10)) : Container()
                                ])
                          ],
                        ));
                      }
                    }
                  }
                })
                .toList()
                .reversed);

            //Padding
            ChatList.insert(
              0,
              ListTile(
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    Text(" "),
                  ])),
            );
            ChatList.insert(
              0,
              ListTile(
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                    Text(" "),
                  ])),
            );

            return ListView(
              controller: _scrollController,
              children: ChatList,
              reverse: true,
            );
          } else {
            return ListView(controller: _scrollController, children: []);
          }
        });
  }
}
