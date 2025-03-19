import '';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/ibs_page_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'i_b_s_report_widget.dart' show IBSReportWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class IBSReportModel extends FlutterFlowModel<IBSReportWidget> {
  ///  Local state fields for this page.

  double? borderWidth = 7.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetKPIAll)] action in IBSReport widget.
  ApiCallResponse? kPIAllOutput;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for ibsPageComponent component.
  late IbsPageComponentModel ibsPageComponentModel;

  @override
  void initState(BuildContext context) {
    ibsPageComponentModel = createModel(context, () => IbsPageComponentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    ibsPageComponentModel.dispose();
  }
}
