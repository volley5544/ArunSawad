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
import 'dart:typed_data';
import 'package:file_saver/file_saver.dart';

Future downloadFileFromFilePath(String? filePath) async {
  // Add your function code here!
  //final result = await OpenFile.open(filePath!);
  //print(result.message);

  final file = File(filePath!);
  final Uint8List bytes5544 = await file.readAsBytes();
  final String name = file.uri.pathSegments.last.split('.')[0];
  final String extension5544 = file.uri.pathSegments.last.split('.')[1];
  MimeType mimeTyp = MimeType.text;
  if (extension5544 == 'docx' || extension5544 == 'doc') {
    mimeTyp = MimeType.microsoftWord;
  } else if (extension5544 == 'xlsx' || extension5544 == 'xls') {
    mimeTyp = MimeType.microsoftExcel;
  }

  print('file NaMe : ${name}');
  await FileSaver.instance.saveAs(
      bytes: bytes5544, name: name, ext: extension5544, mimeType: mimeTyp);
}
