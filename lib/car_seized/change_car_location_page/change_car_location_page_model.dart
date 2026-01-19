import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'change_car_location_page_widget.dart' show ChangeCarLocationPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChangeCarLocationPageModel
    extends FlutterFlowModel<ChangeCarLocationPageWidget> {
  ///  Local state fields for this page.

  bool allowChangeLocation = false;

  ImpoundCarParamSetStruct? tempImpoundCarParamSet;
  void updateTempImpoundCarParamSetStruct(
      Function(ImpoundCarParamSetStruct) updateFn) {
    updateFn(tempImpoundCarParamSet ??= ImpoundCarParamSetStruct());
  }

  BranchDataTypeStruct? branchSearchData;
  void updateBranchSearchDataStruct(Function(BranchDataTypeStruct) updateFn) {
    updateFn(branchSearchData ??= BranchDataTypeStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (improundCarSearchBranch)] action in ChangeCarLocationPage widget.
  ApiCallResponse? improundCarSearchBranchOutput;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (improundCarGetBranch)] action in DropDown widget.
  ApiCallResponse? getBranchOutput;
  // State field(s) for SearchTextfield widget.
  FocusNode? searchTextfieldFocusNode;
  TextEditingController? searchTextfieldTextController;
  String? Function(BuildContext, String?)?
      searchTextfieldTextControllerValidator;
  // State field(s) for CompanyTextField widget.
  FocusNode? companyTextFieldFocusNode;
  TextEditingController? companyTextFieldTextController;
  String? Function(BuildContext, String?)?
      companyTextFieldTextControllerValidator;
  // State field(s) for DeliverTextField widget.
  FocusNode? deliverTextFieldFocusNode;
  TextEditingController? deliverTextFieldTextController;
  String? Function(BuildContext, String?)?
      deliverTextFieldTextControllerValidator;
  // State field(s) for PriceTextField widget.
  FocusNode? priceTextFieldFocusNode;
  TextEditingController? priceTextFieldTextController;
  String? Function(BuildContext, String?)?
      priceTextFieldTextControllerValidator;
  // State field(s) for RemarkTextField widget.
  FocusNode? remarkTextFieldFocusNode;
  TextEditingController? remarkTextFieldTextController;
  String? Function(BuildContext, String?)?
      remarkTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (updateImproundCar)] action in Button widget.
  ApiCallResponse? updateCarLocationOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTextfieldFocusNode?.dispose();
    searchTextfieldTextController?.dispose();

    companyTextFieldFocusNode?.dispose();
    companyTextFieldTextController?.dispose();

    deliverTextFieldFocusNode?.dispose();
    deliverTextFieldTextController?.dispose();

    priceTextFieldFocusNode?.dispose();
    priceTextFieldTextController?.dispose();

    remarkTextFieldFocusNode?.dispose();
    remarkTextFieldTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
