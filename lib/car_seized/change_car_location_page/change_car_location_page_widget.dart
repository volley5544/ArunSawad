import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/data_not_found_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'change_car_location_page_model.dart';
export 'change_car_location_page_model.dart';

class ChangeCarLocationPageWidget extends StatefulWidget {
  const ChangeCarLocationPageWidget({
    super.key,
    required this.step,
    required this.readAccessRoleData,
    required this.saveAccessRoleData,
    required this.userRoleRead,
    required this.userRoleSave,
    required this.fromPage,
    required this.impoundCarParamSet,
    required this.impoundCarStatusId,
    required this.impoundCarStatusCode,
    required this.impoundCarStatusName,
    required this.carConfig,
    required this.motocycleConfig,
    this.impoundCarLocateParamSet,
    required this.editAccessRoleData,
    required this.userRoleEdit,
  });

  final String? step;
  final dynamic readAccessRoleData;
  final dynamic saveAccessRoleData;
  final String? userRoleRead;
  final String? userRoleSave;
  final String? fromPage;
  final ImpoundCarParamSetStruct? impoundCarParamSet;
  final String? impoundCarStatusId;
  final String? impoundCarStatusCode;
  final String? impoundCarStatusName;
  final List<String>? carConfig;
  final List<String>? motocycleConfig;
  final ImpoundCarLocateParamSetStruct? impoundCarLocateParamSet;
  final dynamic editAccessRoleData;
  final String? userRoleEdit;

  static String routeName = 'ChangeCarLocationPage';
  static String routePath = 'ChangeCarLocationPage';

  @override
  State<ChangeCarLocationPageWidget> createState() =>
      _ChangeCarLocationPageWidgetState();
}

