import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
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
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
  TextEditingController? coordinateInputController1;
  String? Function(BuildContext, String?)? coordinateInputController1Validator;
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for coordinateInput widget.
  FocusNode? coordinateInputFocusNode2;
  TextEditingController? coordinateInputController2;
  String? Function(BuildContext, String?)? coordinateInputController2Validator;
  // State field(s) for desTimesheet widget.
  FocusNode? desTimesheetFocusNode;
  TextEditingController? desTimesheetController;
  String? Function(BuildContext, String?)? desTimesheetControllerValidator;
  // State field(s) for idTimesheet widget.
  FocusNode? idTimesheetFocusNode;
  TextEditingController? idTimesheetController;
  String? Function(BuildContext, String?)? idTimesheetControllerValidator;
  // State field(s) for nameTimesheet widget.
  FocusNode? nameTimesheetFocusNode;
  TextEditingController? nameTimesheetController;
  String? Function(BuildContext, String?)? nameTimesheetControllerValidator;
  // State field(s) for landmarkTimesheet widget.
  FocusNode? landmarkTimesheetFocusNode;
  TextEditingController? landmarkTimesheetController;
  String? Function(BuildContext, String?)? landmarkTimesheetControllerValidator;
  // State field(s) for remarkTimesheet widget.
  FocusNode? remarkTimesheetFocusNode;
  TextEditingController? remarkTimesheetController;
  String? Function(BuildContext, String?)? remarkTimesheetControllerValidator;
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    coordinateInputFocusNode1?.dispose();
    coordinateInputController1?.dispose();

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

    textFieldFocusNode3?.dispose();
    textController9?.dispose();

    coordinateInputFocusNode2?.dispose();
    coordinateInputController2?.dispose();

    desTimesheetFocusNode?.dispose();
    desTimesheetController?.dispose();

    idTimesheetFocusNode?.dispose();
    idTimesheetController?.dispose();

    nameTimesheetFocusNode?.dispose();
    nameTimesheetController?.dispose();

    landmarkTimesheetFocusNode?.dispose();
    landmarkTimesheetController?.dispose();

    remarkTimesheetFocusNode?.dispose();
    remarkTimesheetController?.dispose();

    textFieldFocusNode4?.dispose();
    textController16?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
