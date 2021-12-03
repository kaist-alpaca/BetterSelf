import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'betterself_trainer/login/functions/SyncFB.dart';
import 'functions/Controllers/image_crop_controller.dart';
import 'functions/Controllers/notification_controller.dart';
import 'functions/Controllers/profile_controller.dart';

// void main() => runApp(new MyApp());
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
  print('Message data: ${message.data}');
}

void main() {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
        Get.put(NotificationController());
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
