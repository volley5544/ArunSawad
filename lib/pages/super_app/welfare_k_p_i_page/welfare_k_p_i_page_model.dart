import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'welfare_k_p_i_page_widget.dart' show WelfareKPIPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WelfareKPIPageModel extends FlutterFlowModel<WelfareKPIPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in WelfareKPIPage widget.
  UserLogRecord? createdUserLogWelfareKPI;
  // Stores action output result for [Backend Call - API (getWelfareKpiCurrentMonthAPI)] action in WelfareKPIPage widget.
  ApiCallResponse? getKpiWelfareCurrentMonth;
  // Stores action output result for [Backend Call - API (getWelfareKpiLastMonthAPI)] action in WelfareKPIPage widget.
  ApiCallResponse? getKpiWelfareLastMonth;
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in WelfareKPIPage widget.
  ApiCallResponse? getServerDateTime;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
