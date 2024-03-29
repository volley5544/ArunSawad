import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/input_copy2/input_copy2_widget.dart';
import '/components/input_copy2_copy/input_copy2_copy_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/show_checkin_image/show_checkin_image_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'leave_show_page_copy_widget.dart' show LeaveShowPageCopyWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LeaveShowPageCopyModel extends FlutterFlowModel<LeaveShowPageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (leaveListAPI)] action in LeaveShowPageCopy widget.
  ApiCallResponse? leaveListAPIOutput;
  // Stores action output result for [Backend Call - API (resignListAPI)] action in LeaveShowPageCopy widget.
  ApiCallResponse? resignListAPIOutput;
  // State field(s) for monthSelect widget.
  String? monthSelectValue;
  FormFieldController<String>? monthSelectValueController;
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
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
