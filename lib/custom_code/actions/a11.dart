// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_messaging/firebase_messaging.dart';

Future<String> a11() async {
  // Add your function code here!
  // Get the token each time the application loads
  String? token = await FirebaseMessaging.instance.getToken();

  // Save the initial token to the database
  // await saveTokenToDatabase(token!);

  // Any time the token refreshes, store this in the database too.
  // FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);

  return token!;
}
