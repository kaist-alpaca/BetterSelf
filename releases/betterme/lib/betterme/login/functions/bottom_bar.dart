import 'package:betterme/betterme/home/functions/CustomIcons.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:betterme/betterme/communication/CommunicationScreen.dart';
import 'package:betterme/betterme/home/HomeScreen.dart';

import 'package:betterme/betterme/report/ReportScreen_old.dart';
import 'package:betterme/betterme/setting/SettingScreen.dart';

class BottomNavigation extends StatelessWidget {
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(CustomIcons.report)),
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/home.svg')),
    BottomNavigationBarItem(icon: Icon(CustomIcons.communication)),
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
                child: ReportScreen(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomeScreen(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: CommunicationScreen(),
              );
            });
          case 3:
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
