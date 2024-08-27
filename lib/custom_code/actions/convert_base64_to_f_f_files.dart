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
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';

Future<String?> convertBase64ToFFFiles(
    String? imageBase64, String? index) async {
  // Add your function code here!
  String base64Output = imageBase64!.split(',')[1];

  Uint8List imageBytes = base64Decode(base64Output!);

  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/image${index!}.png';

  // Save the image file
  final file = File(filePath);
  await file.writeAsBytes(imageBytes);

  return filePath;
}
