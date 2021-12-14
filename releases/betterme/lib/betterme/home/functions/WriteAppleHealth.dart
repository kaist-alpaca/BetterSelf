import 'dart:async';
import 'dart:convert';
import 'package:betterme/functions/Controllers/profile_controller.dart';
import 'package:betterme/functions/Controllers/server_connection.dart';
import 'package:betterme/functions/Encryption/Encryption.dart';
import 'package:http/http.dart' as http;

import 'package:health_kit_reporter/health_kit_reporter.dart';
import 'package:health_kit_reporter/model/payload/device.dart';
import 'package:health_kit_reporter/model/payload/quantity.dart';
import 'package:health_kit_reporter/model/payload/source.dart';
import 'package:health_kit_reporter/model/payload/source_revision.dart';
import 'package:health_kit_reporter/model/type/quantity_type.dart';

class WriteAppleHealth {
  static Future<void> writeWeight(
      int millisecondsSinceEpoch, double weight2) async {
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
        final harmonized = QuantityHarmonized(weight2, 'kg', null);
        final weight = Quantity(
            'testStepsUUID',
            QuantityType.bodyMass.identifier,
            millisecondsSinceEpoch,
            millisecondsSinceEpoch,
            _device,
            _sourceRevision,
            harmonized);
        print('try to save: ${weight.map}');
        final saved = await HealthKitReporter.save(weight);

        final response = await http.get(Uri.parse(
            "http://kaistuser.iptime.org:8080/healthData_get_lastupdate.php?uid=" +
                ProfileController.to.originMyProfile.uid!));

        print(json.decode(response.body));
        String lastupdate = json.decode(response.body).toString();

        if (millisecondsSinceEpoch >
            DateTime.parse(lastupdate).millisecondsSinceEpoch) {
          await ServerConnection.updateHeathData(
              ProfileController.to.originMyProfile.uid!);
        } else {
          await ServerConnection.uploadWeight(
              ProfileController.to.originMyProfile.uid!,
              DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch)
                  .toString()
                  .substring(0, 10)
                  .replaceAll('-', '_'),
              millisecondsSinceEpoch / 1000,
              weight2);
        }

        var weight3 = await ServerConnection.GetWeight(
            ProfileController.to.originMyProfile.uid!);
        // print(weight["result"].last["weight"]);
        if (weight3["result"] != '0') {
          ProfileController.to.weightSelected(weight3["result"][0]["weight"]);
        }
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
