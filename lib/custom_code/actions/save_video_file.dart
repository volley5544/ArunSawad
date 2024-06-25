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

Future<String> saveVideoFile(FFUploadedFile? inputFile, String? contNo) async {
  // Add your function code here!

  // Save the converted image to local storage
  final directory = await getTemporaryDirectory();
  final filePath = '${directory.path}/${contNo}.mp4';
  final File savedFile = File(filePath);
  String outputText = '';
  await savedFile.writeAsBytes(inputFile!.bytes!).then((value) async {
    await ImageGallerySaver.saveFile(
      value.path,
    ).then((value1) {
      print('File Saved Name : ${value1}');
      outputText = 'บันทึกลง Gallery สำเร็จ!';
    }).onError((error, stackTrace) {
      outputText = error.toString();
    });
  }).onError((error, stackTrace) {
    outputText = error.toString();
  });

  return outputText;
}
