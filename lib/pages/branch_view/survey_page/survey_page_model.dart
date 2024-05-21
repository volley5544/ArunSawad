import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/camera_button_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'survey_page_widget.dart' show SurveyPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SurveyPageModel extends FlutterFlowModel<SurveyPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - a8] action in SurveyPage widget.
  bool? checkLatLngBVSurvey;
  // Stores action output result for [Backend Call - Create Document] action in SurveyPage widget.
  UserLogRecord? createdUserLogBVSurvey;
  // Model for cameraButton component.
  late CameraButtonModel cameraButtonModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for coordinateInput widget.
  FocusNode? coordinateInputFocusNode1;
  TextEditingController? coordinateInputTextController1;
  String? Function(BuildContext, String?)?
      coordinateInputTextController1Validator;
  // State field(s) for desInput widget.
  FocusNode? desInputFocusNode;
  TextEditingController? desInputTextController;
  String? Function(BuildContext, String?)? desInputTextControllerValidator;
  // State field(s) for idInput widget.
  FocusNode? idInputFocusNode;
  TextEditingController? idInputTextController;
  String? Function(BuildContext, String?)? idInputTextControllerValidator;
  // State field(s) for nameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  // State field(s) for landmarkInput widget.
  FocusNode? landmarkInputFocusNode;
  TextEditingController? landmarkInputTextController;
  String? Function(BuildContext, String?)? landmarkInputTextControllerValidator;
  // State field(s) for remarkInput widget.
  FocusNode? remarkInputFocusNode;
  TextEditingController? remarkInputTextController;
  String? Function(BuildContext, String?)? remarkInputTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for coordinateInput widget.
  FocusNode? coordinateInputFocusNode2;
  TextEditingController? coordinateInputTextController2;
  String? Function(BuildContext, String?)?
      coordinateInputTextController2Validator;
  // State field(s) for desTimesheet widget.
  FocusNode? desTimesheetFocusNode;
  TextEditingController? desTimesheetTextController;
  String? Function(BuildContext, String?)? desTimesheetTextControllerValidator;
  // State field(s) for idTimesheet widget.
  FocusNode? idTimesheetFocusNode;
  TextEditingController? idTimesheetTextController;
  String? Function(BuildContext, String?)? idTimesheetTextControllerValidator;
  // State field(s) for nameTimesheet widget.
  FocusNode? nameTimesheetFocusNode;
  TextEditingController? nameTimesheetTextController;
  String? Function(BuildContext, String?)? nameTimesheetTextControllerValidator;
  // State field(s) for landmarkTimesheet widget.
  FocusNode? landmarkTimesheetFocusNode;
  TextEditingController? landmarkTimesheetTextController;
  String? Function(BuildContext, String?)?
      landmarkTimesheetTextControllerValidator;
  // State field(s) for remarkTimesheet widget.
  FocusNode? remarkTimesheetFocusNode;
  TextEditingController? remarkTimesheetTextController;
  String? Function(BuildContext, String?)?
      remarkTimesheetTextControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController16;
  String? Function(BuildContext, String?)? textController16Validator;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave;
  // Stores action output result for [Backend Call - API (SurveyAPI)] action in Button widget.
  ApiCallResponse? surveyAPISubmit;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? saveImgToFirebase;

  @override
  void initState(BuildContext context) {
    cameraButtonModel = createModel(context, () => CameraButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cameraButtonModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    coordinateInputFocusNode1?.dispose();
    coordinateInputTextController1?.dispose();

    desInputFocusNode?.dispose();
    desInputTextController?.dispose();

    idInputFocusNode?.dispose();
    idInputTextController?.dispose();

    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    landmarkInputFocusNode?.dispose();
    landmarkInputTextController?.dispose();

    remarkInputFocusNode?.dispose();
    remarkInputTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController9?.dispose();

    coordinateInputFocusNode2?.dispose();
    coordinateInputTextController2?.dispose();

    desTimesheetFocusNode?.dispose();
    desTimesheetTextController?.dispose();

    idTimesheetFocusNode?.dispose();
    idTimesheetTextController?.dispose();

    nameTimesheetFocusNode?.dispose();
    nameTimesheetTextController?.dispose();

    landmarkTimesheetFocusNode?.dispose();
    landmarkTimesheetTextController?.dispose();

    remarkTimesheetFocusNode?.dispose();
    remarkTimesheetTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController16?.dispose();
  }
}
