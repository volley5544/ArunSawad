import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/components/p_d_f_viewer_widget.dart';
import '/components/search_employee_component_widget.dart';
import '/components/splash_page_holiday_widget.dart';
import '/components/splash_page_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SuperAppPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getBuildVersion] action in SuperAppPage widget.
  String? getDeviceVersion;
  // Stores action output result for [Custom Action - a14] action in SuperAppPage widget.
  String? leadNotiOutput;
  // Stores action output result for [Custom Action - a17] action in SuperAppPage widget.
  bool? checkDoNotShowIsEmpty;
  // Stores action output result for [Custom Action - a18] action in SuperAppPage widget.
  bool? checkDoNotShowHoliday;
  // Stores action output result for [Custom Action - a18] action in SuperAppPage widget.
  bool? checkDoNotShow;
  // State field(s) for PageViewBanner widget.
  PageController? pageViewBannerController;
  // State field(s) for PageView widget.
  PageController? pageViewController1;
  // State field(s) for PageView widget.
  PageController? pageViewController2;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginCheckin;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginLeavePage;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginKPI;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in ContainerWelfare widget.
  ApiCallResponse? checkLoginKPIWelfare;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginThaiPaiboon;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginCheckLead;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginBranchView;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createUserLogBranchView;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginInsurance;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginQR;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginSaleskit;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginFormLead;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginPromotion;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginCoach;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createdUserLogCoach;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginClassroom;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginITSupport;
  // State field(s) for PageView widget.
  PageController? pageViewController3;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginCheckinTab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginLeavePagetab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginKPItab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in ContainerWelfareTab widget.
  ApiCallResponse? checkLoginKPIWelfaretab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in thaipaiboonPad widget.
  ApiCallResponse? checkLoginThaiPaiboonPad;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginCheckLeadtab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginBranchViewtab;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createUserLogBranchViewtab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginInsurancetab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginQRtab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginSaleskittab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginFormLeadtab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginPromotiontab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginCoachtab;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createdUserLogCoachtab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginClassroomtab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginITSupporttab;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginFormService;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createdUserLogFormService;
  // Stores action output result for [Backend Call - API (actionUserAPI)] action in Container widget.
  ApiCallResponse? checkLoginFormServicetab;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  UserLogRecord? createdUserLogFormServicetab;
  // Stores action output result for [Custom Action - a1] action in ListTile widget.
  bool? checkDeviceLocSerLogout;
  // Stores action output result for [Custom Action - a2] action in ListTile widget.
  bool? checkDeviceLocPerLogout;
  // Stores action output result for [Custom Action - a8] action in ListTile widget.
  bool? checkLatLngLogout;
  // Stores action output result for [Backend Call - API (logoutAPI)] action in ListTile widget.
  ApiCallResponse? logoutAction;
  // Stores action output result for [Backend Call - Create Document] action in ListTile widget.
  UserLogRecord? createdUserLogLogout;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
