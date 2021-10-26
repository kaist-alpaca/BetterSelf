import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/app.dart';
import 'src/controller/image_crop_controller.dart';
import 'src/controller/profile_controller.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

// void main() => runApp(new MyApp());
void main() {
  runApp(
    /// 1. Wrap your App widget in the Phoenix widget
    Phoenix(
      child: BetterMe(),
    ),
  );
}

class BetterMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ImageCropper',
      theme: ThemeData.light().copyWith(primaryColor: Colors.white),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<ProfileController>(() => ProfileController());
        Get.lazyPut<ImageCropController>(() => ImageCropController());
      }),
      home: SyncFB(),
    );
  }
}
