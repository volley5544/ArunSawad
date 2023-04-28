import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WelfareKPIPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in WelfareKPIPage widget.
  UserLogRecord? createdUserLogWelfareKPI;
  // Stores action output result for [Backend Call - API (getWelfareKpiCurrentMonthAPI)] action in WelfareKPIPage widget.
  ApiCallResponse? getKpiWelfareCurrentMonth;
  // Stores action output result for [Backend Call - API (getWelfareKpiLastMonthAPI)] action in WelfareKPIPage widget.
  ApiCallResponse? getKpiWelfareLastMonth;
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in WelfareKPIPage widget.
  ApiCallResponse? getServerDateTime;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
