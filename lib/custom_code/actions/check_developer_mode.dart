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
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

Future<bool> checkDeveloperMode() async {
  bool isDevMode = false;
  if (!Platform.isAndroid) return false;

  if (Platform.isAndroid) {
    Timestamp now = Timestamp.now();

    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      // Firestore-based document ID
      String docId =
          '${now.seconds}_${now.nanoseconds}_${FFAppState().employeeID}';

      Map<String, dynamic> data = {
        'employee_id': '${FFAppState().employeeID}',
        'date_time': FieldValue.serverTimestamp(),
        'device_id': '${FFAppState().imei}',
        'operating_system': Platform.isAndroid ? 'Android' : 'iOS',
        'log_from': 'Developer_Mode_On'
      };
      await firestore.collection('FakeLocationLog').doc(docId).set(data);

      if (FFAppState().blockMockedLocation) {
        return false;
      }

      isDevMode = await FlutterJailbreakDetection.developerMode ?? false;
    } on PlatformException {
      return true;
    }
  }

  return isDevMode;
}
