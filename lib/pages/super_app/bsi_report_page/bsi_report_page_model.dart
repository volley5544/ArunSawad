import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'bsi_report_page_widget.dart' show BsiReportPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BsiReportPageModel extends FlutterFlowModel<BsiReportPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in BsiReportPage widget.
  UserLogRecord? createdUserLogBsiReport;
  // Stores action output result for [Backend Call - API (GetlocationAPI)] action in BsiReportPage widget.
  ApiCallResponse? getMyselfBranch;
  // State field(s) for branchInput widget.
  FocusNode? branchInputFocusNode;
  TextEditingController? branchInputTextController;
  String? Function(BuildContext, String?)? branchInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (getBranchAPI)] action in IconButton widget.
  ApiCallResponse? getBranchSearched;
  // State field(s) for BranchDropDown widget.
  String? branchDropDownValue;
  FormFieldController<String>? branchDropDownValueController;
  // State field(s) for ReportDropDown widget.
  String? reportDropDownValue;
  FormFieldController<String>? reportDropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UrlLinkStorageRecord? getCollectionApiUrl;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    branchInputFocusNode?.dispose();
    branchInputTextController?.dispose();
  }
}
