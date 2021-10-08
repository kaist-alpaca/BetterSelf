import 'package:flutter/material.dart';
import 'package:user_application_front/src/pages/report_page/inbody_page/inbody_screen.dart';

/*class InbodyTabs extends StatefulWidget{
  @override
  _InbodyTabs createState() => _InbodyTabs(buttonCase: 0);
}*/
/*
class  extends StatefulWidget {
  const ({ Key? key }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}*/

int? buttonCase;

class InbodyTabs extends StatefulWidget {
  InbodyTabs(int a) {
    buttonCase = a;
  }

  @override
  _InbodyTabs createState() => _InbodyTabs();
}

int testValue = 0;

class _InbodyTabs extends State<InbodyTabs> {
  @override
  Widget build(BuildContext context) {
    print('In buttonCase is $buttonCase');
    if (buttonCase == 0) {
      //7일로 선택되었을 때 표현될 위젯들은 여기에.
      return Container(
          child: Center(
              child: Column(children: [
        Container(
          child: Text('여기다가 7일짜리 그래프'),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              testValue++;
            });
          },
          child: Container(
            height: 20,
            width: 20,
            color: Colors.grey,
            child: Text('$testValue'),
          ),
        )
      ])));
    } else if (buttonCase == 1) {
      //31일로 선택되었을 때 표현될 위젯들은 여기에
      return Container(
        child: Center(
          child: Column(children: [
            Container(
              child: Text('여기다가 31일짜리 그래프'),
            ),
            Container(
              width: 20,
              height: 20,
              color: Colors.red,
            )
          ]),
        ),
      );
    } else if (buttonCase == 2) {
      //12개월로 선택되었을 때 표현될 위젯들은 여기에.
      return Container(
          child: Center(
              child: Column(children: [
        Container(
          child: Text('여기다가 12개월짜리 그래프'),
        ),
        Container(
          width: 20,
          height: 20,
          color: Colors.blue,
        )
      ])));
    } else {
      return Container();
    }
  }
}
