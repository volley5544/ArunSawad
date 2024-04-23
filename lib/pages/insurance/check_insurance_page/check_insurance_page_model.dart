import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'check_insurance_page_widget.dart' show CheckInsurancePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CheckInsurancePageModel
    extends FlutterFlowModel<CheckInsurancePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in CheckInsurancePage widget.
  UserLogRecord? createdUserLogInsurance;
  // Stores action output result for [Backend Call - API (teleGetBrandAPI)] action in CheckInsurancePage widget.
  ApiCallResponse? gerBrand;
  // Stores action output result for [Backend Call - API (teleGetModelAPI )] action in CheckInsurancePage widget.
  ApiCallResponse? getModel;
  // Stores action output result for [Backend Call - API (teleGetProvinceAPI)] action in CheckInsurancePage widget.
  ApiCallResponse? getProvince;
  // State field(s) for BrandDropDown widget.
  String? brandDropDownValue;
  FormFieldController<String>? brandDropDownValueController;
  // State field(s) for modelDropDown widget.
  String? modelDropDownValue;
  FormFieldController<String>? modelDropDownValueController;
  // State field(s) for yearDropDown widget.
  String? yearDropDownValue;
  FormFieldController<String>? yearDropDownValueController;
  // State field(s) for provinceDropDown widget.
  String? provinceDropDownValue;
  FormFieldController<String>? provinceDropDownValueController;
  // State field(s) for useTypeDropDown widget.
  String? useTypeDropDownValue;
  FormFieldController<String>? useTypeDropDownValueController;
  // State field(s) for nameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  // State field(s) for lastnameInput widget.
  FocusNode? lastnameInputFocusNode;
  TextEditingController? lastnameInputTextController;
  String? Function(BuildContext, String?)? lastnameInputTextControllerValidator;
  // State field(s) for idInput widget.
  FocusNode? idInputFocusNode;
  TextEditingController? idInputTextController;
  String? Function(BuildContext, String?)? idInputTextControllerValidator;
  // State field(s) for phoneInput widget.
  FocusNode? phoneInputFocusNode;
  TextEditingController? phoneInputTextController;
  String? Function(BuildContext, String?)? phoneInputTextControllerValidator;
  // State field(s) for plateInput widget.
  FocusNode? plateInputFocusNode;
  TextEditingController? plateInputTextController;
  String? Function(BuildContext, String?)? plateInputTextControllerValidator;
  // State field(s) for driverDropDown widget.
  String? driverDropDownValue;
  FormFieldController<String>? driverDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    lastnameInputFocusNode?.dispose();
    lastnameInputTextController?.dispose();

    idInputFocusNode?.dispose();
    idInputTextController?.dispose();

    phoneInputFocusNode?.dispose();
    phoneInputTextController?.dispose();

    plateInputFocusNode?.dispose();
    plateInputTextController?.dispose();
  }
}
