import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/show_checkin_image/show_checkin_image_widget.dart';
import '/components/url_link/url_link_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'approved_leave_page_widget.dart' show ApprovedLeavePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ApprovedLeavePageModel extends FlutterFlowModel<ApprovedLeavePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (leaveListAprroveAPI)] action in ApprovedLeavePage widget.
  ApiCallResponse? leaveListAprroveAPIOutput;
  // Stores action output result for [Backend Call - Create Document] action in ApprovedLeavePage widget.
  UserLogRecord? createdUserLogLogout125;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (leaveFlagApproveListAPI)] action in Button widget.
  ApiCallResponse? leaveFlagApproveListOutput;
  // Stores action output result for [Backend Call - API (leaveFlagApproveAPI)] action in Button widget.
  ApiCallResponse? leaveFlagApproveAPIOutput;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationRecord? createResignPageNotification;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationRecord? createResignPageNotificationRequester;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserLogRecord? createdUserLogLogout127;
  // Stores action output result for [Backend Call - API (leaveFlagApproveAPI)] action in Button widget.
  ApiCallResponse? leaveFlagApproveAPIOutput2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationRecord? createNotApproveNotification;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserLogRecord? createdUserLogLogout128;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
