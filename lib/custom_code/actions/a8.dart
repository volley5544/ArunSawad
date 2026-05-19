// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

Future<bool> a8(String? getLocationFrom) async {
  // Add your function code here!
  bool areLocationServicesEnabled;
  areLocationServicesEnabled = await Geolocator.isLocationServiceEnabled();
  Position position = await Geolocator.getCurrentPosition();
  print(position.isMocked); // true on emulator

  LatLng currentLocation = LatLng(position.latitude, position.longitude);

  if ('${FFAppState().employeeID}' == '31622' ||
      '${FFAppState().employeeID}' == '33511' ||
      '${FFAppState().employeeID}' == '30427' ||
      '${FFAppState().employeeID}' == '32758' ||
      '${FFAppState().employeeID}' == '38630') {
    print('is admin');
  } else {
    if (Platform.isAndroid) {
      Position position = await Geolocator.getCurrentPosition();
      Timestamp now = Timestamp.now();

      if (position.isMocked) {
        try {
          FirebaseFirestore firestore = FirebaseFirestore.instance;
          // Firestore-based document ID
          String docId =
              '${now.seconds}_${now.nanoseconds}_${FFAppState().employeeID}';

          Map<String, dynamic> data = {
            'employee_id': '${FFAppState().employeeID}',
            'date_time': FieldValue.serverTimestamp(),
            'device_id': '${FFAppState().imei}',
            'operating_system': Platform.isAndroid ? 'Android' : 'iOS',
            'log_from': '${getLocationFrom!}'
          };
          await firestore.collection('FakeLocationLog').doc(docId).set(data);
        } catch (e) {
          print('Error creating document: $e');
        }
        if (FFAppState().blockMockedLocation) {
          return false;
        }
      }
    }
  }

  // if (position.isMocked) {
  //   return false;
  // }

  if (areLocationServicesEnabled &&
      currentLocation != LatLng(0, 0) &&
      currentLocation != LatLng(0.0, 0.0)) {
    // Location services are enabled
    //''
    return true;
  } else {
    return false;
    // Location services are not enabled
  }
}
