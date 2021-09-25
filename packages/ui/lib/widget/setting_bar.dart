import 'package:flutter/material.dart';
import 'package:ui/common/custom_icons_icons.dart';

class settingBar extends StatelessWidget {
  final name;
  final screen;

  const settingBar({Key? key, @required this.name, @required this.screen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var maxWidth = MediaQuery.of(context).size.width;
    var maxHeight = MediaQuery.of(context).size.height;
    var defaultSize = maxWidth * 0.0025;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Container(
        height: maxWidth * 0.1,
        width: double.infinity,
        color: Colors.lightBlue,
        margin: EdgeInsets.fromLTRB(0, maxWidth * 0.01, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              child: Icon(CustomIcons.setting_arrow),
            ),
          ],
        ),
      ),
    );
  }
}
