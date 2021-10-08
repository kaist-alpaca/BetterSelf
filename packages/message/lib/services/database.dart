import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethos{
  Future addUserInfoRoDB(String? userId, Map<String, dynamic> userInfoMap) async{
    return FirebaseFirestore.instance.collection("users").doc(userId).set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getUserByUserName(String username) async{
    return await FirebaseFirestore.instance
        .collection("users")
        .where("username", isEqualTo: username).snapshots();
  }
}