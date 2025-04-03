import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/schema/structs/index.dart';
import '/car_seized/impound_car_price_input_component/impound_car_price_input_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_customers_g_d_model.dart';
export 'search_customers_g_d_model.dart';

class SearchCustomersGDWidget extends StatefulWidget {
  const SearchCustomersGDWidget({
    super.key,
    required this.fromPage,
    required this.step,
    required this.textShow,
    required this.readAccessRoleData,
    required this.saveAccessRoleData,
    required this.userRoleRead,
    required this.userRoleSave,
    required this.carConfig,
    required this.motocycleConfig,
    required this.editAccessRoleData,
    required this.userRoleEdit,
    String? contractNumber,
    required this.priceAccessRoleData,
    required this.userRolePrice,
    this.contNoFromNoti,
  }) : this.contractNumber = contractNumber ?? 'contractNumber';

  final String? fromPage;
  final String? step;
  final String? textShow;
  final dynamic readAccessRoleData;
  final dynamic saveAccessRoleData;
  final String? userRoleRead;
  final String? userRoleSave;
  final List<String>? carConfig;
  final List<String>? motocycleConfig;
  final dynamic editAccessRoleData;
  final String? userRoleEdit;
  final String contractNumber;
  final dynamic priceAccessRoleData;
  final String? userRolePrice;
  final String? contNoFromNoti;

  static String routeName = 'searchCustomersGD';
  static String routePath = 'searchCustomersGD';

  @override
  State<SearchCustomersGDWidget> createState() =>
      _SearchCustomersGDWidgetState();
}

