import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_application_front/src/pages/report_page/Inbody_page/inbody_screen.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreen createState() => _ReportScreen();
}

class _ReportScreen extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InbodyScreen()));
              },
              child: Container(
                color: Colors.grey,
                width: valWidth,
                height: valHeight * 0.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
