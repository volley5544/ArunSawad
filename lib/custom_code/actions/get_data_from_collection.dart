// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

Future<dynamic> getDataFromCollection(String? collection) async {
  // Add your function code here!
  Map<String, dynamic> dataOutput = {};

  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection(collection!)
        .get(); //.where(filterField, isEqualTo: filterValue)

    List<QueryDocumentSnapshot> documents = querySnapshot.docs;

    for (QueryDocumentSnapshot document in documents!) {
      Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;
      if (data != null) {
        dataOutput = data;
      }
    }
  } catch (e) {
    print('Error: $e');
  }
  print('dataOutput :  $dataOutput');
  dynamic jsonOutput = jsonEncode(dataOutput);
  return jsonOutput;
}
