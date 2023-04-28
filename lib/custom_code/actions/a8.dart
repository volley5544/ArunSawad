// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';

Future<bool> a8(LatLng? currentLocation) async {
  // Add your function code here!
  bool areLocationServicesEnabled;
  areLocationServicesEnabled = await Geolocator.isLocationServiceEnabled();

  if (areLocationServicesEnabled) {
    // Location services are enabled
    return true;
  } else {
    return false;
    // Location services are not enabled
  }
}
