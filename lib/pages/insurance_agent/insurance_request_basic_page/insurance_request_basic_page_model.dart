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
  TextEditingController? insuranceLicenseNoInputController;
  String? Function(BuildContext, String?)?
      insuranceLicenseNoInputControllerValidator;
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
  TextEditingController? freezeBoxPriceInputController;
  String? Function(BuildContext, String?)?
      freezeBoxPriceInputControllerValidator;
  // State field(s) for brandInput widget.
  final brandInputKey = GlobalKey();
  FocusNode? brandInputFocusNode;
  TextEditingController? brandInputController;
  String? brandInputSelectedOption;
  String? Function(BuildContext, String?)? brandInputControllerValidator;
  // State field(s) for modelInput widget.
  final modelInputKey = GlobalKey();
  FocusNode? modelInputFocusNode;
  TextEditingController? modelInputController;
  String? modelInputSelectedOption;
  String? Function(BuildContext, String?)? modelInputControllerValidator;
  // State field(s) for TruckCurrentPriceInput widget.
  FocusNode? truckCurrentPriceInputFocusNode;
  TextEditingController? truckCurrentPriceInputController;
  String? Function(BuildContext, String?)?
      truckCurrentPriceInputControllerValidator;
  // State field(s) for plateInput widget.
  FocusNode? plateInputFocusNode;
  TextEditingController? plateInputController;
  String? Function(BuildContext, String?)? plateInputControllerValidator;
  // State field(s) for plateAdditionalInput widget.
  FocusNode? plateAdditionalInputFocusNode;
  TextEditingController? plateAdditionalInputController;
  String? Function(BuildContext, String?)?
      plateAdditionalInputControllerValidator;
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
  TextEditingController? logistPoposeInputController;
  String? Function(BuildContext, String?)? logistPoposeInputControllerValidator;
  // State field(s) for CarModifyCheckbox widget.
  bool? carModifyCheckboxValue;
  // State field(s) for AccessoryProtectedInput widget.
  FocusNode? accessoryProtectedInputFocusNode;
  TextEditingController? accessoryProtectedInputController;
  String? Function(BuildContext, String?)?
      accessoryProtectedInputControllerValidator;
  // State field(s) for nameInput widget.
  FocusNode? nameInputFocusNode;
  TextEditingController? nameInputController;
  String? Function(BuildContext, String?)? nameInputControllerValidator;
  // State field(s) for lastnameInput widget.
  FocusNode? lastnameInputFocusNode;
  TextEditingController? lastnameInputController;
  String? Function(BuildContext, String?)? lastnameInputControllerValidator;
  // State field(s) for phoneInput widget.
  FocusNode? phoneInputFocusNode;
  TextEditingController? phoneInputController;
  String? Function(BuildContext, String?)? phoneInputControllerValidator;
  // State field(s) for idInput widget.
  FocusNode? idInputFocusNode;
  TextEditingController? idInputController;
  String? Function(BuildContext, String?)? idInputControllerValidator;
  // State field(s) for RemarkInput widget.
  FocusNode? remarkInputFocusNode;
  TextEditingController? remarkInputController;
  String? Function(BuildContext, String?)? remarkInputControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    insuranceLicenseNoInputFocusNode?.dispose();
    insuranceLicenseNoInputController?.dispose();

    freezeBoxPriceInputFocusNode?.dispose();
    freezeBoxPriceInputController?.dispose();

    brandInputFocusNode?.dispose();

    modelInputFocusNode?.dispose();

    truckCurrentPriceInputFocusNode?.dispose();
    truckCurrentPriceInputController?.dispose();

    plateInputFocusNode?.dispose();
    plateInputController?.dispose();

    plateAdditionalInputFocusNode?.dispose();
    plateAdditionalInputController?.dispose();

    logistPoposeInputFocusNode?.dispose();
    logistPoposeInputController?.dispose();

    accessoryProtectedInputFocusNode?.dispose();
    accessoryProtectedInputController?.dispose();

    nameInputFocusNode?.dispose();
    nameInputController?.dispose();

    lastnameInputFocusNode?.dispose();
    lastnameInputController?.dispose();

    phoneInputFocusNode?.dispose();
    phoneInputController?.dispose();

    idInputFocusNode?.dispose();
    idInputController?.dispose();

    remarkInputFocusNode?.dispose();
    remarkInputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get truckPartRadioButtonValue =>
      truckPartRadioButtonValueController?.value;
}
