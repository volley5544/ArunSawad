import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'form_it_support_widget.dart' show FormItSupportWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormItSupportModel extends FlutterFlowModel<FormItSupportWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for leaveDays widget.
  FocusNode? leaveDaysFocusNode;
  TextEditingController? leaveDaysController;
  String? Function(BuildContext, String?)? leaveDaysControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for reasonToLeave widget.
  FocusNode? reasonToLeaveFocusNode;
  TextEditingController? reasonToLeaveController;
  String? Function(BuildContext, String?)? reasonToLeaveControllerValidator;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    leaveDaysFocusNode?.dispose();
    leaveDaysController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    reasonToLeaveFocusNode?.dispose();
    reasonToLeaveController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
