// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';

Future open3CXAction(String? phoneNumber) async {
  // Add your function code here!

  final url = 'tel:${Uri.encodeComponent(phoneNumber!)}';

  await launchUrl(Uri.parse(url));
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
