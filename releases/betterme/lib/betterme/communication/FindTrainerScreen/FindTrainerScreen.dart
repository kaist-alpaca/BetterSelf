import 'package:betterme/betterme/communication/functions/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

import 'package:betterme/functions/Firestore/AuthMethods.dart';
import 'package:betterme/functions/Firestore/DatabaseMethods.dart';

import '../CommunicationScreen.dart';

class FindTrainerScreen extends StatefulWidget {
  const FindTrainerScreen({Key? key}) : super(key: key);

  @override
  _FindTrainerScreenState createState() => _FindTrainerScreenState();
}

class _FindTrainerScreenState extends State<FindTrainerScreen> {
  bool isSearching = false;

  TextEditingController searching = TextEditingController();

  Widget? TrainerList(BuildContext context, stream) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    final bgColor = Color(0xff0B202A); //배경색
    final txtColor = Color(0xffFFFDFD); //텍스트 , 앱바 텍스트 색
    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색

    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return snapshot.hasData
              ? ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    final valHeight =
                        MediaQuery.of(context).size.height; //화면 높이
                    final valWidth = MediaQuery.of(context).size.width; //화면 너비
                    final bgColor = Color(0xff0B202A); //배경색
                    final txtColor = Color(0xffFFFDFD);
                    final linetxtColor = Color(0xffAA8F9D); //라인-텍스트-라인 색
                    final blockColor = Color(0xff333C47); // 여러 블럭들 색
                    double defaultSize = valWidth * 0.0025;
                    if (data['email'].toString().contains(searching.text) && data['isCoach'] == true) {
                      return ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                        child: Container(
                          height: 50,
                          child: Card(
                              color: bgColor,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      backgroundColor: bgColor,
                                      content: Text(
                                        "${data['email']} 님에게\n트레이너 요청을 보내시겠습니까?",
                                        style: TextStyle(color: txtColor),
                                      ), // 서버에 발송기능 구현
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text(
                                            '취소',
                                            style: TextStyle(
                                                color: Color(0xffFFFDFD)),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            DatabaseMethos().addTrainer(document.id, AuthMethods().auth.currentUser!.uid);
                                            Navigator.pop(context, 'OK');
                                          },
                                          child: const Text(
                                            '확인',
                                            style: TextStyle(
                                                color: Color(0xffFFFDFD)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: ListTile(
                                  tileColor: blockColor,
                                  dense: true,
                                  title: Container(
                                      alignment: Alignment(-1, -0.2),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Text(
                                        data['email'],
                                        style: TextStyle(
                                          color: txtColor,
                                          fontSize: defaultSize * 15, //15,
                                        ),
                                      )),
                                ),
                              )),
                        ),
                      );
                    } else {
                      return Container();
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
    final blockColor = Color(0xff333C47); // 여러 블럭들 색
    double defaultSize = valWidth * 0.0025;

    var userlistStream =
        FirebaseFirestore.instance.collection('users').snapshots();

    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          return Future.value(true);
        },
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(valHeight * 0.08),
            child: AppBar(
              backgroundColor: bgColor,
              elevation: 0.0,
              title: Container(
                height: valHeight * 0.08,
                padding: EdgeInsets.only(top: valHeight * 0.02),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('트레이너 추가',
                      style: TextStyle(
                          color: txtColor, fontSize: defaultSize * 17),
                      textAlign: TextAlign.center),
                ),
              ),
              leading: Container(
                  height: valHeight * 0.08,
                  width: valWidth * 0.1,
                  padding: EdgeInsets.only(top: valHeight * 0.022),
                  margin: EdgeInsets.only(left: valWidth * 0.05),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:
                        SvgPicture.asset('images/arrow towards left_icon.svg'),
                  )),
              actions: [Container(width: valWidth * 0.15)],
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
                child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      //검색박스
                      height: 30,
                      width: valWidth * 0.74,
                      decoration: BoxDecoration(
                        color: blockColor,
                        borderRadius: BorderRadius.circular(valWidth * 0.015),
                      ),
                      child: Row(
                        children: [
                          Container(
                              width: valWidth * 0.08,
                              height: valHeight * 0.045,
                              child: Image.asset('images/search_icon.png')),

                          isSearching
                              ? GestureDetector(
                                  onTap: () {
                                    isSearching = false;
                                    searching.text = "";
                                    setState(() {});
                                  },
                                  child: Container(),
                                )
                              : Container(),
                          Expanded(
                              child: TextField(
                            controller: searching,
                            style: TextStyle(color: txtColor),
                          ))

                          ///여기에 텍스트 입력받고 검색구현
                        ],
                      )),
                  SizedBox(width: valWidth * 0.02),
                  ElevatedButton(
                      //검색 버튼
                      onPressed: () {
                        if (searching.text != "") {
                          setState(() {});
                          isSearching = true;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: blockColor,
                          minimumSize: Size(valWidth * 0.12, valHeight * 0.045),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(valWidth * 0.015))),
                      child: Text('검색',
                          style: TextStyle(
                              fontSize: defaultSize * 15, color: txtColor)))
                ]),
                // Row(children: [
                //   isSearching
                //       ? GestureDetector(
                //           onTap: () {
                //             isSearching = false;
                //             searching.text = "";
                //             setState(() {});
                //           },
                //           child: const Padding(
                //               padding: EdgeInsets.only(right: 12),
                //               child: Icon(Icons.arrow_back,
                //                   color: Colors.black)))
                //       : Container(),
                //   Expanded(
                //       child: TextField(
                //           controller: searching,
                //           style: const TextStyle(color: Colors.black),
                //           decoration: textFieldInput("username"))),
                //   GestureDetector(
                //     onTap: () {
                //       if (searching.text != "") {
                //         setState(() {});
                //         isSearching = true;
                //       }
                //     },
                //     child: const Icon(Icons.search, color: Colors.black),
                //   )
                // ]),
                // const Padding(
                //   padding:
                //       EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),
                // ),
                SizedBox(
                  height: 2,
                ),
                Container(
                    height: 0.75 * valHeight, // 트레이너 보이는 범위
                    child: TrainerList(context, userlistStream)!),
                // isSearching ? SizedBox(
                //   height : 500,
                //   child : searchUsersList(),
                // ) : chatRoomList()
              ],
            )),
          ),
        ));
  }
}
