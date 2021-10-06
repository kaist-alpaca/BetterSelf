import 'dart:io';

import 'package:get/get.dart';
import 'package:kakao_sample_profile/repository/firebase_user_repository.dart';
import 'package:kakao_sample_profile/repository/firestorage_repository.dart';
import 'package:kakao_sample_profile/src/controller/image_crop_controller.dart';
import 'package:kakao_sample_profile/src/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

enum ProfileImageType { THUMBNAIL, BACKGROUND }

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  RxBool isEditMyProfile = false.obs;
  UserModel originMyProfile = UserModel();
  Rx<UserModel> myProfile = UserModel().obs;
  FireStorageRepository _fireStorageRepository = FireStorageRepository();

  void authStateChanges(Object? firebaseUser) async {
    if (firebaseUser != null) {
      UserModel? userModel = await FirebaseUserRepository.findUserByUid(
          FirebaseAuth.instance.currentUser!.uid);
      if (userModel != null) {
        originMyProfile = userModel;
        FirebaseUserRepository.updateLastLoginDate(
          userModel.docId!,
          DateTime.now(),
        );
      } else {
        originMyProfile = UserModel(
          uid: FirebaseAuth.instance.currentUser!.uid,
          name: FirebaseAuth.instance.currentUser!.displayName,
          avatarUrl: FirebaseAuth.instance.currentUser!.photoURL,
          createdTime: DateTime.now(),
          lastLoginTime: DateTime.now(),
          discription: "",
        );
        String? docId = await FirebaseUserRepository.signup(originMyProfile);
        originMyProfile.docId = docId;
      }
    }
    myProfile(UserModel.clone(originMyProfile));
  }

  @override
  void onInit() {
    isEditMyProfile(false);

    super.onInit();
  }

  void toggleEditProfile() {
    isEditMyProfile(!isEditMyProfile.value);
  }

  void rollback() {
    myProfile.value.initImageFile();
    myProfile(originMyProfile);
    toggleEditProfile();
  }

  void updateName(String updateName) {
    myProfile.update((my) {
      my!.name = updateName;
    });
  }

  void updateDiscription(String updateDiscription) {
    myProfile.update((my) {
      my!.discription = updateDiscription;
    });
  }

  void pickImage(ProfileImageType type) async {
    if (!isEditMyProfile.value) return;
    File? file = await ImageCropController.to.selectImage(type);
    if (file == null) return;
    switch (type) {
      case ProfileImageType.THUMBNAIL:
        myProfile.update((my) => my?.avatarFile = file);
        break;
      case ProfileImageType.BACKGROUND:
        myProfile.update((my) => my?.backgroundFile = file);
        break;
    }
  }

  void _updateProfileImageUrl(String downloadUrl) {
    originMyProfile.avatarUrl = downloadUrl;
    myProfile.update((user) => user!.avatarUrl = downloadUrl);
  }

  void _updateBackgroundImageUrl(String downloadUrl) {
    originMyProfile.backgroundUrl = downloadUrl;
    myProfile.update((user) => user!.backgroundUrl = downloadUrl);
  }

  Future<void> save() async {
    originMyProfile = myProfile.value;

    if (originMyProfile.avatarFile != null) {
      await _fireStorageRepository.uploadImageFile(
          originMyProfile.uid!, "profile", originMyProfile.avatarFile!);
      _updateProfileImageUrl("http://kaistuser.iptime.org:8080/img/profile/" +
          originMyProfile.uid! +
          ".jpg");
      // FirebaseUserRepository.updateImageUrl(
      //     originMyProfile.uid!,
      //     "http://kaistuser.iptime.org:8080/img/profile/" +
      //         originMyProfile.uid! +
      //         ".jpg",
      //     "avatar_url");
    }

    if (originMyProfile.backgroundFile != null) {
      _fireStorageRepository.uploadImageFile(
          originMyProfile.uid!, "background", originMyProfile.avatarFile!);
      _updateBackgroundImageUrl(
          "http://kaistuser.iptime.org:8080/img/background/" +
              originMyProfile.uid! +
              ".jpg");
    }

    // if (originMyProfile.backgroundFile != null) {
    //   var task = _fireStorageRepository.uploadImageFile(
    //       originMyProfile.uid!, "background", originMyProfile.backgroundFile!);
    //   task.snapshotEvents.listen((event) async {
    //     if (event.bytesTransferred == event.totalBytes) {
    //       String downloadUrl = await event.ref.getDownloadURL();
    //       _updateBackgroundImageUrl(downloadUrl);
    //       FirebaseUserRepository.updateImageUrl(
    //           originMyProfile.docId!, downloadUrl, "background_url");
    //     }
    //   });
    // }

    FirebaseUserRepository.updateData(originMyProfile.docId!, originMyProfile);
    toggleEditProfile();
  }

  // void save() {
  //   originMyProfile = myProfile.value;

  //   print("!!!!!!!!!");
  //   print(originMyProfile.avatarFile!);

  //   if (originMyProfile.avatarFile != null) {
  //     //   print("!!!!!!!!!!!!!!!!!!!!!!!!");
  //     //   // UploadTask task = _fireStorageRepository.uploadImageFile(
  //     //   //     originMyProfile.uid!, "profile", originMyProfile.avatarFile!);
  //     //   // task.snapshotEvents.listen((event) {
  //     //   //   print(event.bytesTransferred);
  //     //   // });
  //     var task = _fireStorageRepository.uploadImageFile(
  //         originMyProfile.uid!, "profile", originMyProfile.avatarFile!);
  //     task.snapshotEvents.listen((event) async {
  //       print(event.bytesTransferred);
  //       if (event.bytesTransferred == event.totalBytes) {
  //         String downloadUrl = await event.ref.getDownloadURL();
  //         _updateProfileImageUrl(downloadUrl);
  //         FirebaseUserRepository.updateImageUrl(
  //             originMyProfile.docId!, downloadUrl, "avatar_url");
  //       }
  //     });
  //   }

  //   FirebaseUserRepository.updateData(originMyProfile.docId!, originMyProfile);
  //   toggleEditProfile();
  // }
}
