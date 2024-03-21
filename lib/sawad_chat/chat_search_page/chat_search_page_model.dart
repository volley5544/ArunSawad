import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'chat_search_page_widget.dart' show ChatSearchPageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChatSearchPageModel extends FlutterFlowModel<ChatSearchPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SearchBox widget.
  FocusNode? searchBoxFocusNode;
  TextEditingController? searchBoxController;
  String? Function(BuildContext, String?)? searchBoxControllerValidator;
  // Stores action output result for [Backend Call - API (getAllEmployeeAPI)] action in IconButton widget.
  ApiCallResponse? getEmployee;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    searchBoxFocusNode?.dispose();
    searchBoxController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
