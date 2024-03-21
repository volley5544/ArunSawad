import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'saved_lead_called_status_widget.dart' show SavedLeadCalledStatusWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SavedLeadCalledStatusModel
    extends FlutterFlowModel<SavedLeadCalledStatusWidget> {
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
  FocusNode? calledRemarkTextFieldFocusNode;
  TextEditingController? calledRemarkTextFieldController;
  String? Function(BuildContext, String?)?
      calledRemarkTextFieldControllerValidator;
  // Stores action output result for [Backend Call - API (saveCallStatusAPI)] action in Button widget.
  ApiCallResponse? saveCallOutput;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    calledRemarkTextFieldFocusNode?.dispose();
    calledRemarkTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
