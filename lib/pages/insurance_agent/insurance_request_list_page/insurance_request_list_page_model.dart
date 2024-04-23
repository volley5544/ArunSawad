import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'insurance_request_list_page_widget.dart'
    show InsuranceRequestListPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceRequestListPageModel
    extends FlutterFlowModel<InsuranceRequestListPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (insuranceRequestListAPI)] action in InsuranceRequestListPage widget.
  ApiCallResponse? getRequestList;
  // Stores action output result for [Backend Call - API (insuranceRequestDetailAPI)] action in Button widget.
  ApiCallResponse? getInsuranceDetail;
  // Stores action output result for [Backend Call - API (insuranceRequestDetailAPI)] action in Button widget.
  ApiCallResponse? getInsuranceDetailDup;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
