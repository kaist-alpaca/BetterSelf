import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:betterme/common/custom_icons_icons.dart';
import 'package:betterme/src/screen/communication_screen.dart';
import 'package:betterme/src/screen/home_screen.dart';
import 'package:betterme/src/screen/report_screen.dart';
import 'package:betterme/src/screen/setting_screen.dart';

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
                child: HomeScreenMain(),
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
                child: HomeScreenMain(),
              );
            });
        }
      },
    );
  }
}
