import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginCheckInPage;
  // Stores action output result for [Custom Action - a1] action in Container widget.
  bool? checkInLocationService;
  // Stores action output result for [Custom Action - a2] action in Container widget.
  bool? checkInLocationPermission;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginSurveyPage;
  // Stores action output result for [Custom Action - a1] action in Container widget.
  bool? surveyLocationService;
  // Stores action output result for [Custom Action - a2] action in Container widget.
  bool? surveyLocationPermission;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginCollectionPage;
  // Stores action output result for [Custom Action - a1] action in Container widget.
  bool? collectionLocationService;
  // Stores action output result for [Custom Action - a2] action in Container widget.
  bool? collectionLocationPermission;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginMarketingPage;
  // Stores action output result for [Custom Action - a1] action in Container widget.
  bool? marketingLocationService;
  // Stores action output result for [Custom Action - a2] action in Container widget.
  bool? marketingLocationPermission;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginNPAPage;
  // Stores action output result for [Custom Action - a1] action in Container widget.
  bool? nPALocationService;
  // Stores action output result for [Custom Action - a2] action in Container widget.
  bool? nPALocationPermission;
  // Stores action output result for [Backend Call - API (getUserProfileAPI)] action in Container widget.
  ApiCallResponse? checkLoginOPSPage;
  // Stores action output result for [Custom Action - a1] action in Container widget.
  bool? oPSLocationService;
  // Stores action output result for [Custom Action - a2] action in Container widget.
  bool? oPSLocationPermission;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginCheckerPage;
  // Stores action output result for [Custom Action - a1] action in Container widget.
  bool? checkerLocationService;
  // Stores action output result for [Custom Action - a2] action in Container widget.
  bool? checkerLocationPermission;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginTimesheetPage;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
