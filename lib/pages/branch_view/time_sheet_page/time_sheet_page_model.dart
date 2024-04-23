import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'time_sheet_page_widget.dart' show TimeSheetPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TimeSheetPageModel extends FlutterFlowModel<TimeSheetPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - a8] action in TimeSheetPage widget.
  bool? checkLatLngBVTimeSheet;
  // Stores action output result for [Backend Call - Create Document] action in TimeSheetPage widget.
  UserLogRecord? createdUserLogBVSurvey;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (TimesheetDetailAPI)] action in Container widget.
  ApiCallResponse? checkInTimesheetDetail;
  // Stores action output result for [Backend Call - API (TimesheetDetailAPI)] action in Container widget.
  ApiCallResponse? surveyTimesheetDetail;
  // Stores action output result for [Backend Call - API (TimesheetDetailAPI)] action in Container widget.
  ApiCallResponse? collectionTimesheetDetail;
  // Stores action output result for [Backend Call - API (TimesheetDetailAPI)] action in Container widget.
  ApiCallResponse? marketingTimesheetDetail;
  // Stores action output result for [Backend Call - API (TimesheetDetailAPI)] action in Container widget.
  ApiCallResponse? surveyNPATimesheetDetail;
  // Stores action output result for [Backend Call - API (TimesheetDetailAPI)] action in Container widget.
  ApiCallResponse? checkerTimesheetDetail;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
