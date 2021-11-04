import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:betterme/betterme/communication/CommunicationScreen.dart';
import 'package:betterme/betterme/report/ReportScreen.dart';
import 'package:betterme/betterme/setting/SettingScreen.dart';

import '../HomeScreen.dart';
import 'CustomIcons.dart';

import 'package:get/get.dart';

import 'package:betterme/functions/Controllers/profile_controller.dart';

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
                CommunicationScreen(),
                ReportScreen(),
                SettingScreen(),
                // ReportScreen(),
                // ReportScreen(),
                // ReportScreen(),
                // ReportScreen()
                // ReportScreen(),
                // ReportScreen(),
                // ReportScreen(),
                // ReportScreen()
              ]
            : <Widget>[
                // 정상 로그인시 홈스크린 보인다.
                CommunicationScreen(),

                HomeScreen(),

                ReportScreen(),
                SettingScreen(),
              ],
        controller: pageController, // controller를 지정해주면 각 페이지별 인덱스로 컨트롤 가능
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: getPageIndex,
        onTap: onTapChangePage,
        activeColor: Colors.white,
        inactiveColor: Color(0xff6E6572),
        backgroundColor: Color(0xff0B202A),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/communication_icon.svg'),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('images/report_icon.svg')),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('images/setting_icon1.svg')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildHomeScreen();
  }
}
