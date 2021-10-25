import 'package:alpaca_develop/src/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void readDoc(DocumentSnapshot doc) {
  print("doc[uid]");
}

class FirebaseUserRepository {
  static Future<String?> signup(UserModel user) async {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    DocumentReference drf = await users.add(user.toMap());
    return drf.id;
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
