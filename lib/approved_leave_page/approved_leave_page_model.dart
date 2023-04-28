import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/components/show_checkin_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ApprovedLeavePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (leaveListAprroveAPI)] action in ApprovedLeavePage widget.
  ApiCallResponse? leaveListAprroveAPIOutput;
  // Stores action output result for [Backend Call - API (leaveFlagApproveAPI)] action in Button widget.
  ApiCallResponse? leaveFlagApproveAPIOutput;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationRecord? createResignPageNotification;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationRecord? createResignPageNotificationRequester;
  // Stores action output result for [Backend Call - API (leaveFlagApproveAPI)] action in Button widget.
  ApiCallResponse? leaveFlagApproveAPIOutput2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationRecord? createNotApproveNotification;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
