import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health/health.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Pair<num, DateTime> {
  final num value;
  final DateTime date;

  Pair(this.value, this.date);
}

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTH_NOT_GRANTED
}

class _MyAppState extends State<MyApp> {
  List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.DATA_NOT_FETCHED;

  @override
  void initState() {
    super.initState();
  }

  /// Fetch data from the healt plugin and print it
  Future fetchData() async {
    // get everything from midnight until now
    DateTime startDate = DateTime(2021, 10, 04, 0, 0, 0);
    DateTime endDate = DateTime(2021, 10, 05, 23, 59, 59);

    HealthFactory health = HealthFactory();

    // define the types to get
    List<HealthDataType> types = [
      // HealthDataType.STEPS,
      // HealthDataType.WEIGHT,
      // HealthDataType.HEIGHT,
      //HealthDataType.BLOOD_GLUCOSE,
      // HealthDataType.DISTANCE_WALKING_RUNNING,
      HealthDataType.HEART_RATE,
      //HealthDataType.SLEEP_IN_BED,
      HealthDataType.HEART_RATE_VARIABILITY_SDNN,
      // HealthDataType.HIGH_HEART_RATE_EVENT,
    ];

    setState(() => _state = AppState.FETCHING_DATA);

    // you MUST request access to the data types before reading them
    bool accessWasGranted = await health.requestAuthorization(types);

    int steps = 0;

    if (accessWasGranted) {
      try {
        // fetch new data
        List<HealthDataPoint> healthData =
            await health.getHealthDataFromTypes(startDate, endDate, types);

        // save all the new data points
        _healthDataList.addAll(healthData);
      } catch (e) {
        print("Caught exception in getHealthDataFromTypes: $e");
      }

      // filter out duplicates
      _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

      // print the results
      // _healthDataList.forEach((x) {
      //   print("Data point: $x");
      //   steps += x.value.round();
      // });

      List<Pair> SDNN = [];
      List<Pair> HR = [];
      double alpha = -0.3;

      for (int i = 0; i < _healthDataList.length; i++) {
        if (_healthDataList[i].type ==
            HealthDataType.HEART_RATE_VARIABILITY_SDNN) {
          SDNN.add(Pair(_healthDataList[i].value, _healthDataList[i].dateTo));
        } else if (_healthDataList[i].type == HealthDataType.HEART_RATE) {
          HR.add(Pair(_healthDataList[i].value, _healthDataList[i].dateTo));
        }
      }

      for (int i = 0; i < SDNN.length; i++) {
        print('${SDNN[i].value} : ${SDNN[i].date}');
        for (int j = 0; j < HR.length; j++) {
          if (SDNN[i].date.difference(HR[j].date).isNegative) {
            print('${HR[j].value} : ${HR[j].date}');

            print('\nStress: ${HR[j].value + alpha * SDNN[i].value} \n\n');

            break;
          }
        }
      }

      // print("Steps: $steps");

      // update the UI to display the results
      setState(() {
        _state =
            _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
      });
    } else {
      print("Authorization not granted");
      setState(() => _state = AppState.DATA_NOT_FETCHED);
    }
  }

  Widget _contentFetchingData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(
              strokeWidth: 10,
            )),
        Text('Fetching data...')
      ],
    );
  }

  Widget _contentDataReady() {
    return ListView.builder(
        itemCount: _healthDataList.length,
        itemBuilder: (_, index) {
          HealthDataPoint p = _healthDataList[index];
          return ListTile(
            title: Text("${p.typeString}: ${p.value}"),
            trailing: Text('${p.unitString}'),
            subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
          );
        });
  }

  Widget _contentNoData() {
    return Text('No Data to show');
  }

  Widget _contentNotFetched() {
    return Text('Press the download button to fetch data');
  }

  Widget _authorizationNotGranted() {
    return Text('''Authorization not given.
        For Android please check your OAUTH2 client ID is correct in Google Developer Console.
         For iOS check your permissions in Apple Health.''');
  }

  Widget _content() {
    if (_state == AppState.DATA_READY)
      return _contentDataReady();
    else if (_state == AppState.NO_DATA)
      return _contentNoData();
    else if (_state == AppState.FETCHING_DATA)
      return _contentFetchingData();
    else if (_state == AppState.AUTH_NOT_GRANTED)
      return _authorizationNotGranted();

    return _contentNotFetched();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.file_download),
                onPressed: () {
                  fetchData();
                },
              )
            ],
          ),
          body: Center(
            child: _content(),
          )),
    );
  }
}
