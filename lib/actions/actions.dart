import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';

Future alertUpdateAppBlock(BuildContext context) async {
  context.goNamed(Ew9tf0uewitfWidget.routeName);
}

Future<bool?> checkToken(
  BuildContext context, {
  required String? statuscode,
}) async {
  if (statuscode != '401') {
    return true;
  }
  FFAppState().loginStateFirebase = '[loginStateFirebase]';
  FFAppState().deleteAccessToken();
  FFAppState().accessToken = 'access_token';

  FFAppState().update(() {});
  FFAppState().deleteEmployeeID();
  FFAppState().employeeID = 'employee_id';

  FFAppState().QRCodeLink = 'qrcode_link';
  FFAppState().update(() {});
  FFAppState().deleteApiURLLocalState();
  FFAppState().apiURLLocalState = 'api_url_local_state';

  FFAppState().deleteBranchCode();
  FFAppState().branchCode = 'branch_code';

  FFAppState().update(() {});
  FFAppState().isFromSetPinPage = false;
  FFAppState().leadChannelColor = [];
  FFAppState().update(() {});
  FFAppState().leadChannelList = [];
  FFAppState().isFromLoginPage = false;
  FFAppState().update(() {});
  FFAppState().deletePinCodeAuthen();
  FFAppState().pinCodeAuthen = '013972';

  FFAppState().isFromAuthenPage = false;
  FFAppState().update(() {});
  FFAppState().deleteDateDoNotShowAgain();
  FFAppState().dateDoNotShowAgain = null;

  FFAppState().deleteDoNotShowAgain();
  FFAppState().doNotShowAgain = false;

  FFAppState().update(() {});
  FFAppState().inAppViaNotification = true;
  FFAppState().isInApp = false;
  FFAppState().update(() {});
  FFAppState().fcmToken = 'fcm_token';
  FFAppState().isPassLoginSection = false;
  FFAppState().update(() {});
  await actions.a22();
  return false;
}
