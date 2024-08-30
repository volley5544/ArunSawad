import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'roadmapinsurance_widget.dart' show RoadmapinsuranceWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RoadmapinsuranceModel extends FlutterFlowModel<RoadmapinsuranceWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in Roadmapinsurance widget.
  UserLogRecord? createdUserLogITSupport;
  // Stores action output result for [Firestore Query - Query a collection] action in Roadmapinsurance widget.
  UrlLinkStorageRecord? getroadmapinsurance;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
