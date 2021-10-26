import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:betterme/betterme/communication/CommunicationScreen.dart';
import 'package:betterme/betterme/report/ReportScreen.dart';
import 'package:betterme/betterme/setting/SettingScreen.dart';

import '../HomeScreen.dart';
import 'CustomIcons.dart';

class ConstructTabBar extends StatefulWidget {
  const ConstructTabBar({Key? key}) : super(key: key);

  @override
  _ConstructTabBar createState() => _ConstructTabBar();
}

class _ConstructTabBar extends State<ConstructTabBar> {
  late PageController pageController;
  int getPageIndex = 1;
  int checker = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  onTapChangePage(int pageIndex) {
    if (checker == 1) {
      pageController.animateToPage(pageIndex,
          duration: Duration(milliseconds: 100), curve: Curves.bounceInOut);
      setState(() {
        this.getPageIndex = pageIndex;
      });
    } else if (pageIndex != 1) {
      setState(() {
        this.checker = 1;
        this.getPageIndex = pageIndex;
      });
      pageController.animateToPage(pageIndex,
          duration: Duration(milliseconds: 100), curve: Curves.bounceInOut);
    }
  }

  buildHomeScreen() {
    return Scaffold(
      body: PageView(
        children: checker == 0
            ? <Widget>[
                // 정상 로그인시 홈스크린 보인다.
                HomeScreen(),
                ReportScreen(),
                CommunicationScreen(),
                SettingScreen(),
                // ReportScreen(),
                // ReportScreen(),
                // ReportScreen(),
                // ReportScreen()
              ]
            : <Widget>[
                // 정상 로그인시 홈스크린 보인다.
                ReportScreen(),
                HomeScreen(),
                CommunicationScreen(),
                SettingScreen(),
              ],
        controller: pageController, // controller를 지정해주면 각 페이지별 인덱스로 컨트롤 가능
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: getPageIndex,
        onTap: onTapChangePage,
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(CustomIcons.report)),
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(CustomIcons.communication)),
          BottomNavigationBarItem(icon: Icon(CustomIcons.setting)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildHomeScreen();
  }
}
