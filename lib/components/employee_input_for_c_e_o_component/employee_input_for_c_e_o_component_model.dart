import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'employee_input_for_c_e_o_component_widget.dart'
    show EmployeeInputForCEOComponentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmployeeInputForCEOComponentModel
    extends FlutterFlowModel<EmployeeInputForCEOComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for employeeKeywordInput widget.
  FocusNode? employeeKeywordInputFocusNode;
  TextEditingController? employeeKeywordInputTextController;
  String? Function(BuildContext, String?)?
      employeeKeywordInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    employeeKeywordInputFocusNode?.dispose();
    employeeKeywordInputTextController?.dispose();
  }
}
