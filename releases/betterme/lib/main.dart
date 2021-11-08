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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: SyncFB(),
    );
  }
}

// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:health_kit_reporter/health_kit_reporter.dart';
// import 'package:health_kit_reporter/model/payload/category.dart';
// import 'package:health_kit_reporter/model/payload/date_components.dart';
// import 'package:health_kit_reporter/model/payload/device.dart';
// import 'package:health_kit_reporter/model/payload/preferred_unit.dart';
// import 'package:health_kit_reporter/model/payload/quantity.dart';
// import 'package:health_kit_reporter/model/payload/source.dart';
// import 'package:health_kit_reporter/model/payload/source_revision.dart';
// import 'package:health_kit_reporter/model/payload/workout.dart';
// import 'package:health_kit_reporter/model/payload/workout_activity_type.dart';
// import 'package:health_kit_reporter/model/payload/workout_event.dart';
// import 'package:health_kit_reporter/model/payload/workout_event_type.dart';
// import 'package:health_kit_reporter/model/predicate.dart';
// import 'package:health_kit_reporter/model/type/activity_summary_type.dart';
// import 'package:health_kit_reporter/model/type/category_type.dart';
// import 'package:health_kit_reporter/model/type/characteristic_type.dart';
// import 'package:health_kit_reporter/model/type/correlation_type.dart';
// import 'package:health_kit_reporter/model/type/electrocardiogram_type.dart';
// import 'package:health_kit_reporter/model/type/quantity_type.dart';
// import 'package:health_kit_reporter/model/type/series_type.dart';
// import 'package:health_kit_reporter/model/type/workout_type.dart';
// import 'package:health_kit_reporter/model/update_frequency.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   final _predicate = Predicate(
//     // DateTime.now().add(Duration(days: -2)),
//     DateTime.now().add(Duration(days: -365 * 2)),
//     DateTime.now(),
//   );
//   final _device = Device(
//     'FlutterTracker1',
//     'kvs1',
//     'T-8001',
//     '31',
//     '3.01',
//     '1.1.11',
//     'kvs.sample.app1',
//     '444-888-5551',
//   );
//   final _source = Source(
//     'myApp1',
//     'com.kvs.health_kit_reporter_example1',
//   );
//   final _operatingSystem = OperatingSystem(
//     1,
//     2,
//     3,
//   );

//   // SourceRevision get _sourceRevision => SourceRevision(
//   //       _source,
//   //       '5',
//   //       'fit',
//   //       '4',
//   //       _operatingSystem,
//   //     );

//   final _sourceRevision = SourceRevision(
//     Source(
//       'myApp',
//       'com.kvs.health_kit_reporter_example11',
//     ),
//     '511',
//     'fit11',
//     '411',
//     OperatingSystem(
//       11,
//       21,
//       31,
//     ),
//   );

//   bool _isAuthorizationRequested = false;

