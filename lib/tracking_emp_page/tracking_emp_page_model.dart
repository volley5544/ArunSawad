import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'tracking_emp_page_widget.dart' show TrackingEmpPageWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TrackingEmpPageModel extends FlutterFlowModel<TrackingEmpPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (APIUsersRegion)] action in trackingEmpPage widget.
  ApiCallResponse? apiSearchOutput;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (APIUserLocationTracker)] action in Container widget.
  ApiCallResponse? trackerOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
