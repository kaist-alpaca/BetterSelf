import 'dart:convert';
import 'dart:io';

import 'package:health_kit_reporter/health_kit_reporter.dart';
import 'package:health_kit_reporter/model/predicate.dart';
import 'package:health_kit_reporter/model/type/activity_summary_type.dart';
import 'package:health_kit_reporter/model/type/category_type.dart';
import 'package:health_kit_reporter/model/type/characteristic_type.dart';
import 'package:health_kit_reporter/model/type/electrocardiogram_type.dart';
import 'package:health_kit_reporter/model/type/quantity_type.dart';
import 'package:health_kit_reporter/model/type/series_type.dart';
import 'package:health_kit_reporter/model/type/workout_type.dart';
import 'package:http/http.dart' as http;

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
      name: list['result']["name"],
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

  static Future<void> uploadProfileImage(String uid, String photoURL) async {
    await http.get(Uri.parse(
        "http://kaistuser.iptime.org:8080/upload_image.php?uid=" +
            uid +
            "&photoURL=" +
            photoURL));
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
    DateTime start;
    if (lastupdate == "0") {
      print("update date is none");
      start = DateTime.now().add(Duration(days: -400));
      // start = DateTime.now().add(Duration(days: -10));
    } else {
      print("update date is not none");
      // start = DateTime.parse(lastupdate);
      start = DateTime.now();
      // start = DateTime.now().add(Duration(days: -20));
    }
    DateTime now = DateTime.now();
    final _predicate = Predicate(
      start,
      // DateTime.now().add(Duration(days: -365 * 2)),
      // lastupdate.,
      now,
    );
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
        QuantityType.stepCount.identifier,
        WorkoutType.workoutType.identifier,
        CategoryType.sleepAnalysis.identifier,
        CategoryType.mindfulSession.identifier,
      ];
      final isRequested =
          await HealthKitReporter.requestAuthorization(readTypes, writeTypes);
      _isAuthorizationRequested = isRequested;
    } catch (e) {
      print(e);
      print("error...?");
    }
    try {
      var activityData = [];
      final appleHealthActivity = await HealthKitReporter.sampleQuery(
          QuantityType.activeEnergyBurned.identifier, _predicate);
      // print(samples2.map((e) => e.map).toList()[0]);
      for (final q in appleHealthActivity) {
        var map = {};
        map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
        map['endTime'] = '${json.encode(q.map["endTimestamp"])}';
        map['calorie'] = '${json.encode(q.map["harmonized"]["value"])}';
        activityData.add(map);
      }

      var activitySummaryData = [];
      final appleHealthactivitySummary =
          await HealthKitReporter.queryActivitySummary(_predicate);
      for (final q in appleHealthactivitySummary) {
        // print('q: ${json.encode(q.map)} \n');
        // print(json.encode(q.map["date"]).substring(1, 11).replaceAll("-", "_"));
        // print(json.encode(q.map["harmonized"]["activeEnergyBurned"]));
        // print(json.encode(q.map["harmonized"]["activeEnergyBurnedGoal"]));
        var map = {};
        map['startTime'] =
            '${json.encode(q.map["date"]).substring(1, 11).replaceAll("-", "_")}';
        map['activeEnergyBurned'] =
            '${json.encode(q.map["harmonized"]["activeEnergyBurned"])}';
        map['activeEnergyBurnedGoal'] =
            '${json.encode(q.map["harmonized"]["activeEnergyBurnedGoal"])}';
        activitySummaryData.add(map);
      }

      var sleepData = [];
      var tmp = [];
      final appleHealthSleep = await HealthKitReporter.categoryQuery(
          CategoryType.sleepAnalysis, _predicate);
      for (final q in appleHealthSleep) {
        var map = {};
        map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
        map['endTime'] = '${json.encode(q.map["endTimestamp"])}';
        if (!tmp.contains(map.toString())) {
          sleepData.add(map);
          tmp.add(map.toString());
        }
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
          map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
          map['stress'] = stress.toString();
          stressData.add(map);
        }
      }

      var weightData = [];
      final appleHealthWeight = await HealthKitReporter.sampleQuery(
          QuantityType.bodyMass.identifier, _predicate);
      for (final q in appleHealthWeight) {
        var map = {};
        // print('q: ${json.encode(q.map)} \n');
        // print(
        //     'q: ${json.encode(q.map["startTimestamp"])} ${json.encode(q.map["harmonized"]["value"])} kg \n');
        map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
        map['weight'] = '${json.encode(q.map["harmonized"]["value"])}';
        // print('q: ${json.encode(q.map["harmonized"]["value"])} \n');
        weightData.add(map);
      }

      var workoutsData = [];
      final appleHealthWorkouts =
          await HealthKitReporter.workoutQuery(_predicate);
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
        map['startTime'] = '${json.encode(q.map["startTimestamp"])}';
        map['endTime'] = '${json.encode(q.map["endTimestamp"])}';
        map['type'] = '${json.encode(q.map["harmonized"]["description"])}'
            .replaceAll('"', '');
        map['calorie'] =
            '${json.encode(q.map["harmonized"]["totalEnergyBurned"])}';
        workoutsData.add(map);
      }

      String checker = lastupdate == "0" ? "0" : "1";

      final response = await http.post(
        Uri.http('kaistuser.iptime.org:8080',
            'upload_healthData.php'), // ex ) http://123.0.0.0/test
        body: <String, String>{
          'uid': uid, //서버에 post key : 보내는 값
          'checkUser': checker,
          'lastupdate': now.toString(),
          'activityData': json.encode(activityData),
          'activitySummaryData': json.encode(activitySummaryData),
          'sleepData': json.encode(sleepData),
          'stressData': json.encode(stressData),
          'weightData': json.encode(weightData),
          'workoutsData': json.encode(workoutsData)
        },
      );
      // print("post test");
      // print(json.decode(response.body));
      // print(stressData);
    } catch (e) {
      print(
          "the problem might happen because you do not have apple health on your device");
      print(e);
    }
    return lastupdate;
  }
}
