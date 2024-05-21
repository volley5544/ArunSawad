import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'k_p_i_all_c_e_o_page_widget.dart' show KPIAllCEOPageWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class KPIAllCEOPageModel extends FlutterFlowModel<KPIAllCEOPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in KPIAllCEOPage widget.
  UserLogRecord? createdUserLogKPI;
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in KPIAllCEOPage widget.
  ApiCallResponse? getServerDateTime;
  // Stores action output result for [Backend Call - API (getRegionAreaAPI)] action in KPIAllCEOPage widget.
  ApiCallResponse? getArea;
  // Stores action output result for [Backend Call - API (getRegionAreaAPI)] action in KPIAllCEOPage widget.
  ApiCallResponse? getRegion;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for branchInput widget.
  FocusNode? branchInputFocusNode;
  TextEditingController? branchInputTextController;
  String? Function(BuildContext, String?)? branchInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (getBranchAPI)] action in IconButton widget.
  ApiCallResponse? getBranchSearched;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Backend Call - API (getTargetBudgetKpiCEOAPI)] action in DropDown widget.
  ApiCallResponse? getBudget;
  // Stores action output result for [Backend Call - API (getTargetContractKpiCEOAPI)] action in DropDown widget.
  ApiCallResponse? getContract;
  // State field(s) for DropDownName widget.
  String? dropDownNameValue;
  FormFieldController<String>? dropDownNameValueController;
  // Stores action output result for [Backend Call - API (getTargetBudgetKpiCEOAPI)] action in DropDownName widget.
  ApiCallResponse? getBudget2;
  // Stores action output result for [Backend Call - API (getTargetContractKpiCEOAPI)] action in DropDownName widget.
  ApiCallResponse? getContract2;
  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for employeeKeywordInput widget.
  FocusNode? employeeKeywordInputFocusNode;
  TextEditingController? employeeKeywordInputTextController;
  String? Function(BuildContext, String?)?
      employeeKeywordInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (getEmployeeIdFromNicknameAPI)] action in IconButton widget.
  ApiCallResponse? getEmployeeSearched;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Backend Call - API (getEmpTargetBudgetKPIAPI)] action in DropDown widget.
  ApiCallResponse? getEmployeeBudget;
  // Stores action output result for [Backend Call - API (getEmpTargetContractKPIAPI)] action in DropDown widget.
  ApiCallResponse? getEmployeeContract;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // State field(s) for AreaRegionDropDown widget.
  String? areaRegionDropDownValue;
  FormFieldController<String>? areaRegionDropDownValueController;
  // State field(s) for AreaRegionSelectedDropDown widget.
  String? areaRegionSelectedDropDownValue;
  FormFieldController<String>? areaRegionSelectedDropDownValueController;
  // State field(s) for branchInputArea widget.
  final branchInputAreaKey = GlobalKey();
  FocusNode? branchInputAreaFocusNode;
  TextEditingController? branchInputAreaTextController;
  String? branchInputAreaSelectedOption;
  String? Function(BuildContext, String?)?
      branchInputAreaTextControllerValidator;
  // State field(s) for PageView widget.
  PageController? pageViewController3;

  int get pageViewCurrentIndex3 => pageViewController3 != null &&
          pageViewController3!.hasClients &&
          pageViewController3!.page != null
      ? pageViewController3!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    expandableExpandableController1.dispose();
    branchInputFocusNode?.dispose();
    branchInputTextController?.dispose();

    expandableExpandableController2.dispose();
    employeeKeywordInputFocusNode?.dispose();
    employeeKeywordInputTextController?.dispose();

    branchInputAreaFocusNode?.dispose();
  }
}
