import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'empolyee_check_in_widget.dart' show EmpolyeeCheckInWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EmpolyeeCheckInModel extends FlutterFlowModel<EmpolyeeCheckInWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetlocationAPI)] action in EmpolyeeCheckIn widget.
  ApiCallResponse? getLocationOutput1;
  // Stores action output result for [Backend Call - Create Document] action in EmpolyeeCheckIn widget.
  UserLogRecord? createdUserLogLogout2;
  // Stores action output result for [Backend Call - API (GetlocationAPI)] action in EmpolyeeCheckIn widget.
  ApiCallResponse? getLocationOutput;
  // Stores action output result for [Backend Call - Create Document] action in EmpolyeeCheckIn widget.
  UserLogRecord? createdUserLogLogout;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Icon widget.
  String? uploadFirebaseStorageAction;
  // State field(s) for branchDropDown widget.
  String? branchDropDownValue;
  FormFieldController<String>? branchDropDownValueController;
  // State field(s) for branchField widget.
  final branchFieldKey = GlobalKey();
  FocusNode? branchFieldFocusNode;
  TextEditingController? branchFieldTextController;
  String? branchFieldSelectedOption;
  String? Function(BuildContext, String?)? branchFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (GetlocationAPI)] action in findLocation widget.
  ApiCallResponse? findLocationOutput;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for reasoncheckin1 widget.
  FocusNode? reasoncheckin1FocusNode;
  TextEditingController? reasoncheckin1TextController;
  String? Function(BuildContext, String?)?
      reasoncheckin1TextControllerValidator;
  // Stores action output result for [Custom Action - locationCal] action in Button widget.
  bool? inCurrentLocation;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - uploadFileFirebaseStorage] action in Button widget.
  String? uploadFirebaseStorageCheckinBtn;
  // Stores action output result for [Custom Action - locationCal] action in Button widget.
  bool? inCurrentLocation2;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave;
  // Stores action output result for [Backend Call - API (CheckinAPI)] action in Button widget.
  ApiCallResponse? checkinAPIOutput;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserLogRecord? createdUserLogLogout1;
  // Stores action output result for [Backend Call - API (GetlocationAPI)] action in Button widget.
  ApiCallResponse? getLocationOutput2Copy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    branchFieldFocusNode?.dispose();

    reasoncheckin1FocusNode?.dispose();
    reasoncheckin1TextController?.dispose();
  }
}
