import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/camera_button_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'o_p_spage_widget.dart' show OPSpageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class OPSpageModel extends FlutterFlowModel<OPSpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
  // State field(s) for branchInput widget.
  FocusNode? branchInputFocusNode;
  TextEditingController? branchInputTextController;
  String? Function(BuildContext, String?)? branchInputTextControllerValidator;
  // State field(s) for assetDropDown widget.
  String? assetDropDownValue;
  FormFieldController<String>? assetDropDownValueController;
  // State field(s) for assteTypeDropDown widget.
  String? assteTypeDropDownValue;
  FormFieldController<String>? assteTypeDropDownValueController;
  // State field(s) for carPlateInput widget.
  FocusNode? carPlateInputFocusNode;
  TextEditingController? carPlateInputTextController;
  String? Function(BuildContext, String?)? carPlateInputTextControllerValidator;
  // State field(s) for signStatusDropDown widget.
  String? signStatusDropDownValue;
  FormFieldController<String>? signStatusDropDownValueController;
  // State field(s) for remarkInput widget.
  FocusNode? remarkInputFocusNode;
  TextEditingController? remarkInputTextController;
  String? Function(BuildContext, String?)? remarkInputTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for coordinateTimesheet widget.
  FocusNode? coordinateTimesheetFocusNode;
  TextEditingController? coordinateTimesheetTextController;
  String? Function(BuildContext, String?)?
      coordinateTimesheetTextControllerValidator;
  // State field(s) for branchTimesheet widget.
  FocusNode? branchTimesheetFocusNode;
  TextEditingController? branchTimesheetTextController;
  String? Function(BuildContext, String?)?
      branchTimesheetTextControllerValidator;
  // State field(s) for assetDropDownTimesheet widget.
  String? assetDropDownTimesheetValue;
  FormFieldController<String>? assetDropDownTimesheetValueController;
  // State field(s) for assteTypeDropDownTimesheet widget.
  String? assteTypeDropDownTimesheetValue;
  FormFieldController<String>? assteTypeDropDownTimesheetValueController;
  // State field(s) for carPlateTimesheet widget.
  FocusNode? carPlateTimesheetFocusNode;
  TextEditingController? carPlateTimesheetTextController;
  String? Function(BuildContext, String?)?
      carPlateTimesheetTextControllerValidator;
  // State field(s) for signStatusDropDownTimesheet widget.
  String? signStatusDropDownTimesheetValue;
  FormFieldController<String>? signStatusDropDownTimesheetValueController;
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
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in Button widget.
  ApiCallResponse? checkLoginBeforeBack;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGSPBeforeSave1;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in Button widget.
  ApiCallResponse? checkLoginBeforeSave1;
  // Stores action output result for [Backend Call - API (opsAPI)] action in Button widget.
  ApiCallResponse? opsAPI;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? saveImgToFirebase1;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave2;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in Button widget.
  ApiCallResponse? checkLoginBeforeSave3;
  // Stores action output result for [Backend Call - API (opsAPI)] action in Button widget.
  ApiCallResponse? opsAPIFarmCar;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? saveImgToFirebase2;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave3;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in Button widget.
  ApiCallResponse? checkLoginBeforeSave2;
  // Stores action output result for [Backend Call - API (opsAPI)] action in Button widget.
  ApiCallResponse? opsAPISignboard;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? saveImgToFirebase3;

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

    branchInputFocusNode?.dispose();
    branchInputTextController?.dispose();

    carPlateInputFocusNode?.dispose();
    carPlateInputTextController?.dispose();

    remarkInputFocusNode?.dispose();
    remarkInputTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController7?.dispose();

    coordinateTimesheetFocusNode?.dispose();
    coordinateTimesheetTextController?.dispose();

    branchTimesheetFocusNode?.dispose();
    branchTimesheetTextController?.dispose();

    carPlateTimesheetFocusNode?.dispose();
    carPlateTimesheetTextController?.dispose();

    remarkTimesheetFocusNode?.dispose();
    remarkTimesheetTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController12?.dispose();
  }
}
