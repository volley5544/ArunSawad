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
import 'package:unique_identifier/unique_identifier.dart';

String _identifier = 'Unknown';

Future<String> a3() async {
  // Add your function code here!

  String? identifier;
  try {
    identifier = await UniqueIdentifier.serial;
  } on PlatformException {
    identifier = 'Failed to get Unique Identifier';
  }

  //if (!mounted) return;

  _identifier = identifier!;
  return _identifier;
}
