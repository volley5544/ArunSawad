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

Future<String> distanceBetween(
  LatLng? location,
  LatLng? userLocation,
) async {
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
  int resultInt = x.toInt();
  if (resultInt >= 1000) {
    String result = ((resultInt / 1000).toDouble()).toStringAsFixed(3);
    return (result + " km");
  } else {
    String result = resultInt.toString();
    return (result + " m");
  }
}
