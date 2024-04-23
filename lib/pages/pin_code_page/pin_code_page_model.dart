import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'pin_code_page_widget.dart' show PinCodePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PinCodePageModel extends FlutterFlowModel<PinCodePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - a3] action in PinCodePage widget.
  String? androidIMEI1st;
  // Stores action output result for [Custom Action - a4] action in PinCodePage widget.
  String? iOSidentifierForVendor1st;
  // Stores action output result for [Custom Action - a1] action in PinCodePage widget.
  bool? checkDeviceLocSer;
  // Stores action output result for [Custom Action - a2] action in PinCodePage widget.
  bool? checkDeviceLocPer;
  // Stores action output result for [Custom Action - getBuildVersion] action in PinCodePage widget.
  String? getDeviceVersion;
  // Stores action output result for [Custom Action - checkStatusFirebase] action in PinCodePage widget.
  bool? checkFirebaseOutput;
  // Stores action output result for [Custom Action - a1] action in IconButton widget.
  bool? checkDeviceLocSerLogout;
  // Stores action output result for [Custom Action - a2] action in IconButton widget.
  bool? checkDeviceLocPerLogout;
  // Stores action output result for [Custom Action - a8] action in IconButton widget.
  bool? checkLatLngLogout;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  UserLogRecord? createdUserLogLogout;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in PinCode widget.
  ApiCallResponse? getUserProfilePin;
  // Stores action output result for [Backend Call - API (getUserInsuranceLicense)] action in PinCode widget.
  ApiCallResponse? getUserInsuranceLicense;
  // Stores action output result for [Custom Action - a8] action in PinCode widget.
  bool? checkLatLngBeforeEnterApp;
  // Stores action output result for [Backend Call - Create Document] action in PinCode widget.
  UserLogRecord? createdUserLogLoginPin;
  // Stores action output result for [Backend Call - Create Document] action in PinCode widget.
  InsuranceNotiDataRecord? createInsuNotidadta;
  // Stores action output result for [Backend Call - Create Document] action in PinCode widget.
  NotificationRecord? createInsuPageNotification;
  bool bioAuthCheck = false;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in IconButton widget.
  ApiCallResponse? getUserProfileBio;
  // Stores action output result for [Backend Call - API (getUserInsuranceLicense)] action in IconButton widget.
  ApiCallResponse? getUserInsuranceLicenseBio;
  // Stores action output result for [Custom Action - a8] action in IconButton widget.
  bool? checkLatLngBeforeEnterAppBio;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  UserLogRecord? createdUserLogLoginPinCopy;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  InsuranceNotiDataRecord? createInsuNotidadta2;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  NotificationRecord? createInsuPageNotificationBio;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pinCodeController?.dispose();
  }
}
