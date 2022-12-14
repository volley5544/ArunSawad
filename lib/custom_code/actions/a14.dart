// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:firebase_messaging/firebase_messaging.dart';

String notiMessage = 'notification_message';
bool getNotification = false;

Future<bool> a14() async {
  // Get any messages which caused the application to open from
  // a terminated state.

  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();

  // If the message also contains a data property with a "type" of "chat",
  // navigate to a chat screen
  if (initialMessage != null) {
    getNotification = true;
  }

  // Also handle any interaction when the app is in the background via a
  // Stream listener
  //FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

  return getNotification;
}

//void _handleMessage(RemoteMessage message) {
// if (message.data['leadid'] == '200023') {
// //Navigator.pushNamed(context, '/chat',
// //arguments: ChatArguments(message),
// notiMessage = 'lead id = 200023';
// }
