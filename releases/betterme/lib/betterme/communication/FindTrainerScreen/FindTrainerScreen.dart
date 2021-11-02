import 'package:betterme/betterme/communication/functions/Widgets.dart';
import 'package:flutter/material.dart';

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
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    if (data['email'].toString().contains(searching.text)) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 20.0),
                          child: Card(
                            color: Colors.black12,
                            child: GestureDetector(
                                onTap: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      content: Text(
                                          "${data['email']} 님에게\n트레이너 요청을 보내시겠습니까?"), // 서버에 발송기능 구현
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('취소'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('확인'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Image.network(data['imgUrl']),
                                  title: Text(
                                    data['email'],
                                    style: TextStyle(
                                      color: txtColor,
                                    ),
                                  ),
                                )),
                          ));
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
          appBar: AppBar(
            backgroundColor: bgColor,
            title: Text('트레이너 추가'),
          ),
          body: SingleChildScrollView(
            child: Container(
                child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      //검색박스
                      height: valHeight * 0.045,
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
                Container(
                    height: 0.6 * valHeight,
                    child: TrainerList(context, userlistStream)!),
              ],
            )),
          ),
        ));
  }
}
