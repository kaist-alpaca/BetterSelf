import 'package:betterself_trainer/betterself_trainer/coaching/report/total_coaching/SevenDaysCoachingBody.dart';
import 'package:betterself_trainer/functions/Firestore/AuthMethods.dart';
import 'package:betterself_trainer/functions/Firestore/DatabaseMethods.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


import '../Widgets/coaching_widgets/CoachingTxtBox.dart';
import '../Widgets/coaching_widgets/CoachingDate.dart';
import '../Widgets/coaching_widgets/CoachingFoodBox.dart';
import '../Widgets/coaching_widgets/CoachingExerciseBox.dart';

var CoachingBiotexts = [];
var CoachingBiotimes = [];

var CoachingFoodtexts = [];
var CoachingFoodtimes = [];

var CoachingExercisetexts = [];
var CoachingExercisetimes = [];

var user = AuthMethods()
    .auth
    .currentUser!
    .email
    .toString()
    .replaceAll("@gmail.com", "");

  String? codeDialog;
  String? valueText;

  Widget build(BuildContext context) {
    return Container();
  }

Widget InitBioCoaching(
    BuildContext context, DateTime selectedDate, String formatD, String uid) {

  final EditController = TextEditingController();
  final valWidth = MediaQuery.of(context).size.width;
  final valHeight = MediaQuery.of(context).size.height;

  Future openEdit() => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            keyboardType: TextInputType.multiline,
            controller: EditController,
            maxLines: null,
            autofocus: true,
          ),
          actions: [
            TextButton(
                onPressed: (){
                  DatabaseMethos().sendCoaching(uid, 2, selectedDate, EditController.text);
                  Navigator.pop(context);
                },
                child: Text('edit')
            )
          ],
        );
      }
  );


  Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('coaching_bio')
      .orderBy("time")
      .snapshots();

  return Container(
    height: MediaQuery.of(context).size.height * 0.45,
    child: StreamBuilder<QuerySnapshot>(
        stream: usersStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          CoachingBiotexts = [];
          CoachingBiotimes = [];
          if (snapshot.hasData) {
            List CoachingList =
            snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
              document.data()! as Map<String, dynamic>;
              print("time : ${DateTime.parse(data['time'].toDate().toString())}");
              CoachingBiotexts.add(data['message']);
              CoachingBiotimes.add(
                  DateTime.parse(data['time'].toDate().toString()));
              return data['message'];
            }).toList();

            int checkTime = CoachingBiotimes.length - 1;
            // DateFormat('y/M/d').format(controller.selectedDay)

            while (checkTime >= 0) {
              // Coachingtimes[checkTime]-selectedDate]
              int date1 = int.parse(
                  DateFormat('yyyyMMdd').format(CoachingBiotimes[checkTime]));
              int date2 = int.parse(DateFormat('yyyyMMdd').format(selectedDate));
              int DiffDays = date1 - date2;

              if (DiffDays == 0) {
                print('$checkTime and ' + CoachingBiotexts[checkTime]);
                return InkWell(
                  onTap: (){
                    EditController.text = CoachingBiotexts[checkTime];
                    openEdit();
                  },
                  child: SizedBox(
                    height: valHeight * 0.25,
                    width: valWidth * 0.86,
                    child : CoachingTxtBox(context, CoachingBiotexts[checkTime], 0.25),
                  )
                );
              } else if (DiffDays < 0) {
                return InkWell(
                  onTap: (){
                    EditController.text = "";
                    openEdit();
                  },
                  child: SizedBox(
                      height: valHeight * 0.25,
                      width: valWidth * 0.86,
                      child: CoachingTxtBox(context, '?????? ?????? ????????? ?????? ????????? ????????? ????????????.', 0.25)
                  )
                );
              }
              checkTime = checkTime - 1;
            }
            return InkWell(
                onTap: (){
                  EditController.text = "";
                  openEdit();
                },
                child: SizedBox(
                    height: valHeight * 0.25,
                    width: valWidth * 0.86,
                    child: CoachingTxtBox(context, '?????? ?????? ????????? ?????? ????????? ????????? ????????????.', 0.25)
                )
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        })
  );
}

