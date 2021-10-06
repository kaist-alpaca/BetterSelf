import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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
          return Home().handleAuthState();
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
