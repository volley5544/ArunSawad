import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/input_copy2/input_copy2_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'approve_show_page_widget.dart' show ApproveShowPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ApproveShowPageModel extends FlutterFlowModel<ApproveShowPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in ApproveShowPage widget.
  ApiCallResponse? dateTimeAPIOutput;
  // Stores action output result for [Backend Call - API (getApprovedAPI)] action in ApproveShowPage widget.
  ApiCallResponse? getDisapprove;
  // Stores action output result for [Backend Call - API (getApprovedAPI)] action in ApproveShowPage widget.
  ApiCallResponse? getCancelApprove;
  // Stores action output result for [Backend Call - Create Document] action in ApproveShowPage widget.
  UserLogRecord? createdUserLogLogout55;
  // Stores action output result for [Backend Call - API (getApprovedAPI)] action in ApproveShowPage widget.
  ApiCallResponse? getApproved;
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
