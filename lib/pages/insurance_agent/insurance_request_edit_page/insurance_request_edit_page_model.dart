import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
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
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
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

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for MainColumn widget.
  ScrollController? mainColumn;
  bool isDataUploading_uploadPhoto1Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto1Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto2Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto2Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto3Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto3Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto4Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto4Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto5Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto5Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto6Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto6Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhotoShowEdit = false;
  FFUploadedFile uploadedLocalFile_uploadPhotoShowEdit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto8Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto8Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto9Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto9Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto1Truct1Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto1Truct1Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto2Truct1Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto2Truct1Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto3Truct1Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto3Truct1Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto4Truct1Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto4Truct1Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto5Truct1Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto5Truct1Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto6Truct1Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto6Truct1Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhotoShowTruct1Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhotoShowTruct1Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto8Truct1Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto8Truct1Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto1Truct2Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto1Truct2Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto2Truct2Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto2Truct2Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto3Truct2Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto3Truct2Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto4Truct2Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto4Truct2Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto5Truct2Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto5Truct2Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto6Truct2Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto6Truct2Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhotoShowTruct2Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhotoShowTruct2Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadPhoto8Truct2Edit = false;
  FFUploadedFile uploadedLocalFile_uploadPhoto8Truct2Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for Column widget.
  ScrollController? columnController2;
  bool isDataUploading_uploadData9Edit = false;
  FFUploadedFile uploadedLocalFile_uploadData9Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData10Edit = false;
  FFUploadedFile uploadedLocalFile_uploadData10Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData11Edit = false;
  FFUploadedFile uploadedLocalFile_uploadData11Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData12Edit = false;
  FFUploadedFile uploadedLocalFile_uploadData12Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData13Edit = false;
  FFUploadedFile uploadedLocalFile_uploadData13Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData14Edit = false;
  FFUploadedFile uploadedLocalFile_uploadData14Edit =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData15Edit = false;
  FFUploadedFile uploadedLocalFile_uploadData15Edit =
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
  TextEditingController? insuranceLicenseNoInputTextController;
  String? Function(BuildContext, String?)?
      insuranceLicenseNoInputTextControllerValidator;
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
  FocusNode? brandInputFocusNode;
  TextEditingController? brandInputTextController;
  String? Function(BuildContext, String?)? brandInputTextControllerValidator;
  // State field(s) for modelInput widget.
  FocusNode? modelInputFocusNode;
  TextEditingController? modelInputTextController;
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
  TextEditingController? sumInsuredInputTextController;
  String? Function(BuildContext, String?)?
      sumInsuredInputTextControllerValidator;
  // State field(s) for TrailerSumInsuredInput widget.
  FocusNode? trailerSumInsuredInputFocusNode;
  TextEditingController? trailerSumInsuredInputTextController;
  String? Function(BuildContext, String?)?
      trailerSumInsuredInputTextControllerValidator;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    mainColumn = ScrollController();
    columnController2 = ScrollController();
    insuranceBasicColumn = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    mainColumn?.dispose();
    columnController2?.dispose();
    insuranceBasicColumn?.dispose();
    insuranceLicenseNoInputFocusNode?.dispose();
    insuranceLicenseNoInputTextController?.dispose();

    freezeBoxPriceInputFocusNode?.dispose();
    freezeBoxPriceInputTextController?.dispose();

    brandInputFocusNode?.dispose();
    brandInputTextController?.dispose();

    modelInputFocusNode?.dispose();
    modelInputTextController?.dispose();

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

    sumInsuredInputFocusNode?.dispose();
    sumInsuredInputTextController?.dispose();

    trailerSumInsuredInputFocusNode?.dispose();
    trailerSumInsuredInputTextController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
  String? get truckPartRadioButtonValue =>
      truckPartRadioButtonValueController?.value;
  String? get insurerRadioButtonValue =>
      insurerRadioButtonValueController?.value;
}
