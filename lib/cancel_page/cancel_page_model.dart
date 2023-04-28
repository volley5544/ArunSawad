import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CancelPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for reasonCancel widget.
  TextEditingController? reasonCancelController;
  String? Function(BuildContext, String?)? reasonCancelControllerValidator;
  // Stores action output result for [Backend Call - API (leaveListCancelAPI)] action in Button widget.
  ApiCallResponse? leaveListCancelAPIOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    reasonCancelController?.dispose();
  }

  /// Additional helper methods are added here.

}
