import 'dart:convert';

// import 'package:health_kit_reporter/health_kit_reporter.dart';
// import 'package:health_kit_reporter/model/payload/device.dart';
// import 'package:health_kit_reporter/model/payload/quantity.dart';
// import 'package:health_kit_reporter/model/payload/source.dart';
// import 'package:health_kit_reporter/model/payload/source_revision.dart';
// import 'package:health_kit_reporter/model/predicate.dart';
// import 'package:health_kit_reporter/model/type/activity_summary_type.dart';
// import 'package:health_kit_reporter/model/type/category_type.dart';
// import 'package:health_kit_reporter/model/type/characteristic_type.dart';
// import 'package:health_kit_reporter/model/type/electrocardiogram_type.dart';
// import 'package:health_kit_reporter/model/type/quantity_type.dart';
// import 'package:health_kit_reporter/model/type/series_type.dart';
// import 'package:health_kit_reporter/model/type/workout_type.dart';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:betterme/functions/Encryption/Encryption.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:health_kit_reporter/health_kit_reporter.dart';
import 'package:health_kit_reporter/model/predicate.dart';
import 'package:health_kit_reporter/model/type/activity_summary_type.dart';
import 'package:health_kit_reporter/model/type/category_type.dart';
import 'package:health_kit_reporter/model/type/characteristic_type.dart';
import 'package:health_kit_reporter/model/type/electrocardiogram_type.dart';
import 'package:health_kit_reporter/model/type/quantity_type.dart';
import 'package:health_kit_reporter/model/type/series_type.dart';
import 'package:health_kit_reporter/model/type/workout_type.dart';

import 'TypeUserModel.dart';

class ServerConnection {
  static Future<UserModel?> findUserByUid(String uid) async {
    var userModel;
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/find_user_by_uid.php?uid=" + uid));
    var responseBody = utf8.decode(response.bodyBytes);

    Map<String, dynamic> list = json.decode(response.body);

    if (list['result'] == '0') {
      return null;
    }
    print("making usermodel");
    return UserModel(
      uid: uid,
      name: list['result']["user_name"],
      email: list['result']["email"],
      profileUrl:
          "http://kaistuser.iptime.org:8080/img/profile/" + uid + ".jpg",
    );
  }

  static Future<Map<String, dynamic>> GetEnergyburned(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/get_energyburned.php?uid=" + uid));
    print("debug : getEnergyBurned");
    return Map<String, dynamic>.from(json.decode(response.body));
  }

  static Future<Map<String, dynamic>> GetStress(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/get_stress.php?uid=" + uid));
    print("debug : getStress");
    return Map<String, dynamic>.from(json.decode(response.body));
  }

  static Future<Map<String, dynamic>> GetWeight(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/get_weight.php?uid=" + uid));
    print("debug : getWeight");
    return Map<String, dynamic>.from(json.decode(response.body));
  }

  static Future<String> GetBirthDay(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/get_birthday.php?uid=" + uid));
    return (json.decode(response.body));
  }

  static Future<String> GetDisease(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/get_disease.php?uid=" + uid));
    return (json.decode(response.body));
  }

  static Future<String> GetGender(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/get_gender.php?uid=" + uid));
    return (json.decode(response.body));
  }

  static Future<String> GetHeight(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/get_height.php?uid=" + uid));
    return (json.decode(response.body));
  }

