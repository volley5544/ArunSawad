import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/components/p_d_f_viewer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmployeeKPIPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in EmployeeKPIPage widget.
  UserLogRecord? createdUserLogKPI;
  // Stores action output result for [Backend Call - API (getTargetContractKPIAPI)] action in EmployeeKPIPage widget.
  ApiCallResponse? getTargetContractKPI;
  // Stores action output result for [Backend Call - API (getTargetBudgetKPIAPI)] action in EmployeeKPIPage widget.
  ApiCallResponse? getTargetBudget;
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in EmployeeKPIPage widget.
  ApiCallResponse? getServerDateTime;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