Widget InitExerciseCoaching(BuildContext context, DateTime selectedDate) {

  final EditController = TextEditingController();
  final valWidth = MediaQuery.of(context).size.width;
  final valHeight = MediaQuery.of(context).size.height;

  Future openEdit() => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            keyboardType: TextInputType.multiline,
            controller: EditController,
            maxLines: null,
            autofocus: true,
          ),
          actions: [
            TextButton(
                onPressed: (){
                  DatabaseMethos().sendCoaching(uid!, 0, selectedDate, EditController.text);
                  Navigator.pop(context);
                },
                child: Text('edit')
            )
          ],
        );
      }
  );

  Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('coaching_exercise')
      .orderBy("time")
      .snapshots();

  return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        CoachingExercisetexts = [];
        CoachingExercisetimes = [];
        if (snapshot.hasData) {
          List CoachingList =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            print("time : ${DateTime.parse(data['time'].toDate().toString())}");
            CoachingExercisetexts.add(data['message']);
            CoachingExercisetimes.add(
                DateTime.parse(data['time'].toDate().toString()));
            return data['message'];
          }).toList();

          int checkTime = CoachingExercisetimes.length - 1;
          // DateFormat('y/M/d').format(controller.selectedDay)

          while (checkTime >= 0) {
            // Coachingtimes[checkTime]-selectedDate]
            int date1 = int.parse(DateFormat('yyyyMMdd')
                .format(CoachingExercisetimes[checkTime]));
            int date2 = int.parse(DateFormat('yyyyMMdd').format(selectedDate));
            int DiffDays = date1 - date2;

            // print(selectedDate.toString());
            if (DiffDays == 0) {
              // print('$checkTime and ' + CoachingExercisetexts[checkTime]);
              return InkWell(
                  onTap: (){
                    EditController.text = CoachingExercisetexts[checkTime];
                    openEdit();
                  },
                  child: SizedBox(
                    height: valHeight * 0.2,
                    width: valWidth * 0.86,
                    child : CoachingTxtBox(context, CoachingExercisetexts[checkTime], 0.2),
                  )
              );
            } else if (DiffDays < 0) {
              return InkWell(
                  onTap: (){
                    EditController.text = "";
                    openEdit();
                  },
                  child: SizedBox(
                    height: valHeight * 0.2,
                    width: valWidth * 0.86,
                    child : CoachingTxtBox(context, '?????? ?????? ????????? ?????? ????????? ????????????.', 0.2)
                  )
              );
            }
            checkTime = checkTime - 1;
          }

          return InkWell(
              onTap: (){
                EditController.text = "";
                openEdit();
              },
              child: SizedBox(
                  height: valHeight * 0.2,
                  width: valWidth * 0.86,
                  child : CoachingTxtBox(context, '?????? ?????? ????????? ?????? ????????? ????????????.', 0.2)
              )
          );

        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

