import 'dart:io';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';

import 'TypeUserModel.dart';

import 'image_crop_controller.dart';

import 'server_connection.dart';

enum ProfileImageType { THUMBNAIL, BACKGROUND }

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  RxBool isEditMyProfile = false.obs;
  UserModel originMyProfile = UserModel();
  Rx<UserModel> myProfile = UserModel().obs;

  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime reportDay = DateTime.now();

  double weightProfile = 0;

  DateTime date = DateTime.now();

  File? food;

  void updatefocusedDay(DateTime value) {
    focusedDay = value;
    update();
  }

  void updateselectedDay(DateTime value) {
    selectedDay = value;
    update();
  }

  void dateMinus(DateTime value) {
    date = date.subtract(Duration(days: 1));
    update();
  }

  void dateMinus7(DateTime value) {
    date = date.subtract(Duration(days: 7));
    update();
  }

  void rdateMinus7(DateTime value) {
    reportDay = reportDay.subtract(Duration(days: 7));
    update();
  }

  void datePlus(DateTime value) {
    date = date.add(Duration(days: 1));
    update();
  }

  void datePlus7(DateTime value) {
    date = date.add(Duration(days: 7));
    update();
  }

  void rdatePlus7(DateTime value) {
    reportDay = reportDay.add(Duration(days: 7));
    update();
  }

  void dateReset(DateTime value) {
    date = DateTime.now();
    update();
  }

  void reportDayReset(DateTime value) {
    reportDay = DateTime.now();
    update();
  }

  void updateReport(DateTime value) {
    reportDay = value;
    update();
  }

  void updateWeight(double value) {
    weightProfile = value;
    update();
  }

//일주일구하기
  DateTime startDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - (date.weekday - 1));
  }

  DateTime endDate(DateTime value) {
    return DateTime(date.year, date.month, date.day + (7 - date.weekday));
  }

  DateTime TueDate(DateTime value) {
    return DateTime(date.year, date.month, date.day + 1 - (date.weekday - 1));
  }

  DateTime WedDate(DateTime value) {
    return DateTime(date.year, date.month, date.day + 2 - (date.weekday - 1));
  }

  DateTime ThuDate(DateTime value) {
    return DateTime(date.year, date.month, date.day + 3 - (date.weekday - 1));
  }

  DateTime FriDate(DateTime value) {
    return DateTime(date.year, date.month, date.day + 4 - (date.weekday - 1));
  }

  DateTime SatDate(DateTime value) {
    return DateTime(date.year, date.month, date.day + 5 - (date.weekday - 1));
  }

  // 홈화면용 어제/그제 구하기
  DateTime YYDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 2);
  }

  DateTime YDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 1);
  }

  String? gender;
  String? birthday;
  String? height;
  String? weight;
  String? disease;

  void genderSelected(String value) {
    gender = value;
    update();
  }

  void birthdaySelected(String value) {
    birthday = value;
    update();
  }

  void heightSelected(String value) {
    height = value;
    update();
  }

  void weightSelected(String value) {
    weight = value;
    update();
  }

  void diseaseSelected(String value) {
    disease = value;
    update();
  }

  Future<String> authStateChanges(Object? firebaseUser) async {
    print("authStateChanges working");
    String tmp = "0";
    if (firebaseUser != null) {
      UserModel? userModel = await ServerConnection.findUserByUid(
          FirebaseAuth.instance.currentUser!.uid);
      if (userModel != null) {
        print("usermodel is not null");
        originMyProfile = userModel;
      } else {
        tmp = "1";
        print("usermodel is null");
        await ServerConnection.uploadProfileImage(
          FirebaseAuth.instance.currentUser!.uid,
          FirebaseAuth.instance.currentUser!.photoURL!,
        );
        print("create user");
        print(FirebaseAuth.instance.currentUser!.uid);
        print(FirebaseAuth.instance.currentUser!.email!);
        print(FirebaseAuth.instance.currentUser!.displayName!);

        await ServerConnection.createUser(
          FirebaseAuth.instance.currentUser!.uid,
          FirebaseAuth.instance.currentUser!.email!,
          FirebaseAuth.instance.currentUser!.displayName!,
        );
        originMyProfile = UserModel(
          uid: FirebaseAuth.instance.currentUser!.uid,
          name: FirebaseAuth.instance.currentUser!.displayName,
          email: FirebaseAuth.instance.currentUser!.email,
          profileUrl: "http://kaistuser.iptime.org:8080/img/profile/" +
              FirebaseAuth.instance.currentUser!.uid +
              ".jpg",
        );
      }
    }
    myProfile(UserModel.clone(originMyProfile));

    await ServerConnection.updateHeathData(
        FirebaseAuth.instance.currentUser!.uid);

    // return FirebaseAuth.instance.currentUser == null
    //     ? ''
    //     : FirebaseAuth.instance.currentUser!.uid;
    return tmp;
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> pickImage({required String type, required String use}) async {
    File? file = type == "gallery"
        ? await ImageCropController.to.selectImage(type: 'gallery')
        : await ImageCropController.to.selectImage(type: 'camera');
    food = null;
    if (file == null) {
      update();
      return;
    }
    if (use == "profile") {
      myProfile.update((my) => my?.profileImage = file);
    } else {
      food = file;
      update();
    }
  }

  void _updateProfileImageUrl(String downloadUrl) {
    originMyProfile.profileUrl = downloadUrl;
    myProfile.update((user) => user!.profileUrl = downloadUrl);
    print("update working???");
    print(originMyProfile.profileUrl);
    print(myProfile.value.profileUrl);
  }

  Future<int> save() async {
    originMyProfile = myProfile.value;
    if (originMyProfile.profileImage != null) {
      var stream = new http.ByteStream(
          DelegatingStream.typed(originMyProfile.profileImage!.openRead()));
      var length = await originMyProfile.profileImage!.length();

      var uri = Uri.parse("http://kaistuser.iptime.org:8080/profile.php?uid=" +
          originMyProfile.uid! +
          "&type=profile");

      var request = new http.MultipartRequest("POST", uri);
      var multipartFile = new http.MultipartFile('imgFile', stream, length,
          filename: basename(originMyProfile.profileImage!.path));

      request.files.add(multipartFile);
      var response = await request.send();
      print(response.statusCode);
      print(originMyProfile.uid!);
      print(originMyProfile.profileImage!.length());
      String tmp = "@@@";
      response.stream.transform(utf8.decoder).listen((value) {
        print("!!!!!!!!!");
        print(value);
        tmp = value;
      });
      _updateProfileImageUrl("http://kaistuser.iptime.org:8080/img/profile/" +
          originMyProfile.uid! +
          ".jpg");
    }
    return 123121;
  }

  Future<void> uploadFoodImage(
      {required String uid, required String index, required File file}) async {
    print("food start");
    var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    print(length);
    var uri = Uri.parse(
        "http://kaistuser.iptime.org:8080/upload_food_image.php?uid=" +
            uid +
            "&index=" +
            index +
            "&photoURL=" +
            DateTime.now().year.toString() +
            '_' +
            DateTime.now().month.toString() +
            '_' +
            DateTime.now().day.toString() +
            '_' +
            index);

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('imgFile', stream, length,
        filename: basename(file.path));

    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);

    String tmp = "@@@";
    response.stream.transform(utf8.decoder).listen((value) {
      print("!!!!!!!!!");
      print(value);
      tmp = value;
    });
  }
}
