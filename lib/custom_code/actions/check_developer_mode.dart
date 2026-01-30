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

import 'package:flutter/services.dart';

import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'dart:io';

Future<bool> checkDeveloperMode() async {
  bool isDevMode = false;
  if (!Platform.isAndroid) return false;

  try {
    isDevMode = await FlutterJailbreakDetection.developerMode ?? false;
  } on PlatformException {
    return true;
  }

  return isDevMode;
}
