import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'insurance_request_image_page_widget.dart'
    show InsuranceRequestImagePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceRequestImagePageModel
    extends FlutterFlowModel<InsuranceRequestImagePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in InsuranceRequestImagePage widget.
  ApiCallResponse? getDateTimeServer;
  bool isDataUploading_uploadPhoto1 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto2 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto3 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto4 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto5 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto6 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhotoShow = false;
  FFUploadedFile uploadedLocalFile_uploadPhotoShow =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto8 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto8 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto9 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto9 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto1Truct1 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto1Truct1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto2Truct1 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto2Truct1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto3Truct1 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto3Truct1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto4Truct1 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto4Truct1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto5Truct1 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto5Truct1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto6Truct1 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto6Truct1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhotoShowTruct1 = false;
  FFUploadedFile uploadedLocalFile_uploadPhotoShowTruct1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto8Truct1 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto8Truct1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto1Truct2 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto1Truct2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto2Truct2 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto2Truct2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto3Truct2 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto3Truct2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto4Truct2 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto4Truct2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto5Truct2 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto5Truct2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto6Truct2 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto6Truct2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhotoShowTruct2 = false;
  FFUploadedFile uploadedLocalFile_uploadPhotoShowTruct2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto8Truct2 = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto8Truct2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData9 = false;
  FFUploadedFile uploadedLocalFile_uploadData9 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData10 = false;
  FFUploadedFile uploadedLocalFile_uploadData10 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData11 = false;
  FFUploadedFile uploadedLocalFile_uploadData11 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData12 = false;
  FFUploadedFile uploadedLocalFile_uploadData12 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData13 = false;
  FFUploadedFile uploadedLocalFile_uploadData13 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData14 = false;
  FFUploadedFile uploadedLocalFile_uploadData14 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData15 = false;
  FFUploadedFile uploadedLocalFile_uploadData15 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (insuranceRequestSendEmailAPI)] action in Button widget.
  ApiCallResponse? sendEmailRequestApi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
