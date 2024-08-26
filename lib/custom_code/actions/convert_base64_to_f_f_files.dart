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

import 'dart:convert';
import 'dart:io';

Future<FFUploadedFile?> convertBase64ToFFFiles(String? imageBase64) async {
  // Add your function code here!
  Uint8List? imageBytes = base64Decode(imageBase64!);
  FFUploadedFile? ffFile = FFUploadedFile(bytes: imageBytes!);

  return ffFile;
}
