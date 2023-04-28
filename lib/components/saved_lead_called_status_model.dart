import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SavedLeadCalledStatusModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for callStatusDropDown widget.
  String? callStatusDropDownValue;
  FormFieldController<String>? callStatusDropDownValueController;
  // Stores action output result for [Backend Call - API (getLeadReasonCallDropdownAPI)] action in callStatusDropDown widget.
  ApiCallResponse? getReasonCall;
  // State field(s) for reasonDropDown widget.
  String? reasonDropDownValue;
  FormFieldController<String>? reasonDropDownValueController;
  // State field(s) for calledRemarkTextField widget.
  TextEditingController? calledRemarkTextFieldController;
  String? Function(BuildContext, String?)?
      calledRemarkTextFieldControllerValidator;
  // Stores action output result for [Backend Call - API (saveCallStatusAPI)] action in Button widget.
  ApiCallResponse? saveCallOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    calledRemarkTextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
