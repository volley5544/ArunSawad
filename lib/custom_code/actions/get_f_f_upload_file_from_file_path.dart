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

import 'dart:io';

Future<FFUploadedFile> getFFUploadFileFromFilePath(
    String? inputFilePath, String? contNo) async {
  // Add your function code here!
  Uint8List bytes = await File('${inputFilePath!}').readAsBytes();
  FFUploadedFile bytesFile = new FFUploadedFile(
    name: '${contNo}',
    bytes: bytes,
  );

  return bytesFile;
}
