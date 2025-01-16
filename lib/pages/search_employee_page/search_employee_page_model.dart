import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_employee_page_widget.dart' show SearchEmployeePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SearchEmployeePageModel
    extends FlutterFlowModel<SearchEmployeePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in SearchEmployeePage widget.
  UserLogRecord? createdUserLogKPI;
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in SearchEmployeePage widget.
  ApiCallResponse? getServerDateTime;
  // Stores action output result for [Backend Call - API (getRegionAreaAPI)] action in SearchEmployeePage widget.
  ApiCallResponse? getArea;
  // Stores action output result for [Backend Call - API (getRegionAreaAPI)] action in SearchEmployeePage widget.
  ApiCallResponse? getRegion;
  // State field(s) for employeeKeywordInput widget.
  FocusNode? employeeKeywordInputFocusNode;
  TextEditingController? employeeKeywordInputTextController;
  String? Function(BuildContext, String?)?
      employeeKeywordInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (getAllEmployeeAPI)] action in IconButton widget.
  ApiCallResponse? getEmployeeSearched;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Backend Call - API (APIUserLocationTracker)] action in Button widget.
  ApiCallResponse? getUserLocations;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    employeeKeywordInputFocusNode?.dispose();
    employeeKeywordInputTextController?.dispose();
  }
}