Widget InitFoodCoaching(BuildContext context, DateTime selectedDate, String uid) {

  final EditController = TextEditingController();
  final valWidth = MediaQuery.of(context).size.width;
  final valHeight = MediaQuery.of(context).size.height;

  Future openEdit() => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            keyboardType: TextInputType.multiline,
            controller: EditController,
            maxLines: null,
            autofocus: true,
          ),
          actions: [
            TextButton(
                onPressed: (){
                  DatabaseMethos().sendCoaching(uid, 1, selectedDate, EditController.text);
                  Navigator.pop(context);
                },
                child: Text('edit')
            )
          ],
        );
      }
  );

  Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('coaching_diet')
      .orderBy("time")
      .snapshots();

  return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        CoachingFoodtexts = [];
        CoachingFoodtimes = [];
        if (snapshot.hasData) {
          List CoachingList =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            print("time : ${DateTime.parse(data['time'].toDate().toString())}");
            CoachingFoodtexts.add(data['message']);
            CoachingFoodtimes.add(
                DateTime.parse(data['time'].toDate().toString()));
            return data['message'];
          }).toList();

          int checkTime = CoachingFoodtimes.length - 1;
          // DateFormat('y/M/d').format(controller.selectedDay)

          while (checkTime >= 0) {
            // Coachingtimes[checkTime]-selectedDate]
            int date1 = int.parse(
                DateFormat('yyyyMMdd').format(CoachingFoodtimes[checkTime]));
            int date2 = int.parse(DateFormat('yyyyMMdd').format(selectedDate));
            int DiffDays = date1 - date2;

            if (DiffDays == 0) {
              return InkWell(
                  onTap: (){
                    EditController.text = CoachingFoodtexts[checkTime];
                    openEdit();
                  },
                  child: SizedBox(
                      height: valHeight * 0.2,
                      width: valWidth * 0.86,
                      child : CoachingTxtBox(context, CoachingFoodtexts[checkTime], 0.2)
                  )
              );
            } else if (DiffDays < 0) {
              return InkWell(
                  onTap: (){
                    EditController.text = "";
                    openEdit();
                  },
                  child: SizedBox(
                      height: valHeight * 0.2,
                      width: valWidth * 0.86,
                      child : CoachingTxtBox(context, '?????? ?????? ????????? ?????? ????????? ????????????.', 0.2)
                  )
              );
            }
            checkTime = checkTime - 1;
          }

          return InkWell(
              onTap: (){
                EditController.text = "";
                openEdit();
              },
              child: SizedBox(
                  height: valHeight * 0.2,
                  width: valWidth * 0.86,
                  child : CoachingTxtBox(context, '?????? ?????? ????????? ?????? ????????? ????????????.', 0.2)
              )
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}

int? buttonCase;
DateTime? selectedDay1;
String? uid;

class MonthCoachingBody extends StatefulWidget {
  MonthCoachingBody(int a, DateTime selectedDay, String uid1) {
    buttonCase = a;
    selectedDay1 = selectedDay;
    uid = uid1;
  }

  @override
  _MonthCoachingBody createState() => _MonthCoachingBody();
}

class _MonthCoachingBody extends State<MonthCoachingBody> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final valHeight = MediaQuery.of(context).size.height; //?????? ??????
    final valWidth = MediaQuery.of(context).size.width; //?????? ??????
    final bgColor = Color(0xff0B202A); //?????????
    final txtColor = Color(0xffFFFDFD); //????????? , ?????? ????????? ???
    final linetxtColor = Color(0xffAA8F9D); //??????-?????????-?????? ???

    DateTime selectedDay = selectedDay1!;
    String formattedDate = DateFormat('y/M/d').format(selectedDay);

    if (buttonCase == 1) {
      //??????
      return Column(
        children: [
          CoachingDate(context, '?????? ?????? ??? ??????', '[$formattedDate]'),
          CoachingExerciseBox(context, selectedDay, uid!),
          SizedBox(
            height: 15,
          ),
          InitExerciseCoaching(context, selectedDay),
          Container(
            width: valWidth * 0.74,
            child: Divider(
              color: Color(0xff858E93),
              thickness: 0.6,
            ),
          ),
          SizedBox(
            height: 200,
          )
        ],
      );
    } else if (buttonCase == 2) {
      //??????
      return Column(
        children: [
          CoachingDate(context, '?????? ?????? ??? ??????', '[$formattedDate]'),
          CoachingFoodBox(context, selectedDay, uid!),
          SizedBox(
            height: 15,
          ),
          InitFoodCoaching(context, selectedDay, uid!),
          Container(
            width: valWidth * 0.74,
            child: Divider(
              color: Color(0xff858E93),
              thickness: 0.6,
            ),
          ),
          SizedBox(
            height: 200,
          )
        ],
      );
    } else if (buttonCase == 3) {
      //??????
      return Column(
        children: [
          CoachingDate(context, '?????? ????????? ??????', '[$formattedDate]'),
          InitBioCoaching(context, selectedDay, '[$formattedDate]', uid!),
          SizedBox(
            height: 200,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}

