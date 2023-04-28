import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportITSupportModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - a8] action in ReportITSupport widget.
  bool? checkLatLngBVSurvey;
  // Stores action output result for [Backend Call - Create Document] action in ReportITSupport widget.
  UserLogRecord? createdUserLogBVSurvey;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for coordinateInput widget.
  TextEditingController? coordinateInputController;
  String? Function(BuildContext, String?)? coordinateInputControllerValidator;
  // State field(s) for desInput widget.
  TextEditingController? desInputController;
  String? Function(BuildContext, String?)? desInputControllerValidator;
  // State field(s) for idInput widget.
  TextEditingController? idInputController;
  String? Function(BuildContext, String?)? idInputControllerValidator;
  // State field(s) for nameInput widget.
  TextEditingController? nameInputController;
  String? Function(BuildContext, String?)? nameInputControllerValidator;
  // State field(s) for landmarkInput widget.
  TextEditingController? landmarkInputController;
  String? Function(BuildContext, String?)? landmarkInputControllerValidator;
  // State field(s) for remarkInput widget.
  TextEditingController? remarkInputController;
  String? Function(BuildContext, String?)? remarkInputControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    coordinateInputController?.dispose();
    desInputController?.dispose();
    idInputController?.dispose();
    nameInputController?.dispose();
    landmarkInputController?.dispose();
    remarkInputController?.dispose();
  }

  /// Additional helper methods are added here.

}
