import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethos{
  Future addUserInfoRoDB(String? userId, Map<String, dynamic> userInfoMap) async{
    return FirebaseFirestore.instance.collection("users").doc(userId).set(userInfoMap);
  }

  getUserByUserName(String username) async{
    return FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: username).snapshots();
  }

  createChatroom(String chatroomId, Map<String, dynamic> chatroomInfo) async{
    final snapShot = await FirebaseFirestore.instance.collection("Chatrooms").doc(chatroomId).get();
    if(snapShot.exists){
      return true;
    }else{
      return FirebaseFirestore.instance.collection("Chatrooms").doc(chatroomId).set(chatroomInfo);
    }
  }

  addMessage(String chatroomId, String messageId, Map<String, dynamic> messageInfo) async{
    return FirebaseFirestore.instance.collection("Chatrooms").doc(chatroomId).collection("chats").doc(messageId).set(messageInfo);
  }

  addTrainer(String Traineruid, Map<String, dynamic> userInfo) async{
    final snapShot = await FirebaseFirestore.instance.collection("users").doc(Traineruid).collection("add_query").doc(userInfo['uid']).get();
    if(snapShot.exists){
      return true;
    }else{
      return FirebaseFirestore.instance.collection("users").doc(Traineruid).collection("add_query").doc(userInfo['uid']).set(userInfo);
    }
  }

  addTrainee(String Traineruid, String uid) async{
    final Traineesnapshot = await FirebaseFirestore.instance.collection('users').doc(Traineruid).collection("add_query").doc(uid).get();
    final Traineedata = Traineesnapshot.data()!;

    Map<String, dynamic> TraineeInfo = {
      "uid" : uid,
      "email" : Traineedata['email'],
      "imgUrl" : Traineedata['imgUrl'],
      "name" : Traineedata['name'],
      "profileUrl" : Traineedata['profileUrl'],
      "username" : Traineedata['username'],
    };

    final Trainersnapshot = await FirebaseFirestore.instance.collection('users').doc(Traineruid).get();
    final Trainerdata = Trainersnapshot.data()!;

    Map<String, dynamic> TrainerInfo = {
      "email" : Trainerdata['email'],
      "imgUrl" : Trainerdata['imgUrl'],
      "name" : Trainerdata['name'],
      "profileUrl" : Trainerdata['profileUrl'],
      "username" : Trainerdata['username'],
    };

    final Trainerchatsnapshot = await FirebaseFirestore.instance.collection('users').doc(Traineruid).collection('trainers').doc(TraineeInfo['name']).get();
    final Traineechatsnapshot = await FirebaseFirestore.instance.collection('users').doc(uid).collection('trainers').doc(TrainerInfo['name']).get();

    if(Trainerchatsnapshot.exists){
      return removeTraineeQuery(Traineruid, uid);
    }else{
      FirebaseFirestore.instance.collection('users').doc(uid).collection('trainers').doc(TrainerInfo['name']).set(TrainerInfo);
      FirebaseFirestore.instance.collection('users').doc(Traineruid).collection('trainers').doc(TraineeInfo['name']).set(TraineeInfo);
      return removeTraineeQuery(Traineruid, uid);
    }
  }

  removeTraineeQuery(String Traineruid, String uid) async{
    print("debug remove uid : $uid");
    return await FirebaseFirestore.instance.collection('users').doc(Traineruid).collection("add_query").doc(uid).delete();
  }

  Future<Stream<QuerySnapshot>> getchatroomMessages(chatroomId) async{
    return await FirebaseFirestore.instance.collection("Chatrooms").doc(chatroomId).collection("chats").orderBy("time", descending: true).snapshots();
  }
}