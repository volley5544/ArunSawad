import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/alert_update_app_component_widget.dart';
import '/components/force_logout_component_widget.dart';
import '/components/force_update_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future alertUpdateAppBlock(BuildContext context) async {
  String? forceUpdateAlertOutput;

  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: WebViewAware(
          child: ForceUpdateComponentWidget(),
        ),
      );
    },
  ).then((value) => forceUpdateAlertOutput = value);

  if (isAndroid) {
    await launchURL(
        'https://play.google.com/store/apps/details?id=com.mycompany.publicarunsawad');
    await actions.terminateAppAction();
  } else if (isiOS) {
    await launchURL('itms-beta://testflight.apple.com/join/8sA3XObM');
    await actions.terminateAppAction();
  }
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

Future forceLogoutActionBlock(BuildContext context) async {
  String? forceLogoutDialogOutput;
  LatLng? getLocationLogoutButton;
  UserLogRecord? createdUserLogForceLogout;

  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: WebViewAware(
          child: ForceLogoutComponentWidget(),
        ),
      );
    },
  ).then((value) => forceLogoutDialogOutput = value);

  showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: WebViewAware(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: LoadingSceneWidget(),
          ),
        ),
      );
    },
  );

  getLocationLogoutButton = await actions.getLocation(
    'ForceLogout',
  );

  var userLogRecordReference = UserLogRecord.collection.doc();
  await userLogRecordReference.set(createUserLogRecordData(
    employeeId: FFAppState().employeeID,
    action: 'Logout',
    actionTime: getCurrentTimestamp,
    userLocation: getLocationLogoutButton,
  ));
  createdUserLogForceLogout = UserLogRecord.getDocumentFromData(
      createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'Logout',
        actionTime: getCurrentTimestamp,
        userLocation: getLocationLogoutButton,
      ),
      userLogRecordReference);
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
  FFAppState().leadID = [];
  FFAppState().leadCreatedTimeList = [];
  FFAppState().update(() {});
  FFAppState().leadCustomerNameList = [];
  FFAppState().leadChannelList = [];
  FFAppState().update(() {});
  FFAppState().leadChannelColor = [];
  FFAppState().leadCallStatus = [];
  FFAppState().update(() {});
  FFAppState().leadPhoneNumberList = [];
  FFAppState().leadEmployeeID = [];
  FFAppState().update(() {});
  FFAppState().leadChannelLabelColor = [];
  FFAppState().deleteLeadIdCalledInApp();
  FFAppState().leadIdCalledInApp = [];

  FFAppState().update(() {});
  FFAppState().leadBranchCode = [];
  FFAppState().leadUserLevel = 'lead_user_level';
  FFAppState().update(() {});
  FFAppState().leadChannelAmountList = [];
  FFAppState().update(() {});
  Navigator.pop(context);
  await actions.a22();

  context.goNamed(LoginPageWidget.routeName);
}

Future alertUpdateAppBlock2(BuildContext context) async {
  String? forceUpdateAlertOutput;

  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (dialogContext) {
      return Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        alignment:
            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        child: WebViewAware(
          child: AlertUpdateAppComponentWidget(),
        ),
      );
    },
  ).then((value) => forceUpdateAlertOutput = value);

  if ('${forceUpdateAlertOutput}' != 'update') {
    return;
  }
  if (isAndroid) {
    await launchURL(
        'https://play.google.com/store/apps/details?id=com.mycompany.publicarunsawad');
  } else if (isiOS) {
    await launchURL('itms-beta://testflight.apple.com/join/8sA3XObM');
  }
}
