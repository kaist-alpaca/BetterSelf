import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/app.dart';
import 'src/controller/image_crop_controller.dart';
import 'src/controller/profile_controller.dart';
import 'src/pages/profile.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ImageCropper',
      theme: ThemeData.light().copyWith(primaryColor: Colors.white),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<ProfileController>(() => ProfileController());
        Get.lazyPut<ImageCropController>(() => ImageCropController());
      }),
      home: App(),
    );
  }
}
