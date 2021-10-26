import 'package:flutter/material.dart';
import 'package:message/services/auth.dart';
import 'package:message/widgets/widget.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);
  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signin'),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        padding : EdgeInsets.symmetric(horizontal: 24),
        child : Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: textFieldInput("Email"),
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: textFieldInput("Password"),
            ),
            SizedBox(height: 8,),
            SizedBox(height: 8,),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xff007EF4),
                        Color(0xff2A75BC)
                      ]
                  )
              ),
              child: Text("Sign in", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 16,),
            GestureDetector(
              onTap: (){
                AuthMethods().signInWithGoogle(context);
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Text("Sign in with Google", style: TextStyle(color: Colors.black)),
              ),
            ),
          ]
          )
        )
      );
  }
}