//   @override
//   void initState() {
//     super.initState();
//     // final initializationSettingsIOs = IOSInitializationSettings();
//     // final initSettings = InitializationSettings(iOS: initializationSettingsIOs);
//     // _flutterLocalNotificationsPlugin.initialize(initSettings,
//     //     onSelectNotification: (string) {
//     //   print(string);
//     //   return Future.value(string);
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Health Kit Reporter'),
//           actions: [
//             IconButton(
//               onPressed: () async {
//                 try {
//                   final readTypes = <String>[];
//                   readTypes.addAll(
//                       ActivitySummaryType.values.map((e) => e.identifier));
//                   readTypes
//                       .addAll(CategoryType.values.map((e) => e.identifier));
//                   readTypes.addAll(
//                       CharacteristicType.values.map((e) => e.identifier));
//                   readTypes
//                       .addAll(QuantityType.values.map((e) => e.identifier));
//                   readTypes.addAll(WorkoutType.values.map((e) => e.identifier));
//                   readTypes.addAll(SeriesType.values.map((e) => e.identifier));
//                   readTypes.addAll(
//                       ElectrocardiogramType.values.map((e) => e.identifier));
//                   final writeTypes = <String>[
//                     QuantityType.stepCount.identifier,
//                     QuantityType.bodyMass.identifier,
//                     WorkoutType.workoutType.identifier,
//                     CategoryType.sleepAnalysis.identifier,
//                     CategoryType.mindfulSession.identifier,
//                   ];
//                   final isRequested =
//                       await HealthKitReporter.requestAuthorization(
//                           readTypes, writeTypes);
//                   setState(() => _isAuthorizationRequested = isRequested);
//                 } catch (e) {
//                   print(e);
//                 }
//               },
//               icon: Icon(Icons.login),
//             )
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: _isAuthorizationRequested
//               ? Center(
//                   child: Column(
//                     children: [
//                       Column(
//                         children: [
//                           Text('READ'),
//                           ElevatedButton(
//                               onPressed: () {
//                                 handleQuantitiySamples();
//                               },
//                               child: Text('preferredUnit:quantity:statistics')),
//                           ElevatedButton(
//                               onPressed: () {
//                                 queryCharacteristics();
//                               },
//                               child: Text('characteristics')),
//                           ElevatedButton(
//                               onPressed: () {
//                                 queryCategory();
//                               },
//                               child: Text('sleep')),
//                           ElevatedButton(
//                               onPressed: () {
//                                 queryCategory2();
//                               },
//                               child: Text('weight')),
//                           ElevatedButton(
//                               onPressed: () {
//                                 queryWorkout();
//                               },
//                               child: Text('workouts')),
//                           ElevatedButton(
//                               onPressed: () {
//                                 querySamples2();
//                               },
//                               child: Text('exercise Cal')),
//                           ElevatedButton(
//                               onPressed: () {
//                                 querySamples();
//                               },
//                               child: Text('stress')),
//                           ElevatedButton(
//                               onPressed: () {
//                                 queryHeartbeatSeries();
//                               },
//                               child: Text('heartbeatSeriesQuery')),
//                           ElevatedButton(
//                               onPressed: () {
//                                 querySources();
//                               },
//                               child: Text('sources')),
//                           ElevatedButton(
//                               onPressed: () {
//                                 queryCorrelations();
//                               },
//                               child: Text('correlations')),
//                           ElevatedButton(
//                               onPressed: () {
//                                 queryElectrocardiograms();
//                               },
//                               child: Text('electrocardiograms')),
//                           ElevatedButton(
//                               onPressed: () {
//                                 queryActivitySummary();
//                               },
//                               child: Text('activitySummary')),
//                           ElevatedButton(
//                               onPressed: () {
//                                 quearyTemp();
//                               },
//                               child: Text('quearyTemp')),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Text('WRITE'),
//                           ElevatedButton(
//                             onPressed: () {
//                               saveWorkout();
//                             },
//                             child: Text('saveWorkout'),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               saveWeight();
//                             },
//                             child: Text('saveWeight'),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               saveSteps();
//                             },
//                             child: Text('saveSteps'),
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               saveMindfulMinutes();
//                             },
//                             child: Text('saveMindfulMinutes'),
//                           ),
//                         ],
//                       ),
//                       // Column(
//                       //   children: [
//                       //     Text('OBSERVE'),
//                       //     ElevatedButton(
//                       //         onPressed: () {
//                       //           observerQuery([
//                       //             QuantityType.stepCount.identifier,
//                       //             QuantityType.heartRate.identifier,
//                       //           ]);
//                       //         },
//                       //         child: Text('observerQuery - STEPS and HR')),
//                       //     ElevatedButton(
//                       //         onPressed: () {
//                       //           anchoredObjectQuery([
//                       //             QuantityType.stepCount.identifier,
//                       //             QuantityType.heartRate.identifier,
//                       //           ]);
//                       //         },
//                       //         child:
//                       //             Text('anchoredObjectQuery - STEPS and HR')),
//                       //     ElevatedButton(
//                       //         onPressed: () {
//                       //           queryActivitySummaryUpdates();
//                       //         },
//                       //         child: Text('queryActivitySummaryUpdates')),
//                       //     ElevatedButton(
//                       //         onPressed: () {
//                       //           statisticsCollectionQuery();
//                       //         },
//                       //         child: Text('statisticsCollectionQuery')),
//                       //     ElevatedButton(
//                       //         onPressed: () {
//                       //           workoutRouteQuery();
//                       //         },
//                       //         child: Text('workoutRouteQuery')),
//                       //   ],
//                       // ),
//                       // Column(
//                       //   children: [
//                       //     Text('DELETE'),
//                       //     ElevatedButton(
//                       //         onPressed: () {
//                       //           deleteSteps();
//                       //         },
//                       //         child: Text('deleteSteps')),
//                       //   ],
//                       // ),
//                     ],
//                   ),
//                 )
//               : Container(),
//         ),
//       ),
//     );
//   }

