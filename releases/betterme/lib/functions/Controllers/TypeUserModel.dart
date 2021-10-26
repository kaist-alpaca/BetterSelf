import 'dart:io';

class UserModel {
  String? uid;
  String? name = "";
  String? email = "";
  String? profileUrl;
  File? profileImage;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.profileUrl,
  });

  UserModel.clone(UserModel user)
      : this(
          uid: user.uid,
          name: user.name,
          email: user.email,
          profileUrl: user.profileUrl,
        );

  // void initImageFile() {
  //   avatarFile = null;
  //   backgroundFile = null;
  // }

  // UserModel.fromJson(Map<String, dynamic> json, String docId)
  //     : uid = json["uid"] as String,
  //       docId = docId,
  //       name = json["name"] as String,
  //       discription = json["discription"] as String,
  //       avatarUrl = json["avatar_url"] as String,
  //       backgroundUrl = json["background_url"] as String,
  //       lastLoginTime = json["last_login_time"].toDate(),
  //       createdTime = json["created_time"].toDate();

  Map<String, dynamic> toMap() {
    return {
      "uid": this.uid,
      "name": this.name,
      "email": this.email,
      "profileUrl": this.profileUrl,
    };
  }
}
