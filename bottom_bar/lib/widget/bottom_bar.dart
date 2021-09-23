import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        height: 50,
        child: TabBar(
          labelColor: Colors.red,
          unselectedLabelColor: Colors.pink,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            Tab(
              icon: SvgPicture.asset('assets/question&answer.svg'),
            ),
            Tab(
              icon: SvgPicture.asset('assets/communication.svg'),
            ),
            Tab(
              icon: SvgPicture.asset('assets/home.svg'),
            ),
            Tab(
              icon: SvgPicture.asset('assets/report.svg'),
            ),
            Tab(
              icon: SvgPicture.asset('assets/setting.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
