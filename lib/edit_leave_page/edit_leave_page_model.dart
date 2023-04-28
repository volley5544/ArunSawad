import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditLeavePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetHolidayAPI)] action in EditLeavePage widget.
  ApiCallResponse? getHolidayAPIOutput;
  DateTime? datePicked;
  // State field(s) for leaveTime widget.
  String? leaveTimeValue;
  FormFieldController<String>? leaveTimeValueController;
  // State field(s) for leaveDays widget.
  TextEditingController? leaveDaysController;
  String? Function(BuildContext, String?)? leaveDaysControllerValidator;
  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for reasonToLeave widget.
  TextEditingController? reasonToLeaveController;
  String? Function(BuildContext, String?)? reasonToLeaveControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for PageView widget.
  PageController? pageViewController1;
  // State field(s) for PageView widget.
  PageController? pageViewController2;
  // Stores action output result for [Backend Call - API (leaveEditAPI )] action in Button widget.
  ApiCallResponse? leaveEditAPIOutput2;
  // Stores action output result for [Backend Call - API (leaveEditAPI )] action in Button widget.
  ApiCallResponse? leaveEditAPIOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    leaveDaysController?.dispose();
    phoneNumberController?.dispose();
    reasonToLeaveController?.dispose();
  }

  /// Additional helper methods are added here.

}