class _ChangeCarLocationPageWidgetState
    extends State<ChangeCarLocationPageWidget> {
  late ChangeCarLocationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeCarLocationPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChangeCarLocationPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().selectedDropdownList = [];
      safeSetState(() {});
      FFAppState().impoundDeliverLocateName =
          widget!.impoundCarLocateParamSet!.deliverLocateName;
      FFAppState().impoundDeliverLocateCode =
          widget!.impoundCarLocateParamSet!.deliverLocateCode;
      safeSetState(() {});
      if (widget!.fromPage != 'takeImages') {
        _model.allowChangeLocation = false;
        safeSetState(() {});
      } else {
        _model.allowChangeLocation = true;
        safeSetState(() {});
      }
    });

    _model.searchTextfieldTextController ??= TextEditingController();
    _model.searchTextfieldFocusNode ??= FocusNode();

    _model.companyTextFieldTextController ??= TextEditingController(
        text: widget!.fromPage != 'takeImages'
            ? (widget!.impoundCarLocateParamSet?.logisticsCompany != ''
                ? widget!.impoundCarLocateParamSet?.logisticsCompany
                : '')
            : '');
    _model.companyTextFieldFocusNode ??= FocusNode();

    _model.deliverTextFieldTextController ??= TextEditingController(
        text: widget!.fromPage != 'takeImages'
            ? (widget!.impoundCarLocateParamSet?.receiver != ''
                ? widget!.impoundCarLocateParamSet?.receiver
                : '')
            : '');
    _model.deliverTextFieldFocusNode ??= FocusNode();

    _model.priceTextFieldTextController ??= TextEditingController(
        text: widget!.fromPage != 'takeImages'
            ? (widget!.impoundCarParamSet?.impoundPrice != ''
                ? functions.returnNumberWithComma2Decimal(
                    widget!.impoundCarParamSet?.impoundPrice)
                : '')
            : '');
    _model.priceTextFieldFocusNode ??= FocusNode();
    _model.priceTextFieldFocusNode!.addListener(
      () async {
        if ((_model.priceTextFieldFocusNode?.hasFocus ?? false)) {
          safeSetState(() {
            _model.priceTextFieldTextController?.text =
                functions.removeCommaFromNumText(
                    _model.priceTextFieldTextController.text);
            _model.priceTextFieldFocusNode?.requestFocus();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _model.priceTextFieldTextController?.selection =
                  TextSelection.collapsed(
                offset: _model.priceTextFieldTextController!.text.length,
              );
            });
          });
        } else {
          safeSetState(() {
            _model.priceTextFieldTextController?.text =
                functions.returnNumberWithComma2Decimal(
                    _model.priceTextFieldTextController.text)!;
            _model.priceTextFieldFocusNode?.requestFocus();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _model.priceTextFieldTextController?.selection =
                  TextSelection.collapsed(
                offset: _model.priceTextFieldTextController!.text.length,
              );
            });
          });
        }
      },
    );
    _model.remarkTextFieldTextController ??= TextEditingController();
    _model.remarkTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFFDB771A),
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: AutoSizeText(
            widget!.fromPage == 'takeImages'
                ? 'เลือกสถานที่จอดรถ'
                : 'แก้ไขข้อมูล',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Color(0xFF003063),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [
            Visibility(
              visible: widget!.fromPage != 'takeImages',
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.image_search,
                  color: Color(0xFFDB771A),
                  size: 27.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    CustomerCarDeailsPictureStep1Widget.routeName,
                    queryParameters: {
                      'step': serializeParam(
                        widget!.step,
                        ParamType.String,
                      ),
                      'readAccessRoleData': serializeParam(
                        widget!.readAccessRoleData,
                        ParamType.JSON,
                      ),
                      'saveAccessRoleData': serializeParam(
                        widget!.saveAccessRoleData,
                        ParamType.JSON,
                      ),
                      'userRoleRead': serializeParam(
                        widget!.userRoleRead,
                        ParamType.String,
                      ),
                      'userRoleSave': serializeParam(
                        widget!.userRoleSave,
                        ParamType.String,
                      ),
                      'impoundCarParamSet': serializeParam(
                        widget!.impoundCarParamSet,
                        ParamType.DataStruct,
                      ),
                      'fromPage': serializeParam(
                        widget!.fromPage,
                        ParamType.String,
                      ),
                      'impoundCarLocateParamSet': serializeParam(
                        ImpoundCarLocateParamSetStruct(
                          improundcarLocatId: widget!
                              .impoundCarLocateParamSet?.improundcarLocatId,
                          locatName:
                              widget!.impoundCarLocateParamSet?.locatName,
                          improundcarSubLocatId: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.subLocatId(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.subLocatId(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.improundcarSubLocatId
                                  : '')
                              : widget!.impoundCarLocateParamSet
                                  ?.improundcarSubLocatId,
                          branchNameLocat: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.branchname(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.branchname(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.branchName
                                  : '')
                              : widget!
                                  .impoundCarLocateParamSet?.branchNameLocat,
                          address: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.address(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.address(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.address
                                  : '')
                              : widget!.impoundCarLocateParamSet?.address,
                          subDistrict: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.subdistrict(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.subdistrict(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.subDistrict
                                  : '')
                              : widget!.impoundCarLocateParamSet?.subDistrict,
                          district: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.district(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.district(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.district
                                  : '')
                              : widget!.impoundCarLocateParamSet?.district,
                          province: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.province(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.province(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.province
                                  : '')
                              : widget!.impoundCarLocateParamSet?.province,
                          postcode: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.postcode(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.postcode(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.postcode
                                  : '')
                              : widget!.impoundCarLocateParamSet?.postcode,
                          phoneNumber: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.phoneNumber(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.phoneNumber(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.phoneNumber
                                  : '')
                              : widget!.impoundCarLocateParamSet?.phoneNumber,
                          latitude: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.latitude(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.latitude(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.latitude
                                  : '')
                              : widget!.impoundCarLocateParamSet?.latitude,
                          longitude: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.longitude(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.longitude(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.longitude
                                  : '')
                              : widget!.impoundCarLocateParamSet?.longitude,
                          branchCodeLocat: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.branchcode(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.branchcode(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.branchCode
                                  : '')
                              : widget!
                                  .impoundCarLocateParamSet?.branchCodeLocat,
                          areaCode: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.areacode(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.areacode(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.areaCode
                                  : '')
                              : widget!.impoundCarLocateParamSet?.areaCode,
                          areaName: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.areaname(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.areaname(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.areaName
                                  : '')
                              : widget!.impoundCarLocateParamSet?.areaName,
                          regionCode: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.regioncode(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.regioncode(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.regionCode
                                  : '')
                              : widget!.impoundCarLocateParamSet?.regionCode,
                          regionName: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? (ImproundCarGetBranchCall.regionname(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          ) !=
                                          null &&
                                      (ImproundCarGetBranchCall.regionname(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ))!
                                          .isNotEmpty
                                  ? FFAppState()
                                      .branchDataOutput
                                      .elementAtOrNull(
                                          functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true))
                                      ?.regionName
                                  : '')
                              : widget!.impoundCarLocateParamSet?.regionName,
                          locatCode: _model.allowChangeLocation ||
                                  !((FFAppState().profileLevel == 'สาขา') ||
                                          (FFAppState().profileLevel ==
                                              'เขต') ||
                                          (FFAppState().profileLevel == 'ภาค')
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_level'),
                                          FFAppState().profileLevel)!
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'price_edit_role'),
                                          widget!.userRoleEdit)!)
                              ? _model.dropDownValue
                              : widget!.impoundCarLocateParamSet?.locatCode,
                        ),
                        ParamType.DataStruct,
                      ),
                      'impoundCarStatusName': serializeParam(
                        widget!.impoundCarStatusName,
                        ParamType.String,
                      ),
                      'carConfig': serializeParam(
                        widget!.carConfig,
                        ParamType.String,
                        isList: true,
                      ),
                      'motocycleConfig': serializeParam(
                        widget!.motocycleConfig,
                        ParamType.String,
                        isList: true,
                      ),
                      'editAccessRoleData': serializeParam(
                        widget!.editAccessRoleData,
                        ParamType.JSON,
                      ),
                      'userRoleEdit': serializeParam(
                        widget!.userRoleEdit,
                        ParamType.String,
                      ),
                      'fromPage2': serializeParam(
                        'seeImageButton',
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<ImpoundCarMasterRecord>(
            future: ImpoundCarMasterRecord.getDocumentOnce(
                FFAppState().impoundCarMasterDocRef!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                  ),
                );
              }

              final containerImpoundCarMasterRecord = snapshot.data!;

              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                ),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if ((widget!.fromPage != 'takeImages') &&
                          ((FFAppState().profileLevel == 'สาขา') ||
                                  (FFAppState().profileLevel == 'เขต') ||
                                  (FFAppState().profileLevel == 'ภาค')
                              ? functions.containsValueInJsonList(
                                  functions.getDataFromMapJson(
                                      functions.getDataFromMapJson(
                                          widget!.editAccessRoleData,
                                          widget!.step),
                                      'price_edit_level'),
                                  FFAppState().profileLevel)!
                              : functions.containsValueInJsonList(
                                  functions.getDataFromMapJson(
                                      functions.getDataFromMapJson(
                                          widget!.editAccessRoleData,
                                          widget!.step),
                                      'price_edit_role'),
                                  widget!.userRoleEdit)!))
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: FlutterFlowRadioButton(
                                    options: [
                                      'ใช้สถานที่จอดรถเดิม',
                                      'ใช้สถานที่จอดรถใหม่'
                                    ].toList(),
                                    onChanged: (val) async {
                                      safeSetState(() {});
                                      if (_model.radioButtonValue ==
                                          'ใช้สถานที่จอดรถเดิม') {
                                        _model.allowChangeLocation = false;
                                        safeSetState(() {});
                                      } else {
                                        _model.allowChangeLocation = true;
                                        safeSetState(() {});
                                      }
                                    },
                                    controller:
                                        _model.radioButtonValueController ??=
                                            FormFieldController<String>(
                                                'ใช้สถานที่จอดรถเดิม'),
                                    optionHeight: 32.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    selectedTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF3FCC4B),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                    buttonPosition: RadioButtonPosition.left,
                                    direction: Axis.horizontal,
                                    radioButtonColor: Color(0xFF3FCC4B),
                                    inactiveRadioButtonColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    toggleable: false,
                                    horizontalAlignment: WrapAlignment.start,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if ((widget!.impoundCarLocateParamSet
                                                  ?.branchNameLocat !=
                                              '') ||
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 3.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'สถานที่จอดรถเดิม',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF404040),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      ':',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF404040),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Text(
                                                            '${widget!.impoundCarLocateParamSet?.locatName}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF404040),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if ((widget!.impoundCarLocateParamSet
                                                  ?.branchNameLocat !=
                                              '') ||
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 4.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 3.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'สาขาที่จอดรถเดิม',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF404040),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      ':',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF404040),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Text(
                                                    '${widget!.impoundCarLocateParamSet?.branchNameLocat}(${widget!.impoundCarLocateParamSet?.branchCodeLocat})',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF404040),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      if (_model.allowChangeLocation ||
                          !((FFAppState().profileLevel == 'สาขา') ||
                                  (FFAppState().profileLevel == 'เขต') ||
                                  (FFAppState().profileLevel == 'ภาค')
                              ? functions.containsValueInJsonList(
                                  functions.getDataFromMapJson(
                                      functions.getDataFromMapJson(
                                          widget!.editAccessRoleData,
                                          widget!.step),
                                      'price_edit_level'),
                                  FFAppState().profileLevel)!
                              : functions.containsValueInJsonList(
                                  functions.getDataFromMapJson(
                                      functions.getDataFromMapJson(
                                          widget!.editAccessRoleData,
                                          widget!.step),
                                      'price_edit_role'),
                                  widget!.userRoleEdit)!))
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFB3B3B3),
                                  ),
                                ),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                    _model.dropDownValue ??= '',
                                  ),
                                  options: List<String>.from(
                                      containerImpoundCarMasterRecord
                                          .locateCode),
                                  optionLabels: containerImpoundCarMasterRecord
                                      .locateName,
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.dropDownValue = val);
                                    var _shouldSetState = false;
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height: double.infinity,
                                                child: LoadingSceneWidget(),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    _model.getBranchOutput =
                                        await ImproundCarGetBranchCall.call(
                                      apiUrl: FFAppState().impoundUrlVloan,
                                      token: FFAppState().impoundUrlVloanToken,
                                      locatCode: _model.dropDownValue,
                                    );

                                    _shouldSetState = true;
                                    if ((_model.getBranchOutput?.statusCode ??
                                            200) !=
                                        200) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'พบข้อผิดพลาด Connection(${(_model.getBranchOutput?.statusCode ?? 200).toString()})'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                    if (ImproundCarGetBranchCall.statusLayer1(
                                          (_model.getBranchOutput?.jsonBody ??
                                              ''),
                                        ) !=
                                        '200') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  '${ImproundCarGetBranchCall.messageLayer1(
                                                (_model.getBranchOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )}'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                    FFAppState().selectedDropdownList = [];
                                    safeSetState(() {});
                                    FFAppState().selectedDropdownList =
                                        functions
                                            .createFalseListByItemNumber(
                                                false,
                                                ImproundCarGetBranchCall
                                                    .branchname(
                                                  (_model.getBranchOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )?.length)!
                                            .toList()
                                            .cast<bool>();
                                    safeSetState(() {});
                                    FFAppState()
                                        .branchDataOriginal = (getJsonField(
                                      (_model.getBranchOutput?.jsonBody ?? ''),
                                      r'''$.results.data''',
                                      true,
                                    )!
                                                .toList()
                                                .map<BranchDataTypeStruct?>(
                                                    BranchDataTypeStruct
                                                        .maybeFromMap)
                                                .toList()
                                            as Iterable<BranchDataTypeStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<BranchDataTypeStruct>();
                                    FFAppState()
                                        .branchDataOutput = (getJsonField(
                                      (_model.getBranchOutput?.jsonBody ?? ''),
                                      r'''$.results.data''',
                                      true,
                                    )!
                                                .toList()
                                                .map<BranchDataTypeStruct?>(
                                                    BranchDataTypeStruct
                                                        .maybeFromMap)
                                                .toList()
                                            as Iterable<BranchDataTypeStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<BranchDataTypeStruct>();
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  width: 300.0,
                                  height: 56.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  hintText: 'กรุณาเลือกสถานที่จอดรถ....',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 8.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Color(0xFFB3B3B3),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Container(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller: _model
                                                .searchTextfieldTextController,
                                            focusNode:
                                                _model.searchTextfieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              hintText: 'ระบุคำค้นหา...',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              prefixIcon: Icon(
                                                Icons.search_outlined,
                                                size: 24.0,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .searchTextfieldTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await actions.hideKeyboardAction(
                                            context,
                                          );
                                          if (!(_model.searchTextfieldTextController
                                                      .text !=
                                                  null &&
                                              _model.searchTextfieldTextController
                                                      .text !=
                                                  '')) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'กรุณากรอกคำค้นหา'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            return;
                                          }
                                          FFAppState().branchDataOutput = functions
                                              .generateBranchDataOutput(
                                                  FFAppState()
                                                      .branchDataOriginal
                                                      .toList(),
                                                  _model
                                                      .searchTextfieldTextController
                                                      .text)!
                                              .toList()
                                              .cast<BranchDataTypeStruct>();
                                          safeSetState(() {});
                                          FFAppState().selectedDropdownList =
                                              [];
                                          safeSetState(() {});
                                          FFAppState().selectedDropdownList =
                                              functions
                                                  .createFalseListByItemNumber(
                                                      false,
                                                      FFAppState()
                                                          .branchDataOutput
                                                          .length)!
                                                  .toList()
                                                  .cast<bool>();
                                          safeSetState(() {});
                                        },
                                        text: 'ค้นหา',
                                        options: FFButtonOptions(
                                          width: 94.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFFE6400),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 2.0,
                            ),
                            if ((_model.dropDownValue != null &&
                                    _model.dropDownValue != '') &&
                                (((_model.getBranchOutput?.statusCode ?? 200) ==
                                        200) &&
                                    (ImproundCarGetBranchCall.statusLayer1(
                                          (_model.getBranchOutput?.jsonBody ??
                                              ''),
                                        ) ==
                                        '200')))
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minHeight: 200.0,
                                      maxHeight: ((FFAppState().profileLevel == 'สาขา') || (FFAppState().profileLevel == 'เขต') || (FFAppState().profileLevel == 'ภาค')
                                                  ? (widget!.fromPage != 'takeImages'
                                                      ? functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .editAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_level'),
                                                          FFAppState()
                                                              .profileLevel)!
                                                      : functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_level'),
                                                          FFAppState()
                                                              .profileLevel)!)
                                                  : (widget!.fromPage != 'takeImages'
                                                      ? functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(functions.getDataFromMapJson(widget!.editAccessRoleData, widget!.step), 'include_deliver_data_role'), widget!.userRoleEdit)!
                                                      : functions.containsValueInJsonList(functions.getDataFromMapJson(functions.getDataFromMapJson(widget!.saveAccessRoleData, widget!.step), 'include_deliver_data_role'), widget!.userRoleSave)!)) ||
                                              (widget!.fromPage != 'takeImages')
                                          ? 300.0
                                          : 400.0,
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final branchListItem = FFAppState()
                                            .branchDataOutput
                                            .take(100)
                                            .toList();
                                        if (branchListItem.isEmpty) {
                                          return Center(
                                            child: Container(
                                              height: 50.0,
                                              child:
                                                  DataNotFoundComponentWidget(),
                                            ),
                                          );
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            12.0,
                                            0,
                                            50.0,
                                          ),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: branchListItem.length,
                                          itemBuilder:
                                              (context, branchListItemIndex) {
                                            final branchListItemItem =
                                                branchListItem[
                                                    branchListItemIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 8.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState().selectedDropdownList = functions
                                                      .setBoolValueListAtIndex(
                                                          functions
                                                              .createFalseListByItemNumber(
                                                                  false,
                                                                  FFAppState()
                                                                      .selectedDropdownList
                                                                      .length)
                                                              ?.toList(),
                                                          branchListItemIndex)!
                                                      .toList()
                                                      .cast<bool>();
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 10,
                                                          child: Text(
                                                            '${branchListItemItem.branchName} (${branchListItemItem.branchCode})',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Builder(
                                                            builder: (context) {
                                                              if ((List<bool>
                                                                          selectedDropdownList,
                                                                      int index) {
                                                                return selectedDropdownList[
                                                                    index];
                                                              }(
                                                                  FFAppState()
                                                                      .selectedDropdownList
                                                                      .toList(),
                                                                  branchListItemIndex)) {
                                                                return Icon(
                                                                  Icons
                                                                      .check_sharp,
                                                                  color: Color(
                                                                      0xFF14B401),
                                                                  size: 24.0,
                                                                );
                                                              } else {
                                                                return Container(
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      Divider(
                        thickness: 2.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (((FFAppState().profileLevel == 'สาขา') ||
                                      (FFAppState().profileLevel == 'เขต') ||
                                      (FFAppState().profileLevel == 'ภาค')
                                  ? (widget!.fromPage != 'takeImages'
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'include_deliver_data_level'),
                                          FFAppState().profileLevel)
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.saveAccessRoleData,
                                                  widget!.step),
                                              'include_deliver_data_level'),
                                          FFAppState().profileLevel))
                                  : (widget!.fromPage != 'takeImages'
                                      ? functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.editAccessRoleData,
                                                  widget!.step),
                                              'include_deliver_data_role'),
                                          widget!.userRoleEdit)
                                      : functions.containsValueInJsonList(
                                          functions.getDataFromMapJson(
                                              functions.getDataFromMapJson(
                                                  widget!.saveAccessRoleData,
                                                  widget!.step),
                                              'include_deliver_data_role'),
                                          widget!.userRoleSave))) ??
                              true)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 15.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'สถานที่ส่งมอบรถ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF404040),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            '(บังคับเลือก)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFFF0000),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 8.0, 15.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (widget!
                                                        .impoundCarLocateParamSet
                                                        ?.deliverLocateName !=
                                                    '') {
                                                  return;
                                                }

                                                context.pushNamed(
                                                    BranchSelectedPageWidget
                                                        .routeName);
                                              },
                                              child: Container(
                                                width: 100.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: widget!.impoundCarLocateParamSet
                                                              ?.deliverLocateName ==
                                                          ''
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .accent3,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFF404040),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFAppState().impoundDeliverLocateName !=
                                                                ''
                                                            ? '${FFAppState().impoundDeliverLocateName} (${FFAppState().impoundDeliverLocateCode})'
                                                            : 'เลือกสถานที่ส่งมอบรถ...',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FFAppState()
                                                                              .impoundDeliverLocateName !=
                                                                          ''
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 15.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'บริษัทรับรถ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF404040),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            '(บังคับกรอก)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFFF0000),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 8.0, 15.0, 0.0),
                                            child: Container(
                                              width: 100.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: Color(0xFF404040),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .companyTextFieldTextController,
                                                  focusNode: _model
                                                      .companyTextFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                    hintText:
                                                        'กรอกบริษัทรับรถ...',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  maxLines: null,
                                                  validator: _model
                                                      .companyTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 15.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'ผู้มารับรถ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF404040),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          Text(
                                            '(บังคับกรอก)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFFFF0000),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 8.0, 15.0, 0.0),
                                            child: Container(
                                              width: 100.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: Color(0xFF404040),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .deliverTextFieldTextController,
                                                  focusNode: _model
                                                      .deliverTextFieldFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                    hintText:
                                                        'กรอกผู้มารับรถ...',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                            ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  maxLines: null,
                                                  validator: _model
                                                      .deliverTextFieldTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          if (widget!.fromPage != 'takeImages')
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (((FFAppState().profileLevel == 'สาขา') ||
                                            (FFAppState().profileLevel ==
                                                'เขต') ||
                                            (FFAppState().profileLevel == 'ภาค')
                                        ? functions.containsValueInJsonList(
                                            functions.getDataFromMapJson(
                                                functions.getDataFromMapJson(
                                                    widget!.editAccessRoleData,
                                                    widget!.step),
                                                'price_edit_level'),
                                            FFAppState().profileLevel)
                                        : functions.containsValueInJsonList(
                                            functions.getDataFromMapJson(
                                                functions.getDataFromMapJson(
                                                    widget!.editAccessRoleData,
                                                    widget!.step),
                                                'price_edit_role'),
                                            widget!.userRoleEdit)) ??
                                    true)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'ราคา',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF404040),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Text(
                                              '(ถ้ามี)',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF404040),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 8.0, 15.0, 0.0),
                                              child: Container(
                                                width: 100.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFF404040),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .priceTextFieldTextController,
                                                    focusNode: _model
                                                        .priceTextFieldFocusNode,
                                                    autofocus: false,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                      hintText: 'กรอกราคา...',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      focusedErrorBorder:
                                                          InputBorder.none,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                    maxLines: null,
                                                    keyboardType:
                                                        const TextInputType
                                                            .numberWithOptions(
                                                            decimal: true),
                                                    validator: _model
                                                        .priceTextFieldTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 8.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'เหตุผลที่เปลี่ยนสถานที่จอดรถ / ราคา',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF404040),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        '(บังคับกรอก)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFFFF0000),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 8.0, 15.0, 0.0),
                                        child: Container(
                                          width: 100.0,
                                          height: 137.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: Color(0xFF404040),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .remarkTextFieldTextController,
                                              focusNode: _model
                                                  .remarkTextFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                hintText:
                                                    'กรอกเหตุผลที่เปลี่ยนสถานที่จอดรถ / ราคา...',
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                              maxLines: null,
                                              validator: _model
                                                  .remarkTextFieldTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ].addToEnd(SizedBox(height: 50.0)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if (_model.allowChangeLocation) {
                                      if (!(_model.dropDownValue != null &&
                                          _model.dropDownValue != '')) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'กรุณาเลือกสถานที่จอดรถ'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      if (functions.countTrueInBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList())! <=
                                          0) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'กรุณาเลือกสาขาที่จอดรถ'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    } else {
                                      if (!((FFAppState().profileLevel ==
                                                  'สาขา') ||
                                              (FFAppState().profileLevel ==
                                                  'เขต') ||
                                              (FFAppState().profileLevel ==
                                                  'ภาค')
                                          ? functions.containsValueInJsonList(
                                              functions.getDataFromMapJson(
                                                  functions.getDataFromMapJson(
                                                      widget!
                                                          .editAccessRoleData,
                                                      widget!.step),
                                                  'price_edit_level'),
                                              FFAppState().profileLevel)!
                                          : functions.containsValueInJsonList(
                                              functions.getDataFromMapJson(
                                                  functions.getDataFromMapJson(
                                                      widget!
                                                          .editAccessRoleData,
                                                      widget!.step),
                                                  'price_edit_role'),
                                              widget!.userRoleEdit)!)) {
                                        if (!(_model.dropDownValue != null &&
                                            _model.dropDownValue != '')) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณาเลือกสถานที่จอดรถ'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (functions.countTrueInBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList())! <=
                                            0) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณาเลือกสาขาที่จอดรถ'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      }
                                    }

                                    if (widget!.fromPage == 'takeImages') {
                                      if ((FFAppState().profileLevel ==
                                                  'สาขา') ||
                                              (FFAppState().profileLevel ==
                                                  'เขต') ||
                                              (FFAppState().profileLevel ==
                                                  'ภาค')
                                          ? functions.containsValueInJsonList(
                                              functions.getDataFromMapJson(
                                                  functions.getDataFromMapJson(
                                                      widget!
                                                          .saveAccessRoleData,
                                                      widget!.step),
                                                  'include_deliver_data_level'),
                                              FFAppState().profileLevel)!
                                          : functions.containsValueInJsonList(
                                              functions.getDataFromMapJson(
                                                  functions.getDataFromMapJson(
                                                      widget!
                                                          .saveAccessRoleData,
                                                      widget!.step),
                                                  'include_deliver_data_role'),
                                              widget!.userRoleSave)!) {
                                        if (!((FFAppState()
                                                    .impoundDeliverLocateName !=
                                                '') &&
                                            (FFAppState()
                                                    .impoundDeliverLocateCode !=
                                                ''))) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณาเลือกสถานที่ส่งมอบรถ'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (_model
                                                .companyTextFieldTextController
                                                .text ==
                                            '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณากรอกบริษัทรับรถ'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (_model
                                                .deliverTextFieldTextController
                                                .text ==
                                            '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณากรอกผู้มารับรถ'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      }
                                    } else {
                                      if ((FFAppState().profileLevel ==
                                                  'สาขา') ||
                                              (FFAppState().profileLevel ==
                                                  'เขต') ||
                                              (FFAppState().profileLevel ==
                                                  'ภาค')
                                          ? functions.containsValueInJsonList(
                                              functions.getDataFromMapJson(
                                                  functions.getDataFromMapJson(
                                                      widget!
                                                          .editAccessRoleData,
                                                      widget!.step),
                                                  'include_deliver_data_level'),
                                              FFAppState().profileLevel)!
                                          : functions.containsValueInJsonList(
                                              functions.getDataFromMapJson(
                                                  functions.getDataFromMapJson(
                                                      widget!
                                                          .editAccessRoleData,
                                                      widget!.step),
                                                  'include_deliver_data_role'),
                                              widget!.userRoleEdit)!) {
                                        if (_model
                                                .companyTextFieldTextController
                                                .text ==
                                            '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณากรอกบริษัทรับรถ'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (_model
                                                .deliverTextFieldTextController
                                                .text ==
                                            '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณากรอกผู้มารับรถ'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      }
                                      if ((FFAppState().profileLevel ==
                                                  'สาขา') ||
                                              (FFAppState().profileLevel ==
                                                  'เขต') ||
                                              (FFAppState().profileLevel ==
                                                  'ภาค')
                                          ? functions.containsValueInJsonList(
                                              functions.getDataFromMapJson(
                                                  functions.getDataFromMapJson(
                                                      widget!
                                                          .editAccessRoleData,
                                                      widget!.step),
                                                  'price_edit_level'),
                                              FFAppState().profileLevel)!
                                          : functions.containsValueInJsonList(
                                              functions.getDataFromMapJson(
                                                  functions.getDataFromMapJson(
                                                      widget!
                                                          .editAccessRoleData,
                                                      widget!.step),
                                                  'price_edit_role'),
                                              widget!.userRoleEdit)!) {
                                        if ((_model.priceTextFieldTextController
                                                    .text !=
                                                '') &&
                                            true) {
                                          if (!(double.parse(functions
                                                  .removeCommaFromNumText(_model
                                                      .priceTextFieldTextController
                                                      .text)) >
                                              0.0)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'กรุณากรอกราคามากกว่า 0 บาท'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                          if (!functions.validatePriceImpound(
                                              functions.removeCommaFromNumText(
                                                  _model
                                                      .priceTextFieldTextController
                                                      .text))!) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'กรุณากรอกราคาไม่เกิน 8 หลัก'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                        }
                                      }
                                      if (_model.remarkTextFieldTextController
                                              .text ==
                                          '') {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'กรุณากรอกเหตุผลที่เปลี่ยนสถานที่จอดรถ / ราคา'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      _model.updateCarLocationOutput =
                                          await UploadImagesGoogleDriveGroup
                                              .updateImproundCarCall
                                              .call(
                                        contNo: widget!
                                            .impoundCarParamSet?.improundCONTNO,
                                        improundcarLocatId: _model.allowChangeLocation ||
                                                !((FFAppState().profileLevel == 'สาขา') ||
                                                        (FFAppState().profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState().profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? containerImpoundCarMasterRecord
                                                .impoundCarLocateId
                                                .elementAtOrNull(
                                                    functions.getIndexOfSomethingList(containerImpoundCarMasterRecord.locateCode.toList(), _model.dropDownValue))
                                            : widget!.impoundCarLocateParamSet?.improundcarLocatId,
                                        locatName: _model.allowChangeLocation ||
                                                !((FFAppState().profileLevel == 'สาขา') ||
                                                        (FFAppState().profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState().profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? containerImpoundCarMasterRecord
                                                .locateName
                                                .elementAtOrNull(
                                                    functions.getIndexOfSomethingList(containerImpoundCarMasterRecord.locateCode.toList(), _model.dropDownValue))
                                            : widget!.impoundCarLocateParamSet?.locatName,
                                        improundcarSubLocatId: _model
                                                    .allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState().profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!.editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.subLocatId(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.subLocatId(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.improundcarSubLocatId
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.improundcarSubLocatId,
                                        branchCodeLocat: _model
                                                    .allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState().profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!.editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.branchcode(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.branchcode(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.branchCode
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.branchCodeLocat,
                                        branchName:
                                            FFAppState().profileUnitCodeName,
                                        userid: FFAppState().employeeID,
                                        branchNameLocat: _model
                                                    .allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState().profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!.editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.branchname(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.branchname(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.branchName
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.branchNameLocat,
                                        branchCode: FFAppState().profileBranch,
                                        nameTh: FFAppState().profileFullName,
                                        address: _model.allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.address(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.address(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.address
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.address,
                                        subDistrict: _model.allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!.editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.subdistrict(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.subdistrict(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.subDistrict
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.subDistrict,
                                        district: _model.allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.district(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.district(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.district
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.district,
                                        province: _model.allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.province(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.province(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.province
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.province,
                                        postcode: _model.allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.postcode(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.postcode(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.postcode
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.postcode,
                                        phoneNumber: _model.allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!.editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.phoneNumber(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.phoneNumber(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.phoneNumber
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.phoneNumber,
                                        latitude: _model.allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.latitude(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.latitude(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.latitude
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.latitude,
                                        longitude: _model.allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.longitude(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.longitude(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.longitude
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.longitude,
                                        areaCode: _model.allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.areacode(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.areacode(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.areaCode
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.areaCode,
                                        areaName: _model.allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.areaname(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.areaname(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.areaName
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.areaName,
                                        regionCode: _model.allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!.editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.regioncode(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.regioncode(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.regionCode
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.regionCode,
                                        regionName: _model.allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!.editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? (ImproundCarGetBranchCall.regionname(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall.regionname(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.regionName
                                                : '')
                                            : widget!.impoundCarLocateParamSet?.regionName,
                                        url: FFAppState().improundUrl,
                                        locatCode: _model.allowChangeLocation ||
                                                !((FFAppState()
                                                                .profileLevel ==
                                                            'สาขา') ||
                                                        (FFAppState().profileLevel ==
                                                            'เขต') ||
                                                        (FFAppState()
                                                                .profileLevel ==
                                                            'ภาค')
                                                    ? functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_level'),
                                                        FFAppState()
                                                            .profileLevel)!
                                                    : functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions.getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                            'price_edit_role'),
                                                        widget!.userRoleEdit)!)
                                            ? _model.dropDownValue
                                            : widget!.impoundCarLocateParamSet
                                                ?.locatCode,
                                        impoundcarPrice: _model
                                                    .priceTextFieldTextController
                                                    .text !=
                                                ''
                                            ? functions.removeCommaFromNumText(
                                                _model
                                                    .priceTextFieldTextController
                                                    .text)
                                            : '0.00',
                                        remarkPrice: functions
                                            .replaceEnterInStringText(_model
                                                .remarkTextFieldTextController
                                                .text),
                                        step: widget!.step,
                                        locatDelivercar: ((FFAppState()
                                                            .profileLevel ==
                                                        'สาขา') ||
                                                    (FFAppState()
                                                            .profileLevel ==
                                                        'เขต') ||
                                                    (FFAppState()
                                                            .profileLevel ==
                                                        'ภาค')
                                                ? functions.containsValueInJsonList(
                                                    functions.getDataFromMapJson(
                                                        functions
                                                            .getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                        'include_deliver_data_level'),
                                                    FFAppState().profileLevel)!
                                                : functions.containsValueInJsonList(
                                                    functions.getDataFromMapJson(
                                                        functions
                                                            .getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                        'include_deliver_data_role'),
                                                    widget!.userRoleEdit)!)
                                            ? FFAppState()
                                                .impoundDeliverLocateCode
                                            : '',
                                        locatNameDelivercar: ((FFAppState()
                                                            .profileLevel ==
                                                        'สาขา') ||
                                                    (FFAppState()
                                                            .profileLevel ==
                                                        'เขต') ||
                                                    (FFAppState()
                                                            .profileLevel ==
                                                        'ภาค')
                                                ? functions.containsValueInJsonList(
                                                    functions.getDataFromMapJson(
                                                        functions
                                                            .getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                        'include_deliver_data_level'),
                                                    FFAppState().profileLevel)!
                                                : functions.containsValueInJsonList(
                                                    functions.getDataFromMapJson(
                                                        functions
                                                            .getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                        'include_deliver_data_role'),
                                                    widget!.userRoleEdit)!)
                                            ? FFAppState()
                                                .impoundDeliverLocateName
                                            : '',
                                        logisticsComany: ((FFAppState()
                                                            .profileLevel ==
                                                        'สาขา') ||
                                                    (FFAppState()
                                                            .profileLevel ==
                                                        'เขต') ||
                                                    (FFAppState()
                                                            .profileLevel ==
                                                        'ภาค')
                                                ? functions.containsValueInJsonList(
                                                    functions.getDataFromMapJson(
                                                        functions
                                                            .getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                        'include_deliver_data_level'),
                                                    FFAppState().profileLevel)!
                                                : functions.containsValueInJsonList(
                                                    functions.getDataFromMapJson(
                                                        functions
                                                            .getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                        'include_deliver_data_role'),
                                                    widget!.userRoleEdit)!)
                                            ? _model
                                                .companyTextFieldTextController
                                                .text
                                            : '',
                                        receiver: ((FFAppState().profileLevel ==
                                                        'สาขา') ||
                                                    (FFAppState()
                                                            .profileLevel ==
                                                        'เขต') ||
                                                    (FFAppState()
                                                            .profileLevel ==
                                                        'ภาค')
                                                ? functions.containsValueInJsonList(
                                                    functions.getDataFromMapJson(
                                                        functions
                                                            .getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                        'include_deliver_data_level'),
                                                    FFAppState().profileLevel)!
                                                : functions.containsValueInJsonList(
                                                    functions.getDataFromMapJson(
                                                        functions
                                                            .getDataFromMapJson(
                                                                widget!
                                                                    .editAccessRoleData,
                                                                widget!.step),
                                                        'include_deliver_data_role'),
                                                    widget!.userRoleEdit)!)
                                            ? _model
                                                .deliverTextFieldTextController
                                                .text
                                            : '',
                                        dbCode: widget!
                                            .impoundCarParamSet?.impoundDbCode,
                                        db: widget!
                                            .impoundCarParamSet?.impoundDbName,
                                      );

                                      _shouldSetState = true;
                                      if ((_model.updateCarLocationOutput
                                                  ?.statusCode ??
                                              200) !=
                                          200) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'พบข้อผิดพลาด Connection(${(_model.updateCarLocationOutput?.statusCode ?? 200).toString()})'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      if ('200' ==
                                          UploadImagesGoogleDriveGroup
                                              .updateImproundCarCall
                                              .statusLayer1(
                                                (_model.updateCarLocationOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              .toString()) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    '${UploadImagesGoogleDriveGroup.updateImproundCarCall.messageLayer1(
                                                          (_model.updateCarLocationOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString()}'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        _model.tempImpoundCarParamSet =
                                            widget!.impoundCarParamSet;
                                        safeSetState(() {});
                                        if ((FFAppState().profileLevel ==
                                                    'สาขา') ||
                                                (FFAppState().profileLevel ==
                                                    'เขต') ||
                                                (FFAppState().profileLevel ==
                                                    'ภาค')
                                            ? functions.containsValueInJsonList(
                                                functions.getDataFromMapJson(
                                                    functions.getDataFromMapJson(
                                                        widget!
                                                            .editAccessRoleData,
                                                        widget!.step),
                                                    'price_edit_level'),
                                                FFAppState().profileLevel)!
                                            : functions.containsValueInJsonList(
                                                functions.getDataFromMapJson(
                                                    functions.getDataFromMapJson(
                                                        widget!
                                                            .editAccessRoleData,
                                                        widget!.step),
                                                    'price_edit_role'),
                                                widget!.userRoleEdit)!) {
                                          _model
                                              .updateTempImpoundCarParamSetStruct(
                                            (e) => e
                                              ..impoundPrice = _model
                                                          .priceTextFieldTextController
                                                          .text !=
                                                      ''
                                                  ? functions
                                                      .removeCommaFromNumText(_model
                                                          .priceTextFieldTextController
                                                          .text)
                                                  : '0.00',
                                          );
                                          safeSetState(() {});
                                        }

                                        context.goNamed(
                                          CustomerCarDeailsPictureStep1Widget
                                              .routeName,
                                          queryParameters: {
                                            'step': serializeParam(
                                              widget!.step,
                                              ParamType.String,
                                            ),
                                            'readAccessRoleData':
                                                serializeParam(
                                              widget!.readAccessRoleData,
                                              ParamType.JSON,
                                            ),
                                            'saveAccessRoleData':
                                                serializeParam(
                                              widget!.saveAccessRoleData,
                                              ParamType.JSON,
                                            ),
                                            'userRoleRead': serializeParam(
                                              widget!.userRoleRead,
                                              ParamType.String,
                                            ),
                                            'userRoleSave': serializeParam(
                                              widget!.userRoleSave,
                                              ParamType.String,
                                            ),
                                            'impoundCarParamSet':
                                                serializeParam(
                                              _model.tempImpoundCarParamSet,
                                              ParamType.DataStruct,
                                            ),
                                            'fromPage': serializeParam(
                                              widget!.fromPage,
                                              ParamType.String,
                                            ),
                                            'impoundCarLocateParamSet':
                                                serializeParam(
                                              ImpoundCarLocateParamSetStruct(
                                                improundcarLocatId: _model
                                                            .allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState().profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? containerImpoundCarMasterRecord.impoundCarLocateId.elementAtOrNull(functions.getIndexOfSomethingList(containerImpoundCarMasterRecord.locateCode.toList(), _model.dropDownValue))
                                                    : widget!.impoundCarLocateParamSet?.improundcarLocatId,
                                                locatName: _model.allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? containerImpoundCarMasterRecord.locateName.elementAtOrNull(functions.getIndexOfSomethingList(containerImpoundCarMasterRecord.locateCode.toList(), _model.dropDownValue))
                                                    : widget!.impoundCarLocateParamSet?.locatName,
                                                improundcarSubLocatId: _model
                                                            .allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState().profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.subLocatId(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.subLocatId(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.improundcarSubLocatId
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.improundcarSubLocatId,
                                                branchNameLocat: _model
                                                            .allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState().profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.branchname(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.branchname(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.branchName
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.branchNameLocat,
                                                address: _model.allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.address(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.address(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.address
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.address,
                                                subDistrict: _model.allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.subdistrict(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.subdistrict(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.subDistrict
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.subDistrict,
                                                district: _model.allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.district(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.district(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.district
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.district,
                                                province: _model.allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.province(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.province(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.province
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.province,
                                                postcode: _model.allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.postcode(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.postcode(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.postcode
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.postcode,
                                                phoneNumber: _model.allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.phoneNumber(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.phoneNumber(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.phoneNumber
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.phoneNumber,
                                                latitude: _model.allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.latitude(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.latitude(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.latitude
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.latitude,
                                                longitude: _model.allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.longitude(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.longitude(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.longitude
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.longitude,
                                                branchCodeLocat: _model
                                                            .allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState().profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.branchcode(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.branchcode(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.branchCode
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.branchCodeLocat,
                                                areaCode: _model.allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.areacode(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.areacode(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.areaCode
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.areaCode,
                                                areaName: _model.allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.areaname(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.areaname(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.areaName
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.areaName,
                                                regionCode: _model
                                                            .allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState().profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.regioncode(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.regioncode(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.regionCode
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.regionCode,
                                                regionName: _model
                                                            .allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState().profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState().profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? (ImproundCarGetBranchCall.regionname(
                                                                  (_model.getBranchOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) !=
                                                                null &&
                                                            (ImproundCarGetBranchCall.regionname(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))!
                                                                .isNotEmpty
                                                        ? FFAppState().branchDataOutput.elementAtOrNull(functions.getIndexOfBoolList(FFAppState().selectedDropdownList.toList(), true))?.regionName
                                                        : '')
                                                    : widget!.impoundCarLocateParamSet?.regionName,
                                                locatCode: _model.allowChangeLocation ||
                                                        !((FFAppState().profileLevel ==
                                                                    'สาขา') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'เขต') ||
                                                                (FFAppState()
                                                                        .profileLevel ==
                                                                    'ภาค')
                                                            ? functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!
                                                                            .editAccessRoleData,
                                                                        widget!
                                                                            .step),
                                                                    'price_edit_level'),
                                                                FFAppState()
                                                                    .profileLevel)!
                                                            : functions.containsValueInJsonList(
                                                                functions.getDataFromMapJson(
                                                                    functions.getDataFromMapJson(
                                                                        widget!.editAccessRoleData,
                                                                        widget!.step),
                                                                    'price_edit_role'),
                                                                widget!.userRoleEdit)!)
                                                    ? _model.dropDownValue
                                                    : widget!.impoundCarLocateParamSet?.locatCode,
                                              ),
                                              ParamType.DataStruct,
                                            ),
                                            'impoundCarStatusName':
                                                serializeParam(
                                              widget!.impoundCarStatusName,
                                              ParamType.String,
                                            ),
                                            'carConfig': serializeParam(
                                              widget!.carConfig,
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'motocycleConfig': serializeParam(
                                              widget!.motocycleConfig,
                                              ParamType.String,
                                              isList: true,
                                            ),
                                            'editAccessRoleData':
                                                serializeParam(
                                              widget!.editAccessRoleData,
                                              ParamType.JSON,
                                            ),
                                            'userRoleEdit': serializeParam(
                                              widget!.userRoleEdit,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        _model.tempImpoundCarParamSet = null;
                                        safeSetState(() {});
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    '${UploadImagesGoogleDriveGroup.updateImproundCarCall.messageLayer1(
                                                          (_model.updateCarLocationOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString()}'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (widget!.step == 'step4') {
                                      context.pushNamed(
                                        CustomerCarDeailsStep4Widget.routeName,
                                        queryParameters: {
                                          'step': serializeParam(
                                            widget!.step,
                                            ParamType.String,
                                          ),
                                          'readAccessRoleData': serializeParam(
                                            widget!.readAccessRoleData,
                                            ParamType.JSON,
                                          ),
                                          'saveAccessRoleData': serializeParam(
                                            widget!.saveAccessRoleData,
                                            ParamType.JSON,
                                          ),
                                          'userRoleRead': serializeParam(
                                            widget!.userRoleRead,
                                            ParamType.String,
                                          ),
                                          'userRoleSave': serializeParam(
                                            widget!.userRoleSave,
                                            ParamType.String,
                                          ),
                                          'impoundCarParamSet': serializeParam(
                                            widget!.impoundCarParamSet,
                                            ParamType.DataStruct,
                                          ),
                                          'impoundCarLocateParamSet':
                                              serializeParam(
                                            ImpoundCarLocateParamSetStruct(
                                              improundcarLocatId: containerImpoundCarMasterRecord
                                                  .impoundCarLocateId
                                                  .elementAtOrNull(functions
                                                      .getIndexOfSomethingList(
                                                          containerImpoundCarMasterRecord
                                                              .locateCode
                                                              .toList(),
                                                          _model
                                                              .dropDownValue)),
                                              locatName: containerImpoundCarMasterRecord
                                                  .locateName
                                                  .elementAtOrNull(functions
                                                      .getIndexOfSomethingList(
                                                          containerImpoundCarMasterRecord
                                                              .locateCode
                                                              .toList(),
                                                          _model
                                                              .dropDownValue)),
                                              improundcarSubLocatId: ImproundCarGetBranchCall
                                                              .subLocatId(
                                                            (_model.getBranchOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          null &&
                                                      (ImproundCarGetBranchCall
                                                              .subLocatId(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))!
                                                          .isNotEmpty
                                                  ? FFAppState()
                                                      .branchDataOutput
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .selectedDropdownList
                                                                  .toList(),
                                                              true))
                                                      ?.improundcarSubLocatId
                                                  : '',
                                              branchNameLocat: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.branchName,
                                              address: ImproundCarGetBranchCall
                                                              .address(
                                                            (_model.getBranchOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          null &&
                                                      (ImproundCarGetBranchCall
                                                              .address(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))!
                                                          .isNotEmpty
                                                  ? FFAppState()
                                                      .branchDataOutput
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .selectedDropdownList
                                                                  .toList(),
                                                              true))
                                                      ?.address
                                                  : '',
                                              subDistrict: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.subDistrict,
                                              district: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.district,
                                              province: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.province,
                                              postcode: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.postcode,
                                              phoneNumber: ImproundCarGetBranchCall
                                                              .phoneNumber(
                                                            (_model.getBranchOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          null &&
                                                      (ImproundCarGetBranchCall
                                                              .phoneNumber(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))!
                                                          .isNotEmpty
                                                  ? FFAppState()
                                                      .branchDataOutput
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .selectedDropdownList
                                                                  .toList(),
                                                              true))
                                                      ?.phoneNumber
                                                  : '',
                                              latitude: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.latitude,
                                              longitude: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.longitude,
                                              branchCodeLocat: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.branchCode,
                                              areaCode: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.areaCode,
                                              areaName: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.areaName,
                                              regionCode: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.regionCode,
                                              regionName: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.regionName,
                                              locatCode: _model.dropDownValue,
                                              receiver: ((FFAppState().profileLevel ==
                                                              'สาขา') ||
                                                          (FFAppState()
                                                                  .profileLevel ==
                                                              'เขต') ||
                                                          (FFAppState()
                                                                  .profileLevel ==
                                                              'ภาค')
                                                      ? functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_level'),
                                                          FFAppState()
                                                              .profileLevel)!
                                                      : functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_role'),
                                                          widget!
                                                              .userRoleSave)!)
                                                  ? _model
                                                      .deliverTextFieldTextController
                                                      .text
                                                  : '',
                                              deliverLocateName: ((FFAppState()
                                                                  .profileLevel ==
                                                              'สาขา') ||
                                                          (FFAppState().profileLevel ==
                                                              'เขต') ||
                                                          (FFAppState()
                                                                  .profileLevel ==
                                                              'ภาค')
                                                      ? functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_level'),
                                                          FFAppState()
                                                              .profileLevel)!
                                                      : functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_role'),
                                                          widget!
                                                              .userRoleSave)!)
                                                  ? FFAppState()
                                                      .impoundDeliverLocateName
                                                  : '',
                                              deliverLocateCode: ((FFAppState()
                                                                  .profileLevel ==
                                                              'สาขา') ||
                                                          (FFAppState().profileLevel ==
                                                              'เขต') ||
                                                          (FFAppState()
                                                                  .profileLevel ==
                                                              'ภาค')
                                                      ? functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_level'),
                                                          FFAppState()
                                                              .profileLevel)!
                                                      : functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_role'),
                                                          widget!
                                                              .userRoleSave)!)
                                                  ? FFAppState()
                                                      .impoundDeliverLocateCode
                                                  : '',
                                              logisticsCompany: ((FFAppState()
                                                                  .profileLevel ==
                                                              'สาขา') ||
                                                          (FFAppState().profileLevel ==
                                                              'เขต') ||
                                                          (FFAppState().profileLevel ==
                                                              'ภาค')
                                                      ? functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_level'),
                                                          FFAppState()
                                                              .profileLevel)!
                                                      : functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_role'),
                                                          widget!
                                                              .userRoleSave)!)
                                                  ? _model
                                                      .companyTextFieldTextController
                                                      .text
                                                  : '',
                                            ),
                                            ParamType.DataStruct,
                                          ),
                                          'carConfig': serializeParam(
                                            widget!.carConfig,
                                            ParamType.String,
                                            isList: true,
                                          ),
                                          'motocycleConfig': serializeParam(
                                            widget!.motocycleConfig,
                                            ParamType.String,
                                            isList: true,
                                          ),
                                          'editAccessRoleData': serializeParam(
                                            widget!.editAccessRoleData,
                                            ParamType.JSON,
                                          ),
                                          'userRoleEdit': serializeParam(
                                            widget!.userRoleEdit,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      context.pushNamed(
                                        CustomerCarDeailsStep1Widget.routeName,
                                        queryParameters: {
                                          'step': serializeParam(
                                            widget!.step,
                                            ParamType.String,
                                          ),
                                          'readAccessRoleData': serializeParam(
                                            widget!.readAccessRoleData,
                                            ParamType.JSON,
                                          ),
                                          'saveAccessRoleData': serializeParam(
                                            widget!.saveAccessRoleData,
                                            ParamType.JSON,
                                          ),
                                          'userRoleRead': serializeParam(
                                            widget!.userRoleRead,
                                            ParamType.String,
                                          ),
                                          'userRoleSave': serializeParam(
                                            widget!.userRoleSave,
                                            ParamType.String,
                                          ),
                                          'impoundCarParamSet': serializeParam(
                                            widget!.impoundCarParamSet,
                                            ParamType.DataStruct,
                                          ),
                                          'impoundCarLocateParamSet':
                                              serializeParam(
                                            ImpoundCarLocateParamSetStruct(
                                              improundcarLocatId: containerImpoundCarMasterRecord
                                                  .impoundCarLocateId
                                                  .elementAtOrNull(functions
                                                      .getIndexOfSomethingList(
                                                          containerImpoundCarMasterRecord
                                                              .locateCode
                                                              .toList(),
                                                          _model
                                                              .dropDownValue)),
                                              locatName: containerImpoundCarMasterRecord
                                                  .locateName
                                                  .elementAtOrNull(functions
                                                      .getIndexOfSomethingList(
                                                          containerImpoundCarMasterRecord
                                                              .locateCode
                                                              .toList(),
                                                          _model
                                                              .dropDownValue)),
                                              improundcarSubLocatId: ImproundCarGetBranchCall
                                                              .subLocatId(
                                                            (_model.getBranchOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          null &&
                                                      (ImproundCarGetBranchCall
                                                              .subLocatId(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))!
                                                          .isNotEmpty
                                                  ? FFAppState()
                                                      .branchDataOutput
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .selectedDropdownList
                                                                  .toList(),
                                                              true))
                                                      ?.improundcarSubLocatId
                                                  : '',
                                              branchNameLocat: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.branchName,
                                              address: ImproundCarGetBranchCall
                                                              .address(
                                                            (_model.getBranchOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          null &&
                                                      (ImproundCarGetBranchCall
                                                              .address(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))!
                                                          .isNotEmpty
                                                  ? FFAppState()
                                                      .branchDataOutput
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .selectedDropdownList
                                                                  .toList(),
                                                              true))
                                                      ?.address
                                                  : '',
                                              subDistrict: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.subDistrict,
                                              district: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.district,
                                              province: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.province,
                                              postcode: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.postcode,
                                              phoneNumber: ImproundCarGetBranchCall
                                                              .phoneNumber(
                                                            (_model.getBranchOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) !=
                                                          null &&
                                                      (ImproundCarGetBranchCall
                                                              .phoneNumber(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))!
                                                          .isNotEmpty
                                                  ? FFAppState()
                                                      .branchDataOutput
                                                      .elementAtOrNull(functions
                                                          .getIndexOfBoolList(
                                                              FFAppState()
                                                                  .selectedDropdownList
                                                                  .toList(),
                                                              true))
                                                      ?.phoneNumber
                                                  : '',
                                              latitude: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.latitude,
                                              longitude: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.longitude,
                                              branchCodeLocat: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.branchCode,
                                              areaCode: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.areaCode,
                                              areaName: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.areaName,
                                              regionCode: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.regionCode,
                                              regionName: FFAppState()
                                                  .branchDataOutput
                                                  .elementAtOrNull(functions
                                                      .getIndexOfBoolList(
                                                          FFAppState()
                                                              .selectedDropdownList
                                                              .toList(),
                                                          true))
                                                  ?.regionName,
                                              locatCode: _model.dropDownValue,
                                              receiver: ((FFAppState().profileLevel ==
                                                              'สาขา') ||
                                                          (FFAppState()
                                                                  .profileLevel ==
                                                              'เขต') ||
                                                          (FFAppState()
                                                                  .profileLevel ==
                                                              'ภาค')
                                                      ? functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_level'),
                                                          FFAppState()
                                                              .profileLevel)!
                                                      : functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_role'),
                                                          widget!
                                                              .userRoleSave)!)
                                                  ? _model
                                                      .deliverTextFieldTextController
                                                      .text
                                                  : '',
                                              deliverLocateName: ((FFAppState()
                                                                  .profileLevel ==
                                                              'สาขา') ||
                                                          (FFAppState().profileLevel ==
                                                              'เขต') ||
                                                          (FFAppState()
                                                                  .profileLevel ==
                                                              'ภาค')
                                                      ? functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_level'),
                                                          FFAppState()
                                                              .profileLevel)!
                                                      : functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_role'),
                                                          widget!
                                                              .userRoleSave)!)
                                                  ? FFAppState()
                                                      .impoundDeliverLocateName
                                                  : '',
                                              deliverLocateCode: ((FFAppState()
                                                                  .profileLevel ==
                                                              'สาขา') ||
                                                          (FFAppState().profileLevel ==
                                                              'เขต') ||
                                                          (FFAppState()
                                                                  .profileLevel ==
                                                              'ภาค')
                                                      ? functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_level'),
                                                          FFAppState()
                                                              .profileLevel)!
                                                      : functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_role'),
                                                          widget!
                                                              .userRoleSave)!)
                                                  ? FFAppState()
                                                      .impoundDeliverLocateCode
                                                  : '',
                                              logisticsCompany: ((FFAppState()
                                                                  .profileLevel ==
                                                              'สาขา') ||
                                                          (FFAppState().profileLevel ==
                                                              'เขต') ||
                                                          (FFAppState().profileLevel ==
                                                              'ภาค')
                                                      ? functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_level'),
                                                          FFAppState()
                                                              .profileLevel)!
                                                      : functions.containsValueInJsonList(
                                                          functions.getDataFromMapJson(
                                                              functions.getDataFromMapJson(
                                                                  widget!
                                                                      .saveAccessRoleData,
                                                                  widget!.step),
                                                              'include_deliver_data_role'),
                                                          widget!
                                                              .userRoleSave)!)
                                                  ? _model
                                                      .companyTextFieldTextController
                                                      .text
                                                  : '',
                                            ),
                                            ParamType.DataStruct,
                                          ),
                                          'carConfig': serializeParam(
                                            widget!.carConfig,
                                            ParamType.String,
                                            isList: true,
                                          ),
                                          'motocycleConfig': serializeParam(
                                            widget!.motocycleConfig,
                                            ParamType.String,
                                            isList: true,
                                          ),
                                          'editAccessRoleData': serializeParam(
                                            widget!.editAccessRoleData,
                                            ParamType.JSON,
                                          ),
                                          'userRoleEdit': serializeParam(
                                            widget!.userRoleEdit,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: widget!.fromPage == 'takeImages'
                                      ? 'ถ่ายรูป'
                                      : 'บันทึก',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.45,
                                    height: 60.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFD9761A),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
