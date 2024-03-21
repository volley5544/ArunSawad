import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_resign_page_widget.dart' show AddResignPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddResignPageModel extends FlutterFlowModel<AddResignPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (GetProvinceAPI)] action in AddResignPage widget.
  ApiCallResponse? provinceAPIOutput;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
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
  // State field(s) for provinceDropDown widget.
  String? provinceDropDownValue;
  FormFieldController<String>? provinceDropDownValueController;
  // Stores action output result for [Backend Call - API (GetDistrictAPI)] action in provinceDropDown widget.
  ApiCallResponse? districtAPIOutput;
  // State field(s) for districtDropDown widget.
  String? districtDropDownValue;
  FormFieldController<String>? districtDropDownValueController;
  // Stores action output result for [Backend Call - API (GetSubDistrictAPI)] action in districtDropDown widget.
  ApiCallResponse? subDistrictAPIOutput;
  // State field(s) for subdistrictDropDown widget.
  String? subdistrictDropDownValue;
  FormFieldController<String>? subdistrictDropDownValueController;
  // State field(s) for postCodeDropDown widget.
  String? postCodeDropDownValue;
  FormFieldController<String>? postCodeDropDownValueController;
  // State field(s) for batchRoadTextField widget.
  FocusNode? batchRoadTextFieldFocusNode;
  TextEditingController? batchRoadTextFieldController;
  String? Function(BuildContext, String?)?
      batchRoadTextFieldControllerValidator;
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
  // Stores action output result for [Backend Call - API (leaveRequestFirstAPI)] action in Button widget.
  ApiCallResponse? resignAPIOutput;
  // Stores action output result for [Backend Call - API (SendFCMNotificationAPI)] action in Button widget.
  ApiCallResponse? fcmSendNotiFication;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationRecord? createResignPageNotification;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for CheckboxGroupEdit widget.
  List<String>? checkboxGroupEditValues;
  FormFieldController<List<String>>? checkboxGroupEditValueController;
  // State field(s) for ReasonToLeaveEtcTextField2 widget.
  FocusNode? reasonToLeaveEtcTextField2FocusNode;
  TextEditingController? reasonToLeaveEtcTextField2Controller;
  String? Function(BuildContext, String?)?
      reasonToLeaveEtcTextField2ControllerValidator;
  // State field(s) for ReasonToLeaveTextField2 widget.
  FocusNode? reasonToLeaveTextField2FocusNode;
  TextEditingController? reasonToLeaveTextField2Controller;
  String? Function(BuildContext, String?)?
      reasonToLeaveTextField2ControllerValidator;
  // State field(s) for provinceDropDown2 widget.
  String? provinceDropDown2Value;
  FormFieldController<String>? provinceDropDown2ValueController;
  // Stores action output result for [Backend Call - API (GetDistrictAPI)] action in provinceDropDown2 widget.
  ApiCallResponse? districtAPIOutput2;
  // State field(s) for districtDropDown2 widget.
  String? districtDropDown2Value;
  FormFieldController<String>? districtDropDown2ValueController;
  // Stores action output result for [Backend Call - API (GetSubDistrictAPI)] action in districtDropDown2 widget.
  ApiCallResponse? subDistrictAPIOutput2;
  // State field(s) for subdistrictDropDown2 widget.
  String? subdistrictDropDown2Value;
  FormFieldController<String>? subdistrictDropDown2ValueController;
  // State field(s) for postCodeDropDown2 widget.
  String? postCodeDropDown2Value;
  FormFieldController<String>? postCodeDropDown2ValueController;
  // State field(s) for batchRoadTextField2 widget.
  FocusNode? batchRoadTextField2FocusNode;
  TextEditingController? batchRoadTextField2Controller;
  String? Function(BuildContext, String?)?
      batchRoadTextField2ControllerValidator;
  // State field(s) for PhoneNumberTextField2 widget.
  FocusNode? phoneNumberTextField2FocusNode;
  TextEditingController? phoneNumberTextField2Controller;
  String? Function(BuildContext, String?)?
      phoneNumberTextField2ControllerValidator;
  // State field(s) for ChanceToWorkTgtDropDown2 widget.
  String? chanceToWorkTgtDropDown2Value;
  FormFieldController<String>? chanceToWorkTgtDropDown2ValueController;
  // State field(s) for CheckboxGroupEdit2 widget.
  List<String>? checkboxGroupEdit2Values;
  FormFieldController<List<String>>? checkboxGroupEdit2ValueController;
  // State field(s) for ReturnAssetTextField2 widget.
  FocusNode? returnAssetTextField2FocusNode;
  TextEditingController? returnAssetTextField2Controller;
  String? Function(BuildContext, String?)?
      returnAssetTextField2ControllerValidator;
  // Stores action output result for [Backend Call - API (leaveEditAPI )] action in Button widget.
  ApiCallResponse? resignEditAPIOutput;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    reasonToLeaveEtcTextFieldFocusNode?.dispose();
    reasonToLeaveEtcTextFieldController?.dispose();

    reasonToLeaveTextFieldFocusNode?.dispose();
    reasonToLeaveTextFieldController?.dispose();

    batchRoadTextFieldFocusNode?.dispose();
    batchRoadTextFieldController?.dispose();

    phoneNumberTextFieldFocusNode?.dispose();
    phoneNumberTextFieldController?.dispose();

    returnAssetTextFieldFocusNode?.dispose();
    returnAssetTextFieldController?.dispose();

    textFieldFocusNode2?.dispose();
    textController7?.dispose();

    reasonToLeaveEtcTextField2FocusNode?.dispose();
    reasonToLeaveEtcTextField2Controller?.dispose();

    reasonToLeaveTextField2FocusNode?.dispose();
    reasonToLeaveTextField2Controller?.dispose();

    batchRoadTextField2FocusNode?.dispose();
    batchRoadTextField2Controller?.dispose();

    phoneNumberTextField2FocusNode?.dispose();
    phoneNumberTextField2Controller?.dispose();

    returnAssetTextField2FocusNode?.dispose();
    returnAssetTextField2Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
