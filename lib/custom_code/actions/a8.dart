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

import 'package:geolocator/geolocator.dart';

Future<bool> a8() async {
  // Add your function code here!
  bool areLocationServicesEnabled;
  areLocationServicesEnabled = await Geolocator.isLocationServiceEnabled();
  Position position = await Geolocator.getCurrentPosition();
  print(position.isMocked); // true on emulator

  LatLng currentLocation = LatLng(position.latitude, position.longitude);

  if (position.isMocked) {
    return false;
  }

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
