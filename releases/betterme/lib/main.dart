import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'betterme/login/functions/SyncFB.dart';
import 'functions/Controllers/image_crop_controller.dart';
import 'functions/Controllers/profile_controller.dart';

// void main() => runApp(new MyApp());
void main() {
  runApp(
    /// 1. Wrap your App widget in the Phoenix widget
    Phoenix(
      child: BetterSelf(),
    ),
  );
}

class BetterSelf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ImageCropper',
      theme: ThemeData.light().copyWith(primaryColor: Colors.white),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<ProfileController>(() => ProfileController());
        Get.lazyPut<ImageCropController>(() => ImageCropController());
      }),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: SyncFB(),
    );
  }
}
