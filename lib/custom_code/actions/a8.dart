// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<bool> a8(LatLng? currentLocation) async {
  // Add your function code here!
  if (currentLocation!.latitude != 0.0 && currentLocation!.longitude != 0.0) {
    return true;
  } else {
    return false;
  }
}
