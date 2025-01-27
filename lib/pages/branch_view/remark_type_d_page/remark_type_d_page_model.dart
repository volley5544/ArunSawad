import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
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
import '/flutter_flow/upload_data.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'remark_type_d_page_widget.dart' show RemarkTypeDPageWidget;
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

class RemarkTypeDPageModel extends FlutterFlowModel<RemarkTypeDPageWidget> {
  ///  Local state fields for this page.

  List<String> remarkIDList = [];
  void addToRemarkIDList(String item) => remarkIDList.add(item);
  void removeFromRemarkIDList(String item) => remarkIDList.remove(item);
  void removeAtIndexFromRemarkIDList(int index) => remarkIDList.removeAt(index);
  void insertAtIndexInRemarkIDList(int index, String item) =>
      remarkIDList.insert(index, item);
  void updateRemarkIDListAtIndex(int index, Function(String) updateFn) =>
      remarkIDList[index] = updateFn(remarkIDList[index]);

  List<String> remarkNameList = [];
  void addToRemarkNameList(String item) => remarkNameList.add(item);
  void removeFromRemarkNameList(String item) => remarkNameList.remove(item);
  void removeAtIndexFromRemarkNameList(int index) =>
      remarkNameList.removeAt(index);
  void insertAtIndexInRemarkNameList(int index, String item) =>
      remarkNameList.insert(index, item);
  void updateRemarkNameListAtIndex(int index, Function(String) updateFn) =>
      remarkNameList[index] = updateFn(remarkNameList[index]);

  List<FFUploadedFile> uploadedimageList = [];
  void addToUploadedimageList(FFUploadedFile item) =>
      uploadedimageList.add(item);
  void removeFromUploadedimageList(FFUploadedFile item) =>
      uploadedimageList.remove(item);
  void removeAtIndexFromUploadedimageList(int index) =>
      uploadedimageList.removeAt(index);
  void insertAtIndexInUploadedimageList(int index, FFUploadedFile item) =>
      uploadedimageList.insert(index, item);
  void updateUploadedimageListAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      uploadedimageList[index] = updateFn(uploadedimageList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - a8] action in RemarkTypeDPage widget.
  bool? checkLatLngBVCheckIn;
  // Stores action output result for [Backend Call - Create Document] action in RemarkTypeDPage widget.
  UserLogRecord? createdUserLogBVCheckIn;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

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
  // State field(s) for idInput widget.
  FocusNode? idInputFocusNode;
  TextEditingController? idInputTextController;
  String? Function(BuildContext, String?)? idInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (getVloanContractAPI)] action in Button widget.
  ApiCallResponse? getVloanContract;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
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
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // Stores action output result for [Backend Call - API (TimesheetDetailAPI)] action in Button widget.
  ApiCallResponse? updateCheckin;
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave;
  // Stores action output result for [Backend Call - API (CheckInAPI)] action in Button widget.
  ApiCallResponse? checkInAPISubmit;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FileUploadRecord? saveImgToFirebase;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    coordinateInputFocusNode?.dispose();
    coordinateInputTextController?.dispose();

    idInputFocusNode?.dispose();
    idInputTextController?.dispose();

    remarkInputFocusNode?.dispose();
    remarkInputTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController6?.dispose();

    coordinateTimesheetFocusNode?.dispose();
    coordinateTimesheetTextController?.dispose();

    remarkTimesheetFocusNode?.dispose();
    remarkTimesheetTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController9?.dispose();
  }
}
