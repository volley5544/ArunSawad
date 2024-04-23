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

import 'dart:typed_data';
import 'package:flutter/services.dart';
import '/backend/firebase_storage/storage.dart'; // Imports firebase storage function

Future<String?> uploadFileFirebaseStorage(
  String? uploadedFolderName,
  FFUploadedFile? file,
) async {
  // Add your function code here!
  //DateFormat dateFormat = DateFormat("yyyy-MM-dd-HH:mm:ss"); //yyyyMMddHHmmssSSS
  //String timestamp = dateFormat.format(DateTime.now());

  DateFormat dateFormat1 = DateFormat("yyyyMMM"); //yyyyMMddHHmmssSSS
  String folderName = dateFormat1.format(DateTime.now());
  String uniqueFileName = '${file!.name!}'; //fileName + " " + timestamp;

  String pathUploaded =
      '${uploadedFolderName!}/${folderName}/${uniqueFileName}'; //uploadedFolderName! + "/" + folderName + "/" + uniqueFileName;

  return uploadData(pathUploaded, file!.bytes!);
}
