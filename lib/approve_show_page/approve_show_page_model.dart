import '/backend/api_requests/api_calls.dart';
import '/components/input_copy2_widget.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ApproveShowPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in ApproveShowPage widget.
  ApiCallResponse? dateTimeAPIOutput;
  // Stores action output result for [Backend Call - API (getApprovedAPI)] action in ApproveShowPage widget.
  ApiCallResponse? getDisapprove;
  // Stores action output result for [Backend Call - API (getApprovedAPI)] action in ApproveShowPage widget.
  ApiCallResponse? getCancelApprove;
  // Stores action output result for [Backend Call - API (getApprovedAPI)] action in ApproveShowPage widget.
  ApiCallResponse? getApproved;
  // State field(s) for monthSelect widget.
  String? monthSelectValue;
  FormFieldController<String>? monthSelectValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
