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

Future<LatLng> getLocation(String? getLocationFrom) async {
  // Add your function code here!
  // final serviceEnabled = await Geolocator.isLocationServiceEnabled();
  // if (!serviceEnabled) {
  //   return Future.error('Location services are disabled.');
  // }

  if ('${getLocationFrom}' != 'ForceLogout') {
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
            return LatLng(0.0, 0.0);
          }
        }
      }
    }
  }

  // var permission = await Geolocator.checkPermission();
  // if (permission == LocationPermission.denied) {
  //   permission = await Geolocator.requestPermission();
  //   if (permission == LocationPermission.denied) {
  //     return Future.error('Location permissions are denied');
  //   }
  // }

  // if (permission == LocationPermission.deniedForever) {
  //   return Future.error(
  //       'Location permissions are permanently denied, we cannot request permissions.');
  // }

  // final position = await Geolocator.getCurrentPosition(
  //     locationSettings: LocationSettings(accuracy: LocationAccuracy.high));

  // print('BG location: ${position.latitude}, ${position.longitude}');
  // return LatLng(position.latitude, position.longitude) ?? LatLng(0.0, 0.0);
  return queryCurrentUserLocation().then((loc) {
    return loc ?? LatLng(0.0, 0.0);
  }).onError((error, _) {
    print("Error querying user location: $error");
    return LatLng(0.0, 0.0);
  });
}
