import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'insurance_request_insurer_page_widget.dart'
    show InsuranceRequestInsurerPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceRequestInsurerPageModel
    extends FlutterFlowModel<InsuranceRequestInsurerPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for SumInsuredInput widget.
  FocusNode? sumInsuredInputFocusNode;
  TextEditingController? sumInsuredInputTextController;
  String? Function(BuildContext, String?)?
      sumInsuredInputTextControllerValidator;
  // State field(s) for TrailerSumInsuredInput widget.
  FocusNode? trailerSumInsuredInputFocusNode;
  TextEditingController? trailerSumInsuredInputTextController;
  String? Function(BuildContext, String?)?
      trailerSumInsuredInputTextControllerValidator;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues;
  FormFieldController<List<String>>? checkboxGroupValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    sumInsuredInputFocusNode?.dispose();
    sumInsuredInputTextController?.dispose();

    trailerSumInsuredInputFocusNode?.dispose();
    trailerSumInsuredInputTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
