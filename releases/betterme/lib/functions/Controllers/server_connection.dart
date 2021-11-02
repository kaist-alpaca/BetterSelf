import 'dart:convert';

import 'package:http/http.dart' as http;

import 'TypeUserModel.dart';

class ServerConnection {
  static Future<UserModel?> findUserByUid(String uid) async {
    var userModel;
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/find_user_by_uid.php?uid=" + uid));
    var responseBody = utf8.decode(response.bodyBytes);
    // List<dynamic> list = jsonDecode(responseBody);
    // var list = jsonDecode(response.body);
    Map<String, dynamic> list = json.decode(response.body);
    // print("!!!!!!!!!!!!!!!!!!!");
    // print(list);
    // print(list['result']);
    // print(list['result']['uid']);

    if (list['result'] == '0') {
      return null;
    }
    print("making usermodel");
    return UserModel(
      uid: uid,
      name: list['result']["name"],
      email: list['result']["email"],
      profileUrl:
          "http://kaistuser.iptime.org:8080/img/profile/" + uid + ".jpg",
    );
  }

  static Future<void> uploadProfileImage(String uid, String photoURL) async {
    await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/upload_image.php?uid=" +
            uid +
            "&photoURL=" +
            photoURL));
  }

  // Future<void> uploadFoodImage({String uid, String index, File file}) async {
  //   var stream = new http.ByteStream(DelegatingStream.typed(file!.openRead()));
  //   var length = await originMyProfile.profileImage!.length();

  //   var uri = Uri.parse("http://kaistuser.iptime.org:8080/profile.php?uid=" +
  //       originMyProfile.uid! +
  //       "&type=profile");

  //   var request = new http.MultipartRequest("POST", uri);
  //   var multipartFile = new http.MultipartFile('imgFile', stream, length,
  //       filename: basename(originMyProfile.profileImage!.path));

  //   request.files.add(multipartFile);
  //   var response = await request.send();
  //   // print(response.statusCode);
  //   // print(originMyProfile.uid!);
  //   // print(originMyProfile.profileImage!.length());
  //   // String tmp = "@@@";
  //   // response.stream.transform(utf8.decoder).listen((value) {
  //   //   print("!!!!!!!!!");
  //   //   print(value);
  //   //   tmp = value;
  //   // });

  //   // await http.get(Uri.parse(
  //   //     "http://kaistuser.iptime.org:8080/upload_food_image.php?uid=" +
  //   //         uid +
  //   //         "&photoURL=" +
  //   //         DateTime.now().year.toString() +
  //   //         '_' +
  //   //         DateTime.now().month.toString() +
  //   //         '_' +
  //   //         DateTime.now().day.toString() +
  //   //         '_' +
  //   //         index));
  // }

  static Future<void> createUser(
    String uid,
    String email,
    String userName,
  ) async {
    await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/create_user_info.php?uid=" +
            uid +
            "&email=" +
            email +
            "&user_name=" +
            userName));
  }

  static Future<String> AuthSignedUser(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/check_user_by_uid.php?uid=" + uid));
    print("check user");
    print(json.decode(response.body));
    return json.decode(response.body).toString();
  }
}
