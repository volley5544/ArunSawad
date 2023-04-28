import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class OPSpageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

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
  TextEditingController? coordinateInputController;
  String? Function(BuildContext, String?)? coordinateInputControllerValidator;
  // State field(s) for branchInput widget.
  TextEditingController? branchInputController;
  String? Function(BuildContext, String?)? branchInputControllerValidator;
  // State field(s) for assetDropDown widget.
  String? assetDropDownValue;
  FormFieldController<String>? assetDropDownValueController;
  // State field(s) for assteTypeDropDown widget.
  String? assteTypeDropDownValue;
  FormFieldController<String>? assteTypeDropDownValueController;
  // State field(s) for carPlateInput widget.
  TextEditingController? carPlateInputController;
  String? Function(BuildContext, String?)? carPlateInputControllerValidator;
  // State field(s) for signStatusDropDown widget.
  String? signStatusDropDownValue;
  FormFieldController<String>? signStatusDropDownValueController;
  // State field(s) for remarkInput widget.
  TextEditingController? remarkInputController;
  String? Function(BuildContext, String?)? remarkInputControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for coordinateTimesheet widget.
  TextEditingController? coordinateTimesheetController;
  String? Function(BuildContext, String?)?
      coordinateTimesheetControllerValidator;
  // State field(s) for branchTimesheet widget.
  TextEditingController? branchTimesheetController;
  String? Function(BuildContext, String?)? branchTimesheetControllerValidator;
  // State field(s) for assetDropDownTimesheet widget.
  String? assetDropDownTimesheetValue;
  FormFieldController<String>? assetDropDownTimesheetValueController;
  // State field(s) for assteTypeDropDownTimesheet widget.
  String? assteTypeDropDownTimesheetValue;
  FormFieldController<String>? assteTypeDropDownTimesheetValueController;
  // State field(s) for carPlateTimesheet widget.
  TextEditingController? carPlateTimesheetController;
  String? Function(BuildContext, String?)? carPlateTimesheetControllerValidator;
  // State field(s) for signStatusDropDownTimesheet widget.
  String? signStatusDropDownTimesheetValue;
  FormFieldController<String>? signStatusDropDownTimesheetValueController;
  // State field(s) for remarkTimesheet widget.
  TextEditingController? remarkTimesheetController;
  String? Function(BuildContext, String?)? remarkTimesheetControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in Button widget.
  ApiCallResponse? checkLoginBeforeBack;
  // Stores action output result for [Custom Action - a1] action in Button widget.
  bool? checkGPSService1;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGSPBeforeSave1;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in Button widget.
  ApiCallResponse? checkLoginBeforeSave1;
  // Stores action output result for [Backend Call - API (opsAPI)] action in Button widget.
  ApiCallResponse? opsAPI;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? saveImgToFirebase1;
  // Stores action output result for [Custom Action - a1] action in Button widget.
  bool? checkGPSService2;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave2;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in Button widget.
  ApiCallResponse? checkLoginBeforeSave3;
  // Stores action output result for [Backend Call - API (opsAPI)] action in Button widget.
  ApiCallResponse? opsAPIFarmCar;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? saveImgToFirebase2;
  // Stores action output result for [Custom Action - a1] action in Button widget.
  bool? checkGPSService3;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave3;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in Button widget.
  ApiCallResponse? checkLoginBeforeSave2;
  // Stores action output result for [Backend Call - API (opsAPI)] action in Button widget.
  ApiCallResponse? opsAPISignboard;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? saveImgToFirebase3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    coordinateInputController?.dispose();
    branchInputController?.dispose();
    carPlateInputController?.dispose();
    remarkInputController?.dispose();
    textController7?.dispose();
    coordinateTimesheetController?.dispose();
    branchTimesheetController?.dispose();
    carPlateTimesheetController?.dispose();
    remarkTimesheetController?.dispose();
    textController12?.dispose();
  }

  /// Additional helper methods are added here.

}
