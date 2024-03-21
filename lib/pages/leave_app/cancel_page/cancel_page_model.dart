import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cancel_page_widget.dart' show CancelPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CancelPageModel extends FlutterFlowModel<CancelPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for reasonCancel widget.
  FocusNode? reasonCancelFocusNode;
  TextEditingController? reasonCancelController;
  String? Function(BuildContext, String?)? reasonCancelControllerValidator;
  // Stores action output result for [Backend Call - API (leaveListCancelAPI)] action in Button widget.
  ApiCallResponse? leaveListCancelAPIOutput;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    reasonCancelFocusNode?.dispose();
    reasonCancelController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
