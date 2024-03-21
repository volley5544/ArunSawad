import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/add_branch_lo/add_branch_lo_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'change_lat_lng_page_widget.dart' show ChangeLatLngPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChangeLatLngPageModel extends FlutterFlowModel<ChangeLatLngPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - a8] action in ChangeLatLngPage widget.
  bool? checkLatLngBVCheckIn;
  // Stores action output result for [Backend Call - Create Document] action in ChangeLatLngPage widget.
  UserLogRecord? createdUserLogBVCheckIn;
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
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter1;
  final googleMapsController1 = Completer<GoogleMapController>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter2;
  final googleMapsController2 = Completer<GoogleMapController>();
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
