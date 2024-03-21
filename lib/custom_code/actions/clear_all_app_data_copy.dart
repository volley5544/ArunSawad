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

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';

Future clearAllAppDataCopy() async {
  // Add your function code here!
  // var tempDir = await getTemporaryDirectory();
  // var appDocDir = await getApplicationDocumentsDirectory();
  // final appDir = await getApplicationSupportDirectory();

  // tempDir.deleteSync(recursive: true);
  // appDocDir.deleteSync(recursive: true);
  // appDir.deleteSync(recursive: true);

  final storage = new FlutterSecureStorage();

// Read value

// Read all values
  Map<String, String> allValues = await storage.readAll();

// Delete value

// Delete all
  await storage.deleteAll();

  SystemNavigator.pop();

  /*SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  await ImageCache().clear();
  WidgetsBinding.instance.addPostFrameCallback() {
    SystemNavigator.pop();
  });*/
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
