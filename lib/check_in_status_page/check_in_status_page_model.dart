import '/backend/api_requests/api_calls.dart';
import '/components/checkin_status_widget.dart';
import '/components/loading_scene_widget.dart';
import '/components/p_d_f_viewer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckInStatusPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetHolidayAPI)] action in CheckInStatusPage widget.
  ApiCallResponse? getHoliday;
  // Stores action output result for [Backend Call - API (checkinoutThisMonthAPI)] action in CheckInStatusPage widget.
  ApiCallResponse? checkinThisMonthOutput;
  // Stores action output result for [Backend Call - API (checkinoutLastMonthAPI)] action in CheckInStatusPage widget.
  ApiCallResponse? checkinLastMonthOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
