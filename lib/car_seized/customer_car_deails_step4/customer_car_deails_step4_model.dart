import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene_insurance/loading_scene_insurance_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'customer_car_deails_step4_widget.dart'
    show CustomerCarDeailsStep4Widget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CustomerCarDeailsStep4Model
    extends FlutterFlowModel<CustomerCarDeailsStep4Widget> {
  ///  Local state fields for this page.

  ImpoundCarParamSetStruct? tempImpoundCarParamSet;
  void updateTempImpoundCarParamSetStruct(
      Function(ImpoundCarParamSetStruct) updateFn) {
    updateFn(tempImpoundCarParamSet ??= ImpoundCarParamSetStruct());
  }

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_car4Uploaded01 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded01 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded02 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded02 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded03 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded03 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded04 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded04 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded05 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded05 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded06 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded06 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded07 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded07 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded08 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded08 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded09 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded09 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded10 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded10 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded11 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded11 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded12 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded12 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded131 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded131 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded13 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded13 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car44Uploaded14 = false;
  FFUploadedFile uploadedLocalFile_car44Uploaded14 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded15 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded15 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car44Uploaded16 = false;
  FFUploadedFile uploadedLocalFile_car44Uploaded16 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for PriceTextField widget.
  FocusNode? priceTextFieldFocusNode;
  TextEditingController? priceTextFieldTextController;
  String? Function(BuildContext, String?)?
      priceTextFieldTextControllerValidator;
  // State field(s) for RemarkTextField widget.
  FocusNode? remarkTextFieldFocusNode;
  TextEditingController? remarkTextFieldTextController;
  String? Function(BuildContext, String?)?
      remarkTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (uploadGoogleDriveAPI)] action in Button widget.
  ApiCallResponse? uploadGoogleDriveApiOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    priceTextFieldFocusNode?.dispose();
    priceTextFieldTextController?.dispose();

    remarkTextFieldFocusNode?.dispose();
    remarkTextFieldTextController?.dispose();
  }
}