class _SearchCustomersGDWidgetState extends State<SearchCustomersGDWidget> {
  late SearchCustomersGDModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchCustomersGDModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'searchCustomersGD'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().improundCONTNO = [];
      FFAppState().improundLOCAT = [];
      FFAppState().improundTITLE = [];
      FFAppState().improundFNAME = [];
      FFAppState().improundSNAME = [];
      FFAppState().improundREGNO = [];
      FFAppState().improundREGPROV = [];
      FFAppState().improundCONTNOTYPE = [];
      FFAppState().improundCONTNOTYPENAME = [];
      FFAppState().improundGCODE = [];
      FFAppState().improundGDESC = [];
      FFAppState().improundNumbody = [];
      FFAppState().improundCUSCOD = [];
      FFAppState().impoundCarStatusName = [];
      FFAppState().impoundCarBranchName = [];
      FFAppState().impoundCarMainBranch = [];
      FFAppState().impoundCarStatusId = [];
      FFAppState().impoundCarStatusCode = [];
      FFAppState().improundMANUYRCONVERT = [];
      FFAppState().improundKEYINCSHPRC = [];
      FFAppState().improundENGNO = [];
      FFAppState().improundCOLORCOD = [];
      FFAppState().improundMODELCOD = [];
      FFAppState().improundMANUYR = [];
      FFAppState().improundTYPECOD = [];
      FFAppState().improundCONTSTAT = [];
      FFAppState().improundARNOW = [];
      FFAppState().selectedDropdownList = [];
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController(
        text: widget!.contNoFromNoti != null && widget!.contNoFromNoti != ''
            ? widget!.contNoFromNoti
            : '');
    _model.textFieldFocusNode ??= FocusNode();

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
            'ค้นหาลูกค้า',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF003063),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [
            Visibility(
              visible: false,
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.filter_alt,
                  color: Color(0xFF354052),
                  size: 27.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFAFAFA),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 12,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
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
                              _model.dropDownValue ??=
                                  widget!.contNoFromNoti != null &&
                                          widget!.contNoFromNoti != ''
                                      ? 'cont_no'
                                      : '',
                            ),
                            options: List<String>.from([
                              'cont_no',
                              'firstname_cust',
                              'lastname_cust',
                              'registration_car'
                            ]),
                            optionLabels: [
                              'เลขที่สัญญา',
                              'ชื่อ',
                              'นามสกุล',
                              'เลขทะเบียน'
                            ],
                            onChanged: (val) =>
                                safeSetState(() => _model.dropDownValue = val),
                            width: 300.0,
                            height: 56.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'ค้นหาโดย....',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: Container(
                                    width: 100.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Color(0xFFB3B3B3),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Icon(
                                            Icons.search_outlined,
                                            color: Color(0xFF878787),
                                            size: 29.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController',
                                                Duration(milliseconds: 2000),
                                                () => safeSetState(() {}),
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'ระบุคำค้นหา',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                                suffixIcon: _model
                                                        .textController!
                                                        .text
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () async {
                                                          _model.textController
                                                              ?.clear();
                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.clear,
                                                          size: 20.0,
                                                        ),
                                                      )
                                                    : null,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    await actions.hideKeyboardAction(
                                      context,
                                    );
                                    if (!(_model.dropDownValue != null &&
                                        _model.dropDownValue != '')) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content:
                                                  Text('กรุณาเลือกค้นหาโดย'),
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
                                    if (!(_model.textController.text != null &&
                                        _model.textController.text != '')) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text('กรุณากรอกคำค้นหา'),
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
                                              child: LoadingSceneWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    if (widget!.fromPage == 'takeImages') {
                                      _model.vloanContractAPIOutput =
                                          await SswSurveyAPIVloanGetContractCall
                                              .call(
                                        contNo:
                                            _model.dropDownValue == 'cont_no'
                                                ? _model.textController.text
                                                : '',
                                        firstnameCust: _model.dropDownValue ==
                                                'firstname_cust'
                                            ? _model.textController.text
                                            : '',
                                        lastnameCust: _model.dropDownValue ==
                                                'lastname_cust'
                                            ? _model.textController.text
                                            : '',
                                        cuscod: _model.dropDownValue == 'cuscod'
                                            ? _model.textController.text
                                            : '',
                                        registrationCar: _model.dropDownValue ==
                                                'registration_car'
                                            ? _model.textController.text
                                            : '',
                                        token:
                                            FFAppState().impoundUrlVloanToken,
                                        apiUrl: FFAppState().impoundUrlVloan,
                                        step: widget!.step,
                                      );

                                      _shouldSetState = true;
                                      if ((_model.vloanContractAPIOutput
                                                  ?.statusCode ??
                                              200) !=
                                          200) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'พบข้อผิดพลาด (${(_model.vloanContractAPIOutput?.statusCode ?? 200).toString()})'),
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
                                        Navigator.pop(context);
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      if (SswSurveyAPIVloanGetContractCall.code(
                                            (_model.vloanContractAPIOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          '200') {
                                        FFAppState().improundCONTNO =
                                            SswSurveyAPIVloanGetContractCall
                                                    .contno(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundLOCAT =
                                            SswSurveyAPIVloanGetContractCall
                                                    .locat(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundTITLE =
                                            SswSurveyAPIVloanGetContractCall
                                                    .title(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundFNAME =
                                            SswSurveyAPIVloanGetContractCall
                                                    .fname(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundSNAME =
                                            SswSurveyAPIVloanGetContractCall
                                                    .sname(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundREGNO =
                                            SswSurveyAPIVloanGetContractCall
                                                    .regno(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundREGPROV =
                                            SswSurveyAPIVloanGetContractCall
                                                    .regprov(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundCONTNOTYPE =
                                            SswSurveyAPIVloanGetContractCall
                                                    .contnotype(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundCONTNOTYPENAME =
                                            SswSurveyAPIVloanGetContractCall
                                                    .contnotypename(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundGCODE =
                                            SswSurveyAPIVloanGetContractCall
                                                    .gcode(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundGDESC =
                                            SswSurveyAPIVloanGetContractCall
                                                    .gdesc(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundNumbody =
                                            SswSurveyAPIVloanGetContractCall
                                                    .strno(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundCUSCOD =
                                            SswSurveyAPIVloanGetContractCall
                                                    .cuscod(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundARNOW =
                                            SswSurveyAPIVloanGetContractCall
                                                    .arnow(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundCONTSTAT =
                                            SswSurveyAPIVloanGetContractCall
                                                    .contstat(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundTYPECOD =
                                            SswSurveyAPIVloanGetContractCall
                                                    .typecod(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundMANUYR =
                                            SswSurveyAPIVloanGetContractCall
                                                    .manuyr(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundMODELCOD =
                                            SswSurveyAPIVloanGetContractCall
                                                    .modelcod(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundCOLORCOD =
                                            SswSurveyAPIVloanGetContractCall
                                                    .colorcod(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundENGNO =
                                            SswSurveyAPIVloanGetContractCall
                                                    .engno(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundKEYINCSHPRC =
                                            SswSurveyAPIVloanGetContractCall
                                                    .keyincshprc(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundMANUYRCONVERT =
                                            SswSurveyAPIVloanGetContractCall
                                                    .manuyrconvert(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundVloanDbName =
                                            SswSurveyAPIVloanGetContractCall
                                                    .dBName(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundVloanDbCode =
                                            SswSurveyAPIVloanGetContractCall
                                                    .dBCode(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState()
                                                .impoundDeliverLocateNameList =
                                            SswSurveyAPIVloanGetContractCall
                                                    .locateNameDeliverCar(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState()
                                                .impoundDeliverLocateCodeList =
                                            SswSurveyAPIVloanGetContractCall
                                                    .locateDeliverCar(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        safeSetState(() {});
                                        FFAppState().impoundCarBranchName =
                                            SswSurveyAPIVloanGetContractCall
                                                    .branchnamelocat(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundCarMainBranch =
                                            SswSurveyAPIVloanGetContractCall
                                                    .locatname(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundCarStatusId =
                                            functions
                                                .generateEmptyListByLength(
                                                    FFAppState()
                                                        .improundCONTNO
                                                        .length)!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundCarStatusCode =
                                            SswSurveyAPIVloanGetContractCall
                                                    .statuscode(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundCarStatusName =
                                            SswSurveyAPIVloanGetContractCall
                                                    .statusname(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().ImpoundCarBranchCode =
                                            SswSurveyAPIVloanGetContractCall
                                                    .branchcodelocat(
                                          (_model.vloanContractAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        )!
                                                .toList()
                                                .cast<String>();
                                        safeSetState(() {});
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    SswSurveyAPIVloanGetContractCall
                                                        .message(
                                                  (_model.vloanContractAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!),
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
                                        safeSetState(() {
                                          _model.textController?.text = '';
                                        });
                                        Navigator.pop(context);
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    } else {
                                      _model.searchAPIOutput =
                                          await UploadImagesGoogleDriveGroup
                                              .searchContractNumberCall
                                              .call(
                                        contNo:
                                            _model.dropDownValue == 'cont_no'
                                                ? _model.textController.text
                                                : '',
                                        firstnameCust: _model.dropDownValue ==
                                                'firstname_cust'
                                            ? _model.textController.text
                                            : '',
                                        lastnameCust: _model.dropDownValue ==
                                                'lastname_cust'
                                            ? _model.textController.text
                                            : '',
                                        cuscod: _model.dropDownValue == 'cuscod'
                                            ? _model.textController.text
                                            : '',
                                        registrationCar: _model.dropDownValue ==
                                                'registration_car'
                                            ? _model.textController.text
                                            : '',
                                        url: FFAppState().improundUrl,
                                        step: widget!.step,
                                      );

                                      _shouldSetState = true;
                                      if ((_model.searchAPIOutput?.statusCode ??
                                              200) !=
                                          200) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'พบข้อผิดพลาด (${(_model.searchAPIOutput?.statusCode ?? 200).toString()})'),
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
                                        Navigator.pop(context);
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      if (UploadImagesGoogleDriveGroup
                                              .searchContractNumberCall
                                              .statuscode(
                                            (_model.searchAPIOutput?.jsonBody ??
                                                ''),
                                          ) ==
                                          200) {
                                        FFAppState().improundCONTNO =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .contno(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundLOCAT =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .locat(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundTITLE =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .titlecust(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundFNAME =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .firstnamecust(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundSNAME =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .lastnamecust(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundREGNO =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .registrationcar(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundREGPROV =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .registrationprove(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundCONTNOTYPE =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .typecontract(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundCONTNOTYPENAME =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .contnotypename(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundGCODE =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .productcode(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundGDESC =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .productname(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundNumbody =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .numbody(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundCUSCOD =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .cuscod(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundARNOW =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .arnow(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundCONTSTAT =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .constat(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundTYPECOD =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .typecod(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundMANUYR =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .originyear(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundMODELCOD =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .modelcod(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundCOLORCOD =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .colorcod(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundENGNO =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .engno(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundKEYINCSHPRC =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .keyincshprc(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().improundMANUYRCONVERT =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .convertyear(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundCarStatusName =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .statusname(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundCarBranchName =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .branchnamelocat(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundCarMainBranch =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .locatname(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundCarStatusId =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .impoundStatusId(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundCarStatusCode =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .impoundStatusCode(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().ImpoundCarBranchCode =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .branchcodelocat(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundAddress =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .address(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundSubDistrict =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .subDistrict(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundDistrict =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .district(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundProvince =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .province(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundPostcode =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .postcode(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundPhoneNumber =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .phoneNumber(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundLatitude =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .latitude(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundLongitude =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .longitude(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundAreaCode =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .areaCode(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundAreaName =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .areaName(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundRegionCode =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .regionCode(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundRegionName =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .regionName(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundSubLocateId =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .improundcarsublocatid(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundVloanDbName =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .vloneDbName(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundVloanDbCode =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .vloneDbCode(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundPriceCurrentStep =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .priceCurrentStep(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundLocateCode =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .locatcode(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState()
                                                .impoundDeliverLocateNameList =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .locatNameDeliverCar(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState()
                                                .impoundDeliverLocateCodeList =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .locatDeliverCar(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundReceiver =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .receiver(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundLogisticsCompany =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .logisticsCompany(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        FFAppState().impoundCarRegionCodeList =
                                            UploadImagesGoogleDriveGroup
                                                .searchContractNumberCall
                                                .ownerRegionEmpCodeList(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                .toList()
                                                .cast<String>();
                                        safeSetState(() {});
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    UploadImagesGoogleDriveGroup
                                                        .searchContractNumberCall
                                                        .message(
                                                  (_model.searchAPIOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )!),
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
                                        safeSetState(() {
                                          _model.textController?.text = '';
                                        });
                                        Navigator.pop(context);
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    }

                                    Navigator.pop(context);
                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: 'ค้นหา',
                                  options: FFButtonOptions(
                                    width: 94.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFFE6400),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if ((SswSurveyAPIVloanGetContractCall.code(
                                (_model.vloanContractAPIOutput?.jsonBody ?? ''),
                              ) ==
                              '200') ||
                          (UploadImagesGoogleDriveGroup.searchContractNumberCall
                                  .statuscode(
                                (_model.searchAPIOutput?.jsonBody ?? ''),
                              ) ==
                              200))
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final listImpround =
                                  FFAppState().improundCONTNO.toList();
                              if (listImpround.isEmpty) {
                                return Center(
                                  child: Image.asset(
                                    'assets/images/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
                                  ),
                                );
                              }

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listImpround.length,
                                itemBuilder: (context, listImproundIndex) {
                                  final listImproundItem =
                                      listImpround[listImproundIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 19.0, 10.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0),
                                          topLeft: Radius.circular(16.0),
                                          topRight: Radius.circular(16.0),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 7.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 37.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'เลขที่สัญญา',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 10.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF090F13),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width: 37.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            FFAppState()
                                                                .improundCONTNO
                                                                .elementAtOrNull(
                                                                    listImproundIndex)!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 7.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 37.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'ชื่อ-นามสกุล (ลูกค้า)',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 10.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF090F13),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width: 37.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            '${FFAppState().improundTITLE.elementAtOrNull(listImproundIndex)}${FFAppState().improundFNAME.elementAtOrNull(listImproundIndex)}  ${FFAppState().improundSNAME.elementAtOrNull(listImproundIndex)}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 7.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 37.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'ประเภทรถ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 10.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF090F13),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width: 37.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            FFAppState()
                                                                .improundCONTNOTYPENAME
                                                                .elementAtOrNull(
                                                                    listImproundIndex)!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 7.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 37.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'เลขทะเบียน',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 10.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF090F13),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width: 37.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            FFAppState()
                                                                .improundREGNO
                                                                .elementAtOrNull(
                                                                    listImproundIndex)!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 7.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: 37.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'จังหวัด',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 10.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Text(
                                                          ':',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF090F13),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width: 37.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            FFAppState()
                                                                .improundREGPROV
                                                                .elementAtOrNull(
                                                                    listImproundIndex)!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (FFAppState()
                                                        .impoundCarMainBranch
                                                        .elementAtOrNull(
                                                            listImproundIndex) !=
                                                    '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 7.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 37.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'สถานที่จอดรถ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF090F13),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            ':',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: 37.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              '${FFAppState().impoundCarMainBranch.elementAtOrNull(listImproundIndex)}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF090F13),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if ((FFAppState()
                                                            .impoundCarBranchName
                                                            .elementAtOrNull(
                                                                listImproundIndex) !=
                                                        '') &&
                                                    (FFAppState()
                                                            .impoundCarBranchName
                                                            .elementAtOrNull(
                                                                listImproundIndex) !=
                                                        ''))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 7.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 37.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'สาขาที่จอดรถ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF090F13),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            ':',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: 37.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              '${FFAppState().impoundCarBranchName.elementAtOrNull(listImproundIndex)}(${FFAppState().ImpoundCarBranchCode.elementAtOrNull(listImproundIndex)})',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF090F13),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (FFAppState()
                                                        .impoundCarStatusName
                                                        .elementAtOrNull(
                                                            listImproundIndex) !=
                                                    '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 7.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: 37.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              'สถานะ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF090F13),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 10.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            ':',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: 37.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Text(
                                                              FFAppState()
                                                                  .impoundCarStatusName
                                                                  .elementAtOrNull(
                                                                      listImproundIndex)!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF090F13),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                Builder(
                                                  builder: (context) {
                                                    if (!functions.containsValueInJsonList(
                                                        functions.getDataFromMapJson(
                                                            functions
                                                                .getDataFromMapJson(
                                                                    widget!
                                                                        .saveAccessRoleData,
                                                                    widget!
                                                                        .step),
                                                            'cannot_save_pic_status'),
                                                        FFAppState()
                                                            .impoundCarStatusName
                                                            .elementAtOrNull(
                                                                listImproundIndex))!) {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if (widget!.fromPage ==
                                                                    'price'
                                                                ? (FFAppState()
                                                                        .impoundCarRegionCodeList
                                                                        .contains(FFAppState()
                                                                            .profileRegion) ||
                                                                    (widget!.userRolePrice !=
                                                                        'no_role'))
                                                                : true)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (widget!
                                                                            .fromPage ==
                                                                        'price') {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        barrierColor:
                                                                            Color(0xC0000000),
                                                                        isDismissible:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: Container(
                                                                                  height: 300.0,
                                                                                  child: ImpoundCarPriceInputComponentWidget(
                                                                                    contNo: FFAppState().improundCONTNO.elementAtOrNull(listImproundIndex),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));

                                                                      return;
                                                                    }
                                                                    if ((widget!.fromPage ==
                                                                            'takeImages') ||
                                                                        (widget!.fromPage ==
                                                                            'changeCarLocation')) {
                                                                      if (widget!
                                                                              .fromPage !=
                                                                          'takeImages') {
                                                                        context
                                                                            .pushNamed(
                                                                          ChangeCarLocationPageWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'step':
                                                                                serializeParam(
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
                                                                            'userRoleRead':
                                                                                serializeParam(
                                                                              widget!.userRoleRead,
                                                                              ParamType.String,
                                                                            ),
                                                                            'userRoleSave':
                                                                                serializeParam(
                                                                              widget!.userRoleSave,
                                                                              ParamType.String,
                                                                            ),
                                                                            'fromPage':
                                                                                serializeParam(
                                                                              widget!.fromPage,
                                                                              ParamType.String,
                                                                            ),
                                                                            'impoundCarParamSet':
                                                                                serializeParam(
                                                                              ImpoundCarParamSetStruct(
                                                                                improundCONTNO: FFAppState().improundCONTNO.elementAtOrNull(listImproundIndex),
                                                                                improundLOCAT: FFAppState().improundLOCAT.elementAtOrNull(listImproundIndex),
                                                                                improundTITLE: FFAppState().improundTITLE.elementAtOrNull(listImproundIndex),
                                                                                improundFNAME: FFAppState().improundFNAME.elementAtOrNull(listImproundIndex),
                                                                                improundSNAME: FFAppState().improundSNAME.elementAtOrNull(listImproundIndex),
                                                                                improundREGNO: FFAppState().improundREGNO.elementAtOrNull(listImproundIndex),
                                                                                improundREGPROV: FFAppState().improundREGPROV.elementAtOrNull(listImproundIndex),
                                                                                improundCONTNOTYPE: FFAppState().improundCONTNOTYPE.elementAtOrNull(listImproundIndex),
                                                                                improundCONTNOTYPENAME: FFAppState().improundCONTNOTYPENAME.elementAtOrNull(listImproundIndex),
                                                                                improundGCODE: FFAppState().improundGCODE.elementAtOrNull(listImproundIndex),
                                                                                improundGDESC: FFAppState().improundGDESC.elementAtOrNull(listImproundIndex),
                                                                                improundNumbody: FFAppState().improundNumbody.elementAtOrNull(listImproundIndex),
                                                                                improundCUSCOD: FFAppState().improundCUSCOD.elementAtOrNull(listImproundIndex),
                                                                                improundARNOW: FFAppState().improundARNOW.elementAtOrNull(listImproundIndex),
                                                                                improundCONTSTAT: FFAppState().improundCONTSTAT.elementAtOrNull(listImproundIndex),
                                                                                improundTYPECOD: FFAppState().improundTYPECOD.elementAtOrNull(listImproundIndex),
                                                                                improundMANUYR: FFAppState().improundMANUYR.elementAtOrNull(listImproundIndex),
                                                                                improundMODELCOD: FFAppState().improundMODELCOD.elementAtOrNull(listImproundIndex),
                                                                                improudCOLORCOD: FFAppState().improundCOLORCOD.elementAtOrNull(listImproundIndex),
                                                                                improundENGNO: FFAppState().improundENGNO.elementAtOrNull(listImproundIndex),
                                                                                improundKEYINCSHPRC: FFAppState().improundKEYINCSHPRC.elementAtOrNull(listImproundIndex),
                                                                                improundMANUYRCONVERT: FFAppState().improundMANUYRCONVERT.elementAtOrNull(listImproundIndex),
                                                                                impoundPrice: FFAppState().impoundPriceCurrentStep.elementAtOrNull(listImproundIndex),
                                                                                impoundDbName: FFAppState().impoundVloanDbName.elementAtOrNull(listImproundIndex),
                                                                                impoundDbCode: FFAppState().impoundVloanDbCode.elementAtOrNull(listImproundIndex),
                                                                              ),
                                                                              ParamType.DataStruct,
                                                                            ),
                                                                            'impoundCarStatusId':
                                                                                serializeParam(
                                                                              widget!.fromPage == 'changeCarLocation' ? FFAppState().impoundCarStatusId.elementAtOrNull(listImproundIndex) : '',
                                                                              ParamType.String,
                                                                            ),
                                                                            'impoundCarStatusCode':
                                                                                serializeParam(
                                                                              widget!.fromPage == 'changeCarLocation' ? FFAppState().impoundCarStatusCode.elementAtOrNull(listImproundIndex) : '',
                                                                              ParamType.String,
                                                                            ),
                                                                            'impoundCarStatusName':
                                                                                serializeParam(
                                                                              widget!.fromPage == 'changeCarLocation' ? FFAppState().impoundCarStatusName.elementAtOrNull(listImproundIndex) : '',
                                                                              ParamType.String,
                                                                            ),
                                                                            'carConfig':
                                                                                serializeParam(
                                                                              widget!.carConfig,
                                                                              ParamType.String,
                                                                              isList: true,
                                                                            ),
                                                                            'motocycleConfig':
                                                                                serializeParam(
                                                                              widget!.motocycleConfig,
                                                                              ParamType.String,
                                                                              isList: true,
                                                                            ),
                                                                            'impoundCarLocateParamSet':
                                                                                serializeParam(
                                                                              ImpoundCarLocateParamSetStruct(
                                                                                locatName: FFAppState().impoundCarMainBranch.elementAtOrNull(listImproundIndex),
                                                                                branchNameLocat: FFAppState().impoundCarBranchName.elementAtOrNull(listImproundIndex),
                                                                                branchCodeLocat: FFAppState().ImpoundCarBranchCode.elementAtOrNull(listImproundIndex),
                                                                                improundcarLocatId: FFAppState().improundLOCAT.elementAtOrNull(listImproundIndex),
                                                                                address: FFAppState().impoundAddress.elementAtOrNull(listImproundIndex),
                                                                                subDistrict: FFAppState().impoundSubDistrict.elementAtOrNull(listImproundIndex),
                                                                                district: FFAppState().impoundDistrict.elementAtOrNull(listImproundIndex),
                                                                                province: FFAppState().impoundProvince.elementAtOrNull(listImproundIndex),
                                                                                postcode: FFAppState().impoundPostcode.elementAtOrNull(listImproundIndex),
                                                                                phoneNumber: FFAppState().impoundPhoneNumber.elementAtOrNull(listImproundIndex),
                                                                                latitude: FFAppState().impoundLatitude.elementAtOrNull(listImproundIndex),
                                                                                longitude: FFAppState().impoundLongitude.elementAtOrNull(listImproundIndex),
                                                                                areaCode: FFAppState().impoundAreaCode.elementAtOrNull(listImproundIndex),
                                                                                areaName: FFAppState().impoundAreaName.elementAtOrNull(listImproundIndex),
                                                                                regionCode: FFAppState().impoundRegionCode.elementAtOrNull(listImproundIndex),
                                                                                regionName: FFAppState().impoundRegionName.elementAtOrNull(listImproundIndex),
                                                                                improundcarSubLocatId: FFAppState().impoundSubLocateId.elementAtOrNull(listImproundIndex),
                                                                                locatCode: FFAppState().impoundLocateCode.elementAtOrNull(listImproundIndex),
                                                                                receiver: FFAppState().impoundReceiver.elementAtOrNull(listImproundIndex),
                                                                                deliverLocateName: FFAppState().impoundDeliverLocateNameList.elementAtOrNull(listImproundIndex),
                                                                                deliverLocateCode: FFAppState().impoundDeliverLocateCodeList.elementAtOrNull(listImproundIndex),
                                                                                logisticsCompany: FFAppState().impoundLogisticsCompany.elementAtOrNull(listImproundIndex),
                                                                              ),
                                                                              ParamType.DataStruct,
                                                                            ),
                                                                            'editAccessRoleData':
                                                                                serializeParam(
                                                                              widget!.editAccessRoleData,
                                                                              ParamType.JSON,
                                                                            ),
                                                                            'userRoleEdit':
                                                                                serializeParam(
                                                                              widget!.userRoleEdit,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );

                                                                        return;
                                                                      }

                                                                      context
                                                                          .pushNamed(
                                                                        ChangeCarLocationPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'step':
                                                                              serializeParam(
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
                                                                          'userRoleRead':
                                                                              serializeParam(
                                                                            widget!.userRoleRead,
                                                                            ParamType.String,
                                                                          ),
                                                                          'userRoleSave':
                                                                              serializeParam(
                                                                            widget!.userRoleSave,
                                                                            ParamType.String,
                                                                          ),
                                                                          'fromPage':
                                                                              serializeParam(
                                                                            widget!.fromPage,
                                                                            ParamType.String,
                                                                          ),
                                                                          'impoundCarParamSet':
                                                                              serializeParam(
                                                                            ImpoundCarParamSetStruct(
                                                                              improundCONTNO: FFAppState().improundCONTNO.elementAtOrNull(listImproundIndex),
                                                                              improundLOCAT: FFAppState().improundLOCAT.elementAtOrNull(listImproundIndex),
                                                                              improundTITLE: FFAppState().improundTITLE.elementAtOrNull(listImproundIndex),
                                                                              improundFNAME: FFAppState().improundFNAME.elementAtOrNull(listImproundIndex),
                                                                              improundSNAME: FFAppState().improundSNAME.elementAtOrNull(listImproundIndex),
                                                                              improundREGNO: FFAppState().improundREGNO.elementAtOrNull(listImproundIndex),
                                                                              improundREGPROV: FFAppState().improundREGPROV.elementAtOrNull(listImproundIndex),
                                                                              improundCONTNOTYPE: FFAppState().improundCONTNOTYPE.elementAtOrNull(listImproundIndex),
                                                                              improundCONTNOTYPENAME: FFAppState().improundCONTNOTYPENAME.elementAtOrNull(listImproundIndex),
                                                                              improundGCODE: FFAppState().improundGCODE.elementAtOrNull(listImproundIndex),
                                                                              improundGDESC: FFAppState().improundGDESC.elementAtOrNull(listImproundIndex),
                                                                              improundNumbody: FFAppState().improundNumbody.elementAtOrNull(listImproundIndex),
                                                                              improundCUSCOD: FFAppState().improundCUSCOD.elementAtOrNull(listImproundIndex),
                                                                              improundARNOW: FFAppState().improundARNOW.elementAtOrNull(listImproundIndex),
                                                                              improundCONTSTAT: FFAppState().improundCONTSTAT.elementAtOrNull(listImproundIndex),
                                                                              improundTYPECOD: FFAppState().improundTYPECOD.elementAtOrNull(listImproundIndex),
                                                                              improundMANUYR: FFAppState().improundMANUYR.elementAtOrNull(listImproundIndex),
                                                                              improundMODELCOD: FFAppState().improundMODELCOD.elementAtOrNull(listImproundIndex),
                                                                              improudCOLORCOD: FFAppState().improundCOLORCOD.elementAtOrNull(listImproundIndex),
                                                                              improundENGNO: FFAppState().improundENGNO.elementAtOrNull(listImproundIndex),
                                                                              improundKEYINCSHPRC: FFAppState().improundKEYINCSHPRC.elementAtOrNull(listImproundIndex),
                                                                              improundMANUYRCONVERT: FFAppState().improundMANUYRCONVERT.elementAtOrNull(listImproundIndex),
                                                                              impoundDbName: FFAppState().impoundVloanDbName.elementAtOrNull(listImproundIndex),
                                                                              impoundDbCode: FFAppState().impoundVloanDbCode.elementAtOrNull(listImproundIndex),
                                                                            ),
                                                                            ParamType.DataStruct,
                                                                          ),
                                                                          'impoundCarStatusId':
                                                                              serializeParam(
                                                                            widget!.fromPage == 'changeCarLocation'
                                                                                ? FFAppState().impoundCarStatusId.elementAtOrNull(listImproundIndex)
                                                                                : '',
                                                                            ParamType.String,
                                                                          ),
                                                                          'impoundCarStatusCode':
                                                                              serializeParam(
                                                                            widget!.fromPage == 'changeCarLocation'
                                                                                ? FFAppState().impoundCarStatusCode.elementAtOrNull(listImproundIndex)
                                                                                : '',
                                                                            ParamType.String,
                                                                          ),
                                                                          'impoundCarStatusName':
                                                                              serializeParam(
                                                                            widget!.fromPage == 'changeCarLocation'
                                                                                ? FFAppState().impoundCarStatusName.elementAtOrNull(listImproundIndex)
                                                                                : '',
                                                                            ParamType.String,
                                                                          ),
                                                                          'carConfig':
                                                                              serializeParam(
                                                                            widget!.carConfig,
                                                                            ParamType.String,
                                                                            isList:
                                                                                true,
                                                                          ),
                                                                          'motocycleConfig':
                                                                              serializeParam(
                                                                            widget!.motocycleConfig,
                                                                            ParamType.String,
                                                                            isList:
                                                                                true,
                                                                          ),
                                                                          'editAccessRoleData':
                                                                              serializeParam(
                                                                            widget!.editAccessRoleData,
                                                                            ParamType.JSON,
                                                                          ),
                                                                          'userRoleEdit':
                                                                              serializeParam(
                                                                            widget!.userRoleEdit,
                                                                            ParamType.String,
                                                                          ),
                                                                          'impoundCarLocateParamSet':
                                                                              serializeParam(
                                                                            ImpoundCarLocateParamSetStruct(
                                                                              deliverLocateName: FFAppState().impoundDeliverLocateNameList.elementAtOrNull(listImproundIndex),
                                                                              deliverLocateCode: FFAppState().impoundDeliverLocateCodeList.elementAtOrNull(listImproundIndex),
                                                                              logisticsCompany: '',
                                                                              receiver: '',
                                                                            ),
                                                                            ParamType.DataStruct,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    } else {
                                                                      context
                                                                          .pushNamed(
                                                                        CustomerCarDeailsPictureStep1Widget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'step':
                                                                              serializeParam(
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
                                                                          'userRoleRead':
                                                                              serializeParam(
                                                                            widget!.userRoleRead,
                                                                            ParamType.String,
                                                                          ),
                                                                          'userRoleSave':
                                                                              serializeParam(
                                                                            widget!.userRoleSave,
                                                                            ParamType.String,
                                                                          ),
                                                                          'impoundCarParamSet':
                                                                              serializeParam(
                                                                            ImpoundCarParamSetStruct(
                                                                              improundCONTNO: FFAppState().improundCONTNO.elementAtOrNull(listImproundIndex),
                                                                              improundLOCAT: FFAppState().improundLOCAT.elementAtOrNull(listImproundIndex),
                                                                              improundTITLE: FFAppState().improundTITLE.elementAtOrNull(listImproundIndex),
                                                                              improundFNAME: FFAppState().improundFNAME.elementAtOrNull(listImproundIndex),
                                                                              improundSNAME: FFAppState().improundSNAME.elementAtOrNull(listImproundIndex),
                                                                              improundREGNO: FFAppState().improundREGNO.elementAtOrNull(listImproundIndex),
                                                                              improundREGPROV: FFAppState().improundREGPROV.elementAtOrNull(listImproundIndex),
                                                                              improundCONTNOTYPE: FFAppState().improundCONTNOTYPE.elementAtOrNull(listImproundIndex),
                                                                              improundCONTNOTYPENAME: FFAppState().improundCONTNOTYPENAME.elementAtOrNull(listImproundIndex),
                                                                              improundGCODE: FFAppState().improundGCODE.elementAtOrNull(listImproundIndex),
                                                                              improundGDESC: FFAppState().improundGDESC.elementAtOrNull(listImproundIndex),
                                                                              improundNumbody: FFAppState().improundNumbody.elementAtOrNull(listImproundIndex),
                                                                              improundCUSCOD: FFAppState().improundCUSCOD.elementAtOrNull(listImproundIndex),
                                                                              improundARNOW: FFAppState().improundARNOW.elementAtOrNull(listImproundIndex),
                                                                              improundCONTSTAT: FFAppState().improundCONTSTAT.elementAtOrNull(listImproundIndex),
                                                                              improundTYPECOD: FFAppState().improundTYPECOD.elementAtOrNull(listImproundIndex),
                                                                              improundMANUYR: FFAppState().improundMANUYR.elementAtOrNull(listImproundIndex),
                                                                              improundMODELCOD: FFAppState().improundMODELCOD.elementAtOrNull(listImproundIndex),
                                                                              improudCOLORCOD: FFAppState().improundCOLORCOD.elementAtOrNull(listImproundIndex),
                                                                              improundENGNO: FFAppState().improundENGNO.elementAtOrNull(listImproundIndex),
                                                                              improundKEYINCSHPRC: FFAppState().improundKEYINCSHPRC.elementAtOrNull(listImproundIndex),
                                                                              improundMANUYRCONVERT: FFAppState().improundMANUYRCONVERT.elementAtOrNull(listImproundIndex),
                                                                              impoundDbName: FFAppState().impoundVloanDbName.elementAtOrNull(listImproundIndex),
                                                                              impoundDbCode: FFAppState().impoundVloanDbCode.elementAtOrNull(listImproundIndex),
                                                                              impoundPrice: FFAppState().impoundPriceCurrentStep.elementAtOrNull(listImproundIndex),
                                                                            ),
                                                                            ParamType.DataStruct,
                                                                          ),
                                                                          'fromPage':
                                                                              serializeParam(
                                                                            widget!.fromPage,
                                                                            ParamType.String,
                                                                          ),
                                                                          'impoundCarLocateParamSet':
                                                                              serializeParam(
                                                                            ImpoundCarLocateParamSetStruct(
                                                                              locatName: FFAppState().impoundCarMainBranch.elementAtOrNull(listImproundIndex),
                                                                              branchNameLocat: FFAppState().impoundCarBranchName.elementAtOrNull(listImproundIndex),
                                                                              branchCodeLocat: FFAppState().ImpoundCarBranchCode.elementAtOrNull(listImproundIndex),
                                                                              deliverLocateName: FFAppState().impoundDeliverLocateNameList.elementAtOrNull(listImproundIndex),
                                                                              deliverLocateCode: FFAppState().impoundDeliverLocateCodeList.elementAtOrNull(listImproundIndex),
                                                                              logisticsCompany: FFAppState().impoundLogisticsCompany.elementAtOrNull(listImproundIndex),
                                                                              receiver: FFAppState().impoundReceiver.elementAtOrNull(listImproundIndex),
                                                                            ),
                                                                            ParamType.DataStruct,
                                                                          ),
                                                                          'impoundCarStatusName':
                                                                              serializeParam(
                                                                            FFAppState().impoundCarStatusName.elementAtOrNull(listImproundIndex),
                                                                            ParamType.String,
                                                                          ),
                                                                          'carConfig':
                                                                              serializeParam(
                                                                            widget!.carConfig,
                                                                            ParamType.String,
                                                                            isList:
                                                                                true,
                                                                          ),
                                                                          'motocycleConfig':
                                                                              serializeParam(
                                                                            widget!.motocycleConfig,
                                                                            ParamType.String,
                                                                            isList:
                                                                                true,
                                                                          ),
                                                                          'editAccessRoleData':
                                                                              serializeParam(
                                                                            widget!.editAccessRoleData,
                                                                            ParamType.JSON,
                                                                          ),
                                                                          'userRoleEdit':
                                                                              serializeParam(
                                                                            widget!.userRoleEdit,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    }
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        150.0,
                                                                    height:
                                                                        130.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (widget!.fromPage ==
                                                                            'takeImages')
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(60.0),
                                                                                  border: Border.all(
                                                                                    color: Colors.black,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.camera_alt,
                                                                                    color: Color(0xFF354052),
                                                                                    size: 28.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (widget!.fromPage ==
                                                                            'seeImages')
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(60.0),
                                                                                  border: Border.all(
                                                                                    color: Colors.black,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.image_search,
                                                                                    color: Color(0xFF354052),
                                                                                    size: 28.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (widget!.fromPage ==
                                                                            'changeCarLocation')
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(60.0),
                                                                                  border: Border.all(
                                                                                    color: Colors.black,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.location_pin,
                                                                                    color: Color(0xFF354052),
                                                                                    size: 28.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (widget!.fromPage ==
                                                                            'price')
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(60.0),
                                                                                  border: Border.all(
                                                                                    color: Colors.black,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.attach_money_outlined,
                                                                                    color: Color(0xFF354052),
                                                                                    size: 28.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              widget!.textShow,
                                                                              '-',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: Color(0xFF204A77),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (widget!.fromPage ==
                                                                    'price'
                                                                ? (FFAppState()
                                                                        .impoundCarRegionCodeList
                                                                        .contains(FFAppState()
                                                                            .profileRegion) ||
                                                                    (widget!.userRolePrice !=
                                                                        'no_role'))
                                                                : false)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      CustomerCarDeailsPictureStep1Widget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'step':
                                                                            serializeParam(
                                                                          widget!
                                                                              .step,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'readAccessRoleData':
                                                                            serializeParam(
                                                                          widget!
                                                                              .readAccessRoleData,
                                                                          ParamType
                                                                              .JSON,
                                                                        ),
                                                                        'saveAccessRoleData':
                                                                            serializeParam(
                                                                          widget!
                                                                              .saveAccessRoleData,
                                                                          ParamType
                                                                              .JSON,
                                                                        ),
                                                                        'userRoleRead':
                                                                            serializeParam(
                                                                          widget!
                                                                              .userRoleRead,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'userRoleSave':
                                                                            serializeParam(
                                                                          widget!
                                                                              .userRoleSave,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'impoundCarParamSet':
                                                                            serializeParam(
                                                                          ImpoundCarParamSetStruct(
                                                                            improundCONTNO:
                                                                                FFAppState().improundCONTNO.elementAtOrNull(listImproundIndex),
                                                                            improundLOCAT:
                                                                                FFAppState().improundLOCAT.elementAtOrNull(listImproundIndex),
                                                                            improundTITLE:
                                                                                FFAppState().improundTITLE.elementAtOrNull(listImproundIndex),
                                                                            improundFNAME:
                                                                                FFAppState().improundFNAME.elementAtOrNull(listImproundIndex),
                                                                            improundSNAME:
                                                                                FFAppState().improundSNAME.elementAtOrNull(listImproundIndex),
                                                                            improundREGNO:
                                                                                FFAppState().improundREGNO.elementAtOrNull(listImproundIndex),
                                                                            improundREGPROV:
                                                                                FFAppState().improundREGPROV.elementAtOrNull(listImproundIndex),
                                                                            improundCONTNOTYPE:
                                                                                FFAppState().improundCONTNOTYPE.elementAtOrNull(listImproundIndex),
                                                                            improundCONTNOTYPENAME:
                                                                                FFAppState().improundCONTNOTYPENAME.elementAtOrNull(listImproundIndex),
                                                                            improundGCODE:
                                                                                FFAppState().improundGCODE.elementAtOrNull(listImproundIndex),
                                                                            improundGDESC:
                                                                                FFAppState().improundGDESC.elementAtOrNull(listImproundIndex),
                                                                            improundNumbody:
                                                                                FFAppState().improundNumbody.elementAtOrNull(listImproundIndex),
                                                                            improundCUSCOD:
                                                                                FFAppState().improundCUSCOD.elementAtOrNull(listImproundIndex),
                                                                            improundARNOW:
                                                                                FFAppState().improundARNOW.elementAtOrNull(listImproundIndex),
                                                                            improundCONTSTAT:
                                                                                FFAppState().improundCONTSTAT.elementAtOrNull(listImproundIndex),
                                                                            improundTYPECOD:
                                                                                FFAppState().improundTYPECOD.elementAtOrNull(listImproundIndex),
                                                                            improundMANUYR:
                                                                                FFAppState().improundMANUYR.elementAtOrNull(listImproundIndex),
                                                                            improundMODELCOD:
                                                                                FFAppState().improundMODELCOD.elementAtOrNull(listImproundIndex),
                                                                            improudCOLORCOD:
                                                                                FFAppState().improundCOLORCOD.elementAtOrNull(listImproundIndex),
                                                                            improundENGNO:
                                                                                FFAppState().improundENGNO.elementAtOrNull(listImproundIndex),
                                                                            improundKEYINCSHPRC:
                                                                                FFAppState().improundKEYINCSHPRC.elementAtOrNull(listImproundIndex),
                                                                            improundMANUYRCONVERT:
                                                                                FFAppState().improundMANUYRCONVERT.elementAtOrNull(listImproundIndex),
                                                                            impoundDbName:
                                                                                FFAppState().impoundVloanDbName.elementAtOrNull(listImproundIndex),
                                                                            impoundDbCode:
                                                                                FFAppState().impoundVloanDbCode.elementAtOrNull(listImproundIndex),
                                                                            impoundPrice:
                                                                                FFAppState().impoundPriceCurrentStep.elementAtOrNull(listImproundIndex),
                                                                          ),
                                                                          ParamType
                                                                              .DataStruct,
                                                                        ),
                                                                        'fromPage':
                                                                            serializeParam(
                                                                          widget!
                                                                              .fromPage,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'impoundCarLocateParamSet':
                                                                            serializeParam(
                                                                          ImpoundCarLocateParamSetStruct(
                                                                            locatName:
                                                                                FFAppState().impoundCarMainBranch.elementAtOrNull(listImproundIndex),
                                                                            branchNameLocat:
                                                                                FFAppState().impoundCarBranchName.elementAtOrNull(listImproundIndex),
                                                                            branchCodeLocat:
                                                                                FFAppState().ImpoundCarBranchCode.elementAtOrNull(listImproundIndex),
                                                                            deliverLocateName:
                                                                                FFAppState().impoundDeliverLocateNameList.elementAtOrNull(listImproundIndex),
                                                                            deliverLocateCode:
                                                                                FFAppState().impoundDeliverLocateCodeList.elementAtOrNull(listImproundIndex),
                                                                            logisticsCompany:
                                                                                FFAppState().impoundLogisticsCompany.elementAtOrNull(listImproundIndex),
                                                                            receiver:
                                                                                FFAppState().impoundReceiver.elementAtOrNull(listImproundIndex),
                                                                          ),
                                                                          ParamType
                                                                              .DataStruct,
                                                                        ),
                                                                        'impoundCarStatusName':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .impoundCarStatusName
                                                                              .elementAtOrNull(listImproundIndex),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'carConfig':
                                                                            serializeParam(
                                                                          widget!
                                                                              .carConfig,
                                                                          ParamType
                                                                              .String,
                                                                          isList:
                                                                              true,
                                                                        ),
                                                                        'motocycleConfig':
                                                                            serializeParam(
                                                                          widget!
                                                                              .motocycleConfig,
                                                                          ParamType
                                                                              .String,
                                                                          isList:
                                                                              true,
                                                                        ),
                                                                        'editAccessRoleData':
                                                                            serializeParam(
                                                                          widget!
                                                                              .editAccessRoleData,
                                                                          ParamType
                                                                              .JSON,
                                                                        ),
                                                                        'userRoleEdit':
                                                                            serializeParam(
                                                                          widget!
                                                                              .userRoleEdit,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'fromPage2':
                                                                            serializeParam(
                                                                          'seeImageButton',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        150.0,
                                                                    height:
                                                                        130.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(60.0),
                                                                                border: Border.all(
                                                                                  color: Colors.black,
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.image_search,
                                                                                  color: Color(0xFF354052),
                                                                                  size: 28.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Text(
                                                                            'ดูรูป',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Noto Sans Thai',
                                                                                  color: Color(0xFF204A77),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      );
                                                    } else {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Container(
                                                          height: 80.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    '${functions.getDataFromMapJson(functions.getDataFromMapJson(widget!.saveAccessRoleData, widget!.step), 'cannot_save_pic_text')?.toString()}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFFFF0000),
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
