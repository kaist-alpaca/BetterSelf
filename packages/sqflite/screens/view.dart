import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_test/database/memo.dart';
import 'package:sqflite_test/database/db.dart';
import 'package:sqflite_test/screens/edit.dart';

import 'edit.dart';

class ViewPage extends StatefulWidget {
  ViewPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: showAlertDialog,
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => EditPage(id: widget.id)))
                    .then(onGoBack);
                ;
              },
            ),
          ],
        ),
        body: Padding(padding: EdgeInsets.all(20), child: loadBuilder()));
  }

  Future<List<Memo>> loadMemo(String id) async {
    DBHelper sd = DBHelper();
    return await sd.findMemo(id);
  }

  loadBuilder() {
    return FutureBuilder<List<Memo>>(
        future: loadMemo(widget.id),
        builder: (BuildContext, AsyncSnapshot<List<Memo>> snapshot) {
          if (snapshot.data == null || snapshot.data == []) {
            return Container(child: Text("데터ㄹ 불러올 수  없습니다."));
          } else {
            Memo memo = snapshot.data![0];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 70,
                  child: SingleChildScrollView(
                    child: Text(memo.title,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                Text(
                  '메모 만든 시간: ' + memo.createTime.split('.')[0],
                  style: TextStyle(fontSize: 11),
                  textAlign: TextAlign.end,
                ),
                Text(
                  '메모 수정 시간: ' + memo.editTime.split('.')[0],
                  style: TextStyle(fontSize: 11),
                  textAlign: TextAlign.end,
                ),
                Padding(padding: EdgeInsets.all(10)),
                Expanded(child: SingleChildScrollView(child: Text(memo.text))),
              ],
            );
          }
        });
  }

  Future<void> deleteMemo(String id) async {
    DBHelper sd = DBHelper();
    await sd.deleteMemo(id);
  }

  void showAlertDialog() async {
    await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('삭제 경고'),
          content: Text("정말 삭제하시겠습니까?\n삭제된 메모는 복구되지 않습니다."),
          actions: <Widget>[
            TextButton(
              child: Text('삭제'),
              onPressed: () {
                Navigator.pop(context, "삭제");
                deleteMemo(widget.id);
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context, "취소");
              },
            ),
          ],
        );
      },
    );
  }

  FutureOr onGoBack(value) {
    setState(() {});
  }
}
