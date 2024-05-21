import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/camera_button_widget.dart';
import '/components/input/input_widget.dart';
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
import 'marketing_page_widget.dart' show MarketingPageWidget;
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

class MarketingPageModel extends FlutterFlowModel<MarketingPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - a8] action in MarketingPage widget.
  bool? checkLatLngBVMarketing;
  // Stores action output result for [Backend Call - Create Document] action in MarketingPage widget.
  UserLogRecord? createdUserLogBVMarketing;
  // Stores action output result for [Backend Call - API (getMaterialAPI)] action in MarketingPage widget.
  ApiCallResponse? getMaterialAPIOutput;
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
  // State field(s) for areaInput widget.
  FocusNode? areaInputFocusNode;
  TextEditingController? areaInputTextController;
  String? Function(BuildContext, String?)? areaInputTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
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
  // State field(s) for areaTimesheet widget.
  FocusNode? areaTimesheetFocusNode;
  TextEditingController? areaTimesheetTextController;
  String? Function(BuildContext, String?)? areaTimesheetTextControllerValidator;
  // State field(s) for detailTimesheet widget.
  FocusNode? detailTimesheetFocusNode;
  TextEditingController? detailTimesheetTextController;
  String? Function(BuildContext, String?)?
      detailTimesheetTextControllerValidator;
  // State field(s) for remarkTimesheet widget.
  FocusNode? remarkTimesheetFocusNode;
  TextEditingController? remarkTimesheetTextController;
  String? Function(BuildContext, String?)?
      remarkTimesheetTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController15;
  String? Function(BuildContext, String?)? textController15Validator;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave;
  // Stores action output result for [Backend Call - API (MarketingAPI)] action in Button widget.
  ApiCallResponse? marketingAPISubmit;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? apiResulttbh;

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

    areaInputFocusNode?.dispose();
    areaInputTextController?.dispose();

    remarkInputFocusNode?.dispose();
    remarkInputTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController7?.dispose();

    coordinateTimesheetFocusNode?.dispose();
    coordinateTimesheetTextController?.dispose();

    branchTimesheetFocusNode?.dispose();
    branchTimesheetTextController?.dispose();

    areaTimesheetFocusNode?.dispose();
    areaTimesheetTextController?.dispose();

    detailTimesheetFocusNode?.dispose();
    detailTimesheetTextController?.dispose();

    remarkTimesheetFocusNode?.dispose();
    remarkTimesheetTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController13?.dispose();

    textFieldFocusNode5?.dispose();
    textController14?.dispose();

    textFieldFocusNode6?.dispose();
    textController15?.dispose();
  }
}
