import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/checkin_status/checkin_status_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/p_d_f_viewer/p_d_f_viewer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'check_in_status_page_widget.dart' show CheckInStatusPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CheckInStatusPageModel extends FlutterFlowModel<CheckInStatusPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (checkinoutThisMonthAPI)] action in CheckInStatusPage widget.
  ApiCallResponse? checkinThisMonthOutput;
  // Stores action output result for [Backend Call - Create Document] action in CheckInStatusPage widget.
  UserLogRecord? createdUserLogLogout3;
  // Stores action output result for [Backend Call - API (checkinoutLastMonthAPI)] action in CheckInStatusPage widget.
  ApiCallResponse? checkinLastMonthOutput;
  // Stores action output result for [Backend Call - Create Document] action in CheckInStatusPage widget.
  UserLogRecord? createdUserLogLogout4;
  // Stores action output result for [Backend Call - API (GetLeaveDateCheckinAPI)] action in CheckInStatusPage widget.
  ApiCallResponse? getPersonalLeaveDate;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableController.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
