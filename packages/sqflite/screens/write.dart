import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import '/database/memo.dart';
import '/database/db.dart';

class WritePage extends StatelessWidget {
  String title = '';
  String text = '';
  late BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: saveDB,
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                maxLines: 2,
                onChanged: (String title) {
                  this.title = title;
                },
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: '메모의 제목을 적어주세요.',
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                maxLines: 7,
                onChanged: (String text) {
                  this.text = text;
                },
                decoration: InputDecoration(
                  hintText: '메모의 내용을 적어주세요.',
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();

    var fido = Memo(
      id: Str2Sha512(DateTime.now().toString()),
      title: this.title,
      text: this.text,
      createTime: DateTime.now().toString(),
      editTime: DateTime.now().toString(),
    );

    await sd.insertMemo(fido);

    print(await sd.memos());
    Navigator.pop(_context);
  }

  String Str2Sha512(String text) {
    var bytes = utf8.encode(text);
    var digest = sha512.convert(bytes);
    return digest.toString();
  }
}
