import 'package:betterself_trainer/functions/Controllers/server_connection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
  // FirebaseMessaging _messaging = FirebaseMessaging();
  // FirebaseMessaging _messaging = FirebaseMessaging.instance;
  // RxMap<String, dynamic> message = Map<String, dynamic>().obs;

  // @override
  // void onInit() {
  //   _initNotification();
  //   _getToken();
  //   super.onInit();
  // }

  Future<void> initNotification({required String uid}) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.setAutoInitEnabled(true);

    // _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('token is');
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      print(token);
      if (token != null) {
        ServerConnection.fcm_token(uid: uid, token: token);
      }
    } catch (e) {}
    print('token check and uid is');

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print('Got a message whilst in the foreground!');
    //   print('Message data: ${message.data}');
    //   print('Message data: ${message}');

    //   if (message.notification != null) {
    //     print('Message also contained a notification: ${message.notification}');
    //   }
    // });
  }
}
