// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> a16(BuildContext context) async {
  // Add your function code here!
  bool isLandscape = false;

  if (MediaQuery.of(context).orientation == Orientation.portrait) {
    // is portrait

  } else {
// is landscape
    isLandscape = true;
  }
  return isLandscape;
}
