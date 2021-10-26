import 'package:flutter/material.dart';
import 'package:trainer_application_front/src/screen/communication_screen.dart';
import 'package:trainer_application_front/src/screen/user_info_screen.dart';
import 'package:trainer_application_front/src/screen/report_screen.dart';
import 'package:trainer_application_front/src/screen/setting_screen.dart';
import 'package:trainer_application_front/widget/bottom_bar.dart';

class AppMain extends StatefulWidget {
  @override
  _AppMain createState() => _AppMain();
}

class _AppMain extends State<AppMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          ReportScreen(),
          UserInfoScreen(),
          CommunicationScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
