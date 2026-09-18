import 'package:cloud_firestore/cloud_firestore.dart';

import 'serialization_util.dart';
import '../../auth/firebase_auth/auth_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

export 'push_notifications_handler.dart';
export 'serialization_util.dart';

class UserTokenInfo {
  const UserTokenInfo(this.userPath, this.fcmToken);
  final String userPath;
  final String fcmToken;
}

Stream<UserTokenInfo> getFcmTokenStream(String userPath) => Stream.value(
        !kIsWeb &&
            (defaultTargetPlatform == TargetPlatform.iOS ||
                defaultTargetPlatform == TargetPlatform.android))
    .where((shouldGetToken) => shouldGetToken)
    .asyncMap<String?>((shouldRequestPermission) async {
      final settings = shouldRequestPermission
          ? await FirebaseMessaging.instance.requestPermission()
          : await FirebaseMessaging.instance.getNotificationSettings();
      return settings.authorizationStatus == AuthorizationStatus.authorized
          ? FirebaseMessaging.instance.getToken()
          : null;
    })
    .switchMap((fcmToken) =>
        Stream.value(fcmToken).merge(FirebaseMessaging.instance.onTokenRefresh))
    .where((fcmToken) => fcmToken != null && fcmToken.isNotEmpty)
    .map((token) => UserTokenInfo(userPath, token!));

final fcmTokenUserStream = authenticatedUserStream
    .where((user) => user != null)
    .map((user) => user!.reference.path)
    .distinct()
    .switchMap(getFcmTokenStream)
    .map(
      (userTokenInfo) => makeCloudCall(
        'addFcmToken',
        {
          'userDocPath': userTokenInfo.userPath,
          'fcmToken': userTokenInfo.fcmToken,
          'deviceType':
              defaultTargetPlatform == TargetPlatform.iOS ? 'iOS' : 'Android',
        },
      ),
    );
