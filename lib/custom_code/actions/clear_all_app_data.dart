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

import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future clearAllAppData() async {
  // Add your function code here!
  // var tempDir = await getTemporaryDirectory();
  // var appDocDir = await getApplicationDocumentsDirectory();
  // final appDir = await getApplicationSupportDirectory();

  // tempDir.deleteSync(recursive: true);
  // appDocDir.deleteSync(recursive: true);
  // appDir.deleteSync(recursive: true);

  Future<void> _deleteCacheDir() async {
    var tempDir = await getTemporaryDirectory();

    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  }

  Future<void> _deleteAppDir() async {
    var appDocDir = await getApplicationDocumentsDirectory();

    if (appDocDir.existsSync()) {
      appDocDir.deleteSync(recursive: true);
    }
  }

  _deleteCacheDir();
  _deleteAppDir();

  /*SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  await ImageCache().clear();
  WidgetsBinding.instance.addPostFrameCallback() {
    SystemNavigator.pop();
  });*/
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
