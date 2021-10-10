import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:message/services/auth.dart';
import 'package:message/services/database.dart';
import 'package:message/view/chatroom.dart';
import 'package:message/view/signin.dart';
import 'package:message/widgets/widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isSearching = false;

  var SearchedUserName = [];
  var SearchedUserImg = [];

  TextEditingController searching = TextEditingController();

  var user = AuthMethods().auth.currentUser!.email.toString().replaceAll("@gmail.com", "");


  onSearchBtnClick() async{
    SearchedUserName = [];
    SearchedUserImg = [];

    var usersStream = FirebaseFirestore.instance.collection('users').get();

    var currentuser = AuthMethods().auth.currentUser!.email.toString();

    print('\ncurrentuser : ${currentuser.replaceAll("@gmail.com", "")}\n');
    print('\nquey : ${searching.text}\n\n');

    usersStream.then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(doc["username"].toString().contains(searching.text)){
          setState(() {});
          SearchedUserName.add(doc["username"]);
          SearchedUserImg.add(doc["imgUrl"]);
          print('\nname : ${doc["username"]!.toString()}');
          print('\nimg  : ${doc["imgUrl"]!.toString()}\n\n');
        }
      });
    });

    return FirebaseFirestore.instance.collection('users').get();
  }

  getchatroomid(String a, String b){
    if(a.substring(0,1).codeUnitAt(0) > b.substring(0,1).codeUnitAt(0)){
      return "$b\_$a";
    }else{
      return "$a\_$b";
    }
  }

  // Widget searchUsersList(){
  //   return StreamBuilder<QuerySnapshot>(
  //       stream: onSearchBtnClick()!,
  //       builder: (context, snapshot){
  //         if (snapshot.hasData) {
  //           return ListView.builder(
  //             itemCount: snapshot.data!.docs.length,
  //             shrinkWrap: true,
  //             itemBuilder: (context, index){
  //               DocumentSnapshot ds = snapshot.data!.docs[index];
  //               return (ds.data().toString().contains("imgUrl") ? Image.network(ds.get("imgUrl")) : Text("None"));
  //             },);
  //         } else {
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //       });
  // }
  Widget searchUsersList(){
    return ListView.builder(
      itemCount : SearchedUserName.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 20.0),
          child : Card(
              color: Colors.white12,
              child : InkWell(
                onTap: (){
                  var chatroomId = getchatroomid(user, SearchedUserName[index]);
                  Map<String, dynamic> chatroomInfo = {
                    "users" : [user, SearchedUserName[index]]
                  };

                  DatabaseMethos().createChatroom(chatroomId, chatroomInfo);

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Chatroom(SearchedUserName[index])));
                },
                child : ListTile(
                  leading: Image.network(SearchedUserImg[index]),
                  title: Text(
                    SearchedUserName[index],
                    style: TextStyle(color: Colors.white,),
                  ),
                )
            ),
        ));
      }
    );
  }

  Widget chatRoomList() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signin()));
          isSearching = false;
          return Future.value(false);
        },
    child : Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            InkWell(
              onTap: (){
                AuthMethods().signOut().then((s){
                  isSearching = false;
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signin()));
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(Icons.exit_to_app),),
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                  children: [
                    isSearching? GestureDetector(
                      onTap: (){
                        isSearching = false;
                        SearchedUserName = [];
                        SearchedUserImg = [];
                        searching.text = "";
                        setState(() {});
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 12),
                        child : Icon(Icons.arrow_back, color: Colors.white)
                      )
                    ) : Container(),
                    Expanded(child : TextField(controller: searching,
                    style: const TextStyle(color: Colors.white),
                    decoration: textFieldInput("username"))),
                    GestureDetector(
                      onTap: (){
                        if(searching.text != ""){
                          setState(() {SearchedUserName.clear();SearchedUserImg.clear();});
                          isSearching = true;
                          onSearchBtnClick();
                        }
                      },
                      child : const Icon(Icons.search, color: Colors.white),)]
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),
              ),
              isSearching? SizedBox(
                  height : 300,
                  child : searchUsersList()
              ) : Container(),
              // isSearching ? SizedBox(
              //   height : 500,
              //   child : searchUsersList(),
              // ) : chatRoomList()
            ],
          )
        ),
      )
    );
  }

}
