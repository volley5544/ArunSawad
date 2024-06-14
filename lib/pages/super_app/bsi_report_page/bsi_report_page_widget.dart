import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'bsi_report_page_model.dart';
export 'bsi_report_page_model.dart';

class BsiReportPageWidget extends StatefulWidget {
  const BsiReportPageWidget({super.key});

  @override
  State<BsiReportPageWidget> createState() => _BsiReportPageWidgetState();
}

class _BsiReportPageWidgetState extends State<BsiReportPageWidget>
    with TickerProviderStateMixin {
  late BsiReportPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BsiReportPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BsiReportPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      if (isAndroid) {
        await actions.allowScreenRecordAndroid();
      } else {
        await actions.allowScreenRecordIOS();
      }

      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x00000000),
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: double.infinity,
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      FFAppState().isSearchedBranch = false;
      setState(() {});

      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'BSI_Report',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      ));
      _model.createdUserLogBsiReport = UserLogRecord.getDocumentFromData(
          createUserLogRecordData(
            employeeId: FFAppState().employeeID,
            action: 'BSI_Report',
            actionTime: getCurrentTimestamp,
            userLocation: currentUserLocationValue,
          ),
          userLogRecordReference);
      if (FFAppState().profileLevel != 'สาขา') {
        _model.getMyselfBranch = await GetlocationAPICall.call(
          token: FFAppState().accessToken,
          apiUrl: FFAppState().apiURLLocalState,
        );
        if ((_model.getMyselfBranch?.statusCode ?? 200) != 200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาดConnection (${(_model.getMyselfBranch?.statusCode ?? 200).toString()})'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
          return;
        }
        if (GetlocationAPICall.statusLayer2(
              (_model.getMyselfBranch?.jsonBody ?? ''),
            ) !=
            200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาดConnection (${GetlocationAPICall.statusLayer2(
                    (_model.getMyselfBranch?.jsonBody ?? ''),
                  )?.toString()})'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
          return;
        }
      }
      Navigator.pop(context);
    });

    _model.branchInputTextController ??= TextEditingController();
    _model.branchInputFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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

    return FutureBuilder<List<UrlLinkStorageRecord>>(
      future: queryUrlLinkStorageRecordOnce(
        queryBuilder: (urlLinkStorageRecord) => urlLinkStorageRecord.where(
          'url_name',
          isEqualTo: 'tableau_report_base_url',
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).tertiary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UrlLinkStorageRecord> bsiReportPageUrlLinkStorageRecordList =
            snapshot.data!;
        final bsiReportPageUrlLinkStorageRecord =
            bsiReportPageUrlLinkStorageRecordList.isNotEmpty
                ? bsiReportPageUrlLinkStorageRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: AppBar(
                backgroundColor: Color(0xFFFF6500),
                automaticallyImplyLeading: false,
                leading: Visibility(
                  visible: !FFAppState().isFromTimesheetPage,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed('SuperAppPage');
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xFBFFFFFF),
                      size: 30.0,
                    ),
                  ),
                ),
                title: Text(
                  'รายงาน BSI',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 10.0,
              ),
              body: SafeArea(
                top: true,
                child: FutureBuilder<List<AuthorizationRecord>>(
                  future: queryAuthorizationRecordOnce(
                    queryBuilder: (authorizationRecord) =>
                        authorizationRecord.where(
                      'content_name',
                      isEqualTo: 'kpi_ceo',
                    ),
                    singleRecord: true,
                  ),
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
                    List<AuthorizationRecord> columnAuthorizationRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final columnAuthorizationRecord =
                        columnAuthorizationRecordList.isNotEmpty
                            ? columnAuthorizationRecordList.first
                            : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<List<ReportStorageRecord>>(
                          future: queryReportStorageRecordOnce(
                            queryBuilder: (reportStorageRecord) =>
                                reportStorageRecord.where(
                              'report_name',
                              isEqualTo: 'bsi',
                            ),
                            singleRecord: true,
                          ),
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
                            List<ReportStorageRecord>
                                columnReportStorageRecordList = snapshot.data!;
                            final columnReportStorageRecord =
                                columnReportStorageRecordList.isNotEmpty
                                    ? columnReportStorageRecordList.first
                                    : null;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (columnAuthorizationRecord?.employeeIdList
                                        ?.contains(FFAppState().employeeID) ??
                                    true)
                                  Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Icon(
                                              Icons.home_work_outlined,
                                              color: Colors.black,
                                              size: 29.0,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              'ค้นหาสาขา:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: TextFormField(
                                              controller: _model
                                                  .branchInputTextController,
                                              focusNode:
                                                  _model.branchInputFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    'กรอกรหัสสาขา/ชื่อสาขา',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              textAlign: TextAlign.start,
                                              validator: _model
                                                  .branchInputTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.black,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 35.0,
                                              fillColor: Color(0xFF213BFF),
                                              icon: Icon(
                                                Icons.search_rounded,
                                                color: Colors.white,
                                                size: 25.0,
                                              ),
                                              onPressed: () async {
                                                var _shouldSetState = false;
                                                HapticFeedback.mediumImpact();
                                                if (!(_model.branchInputTextController
                                                            .text !=
                                                        null &&
                                                    _model.branchInputTextController
                                                            .text !=
                                                        '')) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'กรุณากรอกรหัสสาขา/ชื่อสาขา ที่ต้องการจะค้นหา'),
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
                                                    setState(() {});
                                                  return;
                                                }
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      Color(0x00000000),
                                                  isDismissible: false,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                LoadingSceneWidget(),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                _model.getBranchSearched =
                                                    await GetBranchAPICall.call(
                                                  token:
                                                      FFAppState().accessToken,
                                                  branchCode: _model
                                                      .branchInputTextController
                                                      .text,
                                                  apiUrl: FFAppState()
                                                      .apiURLLocalState,
                                                  type: 'actual',
                                                );
                                                _shouldSetState = true;
                                                if (((_model.getBranchSearched
                                                                ?.statusCode ??
                                                            200) ==
                                                        200) &&
                                                    (GetBranchAPICall
                                                            .statusLayer2(
                                                          (_model.getBranchSearched
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        200)) {
                                                  if (!FFAppState()
                                                      .isSearchedBranch) {
                                                    FFAppState()
                                                            .isSearchedBranch =
                                                        true;
                                                    FFAppState().update(() {});
                                                  }
                                                } else {
                                                  if ((_model.getBranchSearched
                                                              ?.statusCode ??
                                                          200) ==
                                                      200) {
                                                    if (GetBranchAPICall
                                                            .statusLayer2(
                                                          (_model.getBranchSearched
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        404) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'ไม่พบข้อมูลสาขา'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'พบข้อผิดพลาดLayer2 (${GetBranchAPICall.statusLayer2(
                                                                (_model.getBranchSearched
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toString()})'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'พบข้อผิดพลาดConnection (${(_model.getBranchSearched?.statusCode ?? 200).toString()})'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                }

                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  setState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (columnAuthorizationRecord!.employeeIdList
                                        .contains(FFAppState().employeeID)
                                    ? FFAppState().isSearchedBranch
                                    : (FFAppState().profileLevel != 'สาขา'))
                                  Container(
                                    width: double.infinity,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Icon(
                                              Icons.house_rounded,
                                              color: Colors.black,
                                              size: 25.0,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              'เลือกสาขา:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .branchDropDownValueController ??=
                                                  FormFieldController<String>(
                                                _model.branchDropDownValue ??=
                                                    '',
                                              ),
                                              options: List<String>.from(
                                                  columnAuthorizationRecord!
                                                          .employeeIdList
                                                          .contains(FFAppState()
                                                              .employeeID)
                                                      ? GetBranchAPICall
                                                          .branchCode(
                                                          (_model.getBranchSearched
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                      : GetlocationAPICall
                                                          .branchCode(
                                                          (_model.getMyselfBranch
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!),
                                              optionLabels: functions
                                                  .createEmployeeDropdown(
                                                      (columnAuthorizationRecord!
                                                                  .employeeIdList
                                                                  .contains(
                                                                      FFAppState()
                                                                          .employeeID)
                                                              ? GetBranchAPICall
                                                                  .branchName(
                                                                  (_model.getBranchSearched
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                              : GetlocationAPICall
                                                                  .branchName(
                                                                  (_model.getMyselfBranch
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))
                                                          ?.toList(),
                                                      (columnAuthorizationRecord!
                                                                  .employeeIdList
                                                                  .contains(
                                                                      FFAppState()
                                                                          .employeeID)
                                                              ? GetBranchAPICall
                                                                  .branchCode(
                                                                  (_model.getBranchSearched
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                              : GetlocationAPICall
                                                                  .branchCode(
                                                                  (_model.getMyselfBranch
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ))
                                                          ?.toList()),
                                              onChanged: (val) => setState(() =>
                                                  _model.branchDropDownValue =
                                                      val),
                                              width: 180.0,
                                              height: 50.0,
                                              searchHintTextStyle: TextStyle(),
                                              searchTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'สาขา...',
                                              searchHintText:
                                                  'กรอกสาขาที่จะค้นหา...',
                                              fillColor: Colors.white,
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 0.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 4.0, 12.0, 4.0),
                                              hidesUnderline: true,
                                              disabled: ((_model.getMyselfBranch
                                                              ?.statusCode ??
                                                          200) !=
                                                      200) &&
                                                  (GetlocationAPICall
                                                          .statusLayer2(
                                                        (_model.getMyselfBranch
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      200),
                                              isSearchable: true,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation1']!),
                                if (FFAppState().profileLevel == 'สาขา'
                                    ? true
                                    : (_model.branchDropDownValue != null &&
                                        _model.branchDropDownValue != ''))
                                  Container(
                                    width: double.infinity,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Icon(
                                              Icons.list_alt_outlined,
                                              color: Colors.black,
                                              size: 25.0,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              'เลือกรายงาน:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .reportDropDownValueController ??=
                                                  FormFieldController<String>(
                                                _model.reportDropDownValue ??=
                                                    '',
                                              ),
                                              options: List<String>.from(
                                                  columnReportStorageRecord!
                                                      .reportUrl),
                                              optionLabels:
                                                  columnReportStorageRecord!
                                                      .reportUrlName,
                                              onChanged: (val) => setState(() =>
                                                  _model.reportDropDownValue =
                                                      val),
                                              width: 180.0,
                                              height: 50.0,
                                              searchHintTextStyle: TextStyle(),
                                              searchTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'รายงาน...',
                                              searchHintText:
                                                  'กรอกสาขาที่จะค้นหา...',
                                              fillColor: Colors.white,
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 0.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 4.0, 12.0, 4.0),
                                              hidesUnderline: true,
                                              disabled: ((_model.getMyselfBranch
                                                              ?.statusCode ??
                                                          200) !=
                                                      200) &&
                                                  (GetlocationAPICall
                                                          .statusLayer2(
                                                        (_model.getMyselfBranch
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      200),
                                              isSearchable: true,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation2']!),
                                Divider(
                                  thickness: 1.0,
                                ),
                                if (_model.reportDropDownValue != null &&
                                    _model.reportDropDownValue != '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 12.0, 24.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              var _shouldSetState = false;
                                              if (_model.reportDropDownValue ==
                                                  'Hello World') {
                                                _model.getCollectionApiUrl =
                                                    await queryUrlLinkStorageRecordOnce(
                                                  queryBuilder:
                                                      (urlLinkStorageRecord) =>
                                                          urlLinkStorageRecord
                                                              .where(
                                                    'url_name',
                                                    isEqualTo:
                                                        'branch_view_collection',
                                                  ),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);
                                                _shouldSetState = true;
                                                FFAppState()
                                                        .isFromTimesheetPage =
                                                    false;
                                                FFAppState().update(() {});
                                                FFAppState().collectionSortBy =
                                                    '';
                                                FFAppState().collectionSearch =
                                                    '';
                                                FFAppState()
                                                    .collectionSearchBy = '';
                                                FFAppState().selectCardList =
                                                    [];
                                                FFAppState()
                                                    .collectionListBoolean = [];
                                                FFAppState().saveCalled =
                                                    SaveCallStruct
                                                        .fromSerializableMap(
                                                            jsonDecode(
                                                                '{\"CONTNO_ID\":\"[]\",\"CONTNO\":\"[]\",\"HISTORY_LEAD_STATUS\":\"[]\",\"HISTORY_REASON_NAME\":\"[]\",\"CREATED_USERID\":\"[]\",\"UPDATED_USERID\":\"[]\",\"ARAPPDATE\":\"[]\",\"ARDESC\":\"[]\",\"USERID\":\"[]\",\"REMGCODE\":\"[]\",\"REMDETCODE\":\"[]\",\"AMOUNT\":\"[]\"}'));
                                                setState(() {});
                                                FFAppState()
                                                        .apiUrlBranchViewCollection =
                                                    _model.getCollectionApiUrl!
                                                        .urlLink;
                                                setState(() {});

                                                context
                                                    .pushNamed('tabCollection');

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                              await actions.openTableauBrowser(
                                                '${FFAppState().accessToken}/${FFAppState().profileLevel == 'สาขา' ? FFAppState().profileBranch : _model.branchDropDownValue}',
                                                '${bsiReportPageUrlLinkStorageRecord?.urlLink}/${_model.reportDropDownValue}',
                                                FFAppState()
                                                    .isOpenAndroidTableauBrowser,
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                            },
                                            text: 'ดูรายงาน',
                                            options: FFButtonOptions(
                                              height: 45.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'rowOnPageLoadAnimation']!),
                                  ),
                              ]
                                  .addToStart(SizedBox(height: 12.0))
                                  .addToEnd(SizedBox(height: 12.0)),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
