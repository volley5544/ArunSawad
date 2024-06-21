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

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> saveVideoFile(String? inputFilePath) async {
  // Add your function code here!

  // Save the converted image to local storage
  // final directory = await getTemporaryDirectory();
  // final filePath = '${directory.path}/recording_video5544.mp4';
  //final File savedFile = File(inputFilePath!);
  String outputText = '';

  final result1 = await ImageGallerySaver.saveFile(
    inputFilePath!,
  ).then((value1) {
    print('File Saved Name : ${value1}');
    outputText = 'Save Video to Gallery Success!';
  }).onError((error, stackTrace) {
    outputText = error.toString();
  });
  print('File Saved Name2 : ${result1}');

  return outputText;
}
