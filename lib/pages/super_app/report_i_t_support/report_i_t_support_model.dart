import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'report_i_t_support_widget.dart' show ReportITSupportWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ReportITSupportModel extends FlutterFlowModel<ReportITSupportWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - a8] action in ReportITSupport widget.
  bool? checkLatLngBVSurvey;
  // Stores action output result for [Backend Call - Create Document] action in ReportITSupport widget.
  UserLogRecord? createdUserLogBVSurvey;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for coordinateInput widget.
  FocusNode? coordinateInputFocusNode;
  TextEditingController? coordinateInputController;
  String? Function(BuildContext, String?)? coordinateInputControllerValidator;
  // State field(s) for desInput widget.
  FocusNode? desInputFocusNode;
  TextEditingController? desInputController;
  String? Function(BuildContext, String?)? desInputControllerValidator;
  // State field(s) for idInput widget.
  FocusNode? idInputFocusNode;
  TextEditingController? idInputController;
  String? Function(BuildContext, String?)? idInputControllerValidator;
  // State field(s) for nameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputController;
  String? Function(BuildContext, String?)? nameInputControllerValidator;
  // State field(s) for landmarkInput widget.
  FocusNode? landmarkInputFocusNode;
  TextEditingController? landmarkInputController;
  String? Function(BuildContext, String?)? landmarkInputControllerValidator;
  // State field(s) for remarkInput widget.
  FocusNode? remarkInputFocusNode;
  TextEditingController? remarkInputController;
  String? Function(BuildContext, String?)? remarkInputControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    coordinateInputFocusNode?.dispose();
    coordinateInputController?.dispose();

    desInputFocusNode?.dispose();
    desInputController?.dispose();

    idInputFocusNode?.dispose();
    idInputController?.dispose();

    nameInputFocusNode?.dispose();
    nameInputController?.dispose();

    landmarkInputFocusNode?.dispose();
    landmarkInputController?.dispose();

    remarkInputFocusNode?.dispose();
    remarkInputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
