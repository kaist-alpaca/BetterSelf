import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_test/database/db.dart';
import 'package:sqflite_test/database/memo.dart';
import 'package:sqflite_test/screens/view.dart';
import 'write.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String deleteId = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 5, top: 30, bottom: 20),
              child: Text('메모메모',
                  style: TextStyle(fontSize: 36, color: Colors.blue))),
          Expanded(child: memoBuilder(context))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => WritePage()))
              .then(onGoBack);
        },
        tooltip: 'Increment',
        label: Text('메모 추가'),
        icon: Icon(Icons.add),
      ),
    );
  }

  // List<Widget> LoadMemo() {
  //   List<Widget> memoList = [];
  //   memoList.add(Container(color: Colors.purpleAccent, height: 100));
  //   return memoList;
  // }

  Future<List<Memo>> loadMemo() async {
    DBHelper sd = DBHelper();
    return await sd.memos();
  }

  Future<void> deleteMemo(String id) async {
    DBHelper sd = DBHelper();
    sd.deleteMemo(id);
  }

  void showAlertDialog(BuildContext context) async {
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('삭제 경고'),
              content: Text('정말 삭제하시겠습니까?\n삭제된 메모는 복구되지 않습니다.'),
              actions: <Widget>[
                TextButton(
                  child: Text('삭제'),
                  onPressed: () {
                    Navigator.pop(context, '삭제');
                    setState(() {
                      deleteMemo(deleteId);
                    });
                  },
                ),
                TextButton(
                  child: Text('취소'),
                  onPressed: () {
                    Navigator.pop(context, '취소');
                  },
                ),
              ]);
        });
  }

  Widget memoBuilder(BuildContext parentContext) {
    return FutureBuilder(
      builder: (context, Snap) {
        if ((Snap.data as List).length == 0) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              "메모를 지금 바로 추가해보세요!",
              style: TextStyle(fontSize: 15, color: Colors.blueAccent),
              textAlign: TextAlign.center,
            ),
          );
        }
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(20),
          itemCount: (Snap.data as List).length,
          itemBuilder: (context, index) {
            Memo memo = (Snap.data as List)[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    parentContext,
                    CupertinoPageRoute(
                        builder: (context) => ViewPage(id: memo.id)));
              },
              onLongPress: () {
                setState(() {
                  deleteId = memo.id;
                  showAlertDialog(parentContext);
                });
              },
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.lightBlue, blurRadius: 3)
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          memo.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          memo.text,
                          style: TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("최종 수정 시간: " + memo.editTime.split('.')[0],
                            style: TextStyle(fontSize: 11)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      future: loadMemo(),
    );
  }

  FutureOr onGoBack(value) {
    setState(() {});
  }
}
