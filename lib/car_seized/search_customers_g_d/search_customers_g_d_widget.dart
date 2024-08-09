import '/backend/api_requests/api_calls.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
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
  });

  final String? fromPage;
  final String? step;
  final String? textShow;
  final dynamic readAccessRoleData;
  final dynamic saveAccessRoleData;
  final String? userRoleRead;
  final String? userRoleSave;

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
      setState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
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
              FlutterFlowIconButton(
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
            ],
            centerTitle: true,
            elevation: 2.0,
          ),
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
                                FormFieldController<String>(null),
                            options: List<String>.from([
                              'cont_no',
                              'firstname_cust',
                              'lastname_cust',
                              'cuscod',
                              'registration_car'
                            ]),
                            optionLabels: [
                              'เลขที่สัญญา',
                              'ชื่อ',
                              'นามสกุล',
                              'บัตรประชาชน',
                              'เลขทะเบียน'
                            ],
                            onChanged: (val) =>
                                setState(() => _model.dropDownValue = val),
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
                                                () => setState(() {}),
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
                                                          setState(() {});
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
                                      if (_shouldSetState) setState(() {});
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
                                      if (_shouldSetState) setState(() {});
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
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
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
                                        if (_shouldSetState) setState(() {});
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
                                        setState(() {});
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
                                        setState(() {
                                          _model.textController?.text = '';
                                          _model.textController?.selection =
                                              TextSelection.collapsed(
                                                  offset: _model.textController!
                                                      .text.length);
                                        });
                                        Navigator.pop(context);
                                        if (_shouldSetState) setState(() {});
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
                                        if (_shouldSetState) setState(() {});
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
                                        setState(() {});
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
                                        setState(() {
                                          _model.textController?.text = '';
                                          _model.textController?.selection =
                                              TextSelection.collapsed(
                                                  offset: _model.textController!
                                                      .text.length);
                                        });
                                        Navigator.pop(context);
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    }

                                    Navigator.pop(context);
                                    if (_shouldSetState) setState(() {});
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
                                                    22.0, 15.0, 22.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 7.0),
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
                                                                    .improundCONTNO[
                                                                listImproundIndex],
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
                                                          0.0, 0.0, 0.0, 7.0),
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
                                                            '${FFAppState().improundTITLE[listImproundIndex]}${FFAppState().improundFNAME[listImproundIndex]}  ${FFAppState().improundSNAME[listImproundIndex]}',
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
                                                          0.0, 0.0, 0.0, 7.0),
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
                                                                    .improundCONTNOTYPENAME[
                                                                listImproundIndex],
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
                                                          0.0, 0.0, 0.0, 7.0),
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
                                                                    .improundREGNO[
                                                                listImproundIndex],
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
                                                          0.0, 0.0, 0.0, 7.0),
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
                                                                    .improundREGPROV[
                                                                listImproundIndex],
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
                                                          0.0, 8.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (widget!
                                                                    .fromPage ==
                                                                'takeImages') {
                                                              if (widget!
                                                                      .step ==
                                                                  'step4') {
                                                                context
                                                                    .pushNamed(
                                                                  'CustomerCarDeailsStep4',
                                                                  queryParameters:
                                                                      {
                                                                    'improundCONTNO':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundCONTNO[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundLOCAT':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundLOCAT[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundTITLE':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundTITLE[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundFNAME':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundFNAME[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundSNAME':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundSNAME[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundREGNO':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundREGNO[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundREGPROV':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundREGPROV[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundCONTNOTYPE':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundCONTNOTYPE[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundCONTNOTYPENAME':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundCONTNOTYPENAME[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundGCODE':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundGCODE[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundGDESC':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundGDESC[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundNumbody':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundNumbody[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'step':
                                                                        serializeParam(
                                                                      widget!
                                                                          .step,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundCUSCOD':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundCUSCOD[
                                                                          listImproundIndex],
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
                                                                  }.withoutNulls,
                                                                );
                                                              } else {
                                                                context
                                                                    .pushNamed(
                                                                  'CustomerCarDeailsStep1',
                                                                  queryParameters:
                                                                      {
                                                                    'improundCONTNO':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundCONTNO[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundLOCAT':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundLOCAT[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundTITLE':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundTITLE[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundFNAME':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundFNAME[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundSNAME':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundSNAME[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundREGNO':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundREGNO[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundREGPROV':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundREGPROV[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundCONTNOTYPE':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundCONTNOTYPE[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundCONTNOTYPENAME':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundCONTNOTYPENAME[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundGCODE':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundGCODE[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundGDESC':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundGDESC[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundNumbody':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundNumbody[
                                                                          listImproundIndex],
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'step':
                                                                        serializeParam(
                                                                      widget!
                                                                          .step,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'improundCUSCOD':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                              .improundCUSCOD[
                                                                          listImproundIndex],
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
                                                                  }.withoutNulls,
                                                                );
                                                              }
                                                            } else {
                                                              context.pushNamed(
                                                                'customerCarDeailsPictureStep1',
                                                                queryParameters:
                                                                    {
                                                                  'improundCONTNO':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                            .improundCONTNO[
                                                                        listImproundIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'improundLOCAT':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                            .improundLOCAT[
                                                                        listImproundIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'improundTITLE':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                            .improundTITLE[
                                                                        listImproundIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'improundFNAME':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                            .improundFNAME[
                                                                        listImproundIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'improundSNAME':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                            .improundSNAME[
                                                                        listImproundIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'improundREGNO':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                            .improundREGNO[
                                                                        listImproundIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'improundREGPROV':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                            .improundREGPROV[
                                                                        listImproundIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'improundCONTNOTYPE':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                            .improundCONTNOTYPE[
                                                                        listImproundIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'improundCONTNOTYPENAME':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                            .improundCONTNOTYPENAME[
                                                                        listImproundIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'improundGCODE':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                            .improundGCODE[
                                                                        listImproundIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'improundGDESC':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                            .improundGDESC[
                                                                        listImproundIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'improundNumbody':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                            .improundNumbody[
                                                                        listImproundIndex],
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'step':
                                                                      serializeParam(
                                                                    widget!
                                                                        .step,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'improundCUSCOD':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                            .improundCUSCOD[
                                                                        listImproundIndex],
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
                                                                }.withoutNulls,
                                                              );
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 138.0,
                                                            height: 110.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (widget!
                                                                        .fromPage ==
                                                                    'takeImages')
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(60.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.black,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.camera_alt,
                                                                            color:
                                                                                Color(0xFF354052),
                                                                            size:
                                                                                28.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (widget!
                                                                        .fromPage ==
                                                                    'seeImages')
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(60.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Colors.black,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.image_search,
                                                                            color:
                                                                                Color(0xFF354052),
                                                                            size:
                                                                                28.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget!
                                                                          .textShow,
                                                                      '-',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Noto Sans Thai',
                                                                          color:
                                                                              Color(0xFF204A77),
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
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
