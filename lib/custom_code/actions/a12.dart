// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

Future a12(String? phoneNumber) async {
  // Add your function code here!
  //String phoneNumber = '0864113456';
  FlutterPhoneDirectCaller.callNumber(phoneNumber!);
}
