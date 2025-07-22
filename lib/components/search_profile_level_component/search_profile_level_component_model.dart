import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_profile_level_component_widget.dart'
    show SearchProfileLevelComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SearchProfileLevelComponentModel
    extends FlutterFlowModel<SearchProfileLevelComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for AreaRegionDropDown widget.
  String? areaRegionDropDownValue;
  FormFieldController<String>? areaRegionDropDownValueController;
  // Stores action output result for [Backend Call - API (getRegionAreaAPI)] action in AreaRegionDropDown widget.
  ApiCallResponse? getRegion;
  // State field(s) for AreaRegionSelectedDropDown widget.
  String? areaRegionSelectedDropDownValue;
  FormFieldController<String>? areaRegionSelectedDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
