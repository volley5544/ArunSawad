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
  List<String>? checkboxGroupValues1;
  FormFieldController<List<String>>? checkboxGroupValueController1;
  // State field(s) for ReasonToLeaveEtcTextField widget.
  FocusNode? reasonToLeaveEtcTextFieldFocusNode;
  TextEditingController? reasonToLeaveEtcTextFieldController;
  String? Function(BuildContext, String?)?
      reasonToLeaveEtcTextFieldControllerValidator;
  // State field(s) for ReasonToLeaveTextField widget.
  FocusNode? reasonToLeaveTextFieldFocusNode;
  TextEditingController? reasonToLeaveTextFieldController;
  String? Function(BuildContext, String?)?
      reasonToLeaveTextFieldControllerValidator;
  // State field(s) for provinceInput widget.
  final provinceInputKey = GlobalKey();
  FocusNode? provinceInputFocusNode;
  TextEditingController? provinceInputController;
  String? provinceInputSelectedOption;
  String? Function(BuildContext, String?)? provinceInputControllerValidator;
  // Stores action output result for [Backend Call - API (GetDistrictAPI)] action in provinceInput widget.
  ApiCallResponse? getDistrictAPIOutput;
  // State field(s) for districtInput widget.
  final districtInputKey = GlobalKey();
  FocusNode? districtInputFocusNode;
  TextEditingController? districtInputController;
  String? districtInputSelectedOption;
  String? Function(BuildContext, String?)? districtInputControllerValidator;
  // Stores action output result for [Backend Call - API (GetSubDistrictAPI)] action in districtInput widget.
  ApiCallResponse? getSubDistrictAPIOutput;
  // State field(s) for subdistrictInput widget.
  final subdistrictInputKey = GlobalKey();
  FocusNode? subdistrictInputFocusNode;
  TextEditingController? subdistrictInputController;
  String? subdistrictInputSelectedOption;
  String? Function(BuildContext, String?)? subdistrictInputControllerValidator;
  // State field(s) for batchRoadTextField widget.
  FocusNode? batchRoadTextFieldFocusNode;
  TextEditingController? batchRoadTextFieldController;
  String? Function(BuildContext, String?)?
      batchRoadTextFieldControllerValidator;
  // State field(s) for PostCodeTextField widget.
  final postCodeTextFieldKey = GlobalKey();
  FocusNode? postCodeTextFieldFocusNode;
  TextEditingController? postCodeTextFieldController;
  String? postCodeTextFieldSelectedOption;
  String? Function(BuildContext, String?)? postCodeTextFieldControllerValidator;
  // State field(s) for PhoneNumberTextField widget.
  FocusNode? phoneNumberTextFieldFocusNode;
  TextEditingController? phoneNumberTextFieldController;
  String? Function(BuildContext, String?)?
      phoneNumberTextFieldControllerValidator;
  // State field(s) for ChanceToWorkTgtDropDown widget.
  String? chanceToWorkTgtDropDownValue;
  FormFieldController<String>? chanceToWorkTgtDropDownValueController;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues2;
  FormFieldController<List<String>>? checkboxGroupValueController2;
  // State field(s) for ReturnAssetTextField widget.
  FocusNode? returnAssetTextFieldFocusNode;
  TextEditingController? returnAssetTextFieldController;
  String? Function(BuildContext, String?)?
      returnAssetTextFieldControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    reasonToLeaveEtcTextFieldFocusNode?.dispose();
    reasonToLeaveEtcTextFieldController?.dispose();

    reasonToLeaveTextFieldFocusNode?.dispose();
    reasonToLeaveTextFieldController?.dispose();

    provinceInputFocusNode?.dispose();

    districtInputFocusNode?.dispose();

    subdistrictInputFocusNode?.dispose();

    batchRoadTextFieldFocusNode?.dispose();
    batchRoadTextFieldController?.dispose();

    postCodeTextFieldFocusNode?.dispose();

    phoneNumberTextFieldFocusNode?.dispose();
    phoneNumberTextFieldController?.dispose();

    returnAssetTextFieldFocusNode?.dispose();
    returnAssetTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
