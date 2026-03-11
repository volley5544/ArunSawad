import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/noti_setting_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'notification_detail_page_widget.dart' show NotificationDetailPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NotificationDetailPageModel
    extends FlutterFlowModel<NotificationDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - a21] action in NotificationDetailPage widget.
  String? getFirebaseUID;
  // Stores action output result for [Backend Call - API (GetBossAPI)] action in Container widget.
  ApiCallResponse? bossCheckOutputNotipageCopy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryLandAndHouseUrlCopy;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UrlLinkStorageRecord? queryMCAssignUrl;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
