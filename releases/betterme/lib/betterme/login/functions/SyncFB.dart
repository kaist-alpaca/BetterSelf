import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'DetectAuthStateChange.dart';

class SyncFB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (contxt, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Firebase load fail"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return DetectAuthStateChange();
        }
        return Material(
          type: MaterialType.transparency,
          child: Container(
            color: Color(0xff0B202A),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    "앱 로딩중....",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
