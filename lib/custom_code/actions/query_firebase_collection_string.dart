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

import 'package:cloud_firestore/cloud_firestore.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future<String> queryFirebaseCollectionString(
  String? collection,
  String? where,
  String? field,
  String? whereValue,
) async {
  String queryData = '';

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    QuerySnapshot querySnapshot = await firestore
        .collection(collection!)
        .where(where!,
            isEqualTo: whereValue!) // Replace 'John Doe' with the desired name
        .get();

    List<QueryDocumentSnapshot> documents = querySnapshot!.docs;

    for (QueryDocumentSnapshot document in documents!) {
      Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;
      if (data != null && data.containsKey(field!)) {
        queryData = data[field!];
      }
    }
  } catch (e) {
    print('Error: $e');
  }
  // FirebaseFirestore.instance
  //     .collection('user_custom')
  //     .where('employee_id', isEqualTo: employeeId!)
  //     .snapshots()
  //     .listen((data) => print(data()['url_profile']));

  // String img = FirebaseFirestore.instance
  //     .collection('user_custom')
  //     .where('employee_id', isEqualTo: employeeId!)
  //     .get('img_profile');

  return queryData;
}
