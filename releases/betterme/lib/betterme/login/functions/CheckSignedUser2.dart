import 'package:betterme/betterme/home/functions/ConstructTabBar.dart';
import 'package:betterme/betterme/login/initialsetting/InitialSettingScreen.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';

class checkSignedUser2 extends StatefulWidget {
  late var num;
  late var data;
  checkSignedUser2({Key? key, required this.num, required this.data})
      : super(key: key);

  @override
  State<checkSignedUser2> createState() => _checkSignedUser2State();
}

class _checkSignedUser2State extends State<checkSignedUser2> {
  @override
  void initState() {
    // TODO: implement initState
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print(message.toString());
    //   print('A new onMessageOpenedApp event was published!');
    //   // setState(() {
    //   //   this.getPageIndex = 1;
    //   // });
    //   // pageController.animateToPage(1,
    //   //     duration: Duration(milliseconds: 100), curve: Curves.bounceInOut);
    //   // ConstructTabBar(getPageIndex: 1);
    //   ConstructTabBar(getPageIndex: 1);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: ProfileController.to.authStateChanges(widget.data),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data! == "0") {
              return ConstructTabBar();
              // return Container(child: Text("안녕1"));
            } else {
              return InitialSettingScreen();
              // return Container(child: Text("안녕"));
            }
          } else {
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
                        "데이터를 불러오는 중입니다....",
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
          }
        });
  }
}
