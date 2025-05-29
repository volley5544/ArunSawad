import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/capture_camera_widget_widget.dart';
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
import 'customer_car_deails_step1_widget.dart'
    show CustomerCarDeailsStep1Widget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CustomerCarDeailsStep1Model
    extends FlutterFlowModel<CustomerCarDeailsStep1Widget> {
  ///  Local state fields for this page.

  ImpoundCarParamSetStruct? tempImpoundCarParamSet;
  void updateTempImpoundCarParamSetStruct(
      Function(ImpoundCarParamSetStruct) updateFn) {
    updateFn(tempImpoundCarParamSet ??= ImpoundCarParamSetStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel1;
  bool isDataUploading_carUploaded01 = false;
  FFUploadedFile uploadedLocalFile_carUploaded01 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel2;
  bool isDataUploading_carUploaded02 = false;
  FFUploadedFile uploadedLocalFile_carUploaded02 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel3;
  bool isDataUploading_carUploaded03 = false;
  FFUploadedFile uploadedLocalFile_carUploaded03 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel4;
  bool isDataUploading_carUploaded04 = false;
  FFUploadedFile uploadedLocalFile_carUploaded04 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel5;
  bool isDataUploading_carUploaded05 = false;
  FFUploadedFile uploadedLocalFile_carUploaded05 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel6;
  bool isDataUploading_carUploaded06 = false;
  FFUploadedFile uploadedLocalFile_carUploaded06 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel7;
  bool isDataUploading_carUploaded07 = false;
  FFUploadedFile uploadedLocalFile_carUploaded07 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel8;
  bool isDataUploading_carUploaded08 = false;
  FFUploadedFile uploadedLocalFile_carUploaded08 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel9;
  bool isDataUploading_carUploaded09 = false;
  FFUploadedFile uploadedLocalFile_carUploaded09 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel10;
  bool isDataUploading_carUploaded10 = false;
  FFUploadedFile uploadedLocalFile_carUploaded10 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel11;
  bool isDataUploading_carUploaded11 = false;
  FFUploadedFile uploadedLocalFile_carUploaded11 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel12;
  bool isDataUploading_carUploaded12 = false;
  FFUploadedFile uploadedLocalFile_carUploaded12 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel13;
  bool isDataUploading_carUploaded13 = false;
  FFUploadedFile uploadedLocalFile_carUploaded13 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car44Uploaded13 = false;
  FFUploadedFile uploadedLocalFile_car44Uploaded13 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded14 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded14 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car44Uploaded15 = false;
  FFUploadedFile uploadedLocalFile_car44Uploaded15 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_car4Uploaded16 = false;
  FFUploadedFile uploadedLocalFile_car4Uploaded16 =
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
  void initState(BuildContext context) {
    captureCameraWidgetModel1 =
        createModel(context, () => CaptureCameraWidgetModel());
    captureCameraWidgetModel2 =
        createModel(context, () => CaptureCameraWidgetModel());
    captureCameraWidgetModel3 =
        createModel(context, () => CaptureCameraWidgetModel());
    captureCameraWidgetModel4 =
        createModel(context, () => CaptureCameraWidgetModel());
    captureCameraWidgetModel5 =
        createModel(context, () => CaptureCameraWidgetModel());
    captureCameraWidgetModel6 =
        createModel(context, () => CaptureCameraWidgetModel());
    captureCameraWidgetModel7 =
        createModel(context, () => CaptureCameraWidgetModel());
    captureCameraWidgetModel8 =
        createModel(context, () => CaptureCameraWidgetModel());
    captureCameraWidgetModel9 =
        createModel(context, () => CaptureCameraWidgetModel());
    captureCameraWidgetModel10 =
        createModel(context, () => CaptureCameraWidgetModel());
    captureCameraWidgetModel11 =
        createModel(context, () => CaptureCameraWidgetModel());
    captureCameraWidgetModel12 =
        createModel(context, () => CaptureCameraWidgetModel());
    captureCameraWidgetModel13 =
        createModel(context, () => CaptureCameraWidgetModel());
  }

  @override
  void dispose() {
    captureCameraWidgetModel1.dispose();
    captureCameraWidgetModel2.dispose();
    captureCameraWidgetModel3.dispose();
    captureCameraWidgetModel4.dispose();
    captureCameraWidgetModel5.dispose();
    captureCameraWidgetModel6.dispose();
    captureCameraWidgetModel7.dispose();
    captureCameraWidgetModel8.dispose();
    captureCameraWidgetModel9.dispose();
    captureCameraWidgetModel10.dispose();
    captureCameraWidgetModel11.dispose();
    captureCameraWidgetModel12.dispose();
    captureCameraWidgetModel13.dispose();
    priceTextFieldFocusNode?.dispose();
    priceTextFieldTextController?.dispose();

    remarkTextFieldFocusNode?.dispose();
    remarkTextFieldTextController?.dispose();
  }
}
