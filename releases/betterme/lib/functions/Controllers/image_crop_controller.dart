import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageCropController extends GetxController {
  static ImageCropController get to => Get.isRegistered<ImageCropController>()
      ? Get.find<ImageCropController>()
      : Get.put(ImageCropController());
  // static ImageCropController get to => Get.find();

  Future<File?> selectImage({required String type}) async {
    final pickedFile = type == "gallery"
        ? await ImagePicker().pickImage(source: ImageSource.gallery)
        : await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile == null) return null;
    return await _cropImage(File(pickedFile.path));
    // return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<File?> _cropImage(File file) async {
    List<CropAspectRatioPreset> presets = [];
    // [
    //   CropAspectRatioPreset.original,
    //   CropAspectRatioPreset.square,
    //   CropAspectRatioPreset.ratio3x2,
    //   CropAspectRatioPreset.ratio4x3,
    //   CropAspectRatioPreset.ratio5x3,
    //   CropAspectRatioPreset.ratio5x4,
    //   CropAspectRatioPreset.ratio7x5,
    //   CropAspectRatioPreset.ratio16x9
    // ],
    presets = [
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio5x3,
    ];
    File? croppedFile = await ImageCropper.cropImage(
        sourcePath: file.path,
        aspectRatioPresets: presets,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    return croppedFile;
  }
}
