import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'test_circle_map_widget.dart' show TestCircleMapWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestCircleMapModel extends FlutterFlowModel<TestCircleMapWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getCheckinImgUrlApi)] action in Button widget.
  ApiCallResponse? getCheckinImgUrl1;
  // Stores action output result for [Backend Call - API (getCheckinImgUrlUrlApi)] action in Button widget.
  ApiCallResponse? getCheckinImgUrl2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
