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

  // double weightProfile = 0;

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

  int duration = 7;
  DateTime totaldate = DateTime.now();
  List<dynamic> datelist = [
    DateTime.now().toString().substring(0, 10).replaceAll("-", "_"),
    DateTime.now()
        .add(Duration(days: -1))
        .toString()
        .substring(0, 10)
        .replaceAll("-", "_"),
    DateTime.now()
        .add(Duration(days: -2))
        .toString()
        .substring(0, 10)
        .replaceAll("-", "_"),
    DateTime.now()
        .add(Duration(days: -3))
        .toString()
        .substring(0, 10)
        .replaceAll("-", "_"),
    DateTime.now()
        .add(Duration(days: -4))
        .toString()
        .substring(0, 10)
        .replaceAll("-", "_"),
    DateTime.now()
        .add(Duration(days: -5))
        .toString()
        .substring(0, 10)
        .replaceAll("-", "_"),
    DateTime.now()
        .add(Duration(days: -6))
        .toString()
        .substring(0, 10)
        .replaceAll("-", "_"),
  ];

  int initalDatelist(int n) {
    if (duration == n) {
      return 1;
    }
    duration = n;
    totaldate = DateTime.now();
    datelist = [];
    for (int i = 0; i < duration; i++) {
      var tmp = totaldate
          .add(Duration(days: -i))
          .toString()
          .substring(0, 10)
          .replaceAll("-", "_");
      datelist.add(tmp);
    }
    update();
    return 1;
  }

  void minusDatelist(int duration) {
    totaldate = totaldate.add(Duration(days: -duration));
    datelist = [];
    for (int i = 0; i < duration; i++) {
      var tmp = totaldate
          .add(Duration(days: -i))
          .toString()
          .substring(0, 10)
          .replaceAll("-", "_");
      datelist.add(tmp);
    }
    update();
  }

  void plusDatelist(int duration) {
    totaldate = totaldate.add(Duration(days: duration));
    datelist = [];
    for (int i = 0; i < duration; i++) {
      var tmp = totaldate
          .add(Duration(days: -i))
          .toString()
          .substring(0, 10)
          .replaceAll("-", "_");
      datelist.add(tmp);
    }
    update();
  }

  // void updateWeight(double value) {
  //   weightProfile = value;
  //   update();
  // }

//???????????????????????????
  DateTime MinusSevenDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 7);
  }

  DateTime MinusSixDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 6);
  }

  DateTime MinusFiveDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 5);
  }

  DateTime MinusFourDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 4);
  }

  DateTime MinusThreeDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 3);
  }

  DateTime MinusTwoDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 2);
  }

  DateTime MinusOneDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 1);
  }

//??????????????????
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

  // ???????????? ??????/?????? ?????????
  DateTime YYDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 2);
  }

  DateTime YDate(DateTime value) {
    return DateTime(date.year, date.month, date.day - 1);
  }

  int foodindex = 1;

  String food1 = "";
  String food2 = "";
  String food3 = "";

  String? gender = "????????????";
  String? birthday = '2002/06/21';
  String? weightday = DateTime.now().toString().substring(0, 10);
  String? height = '';
  String weight = '0.0';
  var weight_test = RxString('');
  String? disease = '';

  void foodindexSelected(int value) {
    foodindex = value;
    update();
  }

  void foodiSelected(int index, String value) {
    if (index == 1) {
      food1 = value;
    } else if (index == 2) {
      food2 = value;
    } else {
      food3 = value;
    }
    update();
  }

  void genderSelected(String value) {
    gender = value;
    update();
  }

  void birthdaySelected(String value) {
    birthday = value;
    update();
  }

  void weightdaySelected(String value) {
    weightday = value;
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

    var weight = await ServerConnection.GetWeight(
        FirebaseAuth.instance.currentUser!.uid);
    // print(weight["result"].last["weight"]);
    if (weight["result"] != '0') {
      weightSelected(weight["result"][0]["weight"]);
    }

    var birth = await ServerConnection.GetBirthDay(
        FirebaseAuth.instance.currentUser!.uid);
    birthdaySelected(birth);

    var disease = await ServerConnection.GetDisease(
        FirebaseAuth.instance.currentUser!.uid);
    // print(weight["result"].last["weight"]);
    if (disease != '0') {
      diseaseSelected(disease);
    }

    var gender = await ServerConnection.GetGender(
        FirebaseAuth.instance.currentUser!.uid);
    // print(weight["result"].last["weight"]);
    if (gender != '0') {
      genderSelected(gender);
    }

    var height = await ServerConnection.GetHeight(
        FirebaseAuth.instance.currentUser!.uid);
    // print(weight["result"].last["weight"]);
    if (height != '0') {
      heightSelected(height);
    }

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
      {required String uid, required File file, required String time}) async {
    print("food start");
    var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    print(length);
    var uri = Uri.parse(
        "http://kaistuser.iptime.org:8080/upload_food_image.php?uid=" +
            uid +
            "&photoURL=" +
            time);

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

  Future<void> updateProfile() async {
    print('gender');
    print(gender);
    print(birthday);
    print(height);
    print(disease == '');
    print(originMyProfile.uid);
    final response = disease == ''
        ? await http.get(Uri.parse(
            "http://kaistuser.iptime.org:8080/update_profile.php?uid=" +
                originMyProfile.uid! +
                '&gender=' +
                gender! +
                '&birthday=' +
                birthday! +
                '&height=' +
                height!))
        : await http.get(Uri.parse(
            "http://kaistuser.iptime.org:8080/update_profile.php?uid=" +
                originMyProfile.uid! +
                '&gender=' +
                gender! +
                '&birthday=' +
                birthday! +
                '&height=' +
                height! +
                '&disease=' +
                disease!));
  }
}
