import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/input_widget.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MarketingPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - a8] action in MarketingPage widget.
  bool? checkLatLngBVMarketing;
  // Stores action output result for [Backend Call - Create Document] action in MarketingPage widget.
  UserLogRecord? createdUserLogBVMarketing;
  // Stores action output result for [Backend Call - API (getMaterialAPI)] action in MarketingPage widget.
  ApiCallResponse? getMaterialAPIOutput;
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
  // State field(s) for areaInput widget.
  TextEditingController? areaInputController;
  String? Function(BuildContext, String?)? areaInputControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
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
  // State field(s) for areaTimesheet widget.
  TextEditingController? areaTimesheetController;
  String? Function(BuildContext, String?)? areaTimesheetControllerValidator;
  // State field(s) for detailTimesheet widget.
  TextEditingController? detailTimesheetController;
  String? Function(BuildContext, String?)? detailTimesheetControllerValidator;
  // State field(s) for remarkTimesheet widget.
  TextEditingController? remarkTimesheetController;
  String? Function(BuildContext, String?)? remarkTimesheetControllerValidator;
  // State field(s) for TextField widget.
  TextEditingController? textController13;
  String? Function(BuildContext, String?)? textController13Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController14;
  String? Function(BuildContext, String?)? textController14Validator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  TextEditingController? textController15;
  String? Function(BuildContext, String?)? textController15Validator;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave;
  // Stores action output result for [Backend Call - API (MarketingAPI)] action in Button widget.
  ApiCallResponse? marketingAPISubmit;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? apiResulttbh;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    coordinateInputController?.dispose();
    branchInputController?.dispose();
    areaInputController?.dispose();
    remarkInputController?.dispose();
    textController7?.dispose();
    coordinateTimesheetController?.dispose();
    branchTimesheetController?.dispose();
    areaTimesheetController?.dispose();
    detailTimesheetController?.dispose();
    remarkTimesheetController?.dispose();
    textController13?.dispose();
    textController14?.dispose();
    textController15?.dispose();
  }

  /// Additional helper methods are added here.

}
