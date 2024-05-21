import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'change_lat_lng_page_web_widget.dart' show ChangeLatLngPageWebWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChangeLatLngPageWebModel
    extends FlutterFlowModel<ChangeLatLngPageWebWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for BranchCodeInput widget.
  FocusNode? branchCodeInputFocusNode;
  TextEditingController? branchCodeInputTextController;
  String? Function(BuildContext, String?)?
      branchCodeInputTextControllerValidator;
  // State field(s) for LatInput widget.
  FocusNode? latInputFocusNode;
  TextEditingController? latInputTextController;
  String? Function(BuildContext, String?)? latInputTextControllerValidator;
  // State field(s) for LngInput widget.
  FocusNode? lngInputFocusNode;
  TextEditingController? lngInputTextController;
  String? Function(BuildContext, String?)? lngInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (ChangeLocationAPI)] action in Button widget.
  ApiCallResponse? changeLocationAPIOutput;
  // Stores action output result for [Custom Action - distanceBetween] action in Button widget.
  String? distanceBetween;
  // State field(s) for GoogleMap1 widget.
  LatLng? googleMap1sCenter;
  final googleMap1sController = Completer<GoogleMapController>();
  // State field(s) for GoogleMap3 widget.
  LatLng? googleMap3sCenter;
  final googleMap3sController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (ChangeLocationAPI)] action in Button widget.
  ApiCallResponse? changeLocationAPIOutputEdit;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    branchCodeInputFocusNode?.dispose();
    branchCodeInputTextController?.dispose();

    latInputFocusNode?.dispose();
    latInputTextController?.dispose();

    lngInputFocusNode?.dispose();
    lngInputTextController?.dispose();
  }
}
