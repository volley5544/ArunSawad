import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_leave_page_widget.dart' show AddLeavePageWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddLeavePageModel extends FlutterFlowModel<AddLeavePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (GetHolidayAPI)] action in AddLeavePage widget.
  ApiCallResponse? getHolidayAPIOutput;
  DateTime? datePicked;
  // State field(s) for leaveTime widget.
  String? leaveTimeValue;
  FormFieldController<String>? leaveTimeValueController;
  // State field(s) for leaveDays widget.
  FocusNode? leaveDaysFocusNode;
  TextEditingController? leaveDaysTextController;
  String? Function(BuildContext, String?)? leaveDaysTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for reasonToLeave widget.
  FocusNode? reasonToLeaveFocusNode;
  TextEditingController? reasonToLeaveTextController;
  String? Function(BuildContext, String?)? reasonToLeaveTextControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];

  // Stores action output result for [Custom Action - uploadMultipleFileFirebaseStorage] action in leaveFile widget.
  List<String>? firebaseuploadoutput;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (leaveRequestFirstAPI)] action in Button widget.
  ApiCallResponse? leaveRequestAPIOutput2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserLogRecord? createdUserLogLogout123;
  // Stores action output result for [Backend Call - API (leaveRequestFirstAPI)] action in Button widget.
  ApiCallResponse? leaveRequestAPIOutput;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserLogRecord? createdUserLogLogout5;
  // Stores action output result for [Backend Call - API (SendFCMNotificationAPI)] action in Button widget.
  ApiCallResponse? fcmSendNotiFication;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationRecord? createLeavePageNotification;

  @override
  void initState(BuildContext context) {
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    leaveDaysFocusNode?.dispose();
    leaveDaysTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    reasonToLeaveFocusNode?.dispose();
    reasonToLeaveTextController?.dispose();
  }
}
