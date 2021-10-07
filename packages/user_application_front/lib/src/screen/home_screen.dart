import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //화면 높이
    final valWidth = MediaQuery.of(context).size.width; //화면 너비
    double defaultSize = valWidth * 0.0025;
    return Scaffold(
      appBar: AppBar(
        title: Text("날짜"), //여기에 현재 날짜 구현해야함/
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: valHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: valWidth * 0.02,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: valHeight * 0.04,
                      width: valWidth * 0.32,
                      child: Text(
                        ' 수면',
                        style: TextStyle(fontSize: defaultSize * 15),
                      ),
                    ),
                    Container(
                      //여기에 해당 날짜 수면 데이터 들어가야함
                      height: valHeight * 0.23,
                      width: valWidth * 0.32,
                      color: Colors.grey,
                    )
                  ],
                ),
                SizedBox(width: valWidth * 0.03),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: valHeight * 0.04,
                      width: valWidth * 0.59,
                      child: Text(
                        ' 활동량',
                        style: TextStyle(fontSize: defaultSize * 15),
                      ),
                    ),
                    Container(
                      //여기에 해당 날짜 활동량 데이터 들어가야함
                      height: valHeight * 0.23,
                      width: valWidth * 0.59,
                      color: Colors.grey,
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: valHeight * 0.02,
            ),
            Container(
                //여기에다 하루 로그? 기록? 추가하면 됨.
                )
          ],
        ),
      ),
    );
  }
}
