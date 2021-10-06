import 'dart:convert';

import 'package:kakao_sample_profile/src/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

void readDoc(DocumentSnapshot doc) {
  print("doc[uid]");
}

class FirebaseUserRepository {
  static Future<String?> signup(UserModel user) async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    DocumentReference drf = await users.add(user.toMap());
    return drf.id;
  }

  static Future<UserModel?> findUserByUid(String uid) async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    QuerySnapshot data = await users.where("uid", isEqualTo: uid).get();
    var userModel;
    await FirebaseFirestore.instance
        .collection('users')
        .where("uid", isEqualTo: uid)
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            print(data.docs[0].id);
            userModel = UserModel(
              docId: data.docs[0].id,
              uid: doc["uid"],
              name: doc["name"],
              avatarUrl: doc["avatar_url"],
              backgroundUrl: doc["background_url"],
              createdTime: doc["created_time"].toDate(),
              lastLoginTime: doc["last_login_time"].toDate(),
              discription: doc["discription"],
            );
          },
        );
      },
    );
    if (data.size == 0) {
      return null;
    } else {
      return userModel;
    }
  }

  static void updateImageUrl(String docId, String url, String fieldName) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    users.doc(docId).update({fieldName: url});
  }

  static void updateLastLoginDate(String docId, DateTime time) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    users.doc(docId).update({"date_last_login": time});
  }

  static void updateData(String docId, UserModel user) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    users.doc(docId).update(user.toMap());
  }
}
