import 'package:cloud_firestore/cloud_firestore.dart';

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
}