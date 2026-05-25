// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

Future listenFirestoreAppVersion() async {
  // Add your function code here!

  FirebaseFirestore.instance
      .collection('BuildVersion')
      .doc('64QVxJ3DHbmVMUPVLnWr')
      .snapshots()
      .listen((docSnapshot) async {
    print('queryVersion : ${docSnapshot.data()!}');
    FFAppState().firestoreAppVersion = Platform.isAndroid
        ? docSnapshot.data()!['build_number_android']
        : Platform.isIOS
            ? docSnapshot.data()!['build_number_ios']
            : 0;

    if (FFAppState().isProductionNew) {
      if (FFAppState().isInApp) {
        int appVersion = await getBuildNumber() ?? 0;
        print('app version : ${appVersion}');
        if (Platform.isAndroid) {
          print(
              'android build : ${docSnapshot.data()!['build_number_android']}');

          docSnapshot.data()!['build_number_android'];
          if (int.parse('${appVersion}') <
              docSnapshot.data()!['build_number_android']) {
            if (docSnapshot.data()!['force_update'] ||
                '${FFAppState().employeeId}' == '31622' ||
                '${FFAppState().employeeId}' == '33511') {
              FFAppEventService.instance.triggerAppEvent(
                CheckAppVersionEvent(
                  timestamp: DateTime.now(),
                  waitForCompletion: true,
                  debugId: '5544',
                ),
              );
            } else {
              FFAppEventService.instance.triggerAppEvent(
                AlertAppUpdateEvent(
                  timestamp: DateTime.now(),
                  waitForCompletion: true,
                  debugId: '5544',
                ),
              );
            }
          }
        } else if (Platform.isIOS) {
          print('ios build : ${docSnapshot.data()!['build_number_ios']}');
          docSnapshot.data()!['build_number_ios'];
          if (int.parse('${appVersion}') <
              docSnapshot.data()!['build_number_ios']) {
            if (docSnapshot.data()!['force_update'] ||
                '${FFAppState().employeeId}' == '31622' ||
                '${FFAppState().employeeId}' == '33511') {
              FFAppEventService.instance.triggerAppEvent(
                CheckAppVersionEvent(
                  timestamp: DateTime.now(),
                  waitForCompletion: true,
                  debugId: '5544',
                ),
              );
            } else {
              FFAppEventService.instance.triggerAppEvent(
                AlertAppUpdateEvent(
                  timestamp: DateTime.now(),
                  waitForCompletion: true,
                  debugId: '5544',
                ),
              );
            }
          }
        } else {}
      }
    }
  });
}
