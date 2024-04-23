import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'input_copy2_copy_widget.dart' show InputCopy2CopyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InputCopy2CopyModel extends FlutterFlowModel<InputCopy2CopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for reasonCancel widget.
  FocusNode? reasonCancelFocusNode;
  TextEditingController? reasonCancelTextController;
  String? Function(BuildContext, String?)? reasonCancelTextControllerValidator;
  // Stores action output result for [Backend Call - API (sendResignFormEmailAPI)] action in Button widget.
  ApiCallResponse? sendEmail;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    reasonCancelFocusNode?.dispose();
    reasonCancelTextController?.dispose();
  }
}
