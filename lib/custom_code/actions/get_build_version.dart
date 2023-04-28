// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Future<String> getBuildVersion() async {
  // Add your function code here!

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String appName = packageInfo.appName;
  String packageName = packageInfo.packageName;
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  //DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //return 'Running on ${androidInfo.model}';

  //print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"

  //IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  return '$version ($buildNumber)';
  //print('Running on ${iosInfo.utsname.machine}');  // e.g. "iPod7,1"

  //WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
  //print('Running on ${webBrowserInfo.userAgent}');  // e.g. "Mozilla/5.0 (X11; Ubuntu; 	Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"
}
