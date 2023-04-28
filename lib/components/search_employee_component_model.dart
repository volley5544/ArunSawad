import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchEmployeeComponentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for employeeKeywordInput widget.
  TextEditingController? employeeKeywordInputController;
  String? Function(BuildContext, String?)?
      employeeKeywordInputControllerValidator;
  // Stores action output result for [Backend Call - API (getEmployeeIdFromNicknameAPI)] action in IconButton widget.
  ApiCallResponse? getEmployeeSearched;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    employeeKeywordInputController?.dispose();
  }

  /// Additional helper methods are added here.

}
