import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/call_history/call_history_widget.dart';
import '/components/saved_lead_called_status/saved_lead_called_status_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'lead_noti_new_page_dup_widget.dart' show LeadNotiNewPageDupWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LeadNotiNewPageDupModel
    extends FlutterFlowModel<LeadNotiNewPageDupWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldSearch widget.
  FocusNode? textFieldSearchFocusNode;
  TextEditingController? textFieldSearchTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchTextControllerValidator;
  // Stores action output result for [Backend Call - API (addPhoneCalledLeadAPI)] action in Image widget.
  ApiCallResponse? addCalledLead;
  // Stores action output result for [Backend Call - API (getLeadCalledStatusDropdownAPI)] action in Button widget.
  ApiCallResponse? getCalledStatusCode;
  // Stores action output result for [Bottom Sheet - savedLeadCalledStatus] action in Button widget.
  String? savedCallStatus;
  // Stores action output result for [Backend Call - API (getLeadCalledHistoryAPI)] action in Button widget.
  ApiCallResponse? getCallHistory;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldSearchFocusNode?.dispose();
    textFieldSearchTextController?.dispose();
  }
}
