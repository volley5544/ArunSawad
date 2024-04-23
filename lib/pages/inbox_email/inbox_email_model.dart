import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'inbox_email_widget.dart' show InboxEmailWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InboxEmailModel extends FlutterFlowModel<InboxEmailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - enoughEmail] action in inboxEmail widget.
  List<String>? subjectEmailOutput;
  // Stores action output result for [Custom Action - enoughEmail] action in inboxEmail widget.
  List<String>? contentEmailOutput;
  // Stores action output result for [Custom Action - enoughEmail] action in inboxEmail widget.
  List<String>? fromEmailOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
