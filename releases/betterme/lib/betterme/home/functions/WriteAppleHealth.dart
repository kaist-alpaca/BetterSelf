import 'dart:async';
import 'package:get/get.dart';

import 'package:health_kit_reporter/health_kit_reporter.dart';
import 'package:health_kit_reporter/model/payload/device.dart';
import 'package:health_kit_reporter/model/payload/quantity.dart';
import 'package:health_kit_reporter/model/payload/source.dart';
import 'package:health_kit_reporter/model/payload/source_revision.dart';
import 'package:health_kit_reporter/model/type/quantity_type.dart';

class WriteAppleHealth {
  static Future<void> writeWeight() async {
    bool _isAuthorizationRequested = false;
    try {
      final readTypes = <String>[];
      final writeTypes = <String>[
        QuantityType.bodyMass.identifier,
      ];
      final isRequested =
          await HealthKitReporter.requestAuthorization(readTypes, writeTypes);
      _isAuthorizationRequested = isRequested;
    } catch (e) {
      print(e);
      print("error...?");
    }
    try {
      final canWrite = await HealthKitReporter.isAuthorizedToWrite(
          QuantityType.bodyMass.identifier);
      if (canWrite) {
        final _device = Device(
          'FlutterTracker',
          'kvs',
          'T-800',
          '3',
          '3.0',
          '1.1.1',
          'kvs.sample.app',
          '444-888-555',
        );
        final _source = Source(
          'myApp',
          'com.kvs.health_kit_reporter_example',
        );
        final _operatingSystem = OperatingSystem(
          1,
          2,
          3,
        );

        final _sourceRevision = SourceRevision(
          _source,
          '5',
          'fit',
          '4',
          _operatingSystem,
        );
        final now = DateTime.now();
        final minuteAgo = now.add(Duration(minutes: -1));
        final harmonized = QuantityHarmonized(100, 'kg', null);
        final weight = Quantity(
            'testStepsUUID',
            QuantityType.bodyMass.identifier,
            now.millisecondsSinceEpoch,
            now.millisecondsSinceEpoch,
            _device,
            _sourceRevision,
            harmonized);
        print('try to save: ${weight.map}');
        final saved = await HealthKitReporter.save(weight);
        print('stepsWeight: $saved');
      } else {
        print('error canWrite weight: $canWrite');
      }
    } catch (e) {
      print(
          "the problem might happen because you do not have apple health on your device");
      print(e);
    }
  }
}
