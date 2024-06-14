import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_resign_page_copy_widget.dart' show AddResignPageCopyWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddResignPageCopyModel extends FlutterFlowModel<AddResignPageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetProvinceAPI)] action in AddResignPageCopy widget.
  ApiCallResponse? provinceAPIOutput;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController1;
  List<String>? get checkboxGroupValues1 =>
      checkboxGroupValueController1?.value;
  set checkboxGroupValues1(List<String>? v) =>
      checkboxGroupValueController1?.value = v;

  // State field(s) for ReasonToLeaveEtcTextField widget.
  FocusNode? reasonToLeaveEtcTextFieldFocusNode;
  TextEditingController? reasonToLeaveEtcTextFieldTextController;
  String? Function(BuildContext, String?)?
      reasonToLeaveEtcTextFieldTextControllerValidator;
  // State field(s) for ReasonToLeaveTextField widget.
  FocusNode? reasonToLeaveTextFieldFocusNode;
  TextEditingController? reasonToLeaveTextFieldTextController;
  String? Function(BuildContext, String?)?
      reasonToLeaveTextFieldTextControllerValidator;
  // State field(s) for provinceInput widget.
  final provinceInputKey = GlobalKey();
  FocusNode? provinceInputFocusNode;
  TextEditingController? provinceInputTextController;
  String? provinceInputSelectedOption;
  String? Function(BuildContext, String?)? provinceInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (GetDistrictAPI)] action in provinceInput widget.
  ApiCallResponse? getDistrictAPIOutput;
  // State field(s) for districtInput widget.
  final districtInputKey = GlobalKey();
  FocusNode? districtInputFocusNode;
  TextEditingController? districtInputTextController;
  String? districtInputSelectedOption;
  String? Function(BuildContext, String?)? districtInputTextControllerValidator;
  // Stores action output result for [Backend Call - API (GetSubDistrictAPI)] action in districtInput widget.
  ApiCallResponse? getSubDistrictAPIOutput;
  // State field(s) for subdistrictInput widget.
  final subdistrictInputKey = GlobalKey();
  FocusNode? subdistrictInputFocusNode;
  TextEditingController? subdistrictInputTextController;
  String? subdistrictInputSelectedOption;
  String? Function(BuildContext, String?)?
      subdistrictInputTextControllerValidator;
  // State field(s) for batchRoadTextField widget.
  FocusNode? batchRoadTextFieldFocusNode;
  TextEditingController? batchRoadTextFieldTextController;
  String? Function(BuildContext, String?)?
      batchRoadTextFieldTextControllerValidator;
  // State field(s) for PostCodeTextField widget.
  final postCodeTextFieldKey = GlobalKey();
  FocusNode? postCodeTextFieldFocusNode;
  TextEditingController? postCodeTextFieldTextController;
  String? postCodeTextFieldSelectedOption;
  String? Function(BuildContext, String?)?
      postCodeTextFieldTextControllerValidator;
  // State field(s) for PhoneNumberTextField widget.
  FocusNode? phoneNumberTextFieldFocusNode;
  TextEditingController? phoneNumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      phoneNumberTextFieldTextControllerValidator;
  // State field(s) for ChanceToWorkTgtDropDown widget.
  String? chanceToWorkTgtDropDownValue;
  FormFieldController<String>? chanceToWorkTgtDropDownValueController;
  // State field(s) for CheckboxGroup widget.
  FormFieldController<List<String>>? checkboxGroupValueController2;
  List<String>? get checkboxGroupValues2 =>
      checkboxGroupValueController2?.value;
  set checkboxGroupValues2(List<String>? v) =>
      checkboxGroupValueController2?.value = v;

  // State field(s) for ReturnAssetTextField widget.
  FocusNode? returnAssetTextFieldFocusNode;
  TextEditingController? returnAssetTextFieldTextController;
  String? Function(BuildContext, String?)?
      returnAssetTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    reasonToLeaveEtcTextFieldFocusNode?.dispose();
    reasonToLeaveEtcTextFieldTextController?.dispose();

    reasonToLeaveTextFieldFocusNode?.dispose();
    reasonToLeaveTextFieldTextController?.dispose();

    provinceInputFocusNode?.dispose();

    districtInputFocusNode?.dispose();

    subdistrictInputFocusNode?.dispose();

    batchRoadTextFieldFocusNode?.dispose();
    batchRoadTextFieldTextController?.dispose();

    postCodeTextFieldFocusNode?.dispose();

    phoneNumberTextFieldFocusNode?.dispose();
    phoneNumberTextFieldTextController?.dispose();

    returnAssetTextFieldFocusNode?.dispose();
    returnAssetTextFieldTextController?.dispose();
  }
}
