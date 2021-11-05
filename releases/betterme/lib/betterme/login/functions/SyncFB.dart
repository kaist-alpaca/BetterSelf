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
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
