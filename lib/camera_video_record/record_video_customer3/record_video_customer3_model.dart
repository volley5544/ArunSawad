import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'record_video_customer3_widget.dart' show RecordVideoCustomer3Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RecordVideoCustomer3Model
    extends FlutterFlowModel<RecordVideoCustomer3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getFFUploadFileFromFilePath] action in RecordVideoCustomer3 widget.
  FFUploadedFile? videoFileOutput;
  // Stores action output result for [Backend Call - API (saveRecordVideoApi)] action in Button widget.
  ApiCallResponse? saveRecordVideoApiOutput;
  // Stores action output result for [Custom Action - saveVideoFile] action in Button widget.
  String? saveVideoFileOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
