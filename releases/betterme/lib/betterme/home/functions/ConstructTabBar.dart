import 'package:betterme/betterme/communication/chatroom/ChatroomScreen.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:betterme/betterme/communication/CommunicationScreen.dart';
import 'package:betterme/betterme/report/ReportScreen.dart';
import 'package:betterme/betterme/setting/SettingScreen.dart';

class ConstructTabBar extends StatefulWidget {
  ConstructTabBar({Key? key}) : super(key: key);

  @override
  _ConstructTabBar createState() => _ConstructTabBar();
}

class _ConstructTabBar extends State<ConstructTabBar> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    ServerConnection.write_log('ConstructTabBar', '', '');
    pageController = PageController();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(message.notification!.body);
      print(message.data);
      print(message.data['from_who']);
      print(message.data.toString());
      print(message.notification!.title);
      print('A new onMessageOpenedApp event was published!');
      // setState(() {
      //   this.getPageIndex = 1;
      // });
      // pageController.animateToPage(1,
      //     duration: Duration(milliseconds: 100), curve: Curves.bounceInOut);
      // ConstructTabBar(getPageIndex: 1);
      // ConstructTabBar(getPageIndex: 1);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatroomScreen(
                  message.data['tousernamechatwith_uid'],
                  message.data['namechatwith'],
                  message.data['imgUrl'],
                  message.data['send_uid'])));
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => ChatroomScreen(
      //             message.data['namechatwith'],
      //             message.data['tousernamechatwith_uid'],
      //             message.data['imgUrl'],
      //             message.data['send_uid'])));
    });
  }

  // onTapChangePage(int pageIndex) {
  //   setState(() {
  //     this.getPageIndex = pageIndex;
  //   });
  //   pageController.animateToPage(pageIndex,
  //       duration: Duration(milliseconds: 100), curve: Curves.bounceInOut);
  // }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: SvgPicture.asset('images/report_icon.svg')),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('images/communication_icon.svg')),
    BottomNavigationBarItem(icon: SvgPicture.asset('images/setting_icon1.svg')),
  ];

  buildHomeScreen() {
    // return Scaffold(
    //   body: PageView(
    //     children: <Widget>[
    //       ReportScreen(),
    //       CommunicationScreen(),
    //       SettingScreen()
    //     ],
    //     controller: pageController, // controller를 지정해주면 각 페이지별 인덱스로 컨트롤 가능
    //     physics: NeverScrollableScrollPhysics(),
    //   ),
    // bottomNavigationBar: CupertinoTabBar(
    //   currentIndex: getPageIndex,
    // onTap: onTapChangePage,
    // activeColor: Colors.white,
    // inactiveColor: Color(0xff6E6572),
    // backgroundColor: Color(0xff0B202A),
    // items: [
    //   BottomNavigationBarItem(
    //       icon: SvgPicture.asset('images/report_icon.svg')),
    //   BottomNavigationBarItem(
    //       icon: SvgPicture.asset('images/communication_icon.svg')),
    //   BottomNavigationBarItem(
    //       icon: SvgPicture.asset('images/setting_icon1.svg')),
    // ],
    //   ),
    // );
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: items,
            currentIndex: 0,
            //onTap: onTapChangePage,
            activeColor: Colors.white,
            inactiveColor: Color(0xff6E6572),
            backgroundColor: Color(0xff0B202A)),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return ReportScreen();
            case 1:
              return CommunicationScreen();
            case 2:
              return SettingScreen();
            default:
              return ReportScreen();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return buildHomeScreen();
  }
}
