import '/backend/api_requests/api_calls.dart';
import '/components/input_copy_widget.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Check1InsurancePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (teleGetCoverTypeAPI)] action in Check_1InsurancePage widget.
  ApiCallResponse? coverTypeAPIOutput;
  // Stores action output result for [Backend Call - API (teleGetInsurersAPI)] action in Check_1InsurancePage widget.
  ApiCallResponse? getInsurersAPIOutput;
  // State field(s) for coverTypeNameChoose widget.
  List<String>? coverTypeNameChooseValues;
  FormFieldController<List<String>>? coverTypeNameChooseValueController;
  // State field(s) for garageChoose widget.
  String? garageChooseValue;
  FormFieldController<String>? garageChooseValueController;
  // State field(s) for sum_insured widget.
  double? sumInsuredValue;
  // State field(s) for insurerNameChoose widget.
  List<String>? insurerNameChooseValues;
  FormFieldController<List<String>>? insurerNameChooseValueController;
  // Stores action output result for [Backend Call - API (telePackageSearchAPI)] action in Button widget.
  ApiCallResponse? packageSearchAPIOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}