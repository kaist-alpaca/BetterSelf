import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:message/services/auth.dart';
import 'package:message/services/database.dart';
import 'package:message/view/signin.dart';
import 'package:message/widgets/widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isSearching = false;
  Stream? usersStream;

  TextEditingController searching = TextEditingController();

  onSearchBtnClick() async{
    isSearching = true;
    usersStream = await FirebaseFirestore.instance.collection("users").where("username", isEqualTo: searching.text).snapshots();
    setState(() {});
  }

  Widget searchUsersList(){
    print('debug : ${FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: searching.text).snapshots().isEmpty}');
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where("username", isEqualTo: searching.text).snapshots(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index){
                DocumentSnapshot ds = snapshot.data!.docs[index];
                return Image.network(ds["imgurl"]);
              },
          );
          } else {
            return Center(
            child: CircularProgressIndicator(),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            InkWell(
              onTap: (){
                AuthMethods().signOut().then((s){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signin()));
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app),),
            )
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                  children: [
                    isSearching? GestureDetector(
                      onTap: (){
                        isSearching = false;
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
                          DatabaseMethos().getUserByUserName(searching.text);
                          onSearchBtnClick();
                        }
                      },
                      child : Icon(Icons.search, color: Colors.white),)]
              ),
              SizedBox(
                height : 30,
              ),
              SizedBox(
                height : 500,
                child : searchUsersList(),
              )
            ],
          )
        ),
    );
  }
}
