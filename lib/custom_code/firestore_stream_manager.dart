import 'dart:async';

import 'package:arun_sawad/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth/base_auth_user_provider.dart';
import 'backend/schema/user_custom_record.dart';

class FirestoreStreamManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// ----------------------------
  /// Stream Controllers
  /// ----------------------------

  final StreamController<QuerySnapshot?> _userProfileController =
      StreamController<QuerySnapshot?>.broadcast();

  /// Public streams

  Stream<QuerySnapshot?> get userProfileStream => _userProfileController.stream;

  /// ----------------------------
  /// Firestore subscriptions
  /// ----------------------------

  StreamSubscription<QuerySnapshot>? _userProfileSubscription;

  /// ----------------------------
  /// Start listeners
  /// ----------------------------

  void start() {
    _startUserProfileListener();
  }

  /// ============================================================
  /// PRIVATE METHODS
  /// ============================================================

  void _startUserProfileListener() {
    /// Prevent duplicate listener
    _userProfileSubscription?.cancel();

    _userProfileSubscription = _firestore
        .collection('user_custom')
        .where('employee_id', isEqualTo: '${FFAppState().employeeID}')
        .snapshots()
        .listen((docSnapshot) async {
      if (docSnapshot.docs.isNotEmpty) {
        print('user_custom : ${docSnapshot.docs.first.data()!}');
        print('token : ${docSnapshot.docs.first.data()!['access_token']}');
        FFAppState().accessTokenFirestore =
            '${docSnapshot.docs.first.data()!['access_token']}';
        if (loggedIn) {
          if ('${docSnapshot.docs.first.data()!['access_token']}' != '' &&
              '${docSnapshot.docs.first.data()!['access_token']}' != 'null') {
            if (FFAppState().isInApp) {
              if ('${FFAppState().accessToken}' != '' &&
                  '${FFAppState().accessToken}' != 'null' &&
                  '${FFAppState().accessToken}' != 'access_token') {
                if (FFAppState().isProductionNew) {
                  if ('${docSnapshot.docs.first.data()!['access_token']}' !=
                      '${FFAppState().accessToken}') {
                    print('Force Logout 5544');
                    // FFAppEventService.instance.triggerAppEvent(
                    //   CheckAppVersionEvent(
                    //     timestamp: DateTime.now(),
                    //     waitForCompletion: true,
                    //     debugId: '5544',
                    //   ),
                    // );
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
      }
    });
  }
}
