import '/backend/api_requests/api_calls.dart';
import '/components/show_image_component_widget.dart';
import '/components/show_image_list_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'insurance_request_edit_page_widget.dart'
    show InsuranceRequestEditPageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InsuranceRequestEditPageModel
    extends FlutterFlowModel<InsuranceRequestEditPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for MainColumn widget.
  ScrollController? mainColumn;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading6 = false;
  FFUploadedFile uploadedLocalFile6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading7 = false;
  FFUploadedFile uploadedLocalFile7 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading8 = false;
  FFUploadedFile uploadedLocalFile8 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading9 = false;
  FFUploadedFile uploadedLocalFile9 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading10 = false;
  FFUploadedFile uploadedLocalFile10 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading11 = false;
  FFUploadedFile uploadedLocalFile11 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading12 = false;
  FFUploadedFile uploadedLocalFile12 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading13 = false;
  FFUploadedFile uploadedLocalFile13 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading14 = false;
  FFUploadedFile uploadedLocalFile14 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading15 = false;
  FFUploadedFile uploadedLocalFile15 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading16 = false;
  FFUploadedFile uploadedLocalFile16 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading17 = false;
  FFUploadedFile uploadedLocalFile17 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading18 = false;
  FFUploadedFile uploadedLocalFile18 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading19 = false;
  FFUploadedFile uploadedLocalFile19 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading20 = false;
  FFUploadedFile uploadedLocalFile20 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading21 = false;
  FFUploadedFile uploadedLocalFile21 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading22 = false;
  FFUploadedFile uploadedLocalFile22 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading23 = false;
  FFUploadedFile uploadedLocalFile23 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading24 = false;
  FFUploadedFile uploadedLocalFile24 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading25 = false;
  FFUploadedFile uploadedLocalFile25 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for Column widget.
  ScrollController? columnController2;
  bool isDataUploading26 = false;
  FFUploadedFile uploadedLocalFile26 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading27 = false;
  FFUploadedFile uploadedLocalFile27 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading28 = false;
  FFUploadedFile uploadedLocalFile28 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading29 = false;
  FFUploadedFile uploadedLocalFile29 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading30 = false;
  FFUploadedFile uploadedLocalFile30 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading31 = false;
  FFUploadedFile uploadedLocalFile31 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading32 = false;
  FFUploadedFile uploadedLocalFile32 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (insuranceRequestEditAPI)] action in Button widget.
  ApiCallResponse? insuranceEditApi;
  // State field(s) for InsuranceBasicColumn widget.
  ScrollController? insuranceBasicColumn;
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
  FocusNode? brandInputFocusNode;
  TextEditingController? brandInputController;
  String? Function(BuildContext, String?)? brandInputControllerValidator;
  // State field(s) for modelInput widget.
  FocusNode? modelInputFocusNode;
  TextEditingController? modelInputController;
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
  // State field(s) for InsurerRadioButton widget.
  FormFieldController<String>? insurerRadioButtonValueController;
  // State field(s) for GarageTypeChoiceChips widget.
  FormFieldController<List<String>>? garageTypeChoiceChipsValueController;
  String? get garageTypeChoiceChipsValue =>
      garageTypeChoiceChipsValueController?.value?.firstOrNull;
  set garageTypeChoiceChipsValue(String? val) =>
      garageTypeChoiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for FlagActCheckbox widget.
  bool? flagActCheckboxValue;
  // State field(s) for SumInsuredInput widget.
  FocusNode? sumInsuredInputFocusNode;
  TextEditingController? sumInsuredInputController;
  String? Function(BuildContext, String?)? sumInsuredInputControllerValidator;
  // State field(s) for TrailerSumInsuredInput widget.
  FocusNode? trailerSumInsuredInputFocusNode;
  TextEditingController? trailerSumInsuredInputController;
  String? Function(BuildContext, String?)?
      trailerSumInsuredInputControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    mainColumn = ScrollController();
    columnController2 = ScrollController();
    insuranceBasicColumn = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    columnController1?.dispose();
    mainColumn?.dispose();
    columnController2?.dispose();
    insuranceBasicColumn?.dispose();
    insuranceLicenseNoInputFocusNode?.dispose();
    insuranceLicenseNoInputController?.dispose();

    freezeBoxPriceInputFocusNode?.dispose();
    freezeBoxPriceInputController?.dispose();

    brandInputFocusNode?.dispose();
    brandInputController?.dispose();

    modelInputFocusNode?.dispose();
    modelInputController?.dispose();

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

    sumInsuredInputFocusNode?.dispose();
    sumInsuredInputController?.dispose();

    trailerSumInsuredInputFocusNode?.dispose();
    trailerSumInsuredInputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
  String? get truckPartRadioButtonValue =>
      truckPartRadioButtonValueController?.value;
  String? get insurerRadioButtonValue =>
      insurerRadioButtonValueController?.value;
}
