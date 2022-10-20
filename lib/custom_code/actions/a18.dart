// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<bool> a18(
  DateTime? doNotShowDateLocalState,
  DateTime? currentDate,
) async {
  // Add your function code here!
  bool doNotShowAgain = true;

  if (doNotShowDateLocalState != null) {
    //doNotShowDate!.difference(currentDate!).inDays;
    if (DateTime(doNotShowDateLocalState!.year, doNotShowDateLocalState!.month,
                doNotShowDateLocalState!.day)
            .difference(DateTime(
                currentDate!.year, currentDate!.month, currentDate!.day))
            .inDays ==
        0) {
      doNotShowAgain = false;
    }
  } else if (doNotShowDateLocalState == null) {
    doNotShowAgain = false;
  }
  //DateTime leadFinalTime = leadCreatedTime![index!].add(Duration(days: 15));
  //int leadTimeLeft = leadFinalTime.difference(currentTime!).inDays;

  return doNotShowAgain;
}
