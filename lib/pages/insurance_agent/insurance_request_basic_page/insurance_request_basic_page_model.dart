import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'insurance_request_basic_page_widget.dart'
    show InsuranceRequestBasicPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceRequestBasicPageModel
    extends FlutterFlowModel<InsuranceRequestBasicPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for OperationChoiceChips widget.
  FormFieldController<List<String>>? operationChoiceChipsValueController;
  String? get operationChoiceChipsValue =>
      operationChoiceChipsValueController?.value?.firstOrNull;
  set operationChoiceChipsValue(String? val) =>
      operationChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for CustomerTypeChoiceChips widget.
  FormFieldController<List<String>>? customerTypeChoiceChipsValueController;
  String? get customerTypeChoiceChipsValue =>
      customerTypeChoiceChipsValueController?.value?.firstOrNull;
  set customerTypeChoiceChipsValue(String? val) =>
      customerTypeChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for InsuranceLicenseNoInput widget.
  FocusNode? insuranceLicenseNoInputFocusNode;
  TextEditingController? insuranceLicenseNoInputTextController;
  String? Function(BuildContext, String?)?
      insuranceLicenseNoInputTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for VehicleTypeDropDown widget.
  String? vehicleTypeDropDownValue;
  FormFieldController<String>? vehicleTypeDropDownValueController;
  // State field(s) for CustomerMemberchipChoiceChips widget.
  FormFieldController<List<String>>?
      customerMemberchipChoiceChipsValueController;
  String? get customerMemberchipChoiceChipsValue =>
      customerMemberchipChoiceChipsValueController?.value?.firstOrNull;
  set customerMemberchipChoiceChipsValue(String? val) =>
      customerMemberchipChoiceChipsValueController?.value =
          val != null ? [val] : [];
  // State field(s) for TruckPartRadioButton widget.
  FormFieldController<String>? truckPartRadioButtonValueController;
  // State field(s) for BoxCheckbox widget.
  bool? boxCheckboxValue;
  // State field(s) for CoopCheckbox widget.
  bool? coopCheckboxValue;
  // State field(s) for BoxTypeChoiceChip widget.
  FormFieldController<List<String>>? boxTypeChoiceChipValueController;
  String? get boxTypeChoiceChipValue =>
      boxTypeChoiceChipValueController?.value?.firstOrNull;
  set boxTypeChoiceChipValue(String? val) =>
      boxTypeChoiceChipValueController?.value = val != null ? [val] : [];
  // State field(s) for FreezeBoxPriceInput widget.
  FocusNode? freezeBoxPriceInputFocusNode;
  TextEditingController? freezeBoxPriceInputTextController;
  String? Function(BuildContext, String?)?
      freezeBoxPriceInputTextControllerValidator;
  // State field(s) for brandInput widget.
  final brandInputKey = GlobalKey();
  FocusNode? brandInputFocusNode;
  TextEditingController? brandInputTextController;
  String? brandInputSelectedOption;
  String? Function(BuildContext, String?)? brandInputTextControllerValidator;
  // State field(s) for modelInput widget.
  final modelInputKey = GlobalKey();
  FocusNode? modelInputFocusNode;
  TextEditingController? modelInputTextController;
  String? modelInputSelectedOption;
  String? Function(BuildContext, String?)? modelInputTextControllerValidator;
  // State field(s) for TruckCurrentPriceInput widget.
  FocusNode? truckCurrentPriceInputFocusNode;
  TextEditingController? truckCurrentPriceInputTextController;
  String? Function(BuildContext, String?)?
      truckCurrentPriceInputTextControllerValidator;
  // State field(s) for plateInput widget.
  FocusNode? plateInputFocusNode;
  TextEditingController? plateInputTextController;
  String? Function(BuildContext, String?)? plateInputTextControllerValidator;
  // State field(s) for plateAdditionalInput widget.
  FocusNode? plateAdditionalInputFocusNode;
  TextEditingController? plateAdditionalInputTextController;
  String? Function(BuildContext, String?)?
      plateAdditionalInputTextControllerValidator;
  // State field(s) for yearDropDown widget.
  String? yearDropDownValue;
  FormFieldController<String>? yearDropDownValueController;
  // State field(s) for provinceDropDown widget.
  String? provinceDropDownValue;
  FormFieldController<String>? provinceDropDownValueController;
  // State field(s) for useTypeDropDown widget.
  String? useTypeDropDownValue;
  FormFieldController<String>? useTypeDropDownValueController;
  // State field(s) for LogistPoposeInput widget.
  FocusNode? logistPoposeInputFocusNode;
  TextEditingController? logistPoposeInputTextController;
  String? Function(BuildContext, String?)?
      logistPoposeInputTextControllerValidator;
  // State field(s) for CarModifyCheckbox widget.
  bool? carModifyCheckboxValue;
  // State field(s) for AccessoryProtectedInput widget.
  FocusNode? accessoryProtectedInputFocusNode;
  TextEditingController? accessoryProtectedInputTextController;
  String? Function(BuildContext, String?)?
      accessoryProtectedInputTextControllerValidator;
  // State field(s) for nameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputTextController;
  String? Function(BuildContext, String?)? nameInputTextControllerValidator;
  // State field(s) for lastnameInput widget.
  FocusNode? lastnameInputFocusNode;
  TextEditingController? lastnameInputTextController;
  String? Function(BuildContext, String?)? lastnameInputTextControllerValidator;
  // State field(s) for phoneInput widget.
  FocusNode? phoneInputFocusNode;
  TextEditingController? phoneInputTextController;
  String? Function(BuildContext, String?)? phoneInputTextControllerValidator;
  // State field(s) for idInput widget.
  FocusNode? idInputFocusNode;
  TextEditingController? idInputTextController;
  String? Function(BuildContext, String?)? idInputTextControllerValidator;
  // State field(s) for RemarkInput widget.
  FocusNode? remarkInputFocusNode;
  TextEditingController? remarkInputTextController;
  String? Function(BuildContext, String?)? remarkInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    insuranceLicenseNoInputFocusNode?.dispose();
    insuranceLicenseNoInputTextController?.dispose();

    freezeBoxPriceInputFocusNode?.dispose();
    freezeBoxPriceInputTextController?.dispose();

    brandInputFocusNode?.dispose();

    modelInputFocusNode?.dispose();

    truckCurrentPriceInputFocusNode?.dispose();
    truckCurrentPriceInputTextController?.dispose();

    plateInputFocusNode?.dispose();
    plateInputTextController?.dispose();

    plateAdditionalInputFocusNode?.dispose();
    plateAdditionalInputTextController?.dispose();

    logistPoposeInputFocusNode?.dispose();
    logistPoposeInputTextController?.dispose();

    accessoryProtectedInputFocusNode?.dispose();
    accessoryProtectedInputTextController?.dispose();

    nameInputFocusNode?.dispose();
    nameInputTextController?.dispose();

    lastnameInputFocusNode?.dispose();
    lastnameInputTextController?.dispose();

    phoneInputFocusNode?.dispose();
    phoneInputTextController?.dispose();

    idInputFocusNode?.dispose();
    idInputTextController?.dispose();

    remarkInputFocusNode?.dispose();
    remarkInputTextController?.dispose();
  }

  /// Additional helper methods.
  String? get truckPartRadioButtonValue =>
      truckPartRadioButtonValueController?.value;
}
