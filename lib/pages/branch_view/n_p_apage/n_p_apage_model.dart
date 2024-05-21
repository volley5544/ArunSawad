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
import 'n_p_apage_widget.dart' show NPApageWidget;
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

class NPApageModel extends FlutterFlowModel<NPApageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - a8] action in NPApage widget.
  bool? checkLatLngBVSurveyNPA;
  // Stores action output result for [Backend Call - Create Document] action in NPApage widget.
  UserLogRecord? createdUserLogBVSurveyNPA;
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
  FocusNode? coordinateInputFocusNode;
  TextEditingController? coordinateInputTextController;
  String? Function(BuildContext, String?)?
      coordinateInputTextControllerValidator;
  // State field(s) for assetIDInput widget.
  FocusNode? assetIDInputFocusNode;
  TextEditingController? assetIDInputTextController;
  String? Function(BuildContext, String?)? assetIDInputTextControllerValidator;
  // State field(s) for remarkInput widget.
  FocusNode? remarkInputFocusNode;
  TextEditingController? remarkInputTextController;
  String? Function(BuildContext, String?)? remarkInputTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for coordinateTimesheet widget.
  FocusNode? coordinateTimesheetFocusNode;
  TextEditingController? coordinateTimesheetTextController;
  String? Function(BuildContext, String?)?
      coordinateTimesheetTextControllerValidator;
  // State field(s) for assetIDTimesheet widget.
  FocusNode? assetIDTimesheetFocusNode;
  TextEditingController? assetIDTimesheetTextController;
  String? Function(BuildContext, String?)?
      assetIDTimesheetTextControllerValidator;
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
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave;
  // Stores action output result for [Backend Call - API (npaCheckAssetIdAPI)] action in Button widget.
  ApiCallResponse? checkAssetID;
  // Stores action output result for [Backend Call - API (npaAPI)] action in Button widget.
  ApiCallResponse? npaAPISubmit;
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

    coordinateInputFocusNode?.dispose();
    coordinateInputTextController?.dispose();

    assetIDInputFocusNode?.dispose();
    assetIDInputTextController?.dispose();

    remarkInputFocusNode?.dispose();
    remarkInputTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController6?.dispose();

    coordinateTimesheetFocusNode?.dispose();
    coordinateTimesheetTextController?.dispose();

    assetIDTimesheetFocusNode?.dispose();
    assetIDTimesheetTextController?.dispose();

    remarkTimesheetFocusNode?.dispose();
    remarkTimesheetTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController10?.dispose();
  }
}