  static Future<void> uploadProfileImage(String uid, String photoURL) async {
    await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/upload_image.php?uid=" +
            uid +
            "&photoURL=" +
            photoURL));
  }

  static Future<void> uploadWeight(
      String uid, String startDate, double startTime, double weight) async {
    print('upload_weight');
    print(uid);
    print(startDate);
    print(startTime);
    print(weight);
    await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/upload_weight.php?uid=" +
            uid +
            "&startDate=" +
            startDate +
            "&startTime=" +
            startTime.toString() +
            "&weight=" +
            weight.toString()));
  }

  static Future<void> createUser(
    String uid,
    String email,
    String userName,
  ) async {
    await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/create_user.php?uid=" +
            uid +
            "&email=" +
            email +
            "&user_name=" +
            userName));
  }

  static Future<String> AuthSignedUser(String uid) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/check_user_by_uid.php?uid=" + uid));
    print("check user");
    print(json.decode(response.body));
    return json.decode(response.body).toString();
  }

  static Future<String> checkFoodPhoto(String uid, String photoURL) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/check_food_uid.php?uid=" +
            uid +
            "&photoURL=" +
            photoURL));
    print("checkfoodphto !!!!!!!!!!!!!!");
    print(json.decode(response.body));
    return json.decode(response.body).toString();
  }

  static Future<String> save_food(String uid, List food, argument) async {
    var data = [];
    // if (num != 31) {
    //   for (int i = 0; i < num; i++) {
    //     var tmp = DateTime.now()
    //         .add(Duration(days: -i))
    //         .toString()
    //         .substring(0, 10)
    //         .replaceAll("-", "_");
    //     print(tmp);
    //     date.add(tmp);
    //   }
    // } else {}
    food.forEach((e) {
      var map = {};
      print(e[0]);
      print(e[1]);
      print(e[2][0]);
      print(e[2][1] * e[3]);
      data.add([
        e[0].toString().substring(0, 10).replaceAll("-", "_"),
        e[0].toString(),
        e[1],
        e[2][0],
        e[2][1] * e[3]
      ]);
    });
    print(food.length);
    print(data);
    var temp;
    if (argument == '0') {
      temp = '0';
    } else {
      temp = '1';
    }
    print("dsiofjsdoijfidsjfdsjfsdj!!!!!!!!!!!!!!");
    print(argument);
    print("dsiofjsdoijfidsjfdsjfsdj!!!!!!!!!!!!!!");
    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'upload_food.php'),
      body: <String, String>{
        'uid': uid, //서버에 post key : 보내는 값
        'data': json.encode(data),
        'date': temp,
        // 'data': json.encode(data.toString())
        // 'data': data.toString()
      },
    );
    print(json.decode(response.body));
    return (json.decode(response.body));
  }

  static Future<List<dynamic>> total_weight(
      String uid, List<dynamic> date) async {
    final key_list = await Encryption.create_aes_key();
    final aes_key_encrypt_rsa = await Encryption.encrypt_rsa(text: key_list[1]);

    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_weight.php'),
      body: <String, String>{
        'key': aes_key_encrypt_rsa,
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    return List<dynamic>.from(json.decode(
        await Encryption.decrypt_aes(text: response.body, key: key_list[0])));
  }

  static Future<List<dynamic>> total_sleep(
      String uid, List<dynamic> date) async {
    final key_list = await Encryption.create_aes_key();
    final aes_key_encrypt_rsa = await Encryption.encrypt_rsa(text: key_list[1]);

    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_sleep.php'),
      body: <String, String>{
        'key': aes_key_encrypt_rsa,
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    return List<dynamic>.from(json.decode(
        await Encryption.decrypt_aes(text: response.body, key: key_list[0])));
  }

  static Future<List<dynamic>> total_stress(
      String uid, List<dynamic> date) async {
    final key_list = await Encryption.create_aes_key();
    final aes_key_encrypt_rsa = await Encryption.encrypt_rsa(text: key_list[1]);

    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_stress.php'),
      body: <String, String>{
        'key': aes_key_encrypt_rsa,
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    return List<dynamic>.from(json.decode(
        await Encryption.decrypt_aes(text: response.body, key: key_list[0])));
  }

  static Future<List<dynamic>> total_food(
      String uid, List<dynamic> date) async {
    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_food.php'),
      body: <String, String>{
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    return List<dynamic>.from(json.decode(response.body));
  }

  static Future<List<dynamic>> total_burned(
      String uid, List<dynamic> date) async {
    // print('showing date');
    // print(date);
    final key_list = await Encryption.create_aes_key();
    final aes_key_encrypt_rsa = await Encryption.encrypt_rsa(text: key_list[1]);

    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_burned.php'),
      body: <String, String>{
        'key': aes_key_encrypt_rsa,
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    print(response.body);
    return List<dynamic>.from(json.decode(
        await Encryption.decrypt_aes(text: response.body, key: key_list[0])));
  }

  static Future<List<dynamic>> total_seven_sleep(
      String uid, List<dynamic> date) async {
    final key_list = await Encryption.create_aes_key();
    final aes_key_encrypt_rsa = await Encryption.encrypt_rsa(text: key_list[1]);

    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_seven_sleep.php'),
      body: <String, String>{
        'key': aes_key_encrypt_rsa,
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    return List<dynamic>.from(json.decode(
        await Encryption.decrypt_aes(text: response.body, key: key_list[0])));
  }

  static Future<List<dynamic>> total_seven_food(
      String uid, List<dynamic> date) async {
    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'total_seven_food.php'),
      body: <String, String>{
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(date)
      },
    );
    return List<dynamic>.from(json.decode(response.body));
  }

  static Future<List<dynamic>> get_food_by_date(
      String uid, DateTime date) async {
    final query = Uri.parse(
        "http://kaistuser.iptime.org:8080/get_food_by_date.php?uid=" +
            uid +
            "&startDate=" +
            date.toString().substring(0, 10).replaceAll("-", "_"));
    print("debug : $query");
    final response = await http.get(query);
    return json.decode(response.body);
  }

  static Future<List<dynamic>> total_workout(String uid, DateTime date) async {
    var dateStr = date.toString().substring(0, 10).replaceAll("-", "_");

    List<String> dateStrs = [];

    dateStrs.add(dateStr);

    final response = await http.post(
      Uri.http('kaistuser.iptime.org:8080', 'get_workout_by_date.php'),
      body: <String, String>{
        'uid': uid, //서버에 post key : 보내는 값
        'date': json.encode(dateStrs)
      },
    );
    return List<dynamic>.from(json.decode(response.body));
  }

  static Future<String> updateHeathData(String uid) async {
    // final response = await http.get(Uri.parse(
    //     "http://kaistuser.iptime.org:8080/healthData_get_lastupdate.php?uid=alpaca"));
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/healthData_get_lastupdate.php?uid=" +
            uid));
    // var responseBody = utf8.decode(response.bodyBytes);
    // List<dynamic> list = jsonDecode(responseBody);
    // var list = jsonDecode(response.body);
    // Map<String, dynamic> list = json.decode(response.body);
    // print("!!!!!!!!!!!!!!!!!!!");
    // print(list);
    // print(list['result']);
    // print(list['result']['uid']);
    print(json.decode(response.body));
    String lastupdate = json.decode(response.body).toString();

    final response_workout = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/healthData_get_workout_last.php?uid=" +
            uid));
    String lastupdate_workout = json.decode(response_workout.body).toString();
    DateTime start;
    if (lastupdate == "0") {
      print("update date is none");
      start = DateTime.now().add(Duration(days: -400));
      // start = DateTime.now().add(Duration(days: -10));
    } else {
      print("update date is not none");
      start = DateTime.parse(lastupdate);
      // start = DateTime.now();
      // start = DateTime.now().add(Duration(days: -20));
    }
    DateTime now = DateTime.now();
    final _predicate = Predicate(
      start,
      // DateTime.now().add(Duration(days: -365 * 2)),
      // lastupdate.,
      now,
    );
    var _predicate_workout;
    if (lastupdate_workout != "0" &&
        int.parse(DateTime.fromMicrosecondsSinceEpoch(
                    (double.parse(lastupdate_workout) * 1000000).toInt())
                .difference(start)
                .inDays
                .toString()) <
            0) {
      print('need to');
      _predicate_workout = Predicate(
        DateTime.fromMicrosecondsSinceEpoch(
            (double.parse(lastupdate_workout) * 1000000).toInt()),
        // DateTime.now().add(Duration(days: -365 * 2)),
        // lastupdate.,
        now,
      );
    } else {
      print('do not need to');
      _predicate_workout = Predicate(
        start,
        // DateTime.now().add(Duration(days: -365 * 2)),
        // lastupdate.,
        now,
      );
    }
    print(_predicate_workout);
    bool _isAuthorizationRequested = false;
    try {
      final readTypes = <String>[];
      readTypes.addAll(ActivitySummaryType.values.map((e) => e.identifier));
      readTypes.addAll(CategoryType.values.map((e) => e.identifier));
      readTypes.addAll(CharacteristicType.values.map((e) => e.identifier));
      readTypes.addAll(QuantityType.values.map((e) => e.identifier));
      readTypes.addAll(WorkoutType.values.map((e) => e.identifier));
      readTypes.addAll(SeriesType.values.map((e) => e.identifier));
      readTypes.addAll(ElectrocardiogramType.values.map((e) => e.identifier));
      final writeTypes = <String>[
        // QuantityType.stepCount.identifier,
        QuantityType.bodyMass.identifier,
        // WorkoutType.workoutType.identifier,
        // CategoryType.sleepAnalysis.identifier,
        // CategoryType.mindfulSession.identifier,
      ];
      final isRequested =
          await HealthKitReporter.requestAuthorization(readTypes, writeTypes);
      _isAuthorizationRequested = isRequested;
    } catch (e) {
      print(e);
      print("error...?");
    }
    try {
      // var activityData = [];
      // if (lastupdate == "0") {
      //   final appleHealthActivity = await HealthKitReporter.sampleQuery(
      //       QuantityType.activeEnergyBurned.identifier,
      //       Predicate(start.add(Duration(days: -10)), start));
      //   // print(samples2.map((e) => e.map).toList()[0]);
      //   for (final q in appleHealthActivity) {
      //     var map = {};
      //     map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
      //     map['endTime'] = '${json.encode(q.map["endTimestamp"])}';
      //     map['calorie'] = '${json.encode(q.map["harmonized"]["value"])}';
      //     activityData.add(map);
      //   }
      // } else {
      //   final appleHealthActivity = await HealthKitReporter.sampleQuery(
      //       QuantityType.activeEnergyBurned.identifier, _predicate);
      //   // print(samples2.map((e) => e.map).toList()[0]);
      //   for (final q in appleHealthActivity) {
      //     var map = {};
      //     map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
      //     map['endTime'] = '${json.encode(q.map["endTimestamp"])}';
      //     map['calorie'] = '${json.encode(q.map["harmonized"]["value"])}';
      //     activityData.add(map);
      //   }
      // }
      final key_list = await Encryption.create_aes_key();
      final aes_key_encrypt_rsa =
          await Encryption.encrypt_rsa(text: key_list[1]);

      var activitySummaryData = [];
      final appleHealthactivitySummary =
          await HealthKitReporter.queryActivitySummary(_predicate);
      for (final q in appleHealthactivitySummary) {
        // print('q: ${json.encode(q.map)} \n');
        // print(json.encode(q.map["date"]).substring(1, 11).replaceAll("-", "_"));
        // print(json.encode(q.map["harmonized"]["activeEnergyBurned"]));
        // print(json.encode(q.map["harmonized"]["activeEnergyBurnedGoal"]));
        var map = {};
        // map['startTime'] =
        //     '${json.encode(q.map["date"]).substring(1, 11).replaceAll("-", "_")}';
        map['startTime'] = await Encryption.encrypt_sha(
            text:
                '${json.encode(q.map["date"]).substring(1, 11).replaceAll("-", "_")}');
        map['activeEnergyBurned'] = await Encryption.encrypt_rsa(
            text:
                '${json.encode(q.map["harmonized"]["activeEnergyBurned"].round())}');
        map['activeEnergyBurnedGoal'] = await Encryption.encrypt_rsa(
            text:
                '${json.encode(q.map["harmonized"]["activeEnergyBurnedGoal"].round())}');

        activitySummaryData.add(map);
      }

      // var sleepData = [];
      // var tmp = [];
      // final appleHealthSleep = await HealthKitReporter.categoryQuery(
      //     CategoryType.sleepAnalysis, _predicate);
      // for (final q in appleHealthSleep) {
      //   var map = {};
      //   map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
      //   map['endTime'] = '${json.encode(q.map["endTimestamp"])}';
      //   if (!tmp.contains(map.toString())) {
      //     sleepData.add(map);
      //     tmp.add(map.toString());
      //   }
      // }

      var sleepData = [];
      var sleepDataSpecific = [];
      var tmp = [];
      final appleHealthSleep = await HealthKitReporter.categoryQuery(
          CategoryType.sleepAnalysis, _predicate);
      for (final q in appleHealthSleep) {
        var map = {};
        var map2 = {};
        // var startTime = '${json.encode(q.map["startTimestamp"])}';
        int startTime = (q.map["startTimestamp"].toInt());
        int endTime = q.map["endTimestamp"].toInt();
        var temp = startTime.toString() + '/' + endTime.toString();
        map['endTime'] =
            DateTime.fromMillisecondsSinceEpoch((endTime * 1000).toInt())
                .toString()
                .substring(0, 10)
                .replaceAll("-", "_");
        map['period'] = ((endTime - startTime) ~/ 60).toString();

        map2['startTime'] =
            DateTime.fromMillisecondsSinceEpoch((startTime * 1000).toInt())
                .toString();
        map2['endTime'] =
            DateTime.fromMillisecondsSinceEpoch((endTime * 1000).toInt())
                .toString();
        // print(DateTime.fromMillisecondsSinceEpoch((endTime * 1000).toInt())
        //     .toString());
        map2['startDate'] =
            DateTime.fromMillisecondsSinceEpoch((startTime * 1000).toInt())
                .toString()
                .substring(0, 10)
                .replaceAll("-", "_");
        map2['endDate'] =
            DateTime.fromMillisecondsSinceEpoch((endTime * 1000).toInt())
                .toString()
                .substring(0, 10)
                .replaceAll("-", "_");
        // print(endTime.runtimeType);
        if (!tmp.contains(temp)) {
          // sleepData.add(map);
          tmp.add(temp);
          // print(map);
          sleepDataSpecific.add(map2);
          if (sleepData.isNotEmpty &&
              sleepData.last["endTime"] == map['endTime']) {
            // print("same");
            // print(sleepData.last["endTime"]);
            sleepData.last["period"] =
                (int.parse(sleepData.last["period"]) + int.parse(map["period"]))
                    .toString();
          } else {
            // print("not same");
            sleepData.add(map);
          }
        }
      }

      for (final q in sleepData) {
        q['endTime'] = await Encryption.encrypt_sha(text: q['endTime']);
        q['period'] = await Encryption.encrypt_rsa(text: q['period']);
      }
      for (final q in sleepDataSpecific) {
        q['startDate'] = await Encryption.encrypt_sha(text: q['startDate']);
        q['endDate'] = await Encryption.encrypt_sha(text: q['endDate']);
        q['startTime'] = await Encryption.encrypt_rsa(text: q['startTime']);
        q['endTime'] = await Encryption.encrypt_rsa(text: q['endTime']);
      }

      var stressData = [];
      var mapHR = {};
      double stress;
      final appleHealthHR = await HealthKitReporter.sampleQuery(
          QuantityType.heartRate.identifier, _predicate);
      // print(samples2.map((e) => e.map).toList()[0]);
      for (final q in appleHealthHR) {
        // print('q: ${json.encode(q.map["harmonized"]["value"])} \n');
        mapHR['${json.encode(q.map["startTimestamp"])}'] =
            '${json.encode(q.map["harmonized"]["value"])}';
      }
      final appleHealthSDNN = await HealthKitReporter.sampleQuery(
          QuantityType.heartRateVariabilitySDNN.identifier, _predicate);
      for (final q in appleHealthSDNN) {
        var map = {};
        if (mapHR[json.encode(q.map["startTimestamp"])] != null) {
          stress =
              double.parse('${mapHR[json.encode(q.map["startTimestamp"])]}') -
                  double.parse('${json.encode(q.map["harmonized"]["value"])}') *
                      0.4;
          map['startDate'] = await Encryption.encrypt_sha(
              text: DateTime.fromMillisecondsSinceEpoch(
                      (q.map["startTimestamp"].toInt() * 1000).toInt())
                  .toString()
                  .substring(0, 10)
                  .replaceAll("-", "_"));
          map['startTime'] = await Encryption.encrypt_rsa(
              text: '${json.encode(q.map["startTimestamp"])}');
          map['stress'] = await Encryption.encrypt_rsa(text: stress.toString());
          stressData.add(map);
        }
      }

      var weightData = [];
      // print('weight!!!');
      final appleHealthWeight = await HealthKitReporter.sampleQuery(
          QuantityType.bodyMass.identifier, _predicate);
      for (final q in appleHealthWeight) {
        var map = {};
        // print('q: ${json.encode(q.map)} \n');
        // print(
        //     'q: ${json.encode(q.map["startTimestamp"])} ${json.encode(q.map["harmonized"]["value"])} kg \n');
        map['startDate'] = await Encryption.encrypt_sha(
            text: DateTime.fromMillisecondsSinceEpoch(
                    (q.map["startTimestamp"].toInt() * 1000).toInt())
                .toString()
                .substring(0, 10)
                .replaceAll("-", "_"));
        map['startTime'] = await Encryption.encrypt_rsa(
            text: '${json.encode(q.map["startTimestamp"])}');
        map['weight'] = await Encryption.encrypt_rsa(
            text: '${json.encode(q.map["harmonized"]["value"])}');
        // print('q: ${json.encode(q.map["harmonized"]["value"])} \n');
        weightData.add(map);
      }

      var workoutsData = [];
      final appleHealthWorkouts =
          await HealthKitReporter.workoutQuery(_predicate_workout);
      // print('workouts: ${workouts.map((e) => e.map).toList()}');
      for (final q in appleHealthWorkouts) {
        var map = {};
        // print('q: ${json.encode(q.map)} \n');
        // print('q: ${json.encode(q.map["startTimestamp"])}');
        // print('q: ${json.encode(q.map["endTimestamp"])}');
        // print('q: ${json.encode(q.map["duration"])}');
        // print('q: ${json.encode(q.map["harmonized"]["description"])}');
        // print('q: ${json.encode(q.map["harmonized"]["totalEnergyBurned"])}');
        // print(
        //     'q: ${json.encode(q.map["harmonized"]["totalEnergyBurnedUnit"])}');
        map['startDate'] = await Encryption.encrypt_sha(
            text: DateTime.fromMillisecondsSinceEpoch(
                    (q.map["startTimestamp"].toInt() * 1000).toInt())
                .toString()
                .substring(0, 10)
                .replaceAll("-", "_"));
        map['startTime'] = await Encryption.encrypt_rsa(
            text: '${json.encode(q.map["startTimestamp"])}');
        map['endTime'] = await Encryption.encrypt_rsa(
            text: '${json.encode(q.map["endTimestamp"])}');
        map['type'] = await Encryption.encrypt_rsa(
            text: '${json.encode(q.map["harmonized"]["description"])}'
                .replaceAll('"', ''));
        map['calorie'] = await Encryption.encrypt_rsa(
            text: '${json.encode(q.map["harmonized"]["totalEnergyBurned"])}');
        workoutsData.add(map);
      }

      String checker = lastupdate == "0" ? "0" : "1";

      // final response = await http.post(
      //   Uri.http('kaistuser.iptime.org:8080',
      //       'upload_healthData.php'), // ex ) http://123.0.0.0/test
      //   body: <String, String>{
      //     'uid': uid, //서버에 post key : 보내는 값
      //     'checkUser': checker,
      //     'lastupdate': now.toString(),
      //     // 'activityData': json.encode(activityData),
      //     'activitySummaryData': json.encode(activitySummaryData),
      //     'sleepData': json.encode(List.from(sleepData.reversed)),
      //     'sleepDataSpecific':
      //         json.encode(List.from(sleepDataSpecific.reversed)),
      //     'stressData': json.encode(List.from(stressData.reversed)),
      //     'weightData': json.encode(List.from(weightData.reversed)),
      //     'workoutsData': json.encode(List.from(workoutsData.reversed))
      //   },
      // );

      // final key_list = await Encryption.create_aes_key();
      // final aes_key_encrypt_rsa =
      //     await Encryption.encrypt_rsa(text: key_list[1]);

      final response_with_encryption = await http.post(
        Uri.http('kaistuser.iptime.org:8080',
            'upload_healthData_encryption.php'), // ex ) http://123.0.0.0/test
        body: <String, String>{
          'key': aes_key_encrypt_rsa,
          // 'uid': uid, //서버에 post key : 보내는 값
          'uid': await Encryption.encrypt_aes_json_encoded(
              text: uid, key: key_list[0]),
          'checkUser': checker,
          'lastupdate': now.toString(),
          // 'activitySummaryData': json.encode(activitySummaryData),
          'activitySummaryData': await Encryption.encrypt_aes_json_encoded(
              text: json.encode(activitySummaryData), key: key_list[0]),
          'sleepData': await Encryption.encrypt_aes_json_encoded(
              text: json.encode(List.from(sleepData.reversed)),
              key: key_list[0]),
          'sleepDataSpecific': await Encryption.encrypt_aes_json_encoded(
              text: json.encode(List.from(sleepDataSpecific.reversed)),
              key: key_list[0]),
          'stressData': await Encryption.encrypt_aes_json_encoded(
              text: json.encode(List.from(stressData.reversed)),
              key: key_list[0]),
          'weightData': await Encryption.encrypt_aes_json_encoded(
              text: json.encode(List.from(weightData.reversed)),
              key: key_list[0]),
          'workoutsData': await Encryption.encrypt_aes_json_encoded(
              text: json.encode(List.from(workoutsData.reversed)),
              key: key_list[0])
        },
      );
      // print(response_with_encryption.request);
      print(json.decode(response_with_encryption.body));

      // print("post test");
      // print(json.decode(response.body));
      // print(stressData);
      // final canWrite = await HealthKitReporter.isAuthorizedToWrite(
      //     QuantityType.bodyMass.identifier);
      // if (canWrite) {
      //   final _device = Device(
      //     'FlutterTracker',
      //     'kvs',
      //     'T-800',
      //     '3',
      //     '3.0',
      //     '1.1.1',
      //     'kvs.sample.app',
      //     '444-888-555',
      //   );
      // final _source = Source(
      //   'myApp',
      //   'com.kvs.health_kit_reporter_example',
      // );
      // final _operatingSystem = OperatingSystem(
      //   1,
      //   2,
      //   3,
      // );

      // SourceRevision _sourceRevision = SourceRevision(
      //   _source,
      //   '5',
      //   'fit',
      //   '4',
      //   _operatingSystem,
      // );
      // final _sourceRevision = SourceRevision(
      //   _source,
      //   '5',
      //   'fit',
      //   '4',
      //   _operatingSystem,
      // );
      // final now = DateTime.now().add(Duration(minutes: -1));
      // final minuteAgo = now.add(Duration(minutes: -1));
      // final harmonized = QuantityHarmonized(80, 'kg', null);
      // final weight = Quantity(
      //     'testStepsUUID',
      //     QuantityType.bodyMass.identifier,
      //     now.millisecondsSinceEpoch,
      //     now.millisecondsSinceEpoch,
      //     _device,
      //     _sourceRevision,
      //     harmonized);
      // print('try to save: ${weight.map}');
      // final saved = await HealthKitReporter.save(weight);
      // final now = DateTime.now();
      // final minuteAgo = now.add(Duration(minutes: -1));
      // final harmonized = QuantityHarmonized(100, 'count', null);
      // final steps = Quantity(
      //     'testStepsUUID',
      //     QuantityType.stepCount.identifier,
      //     minuteAgo.millisecondsSinceEpoch,
      //     now.millisecondsSinceEpoch,
      //     _device,
      //     _sourceRevision,
      //     harmonized);
      // print('try to save: ${steps.map}');
      // final saved = await HealthKitReporter.save(steps);
      // print('stepsSaved: $saved');
      // print('stepsWeight: $saved');
      // } else {
      //   print('error canWrite weight: $canWrite');
      // }
    } catch (e) {
      print(
          "the problem might happen because you do not have apple health on your device");
      print(e);
    }
    return lastupdate;
  }

  static Future<void> write_log(
      String log, String click, String move_to) async {
    String uid = ProfileController.to.originMyProfile.uid!;

    print('wrtie log');
    print(uid);
    print(log);
    print(click);
    print(move_to);

    http.get(Uri.parse("http://kaistuser.iptime.org:8080/write_log.php?uid=" +
        uid +
        "&log=" +
        log +
        "&click=" +
        click +
        "&move_to=" +
        move_to));
  }

  static Future<void> fcm_token(
      {required String uid, required String token}) async {
    http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/upload_fcm_token.php?uid=" +
            uid +
            "&token=" +
            token));
  }

  static Future<String> get_uid_by_email({required String email}) async {
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/get_uid_by_email.php?email=" +
            email));
    return json.decode(response.body).toString();
  }

  static Future<void> fcm_chat(
      {required String trainer_uid,
      required String chat,
      required String namechatwith,
      required String usernamechatwith}) async {
    String uid = ProfileController.to.originMyProfile.uid!;
    String name = ProfileController.to.originMyProfile.name!;
    http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/send_fcm.php?send_uid=" +
            uid +
            "&send_name=" +
            name +
            "&to_uid=" +
            trainer_uid +
            "&namechatwith=" +
            namechatwith +
            "&usernamechatwith=" +
            usernamechatwith +
            "&chat=" +
            chat +
            "&type=fcm_chat"));
  }

  static Future<void> app_badge_count({required String trainer_uid}) async {
    String uid = ProfileController.to.originMyProfile.uid!;
    final response = await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/app_badge_count.php?send_uid=" +
            trainer_uid +
            "&to_uid=" +
            uid +
            "&type=fcm_chat"));
    FlutterAppBadger.updateBadgeCount(json.decode(response.body));
  }
}
