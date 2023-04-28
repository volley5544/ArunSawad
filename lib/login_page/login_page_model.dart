import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getBuildVersion] action in LoginPage widget.
  String? deviceBuildVersion;
  // Stores action output result for [Custom Action - a11] action in LoginPage widget.
  String? getFCMToken;
  // Stores action output result for [Custom Action - a3] action in LoginPage widget.
  String? androidIMEI1st;
  // Stores action output result for [Custom Action - a4] action in LoginPage widget.
  String? iOSidentifierForVendor1st;
  // Stores action output result for [Custom Action - a3] action in LoginPage widget.
  String? androidIMEI;
  // Stores action output result for [Custom Action - a4] action in LoginPage widget.
  String? iOSidentifierForVendor;
  // State field(s) for usernameInput widget.
  TextEditingController? usernameInputController;
  String? Function(BuildContext, String?)? usernameInputControllerValidator;
  // State field(s) for passwordInput widget.
  TextEditingController? passwordInputController;
  late bool passwordInputVisibility;
  String? Function(BuildContext, String?)? passwordInputControllerValidator;
  // Stores action output result for [Backend Call - API (authenAPI)] action in Button widget.
  ApiCallResponse? authenAPIOutputBtn;
  // Stores action output result for [Backend Call - API (authenAPI)] action in Button widget.
  ApiCallResponse? confirmAuthen;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in Button widget.
  ApiCallResponse? getUserProfile;
  // Stores action output result for [Custom Action - a13] action in Button widget.
  String? customFirebaseAuthen;
  // Stores action output result for [Custom Action - a21] action in Button widget.
  String? userUID;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserCustomRecord? createdUserCustom;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserLogRecord? userLogCreated;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserLogRecord? createdUserLogLogin;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FCMTokenRecord? androidCreateFMCTokenDoc;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FCMTokenRecord? iosCreateFMCTokenDoc;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordInputVisibility = false;
  }

  void dispose() {
    usernameInputController?.dispose();
    passwordInputController?.dispose();
  }

  /// Additional helper methods are added here.

}
