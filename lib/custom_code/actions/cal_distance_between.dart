// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:math';

Future<bool> calDistanceBetween(
  LatLng? location,
  LatLng? userLocation,
  double? radiusLocation,
) async {
  bool isEnter = false;
  // if ((location!.latitude - userLocation!.latitude).abs() <=
  //         (radiusLocation! / 111111) &&
  //     (location!.longitude - userLocation!.longitude).abs() <=
  //         radiusLocation! / 111111) {
  //   isEnter = true;
  // } else {
  //   isEnter = false;
  // }
  return isEnter;
}
