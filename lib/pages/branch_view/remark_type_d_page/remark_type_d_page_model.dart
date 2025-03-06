import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/image_or_pdf_viewer_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
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
import '/index.dart';
import 'remark_type_d_page_widget.dart' show RemarkTypeDPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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

  List<String> uploadedFileTypeList = [];
  void addToUploadedFileTypeList(String item) => uploadedFileTypeList.add(item);
  void removeFromUploadedFileTypeList(String item) =>
      uploadedFileTypeList.remove(item);
  void removeAtIndexFromUploadedFileTypeList(int index) =>
      uploadedFileTypeList.removeAt(index);
  void insertAtIndexInUploadedFileTypeList(int index, String item) =>
      uploadedFileTypeList.insert(index, item);
  void updateUploadedFileTypeListAtIndex(
          int index, Function(String) updateFn) =>
      uploadedFileTypeList[index] = updateFn(uploadedFileTypeList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - a8] action in RemarkTypeDPage widget.
  bool? checkLatLngBVCheckIn;
  // Stores action output result for [Backend Call - Create Document] action in RemarkTypeDPage widget.
  UserLogRecord? createdUserLogBVCheckIn;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for coordinateInput widget.
  FocusNode? coordinateInputFocusNode;
  TextEditingController? coordinateInputTextController;
  String? Function(BuildContext, String?)?
      coordinateInputTextControllerValidator;
  // State field(s) for idInput widget.
  FocusNode? idInputFocusNode;
  TextEditingController? idInputTextController;
  String? Function(BuildContext, String?)? idInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (ApiVloanCheckContractTypeD)] action in Button widget.
  ApiCallResponse? getVloanContract;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for remarkInput widget.
  FocusNode? remarkInputFocusNode;
  TextEditingController? remarkInputTextController;
  String? Function(BuildContext, String?)? remarkInputTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for coordinateTimesheet widget.
  FocusNode? coordinateTimesheetFocusNode;
  TextEditingController? coordinateTimesheetTextController;
  String? Function(BuildContext, String?)?
      coordinateTimesheetTextControllerValidator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Custom Action - a8] action in Button widget.
  bool? checkGPSBeforeSave;
  // Stores action output result for [Backend Call - API (LawLedAPI)] action in Button widget.
  ApiCallResponse? lawLedAPISubmit;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    coordinateInputFocusNode?.dispose();
    coordinateInputTextController?.dispose();

    idInputFocusNode?.dispose();
    idInputTextController?.dispose();

    remarkInputFocusNode?.dispose();
    remarkInputTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController5?.dispose();

    coordinateTimesheetFocusNode?.dispose();
    coordinateTimesheetTextController?.dispose();
  }
}
