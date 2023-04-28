import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmployeeKpiCEOPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in EmployeeKpiCEOPage widget.
  UserLogRecord? createdUserLogKPI;
  // Stores action output result for [Backend Call - API (getDateTimeAPI)] action in EmployeeKpiCEOPage widget.
  ApiCallResponse? getServerDateTime;
  // Stores action output result for [Backend Call - API (getRegionAreaAPI)] action in EmployeeKpiCEOPage widget.
  ApiCallResponse? getArea;
  // Stores action output result for [Backend Call - API (getRegionAreaAPI)] action in EmployeeKpiCEOPage widget.
  ApiCallResponse? getRegion;
  // State field(s) for branchInput widget.
  TextEditingController? branchInputController;
  String? Function(BuildContext, String?)? branchInputControllerValidator;
  // Stores action output result for [Backend Call - API (getBranchAPI)] action in IconButton widget.
  ApiCallResponse? getBranchSearched;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Backend Call - API (getTargetBudgetKpiCEOAPI)] action in DropDown widget.
  ApiCallResponse? getBudget;
  // Stores action output result for [Backend Call - API (getTargetContractKpiCEOAPI)] action in DropDown widget.
  ApiCallResponse? getContract;
  // State field(s) for ChoiceChipsType widget.
  String? choiceChipsTypeValue1;
  FormFieldController<List<String>>? choiceChipsTypeValueController1;
  // State field(s) for ChoiceChipsMonth widget.
  String? choiceChipsMonthValue1;
  FormFieldController<List<String>>? choiceChipsMonthValueController1;
  // State field(s) for employeeKeywordInput widget.
  TextEditingController? employeeKeywordInputController;
  String? Function(BuildContext, String?)?
      employeeKeywordInputControllerValidator;
  // Stores action output result for [Backend Call - API (getEmployeeIdFromNicknameAPI)] action in IconButton widget.
  ApiCallResponse? getEmployeeSearched;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Backend Call - API (getEmpTargetBudgetKPIAPI)] action in DropDown widget.
  ApiCallResponse? getEmployeeBudget;
  // Stores action output result for [Backend Call - API (getEmpTargetContractKPIAPI)] action in DropDown widget.
  ApiCallResponse? getEmployeeContract;
  // State field(s) for ChoiceChipsType widget.
  String? choiceChipsTypeValue2;
  FormFieldController<List<String>>? choiceChipsTypeValueController2;
  // State field(s) for ChoiceChipsMonth widget.
  String? choiceChipsMonthValue2;
  FormFieldController<List<String>>? choiceChipsMonthValueController2;
  // State field(s) for AreaRegionDropDown widget.
  String? areaRegionDropDownValue;
  FormFieldController<String>? areaRegionDropDownValueController;
  // State field(s) for AreaRegionSelectedDropDown widget.
  String? areaRegionSelectedDropDownValue;
  FormFieldController<String>? areaRegionSelectedDropDownValueController;
  // State field(s) for branchInputArea widget.
  final branchInputAreaKey = GlobalKey();
  TextEditingController? branchInputAreaController;
  String? branchInputAreaSelectedOption;
  String? Function(BuildContext, String?)? branchInputAreaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    branchInputController?.dispose();
    employeeKeywordInputController?.dispose();
  }

  /// Additional helper methods are added here.

}
