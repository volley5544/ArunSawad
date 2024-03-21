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
import 'check_in_page_widget.dart' show CheckInPageWidget;
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

class CheckInPageModel extends FlutterFlowModel<CheckInPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - a8] action in CheckInPage widget.
  bool? checkLatLngBVCheckIn;
  // Stores action output result for [Backend Call - Create Document] action in CheckInPage widget.
  UserLogRecord? createdUserLogBVCheckIn;
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
  FocusNode? coordinateInputFocusNode;
  TextEditingController? coordinateInputController;
  String? Function(BuildContext, String?)? coordinateInputControllerValidator;
  // State field(s) for remarkInput widget.
  FocusNode? remarkInputFocusNode;
  TextEditingController? remarkInputController;
  String? Function(BuildContext, String?)? remarkInputControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for coordinateTimesheet widget.
  FocusNode? coordinateTimesheetFocusNode;
  TextEditingController? coordinateTimesheetController;
  String? Function(BuildContext, String?)?
      coordinateTimesheetControllerValidator;
  // State field(s) for remarkTimesheet widget.
  FocusNode? remarkTimesheetFocusNode;
  TextEditingController? remarkTimesheetController;
  String? Function(BuildContext, String?)? remarkTimesheetControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // Stores action output result for [Backend Call - API (TimesheetDetailAPI)] action in Button widget.
  ApiCallResponse? updateCheckin;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave;
  // Stores action output result for [Backend Call - API (CheckInAPI)] action in Button widget.
  ApiCallResponse? checkInAPISubmit;
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

    coordinateInputFocusNode?.dispose();
    coordinateInputController?.dispose();

    remarkInputFocusNode?.dispose();
    remarkInputController?.dispose();

    textFieldFocusNode3?.dispose();
    textController5?.dispose();

    coordinateTimesheetFocusNode?.dispose();
    coordinateTimesheetController?.dispose();

    remarkTimesheetFocusNode?.dispose();
    remarkTimesheetController?.dispose();

    textFieldFocusNode4?.dispose();
    textController8?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
