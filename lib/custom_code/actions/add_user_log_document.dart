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

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future addUserLogDocument(
  String? actionName,
  String? employeeId,
  LatLng? currentLocation,
  String? hashThaiId,
) async {
  // Add your function code here!
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Map<String, dynamic> data = {
      'action': actionName,
      'action_time': FieldValue.serverTimestamp(),
      'employee_id': employeeId!,
      'user_location':
          GeoPoint(currentLocation!.latitude, currentLocation!.longitude),
      'hash_thai_id': hashThaiId!
    };
    await firestore.collection('user_log').add(data);
  } catch (e) {
    print('Error creating document: $e');
  }
}
