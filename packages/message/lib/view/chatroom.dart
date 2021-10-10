import 'package:flutter/material.dart';
import 'package:message/services/auth.dart';
import 'package:message/services/database.dart';
import 'package:message/view/home.dart';
import 'package:message/widgets/widget.dart';
import 'package:random_string/random_string.dart';

class Chatroom extends StatefulWidget {

  final String userchatwith;
  const Chatroom(this.userchatwith);

  @override
  _ChatroomState createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {

  var user = AuthMethods().auth.currentUser!.email.toString().replaceAll("@gmail.com", "");

  TextEditingController textmessage = TextEditingController();

  getchatroomid(String a, String b){
    if(a.substring(0,1).codeUnitAt(0) > b.substring(0,1).codeUnitAt(0)){
      return "$b\_$a";
    }else{
      return "$a\_$b";
    }
  }

  constructMessage(bool sendClicked){
    if(textmessage.text != ""){
      String message = textmessage.text;
      var messageId = randomAlphaNumeric(12);
      var messagetime = DateTime.now();

      Map<String, dynamic> messageInfo = {
        "message" : message,
        "sendby" : user,
        "time" : messagetime,
      };

      DatabaseMethos().addMessage(getchatroomid(user, widget.userchatwith), messageId, messageInfo);

      if (sendClicked){
        textmessage.text = "";
        messageId = "";
        setState(() {});
      }
    }
  }

  getandsetmessage(){

  }

  @override
  void initstate(){
    getandsetmessage();
  }

  Widget build(BuildContext context) {

    print('debug: ${getchatroomid(user, widget.userchatwith)}');

    return WillPopScope(
        onWillPop: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
          return Future.value(false);
          },
        child: Scaffold(
          appBar: AppBar(
          title: Text('${widget.userchatwith} + $user'),
          ),
          body: Container(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white10,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child : Row(
                      children: [Expanded(
                        child: TextField(style: TextStyle(color: Colors.white),
                        controller: textmessage,
                        decoration: const InputDecoration(
                          hintText: "message...",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          )),
                          )
                        ),
                        GestureDetector(
                          onTap: (){
                            print('debug: clicked');
                            print("debug: textmessage_ ${textmessage.text}");
                            constructMessage(true);
                            setState(() {});
                          },
                          child: const Icon(Icons.message, color: Colors.white,)
                        ),
                      ],

                    ),
                  )
                )
              ],
            ),
          ),
        )
    );
  }
}
