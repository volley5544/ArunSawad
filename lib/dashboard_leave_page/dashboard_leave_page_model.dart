import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardLeavePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in DashboardLeavePage widget.
  UserLogRecord? createdUserLogLeavePage;
  // Stores action output result for [Backend Call - API (GetBossAPI)] action in DashboardLeavePage widget.
  ApiCallResponse? getBossAPIOutput;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createdUserLogLeaveRequest;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createdUserLogLeaveShow;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createdUserLogLeaveApprove;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createdUserLogLeaveApproveShow;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
