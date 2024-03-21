import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
  TextEditingController? branchCodeInputController;
  String? Function(BuildContext, String?)? branchCodeInputControllerValidator;
  // State field(s) for LatInput widget.
  FocusNode? latInputFocusNode;
  TextEditingController? latInputController;
  String? Function(BuildContext, String?)? latInputControllerValidator;
  // State field(s) for LngInput widget.
  FocusNode? lngInputFocusNode;
  TextEditingController? lngInputController;
  String? Function(BuildContext, String?)? lngInputControllerValidator;
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    branchCodeInputFocusNode?.dispose();
    branchCodeInputController?.dispose();

    latInputFocusNode?.dispose();
    latInputController?.dispose();

    lngInputFocusNode?.dispose();
    lngInputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