//   void quearyTemp() async {
//     try {
//       final samples2 = await HealthKitReporter.sampleQuery(
//           QuantityType.basalEnergyBurned.identifier, _predicate);
//       print(samples2.map((e) => e.map).toList()[0]);
//       for (final q in samples2) {
//         // print(q);
//         print('q: ${json.encode(q.map)} \n');
//         // print(
//         //     'q: ${json.encode(q.map["startTimestamp"])} ~ ${json.encode(q.map["endTimestamp"])} ${json.encode(q.map["harmonized"]["value"])} Cal \n');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//   // void quearyTemp() async {
//   //   try {
//   //     final tmp = await HealthKitReporter.queryActivitySummary(_predicate);
//   //     // print('activitySummary: ${activitySummary.map((e) => e.map).toList()}');
//   //     for (final q in tmp) {
//   //       print('q: ${json.encode(q.map)} \n');
//   //       print('q: ${json.encode(q.map["date"])} \n');
//   //       print('q: ${json.encode(q.map["harmonized"])} \n');
//   //     }
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   void queryActivitySummary() async {
//     try {
//       final activitySummary =
//           await HealthKitReporter.queryActivitySummary(_predicate);
//       // print('activitySummary: ${activitySummary.map((e) => e.map).toList()}');
//       for (final q in activitySummary) {
//         print('q: ${json.encode(q.map)} \n');
//         print(json.encode(q.map["date"]).substring(1, 11).replaceAll("-", "_"));
//         print(json.encode(q.map["harmonized"]["activeEnergyBurned"]));
//         print(json.encode(q.map["harmonized"]["activeEnergyBurnedGoal"]));
//         // print(q.map["identifier"].runtimeType);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void queryElectrocardiograms() async {
//     try {
//       final electrocardiograms =
//           await HealthKitReporter.electrocardiogramQuery(_predicate);
//       print(
//           'electrocardiograms: ${electrocardiograms.map((e) => e.map).toList()}');
//     } catch (e) {
//       print(e);
//     }
//   }

//   void queryCorrelations() async {
//     try {
//       final correlations = await HealthKitReporter.correlationQuery(
//           CorrelationType.bloodPressure.identifier, _predicate);
//       for (final q in correlations) {
//         print('q: ${json.encode(q.map)} \n');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void querySources() async {
//     try {
//       final sources = await HealthKitReporter.sourceQuery(
//           QuantityType.stepCount.identifier, _predicate);
//       // print('sources: ${sources.map((e) => e.map).toList()}');
//       for (final q in sources) {
//         print('q: ${json.encode(q.map)} \n');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void saveSteps() async {
//     try {
//       final canWrite = await HealthKitReporter.isAuthorizedToWrite(
//           QuantityType.stepCount.identifier);
//       if (canWrite) {
//         final now = DateTime.now();
//         final minuteAgo = now.add(Duration(minutes: -1));
//         final harmonized = QuantityHarmonized(100, 'count', null);
//         final steps = Quantity(
//             'testStepsUUID',
//             QuantityType.stepCount.identifier,
//             minuteAgo.millisecondsSinceEpoch,
//             now.millisecondsSinceEpoch,
//             _device,
//             _sourceRevision,
//             harmonized);
//         print('try to save: ${steps.map}');
//         final saved = await HealthKitReporter.save(steps);
//         print('stepsSaved: $saved');
//       } else {
//         print('error canWrite steps: $canWrite');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void saveWeight() async {
//     try {
//       final canWrite = await HealthKitReporter.isAuthorizedToWrite(
//           QuantityType.bodyMass.identifier);
//       if (canWrite) {
//         final now = DateTime.now();
//         final minuteAgo = now.add(Duration(minutes: -1));
//         final harmonized = QuantityHarmonized(100, 'kg', null);
//         final weight = Quantity(
//             'testStepsUUID',
//             QuantityType.bodyMass.identifier,
//             now.millisecondsSinceEpoch,
//             now.millisecondsSinceEpoch,
//             _device,
//             _sourceRevision,
//             harmonized);
//         print('try to save: ${weight.map}');
//         final saved = await HealthKitReporter.save(weight);
//         print('stepsWeight: $saved');
//       } else {
//         print('error canWrite weight: $canWrite');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void saveWorkout() async {
//     try {
//       final canWrite = await HealthKitReporter.isAuthorizedToWrite(
//           WorkoutType.workoutType.identifier);
//       if (canWrite) {
//         final harmonized = WorkoutHarmonized(
//           WorkoutActivityType.badminton,
//           1.2,
//           'kcal',
//           123,
//           'm',
//           0,
//           'count',
//           0,
//           'count',
//           null,
//         );
//         final now = DateTime.now();
//         final duration = 60;
//         final eventHarmonized = WorkoutEventHarmonized(WorkoutEventType.pause);
//         final events = [
//           WorkoutEvent(
//             now.millisecondsSinceEpoch,
//             now.millisecondsSinceEpoch,
//             duration,
//             eventHarmonized,
//           )
//         ];
//         final minuteAgo = now.add(Duration(seconds: -duration));
//         final workout = Workout(
//           'testWorkoutUUID',
//           'basketball',
//           minuteAgo.millisecondsSinceEpoch,
//           now.millisecondsSinceEpoch,
//           _device,
//           _sourceRevision,
//           harmonized,
//           duration,
//           events,
//         );
//         print('try to save: ${workout.map}');
//         final saved = await HealthKitReporter.save(workout);
//         print('workoutSaved: $saved');
//       } else {
//         print('error canWrite workout: $canWrite');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void saveMindfulMinutes() async {
//     try {
//       final canWrite = await HealthKitReporter.isAuthorizedToWrite(
//           CategoryType.mindfulSession.identifier);
//       if (canWrite) {
//         final now = DateTime.now();
//         final minuteAgo = now.add(Duration(minutes: -1));
//         final harmonized = CategoryHarmonized(
//           0,
//           'HKCategoryValue',
//           'Not Aplicable',
//           {},
//         );
//         final mindfulMinutes = Category(
//           'testMindfulMinutesUUID',
//           CategoryType.mindfulSession.identifier,
//           minuteAgo.millisecondsSinceEpoch,
//           now.millisecondsSinceEpoch,
//           _device,
//           _sourceRevision,
//           harmonized,
//         );
//         print('try to save: ${mindfulMinutes.map}');
//         final saved = await HealthKitReporter.save(mindfulMinutes);
//         print('mindfulMinutesSaved: $saved');
//       } else {
//         print('error canWrite mindfulMinutes: $canWrite');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void querySamples2() async {
//     try {
//       var map = {};
//       final samples2 = await HealthKitReporter.sampleQuery(
//           QuantityType.activeEnergyBurned.identifier, _predicate);
//       print(samples2.map((e) => e.map).toList()[0]);
//       for (final q in samples2) {
//         // print('q: ${json.encode(q.map["harmonized"]["value"])} \n');
//         print(
//             'q: ${json.encode(q.map["startTimestamp"])} ~ ${json.encode(q.map["endTimestamp"])} ${json.encode(q.map["harmonized"]["value"])} Cal \n');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void querySamples() async {
//     try {
//       var map = {};
//       double stress;
//       final samples2 = await HealthKitReporter.sampleQuery(
//           QuantityType.heartRate.identifier, _predicate);
//       // print(samples2.map((e) => e.map).toList()[0]);
//       for (final q in samples2) {
//         // print('q: ${json.encode(q.map["harmonized"]["value"])} \n');
//         map['${json.encode(q.map["startTimestamp"])}'] =
//             '${json.encode(q.map["harmonized"]["value"])}';
//       }
//       final samples = await HealthKitReporter.sampleQuery(
//           QuantityType.heartRateVariabilitySDNN.identifier, _predicate);
//       for (final q in samples) {
//         stress = double.parse('${map[json.encode(q.map["startTimestamp"])]}') -
//             double.parse('${json.encode(q.map["harmonized"]["value"])}') * 0.4;
//         print('stress: ${q.map["startTimestamp"]} ${stress} \n');
//       }
//       // final samples = await HealthKitReporter.sampleQuery(
//       //     QuantityType.stepCount.identifier, _predicate);
//       // print('samples: ${samples.map((e) => e.map).toList()}');
//     } catch (e) {
//       print(e);
//     }
//   }

//   void queryCategory() async {
//     try {
//       final categories = await HealthKitReporter.categoryQuery(
//           CategoryType.sleepAnalysis, _predicate);
//       // print('categories: ${categories.map((e) => e.map).toList()}');
//       for (final q in categories) {
//         // print('q: ${json.encode(q.map)}} \n');
//         print(
//             'q: ${json.encode(q.map["startTimestamp"])} ~ ${json.encode(q.map["endTimestamp"])} \n');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void queryCategory2() async {
//     try {
//       final samples2 = await HealthKitReporter.sampleQuery(
//           QuantityType.bodyMass.identifier, _predicate);
//       for (final q in samples2) {
//         print('q: ${json.encode(q.map)} \n');
//         print(
//             'q: ${json.encode(q.map["startTimestamp"])} ${json.encode(q.map["harmonized"]["value"])} kg \n');
//         // print('q: ${json.encode(q.map["harmonized"]["value"])} \n');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void queryWorkout() async {
//     try {
//       final workouts = await HealthKitReporter.workoutQuery(_predicate);
//       // print('workouts: ${workouts.map((e) => e.map).toList()}');
//       for (final q in workouts) {
//         print('q: ${json.encode(q.map)} \n');
//         print('q: ${json.encode(q.map["startTimestamp"])}');
//         print('q: ${json.encode(q.map["endTimestamp"])}');
//         print('q: ${json.encode(q.map["duration"])}');
//         print('q: ${json.encode(q.map["harmonized"]["description"])}');
//         print('q: ${json.encode(q.map["harmonized"]["totalEnergyBurned"])}');
//         print(
//             'q: ${json.encode(q.map["harmonized"]["totalEnergyBurnedUnit"])}');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void queryHeartbeatSeries() async {
//     try {
//       final series = await HealthKitReporter.heartbeatSeriesQuery(_predicate);
//       // print('heartbeatSeries: ${series.map((e) => e.map).toList()}');
//       for (final q in series) {
//         print('q: ${json.encode(q.map)} \n');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void queryCharacteristics() async {
//     try {
//       final characteristics = await HealthKitReporter.characteristicsQuery();
//       print('characteristics: ${characteristics.map}');
//     } catch (e) {
//       print(e);
//     }
//   }

//   void handleQuantitiySamples() async {
//     try {
//       final preferredUnits = await HealthKitReporter.preferredUnits([
//         QuantityType.stepCount,
//       ]);
//       preferredUnits.forEach((preferredUnit) async {
//         final identifier = preferredUnit.identifier;
//         final unit = preferredUnit.unit;
//         print('preferredUnit: ${preferredUnit.map}');
//         final type = QuantityTypeFactory.from(identifier);
//         try {
//           final quantities =
//               await HealthKitReporter.quantityQuery(type, unit, _predicate);
//           print('quantity: ${quantities.map((e) => e.map).toList()}');
//           final statistics =
//               await HealthKitReporter.statisticsQuery(type, unit, _predicate);
//           print('statistics: ${statistics.map}');
//         } catch (e) {
//           print(e);
//         }
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   void observerQuery(List<String> identifiers) async {
//     final sub = HealthKitReporter.observerQuery(identifiers, _predicate,
//         onUpdate: (identifier) async {
//       print('Updates for observerQuerySub - $identifier');
//       print(identifier);
//       // final iOSDetails = IOSNotificationDetails();
//       // final details = NotificationDetails(iOS: iOSDetails);
//       // await _flutterLocalNotificationsPlugin.show(
//       //     0, 'Observer', identifier, details);
//     });
//     print('$identifiers observerQuerySub: $sub');
//     for (final identifier in identifiers) {
//       final isSet = await HealthKitReporter.enableBackgroundDelivery(
//           identifier, UpdateFrequency.immediate);
//       print('$identifier enableBackgroundDelivery: $isSet');
//     }
//   }

//   void workoutRouteQuery() {
//     final sub =
//         HealthKitReporter.workoutRouteQuery(_predicate, onUpdate: (serie) {
//       print('Updates for workoutRouteQuery');
//       print(serie.map);
//     });
//     print('workoutRouteQuery: $sub');
//   }

//   void anchoredObjectQuery(List<String> identifiers) {
//     final sub = HealthKitReporter.anchoredObjectQuery(identifiers, _predicate,
//         onUpdate: (samples, deletedObjects) {
//       print('Updates for anchoredObjectQuerySub');
//       print(samples.map((e) => e.map).toList());
//       print(deletedObjects.map((e) => e.map).toList());
//     });
//     print('$identifiers anchoredObjectQuerySub: $sub');
//   }

//   void queryActivitySummaryUpdates() {
//     final sub = HealthKitReporter.queryActivitySummaryUpdates(_predicate,
//         onUpdate: (samples) {
//       print('Updates for activitySummaryUpdatesSub');
//       print(samples.map((e) => e.map).toList());
//     });
//     print('activitySummaryUpdatesSub: $sub');
//   }

//   void statisticsCollectionQuery() {
//     final anchorDate = DateTime.utc(2020, 2, 1, 12, 30, 30);
//     final enumerateFrom = DateTime.utc(2020, 3, 1, 12, 30, 30);
//     final enumerateTo = DateTime.utc(2020, 12, 31, 12, 30, 30);
//     final intervalComponents = DateComponents(month: 1);
//     final sub = HealthKitReporter.statisticsCollectionQuery(
//       [
//         PreferredUnit(
//           QuantityType.stepCount.identifier,
//           'count',
//         ),
//       ],
//       _predicate,
//       anchorDate,
//       enumerateFrom,
//       enumerateTo,
//       intervalComponents,
//       onUpdate: (statistics) {
//         print('Updates for statisticsCollectionQuerySub');
//         print(statistics.map);
//       },
//     );
//     print('statisticsCollectionQuery: $sub');
//   }

//   void deleteSteps() async {
//     final map = await HealthKitReporter.deleteObjects(
//         QuantityType.stepCount.identifier,
//         Predicate(
//           DateTime.now().add(Duration(days: -1)),
//           DateTime.now(),
//         ));
//     print(map);
//   }
// }
