import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui/common/custom_icons_icons.dart';
import 'package:ui/screen/communication.dart';
import 'package:ui/screen/home.dart';
import 'package:ui/screen/question_and_answer.dart';
import 'package:ui/screen/report.dart';
import 'package:ui/screen/setting.dart';

class BottomNavigation extends StatelessWidget {
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(CustomIcons.question_answer)),
    BottomNavigationBarItem(icon: Icon(CustomIcons.communication)),
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/home.svg')),
    BottomNavigationBarItem(icon: Icon(CustomIcons.report)),
    BottomNavigationBarItem(icon: Icon(CustomIcons.setting)),
  ];

  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.black,
        inactiveColor: Colors.white,
        backgroundColor: Colors.lightGreen,
        items: items,
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: QuestionAnswerScreen(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CommunicationScreen(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomeScreen(),
              );
            });
          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: ReportScreen(),
              );
            });
          case 4:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SettingScreen(),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomeScreen(),
              );
            });
        }
      },
    );
  }
}
