import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'branch_selected_page_widget.dart' show BranchSelectedPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BranchSelectedPageModel
    extends FlutterFlowModel<BranchSelectedPageWidget> {
  ///  Local state fields for this page.

  bool allowChangeLocation = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (improundCarGetBranch)] action in BranchSelectedPage widget.
  ApiCallResponse? getBranchOutput;
  // State field(s) for SearchTextfield widget.
  FocusNode? searchTextfieldFocusNode;
  TextEditingController? searchTextfieldTextController;
  String? Function(BuildContext, String?)?
      searchTextfieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTextfieldFocusNode?.dispose();
    searchTextfieldTextController?.dispose();
  }
}
