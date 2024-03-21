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

Future<bool> locationCal(
  LatLng? location,
  LatLng? userLocation,
  double? radiusLocation,
) async {
  bool isEnter = false;
  double earthRadius = 6378137.0;
  double dLat = (userLocation!.latitude - location!.latitude).abs() * pi / 180;
  double dLon =
      (userLocation!.longitude - location!.longitude).abs() * pi / 180;
  double a = pow(sin(dLat / 2), 2) +
      pow(sin(dLon / 2), 2) *
          cos((location!.latitude) * pi / 180) *
          cos((userLocation!.latitude) * pi / 180);
  double c = 2 * asin(sqrt(a));
  double x = earthRadius * c;

  if (x <= radiusLocation!) {
    isEnter = true;
  } else {
    isEnter = false;
  }
  return isEnter;
}
