import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/car_seized/impound_car_price_input_component/impound_car_price_input_component_widget.dart';
import '/car_seized/impound_car_select_type_component/impound_car_select_type_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'search_customers_g_d_widget.dart' show SearchCustomersGDWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SearchCustomersGDModel extends FlutterFlowModel<SearchCustomersGDWidget> {
  ///  Local state fields for this page.

  List<ImpoundCarDetailDataTypeStruct> dataImpound = [];
  void addToDataImpound(ImpoundCarDetailDataTypeStruct item) =>
      dataImpound.add(item);
  void removeFromDataImpound(ImpoundCarDetailDataTypeStruct item) =>
      dataImpound.remove(item);
  void removeAtIndexFromDataImpound(int index) => dataImpound.removeAt(index);
  void insertAtIndexInDataImpound(
          int index, ImpoundCarDetailDataTypeStruct item) =>
      dataImpound.insert(index, item);
  void updateDataImpoundAtIndex(
          int index, Function(ImpoundCarDetailDataTypeStruct) updateFn) =>
      dataImpound[index] = updateFn(dataImpound[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (sswSurveyAPIVloanGetContract)] action in Button widget.
  ApiCallResponse? vloanContractAPIOutput;
  // Stores action output result for [Backend Call - API (searchContractNumber)] action in Button widget.
  ApiCallResponse? searchAPIOutput;
  // Stores action output result for [Backend Call - API (improundCarSearchBranch)] action in Container widget.
  ApiCallResponse? searchBranchOutput;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  String? selectedSeeTypeOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
