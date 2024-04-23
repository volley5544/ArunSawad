import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'input_copy2_widget.dart' show InputCopy2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InputCopy2Model extends FlutterFlowModel<InputCopy2Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for reasonCancel widget.
  FocusNode? reasonCancelFocusNode;
  TextEditingController? reasonCancelTextController;
  String? Function(BuildContext, String?)? reasonCancelTextControllerValidator;
  // Stores action output result for [Backend Call - API (leaveListCancelAPI)] action in Button widget.
  ApiCallResponse? leaveListCancelAPIOutput;
  // Stores action output result for [Backend Call - API (SendFCMNotificationAPI)] action in Button widget.
  ApiCallResponse? fcmSendNotificationCancelApprove;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationRecord? createCancelApproveNotification;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    reasonCancelFocusNode?.dispose();
    reasonCancelTextController?.dispose();
  }
}
