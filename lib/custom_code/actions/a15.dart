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

Future<String> a15() async {
  // Get any messages which caused the application to open from
  // a terminated state.

  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();

  // If the message also contains a data property with a "type" of "chat",
  // navigate to a chat screen
  if (initialMessage != null) {
    _handleMessage(initialMessage);
  }
  //notiMessage = initialMessage!.data['leadid'];

  // Also handle any interaction when the app is in the background via a
  // Stream listener
  FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

  return notiMessage;
}

void _handleMessage(RemoteMessage message) {
  if (message.notification != null) {
    // //Navigator.pushNamed(context, '/chat',
    // //arguments: ChatArguments(message),
    // notiMessage = 'lead id = 200023';
    notiMessage = 'have noti';
  }
}
