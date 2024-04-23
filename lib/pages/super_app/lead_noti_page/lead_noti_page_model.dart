import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/call_history/call_history_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/saved_lead_called_status/saved_lead_called_status_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'lead_noti_page_widget.dart' show LeadNotiPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LeadNotiPageModel extends FlutterFlowModel<LeadNotiPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in LeadNotiPage widget.
  UserLogRecord? createdLeadDetailLog;
  // Stores action output result for [Backend Call - API (getLeadDetailAPI)] action in LeadNotiPage widget.
  ApiCallResponse? getLeadDetail;
  // Stores action output result for [Backend Call - API (addPhoneCalledLeadAPI)] action in Image widget.
  ApiCallResponse? addCalledLead;
  // Stores action output result for [Backend Call - API (getLeadCalledStatusDropdownAPI)] action in Button widget.
  ApiCallResponse? getCalledStatusCode;
  // Stores action output result for [Backend Call - API (getLeadCalledHistoryAPI)] action in Button widget.
  ApiCallResponse? getCallHistory;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
