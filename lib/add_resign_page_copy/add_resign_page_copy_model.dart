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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddResignPageCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetProvinceAPI)] action in AddResignPageCopy widget.
  ApiCallResponse? provinceAPIOutput;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  DateTime? datePicked;
  // State field(s) for CheckboxGroup widget.
  List<String>? checkboxGroupValues1;
  FormFieldController<List<String>>? checkboxGroupValueController1;
  // State field(s) for ReasonToLeaveEtcTextField widget.
  TextEditingController? reasonToLeaveEtcTextFieldController;
  String? Function(BuildContext, String?)?
      reasonToLeaveEtcTextFieldControllerValidator;
  // State field(s) for ReasonToLeaveTextField widget.
  TextEditingController? reasonToLeaveTextFieldController;
  String? Function(BuildContext, String?)?
      reasonToLeaveTextFieldControllerValidator;
  // State field(s) for provinceInput widget.
  final provinceInputKey = GlobalKey();
  TextEditingController? provinceInputController;
  String? provinceInputSelectedOption;
  String? Function(BuildContext, String?)? provinceInputControllerValidator;
  // Stores action output result for [Backend Call - API (GetDistrictAPI)] action in provinceInput widget.
  ApiCallResponse? getDistrictAPIOutput;
  // State field(s) for districtInput widget.
  final districtInputKey = GlobalKey();
  TextEditingController? districtInputController;
  String? districtInputSelectedOption;
  String? Function(BuildContext, String?)? districtInputControllerValidator;
  // Stores action output result for [Backend Call - API (GetSubDistrictAPI)] action in districtInput widget.
  ApiCallResponse? getSubDistrictAPIOutput;
  // State field(s) for subdistrictInput widget.
  final subdistrictInputKey = GlobalKey();
  TextEditingController? subdistrictInputController;
  String? subdistrictInputSelectedOption;
  String? Function(BuildContext, String?)? subdistrictInputControllerValidator;
  // State field(s) for batchRoadTextField widget.
  TextEditingController? batchRoadTextFieldController;
  String? Function(BuildContext, String?)?
      batchRoadTextFieldControllerValidator;
  // State field(s) for PostCodeTextField widget.
  final postCodeTextFieldKey = GlobalKey();
  TextEditingController? postCodeTextFieldController;
  String? postCodeTextFieldSelectedOption;
  String? Function(BuildContext, String?)? postCodeTextFieldControllerValidator;
  // State field(s) for PhoneNumberTextField widget.
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
  TextEditingController? returnAssetTextFieldController;
  String? Function(BuildContext, String?)?
      returnAssetTextFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    reasonToLeaveEtcTextFieldController?.dispose();
    reasonToLeaveTextFieldController?.dispose();
    batchRoadTextFieldController?.dispose();
    phoneNumberTextFieldController?.dispose();
    returnAssetTextFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
