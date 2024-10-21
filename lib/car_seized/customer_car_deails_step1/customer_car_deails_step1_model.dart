import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
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
  ///  State fields for stateful widgets in this page.

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel1;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel2;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel3;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel4;
  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel5;
  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel6;
  bool isDataUploading6 = false;
  FFUploadedFile uploadedLocalFile6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel7;
  bool isDataUploading7 = false;
  FFUploadedFile uploadedLocalFile7 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel8;
  bool isDataUploading8 = false;
  FFUploadedFile uploadedLocalFile8 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel9;
  bool isDataUploading9 = false;
  FFUploadedFile uploadedLocalFile9 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel10;
  bool isDataUploading10 = false;
  FFUploadedFile uploadedLocalFile10 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel11;
  bool isDataUploading11 = false;
  FFUploadedFile uploadedLocalFile11 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for CaptureCameraWidget component.
  late CaptureCameraWidgetModel captureCameraWidgetModel12;
  bool isDataUploading12 = false;
  FFUploadedFile uploadedLocalFile12 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
