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

import 'package:image/image.dart' as ui;
import 'dart:io';

Future<FFUploadedFile> addWatermark(FFUploadedFile? inputFile) async {
  // Add your function code here!

  // Add your function code here!
  print(inputFile!.name);
  print(inputFile!.bytes);
  print(inputFile!.height);
  print(inputFile!.width);
  // Uint8List image = inputFile!.bytes as Uint8List;
  // print(image);
  // print('wow1');
  // File theOriginalImage = File.fromRawPath(image);
  // print('wow2');
  ui.Image originalImage = ui.decodeImage(
      inputFile!.bytes!)!; //ui.decodeImage(theOriginalImage.readAsBytesSync());
  //ui.Image? watermarkImage = ui.decodeImage(theWatermarkImage.readAsBytesSync());
  print('wow3');
  ui.drawString(originalImage!, "Current TiMe",
      font: ui.arial48, x: 100, y: 120);
  print('wow4');

  //Uint8List modifiedImageBytes = Uint8List.fromList(img.encodePng(image));

  // List<int> wmImage = ui.encodeJpg(originalImage);
  print('wow5');
  // File _watermarkedImage = File.fromRawPath(Uint8List.fromList(wmImage));
  print('wow6');
  // FFUploadedFile watermarkedImage = new FFUploadedFile(
  //   name: "wow image",
  //   bytes: _watermarkedImage.readAsBytesSync(),
  // );
  FFUploadedFile modifiedImageBytes = new FFUploadedFile(
    bytes: Uint8List.fromList(ui.encodePng(originalImage!)),
    name: 'wow image',
  );
  print('wow7');
  print(modifiedImageBytes.name);
  print(modifiedImageBytes.bytes);
  print(modifiedImageBytes.height);
  print(modifiedImageBytes.width);
  return modifiedImageBytes;
}
