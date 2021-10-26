import 'dart:io';
import 'package:get/get.dart';
import 'package:betterme/src/controller/image_crop_controller.dart';
import 'package:betterme/src/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'server_connection.dart';

enum ProfileImageType { THUMBNAIL, BACKGROUND }

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  RxBool isEditMyProfile = false.obs;
  UserModel originMyProfile = UserModel();
  Rx<UserModel> myProfile = UserModel().obs;

  DateTime date = DateTime.now();

  void dateMinus(DateTime value) {
    date = date.subtract(Duration(days: 1));
    update();
  }

  void datePlus(DateTime value) {
    date = date.add(Duration(days: 1));
    update();
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
    if (firebaseUser != null) {
      UserModel? userModel = await ServerConnection.findUserByUid(
          FirebaseAuth.instance.currentUser!.uid);
      if (userModel != null) {
        print("usermodel is not null");
        originMyProfile = userModel;
      } else {
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
    return FirebaseAuth.instance.currentUser == null
        ? ''
        : FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> pickImage() async {
    File? file = await ImageCropController.to.selectImage();
    if (file == null) return;
    myProfile.update((my) => my?.profileImage = file);
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
}
