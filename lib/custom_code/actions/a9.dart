// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<List<int>> a9(
  List<int>? matAmountList,
  int? index,
  int? amount,
) async {
  // Add your function code here!
  List<int> materialAmountListUpdate = matAmountList!;
  materialAmountListUpdate[index!] = amount!;
  return materialAmountListUpdate;
}
