import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/loading_scene_widget.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SurveyPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - a8] action in SurveyPage widget.
  bool? checkLatLngBVSurvey;
  // Stores action output result for [Backend Call - Create Document] action in SurveyPage widget.
  UserLogRecord? createdUserLogBVSurvey;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for coordinateInput widget.
  TextEditingController? coordinateInputController1;
  String? Function(BuildContext, String?)? coordinateInputController1Validator;
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
  // State field(s) for TextField widget.
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for coordinateInput widget.
  TextEditingController? coordinateInputController2;
  String? Function(BuildContext, String?)? coordinateInputController2Validator;
  // State field(s) for desTimesheet widget.
  TextEditingController? desTimesheetController;
  String? Function(BuildContext, String?)? desTimesheetControllerValidator;
  // State field(s) for idTimesheet widget.
  TextEditingController? idTimesheetController;
  String? Function(BuildContext, String?)? idTimesheetControllerValidator;
  // State field(s) for nameTimesheet widget.
  TextEditingController? nameTimesheetController;
  String? Function(BuildContext, String?)? nameTimesheetControllerValidator;
  // State field(s) for landmarkTimesheet widget.
  TextEditingController? landmarkTimesheetController;
  String? Function(BuildContext, String?)? landmarkTimesheetControllerValidator;
  // State field(s) for remarkTimesheet widget.
  TextEditingController? remarkTimesheetController;
  String? Function(BuildContext, String?)? remarkTimesheetControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  TextEditingController? textController16;
  String? Function(BuildContext, String?)? textController16Validator;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave;
  // Stores action output result for [Backend Call - API (SurveyAPI)] action in Button widget.
  ApiCallResponse? surveyAPISubmit;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? saveImgToFirebase;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    coordinateInputController1?.dispose();
    desInputController?.dispose();
    idInputController?.dispose();
    nameInputController?.dispose();
    landmarkInputController?.dispose();
    remarkInputController?.dispose();
    textController9?.dispose();
    coordinateInputController2?.dispose();
    desTimesheetController?.dispose();
    idTimesheetController?.dispose();
    nameTimesheetController?.dispose();
    landmarkTimesheetController?.dispose();
    remarkTimesheetController?.dispose();
    textController16?.dispose();
  }

  /// Additional helper methods are added here.

}
