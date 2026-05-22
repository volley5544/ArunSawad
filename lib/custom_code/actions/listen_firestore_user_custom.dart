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

Future listenFirestoreUserCustom() async {
  // Add your function code here!

  FirebaseFirestore.instance
      .collection('user_custom')
      .where('employee_id', isEqualTo: '${FFAppState().employeeID}')
      .snapshots()
      .listen((docSnapshot) async {
    if (docSnapshot.docs.isNotEmpty) {
      print('user_custom : ${docSnapshot.docs.first.data()!}');
      print('token : ${docSnapshot.docs.first.data()!['access_token']}');
      if ('${docSnapshot.docs.first.data()!['access_token']}' != '' &&
          '${docSnapshot.docs.first.data()!['access_token']}' != 'null') {
        if (FFAppState().isInApp) {
          if ('${FFAppState().accessToken}' != '' &&
              '${FFAppState().accessToken}' != 'null' &&
              '${FFAppState().accessToken}' != 'access_token') {
            if (FFAppState().isProductionNew) {
              if ('${docSnapshot.docs.first.data()!['access_token']}' !=
                  '${FFAppState().accessToken}') {
                FFAppEventService.instance.triggerAppEvent(
                  CheckAppVersionEvent(
                    timestamp: DateTime.now(),
                    waitForCompletion: true,
                    debugId: '5544',
                  ),
                );
              }
            }
          }
        }
      } else {
        if ('${FFAppState().accessToken}' != '' &&
            '${FFAppState().accessToken}' != 'null' &&
            '${FFAppState().accessToken}' != 'access_token') {
          if ('${FFAppState().userRef!}' != '' &&
              '${FFAppState().userRef!}' != 'null') {
            // update token in firebase
            await FFAppState().userRef!.update(createUserCustomRecordData(
                  accessToken: FFAppState().accessToken,
                ));
          }
        }
      }
    }
  });
}
