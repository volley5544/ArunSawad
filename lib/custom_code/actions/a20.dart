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

Future<int> a20(
  DateTime? doNotShowDateLocalState,
  DateTime? currentDate,
) async {
  // Add your function code here!
  //final DateTime now = DateTime.now();
  //final DateFormat formatter = DateFormat('yyyy-MM-dd');
  //final String formatted = formatter.format(now);
  //print(formatted); // something like 2013-04-20

  return DateTime(doNotShowDateLocalState!.year, doNotShowDateLocalState!.month,
          doNotShowDateLocalState!.day)
      .difference(
          DateTime(currentDate!.year, currentDate!.month, currentDate!.day))
      .inDays;
}
