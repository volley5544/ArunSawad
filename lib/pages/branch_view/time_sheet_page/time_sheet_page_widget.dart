import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'time_sheet_page_model.dart';
export 'time_sheet_page_model.dart';

class TimeSheetPageWidget extends StatefulWidget {
  const TimeSheetPageWidget({super.key});

  static String routeName = 'TimeSheetPage';
  static String routePath = 'timeSheetPage';

  @override
  State<TimeSheetPageWidget> createState() => _TimeSheetPageWidgetState();
}

class _TimeSheetPageWidgetState extends State<TimeSheetPageWidget> {
  late TimeSheetPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeSheetPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TimeSheetPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      );

      if (isAndroid) {
        await actions.allowScreenRecordAndroid();
      } else {
        await actions.allowScreenRecordIOS();
      }

      _model.checkLatLngBVTimeSheet = await actions.a8();
      if (!_model.checkLatLngBVTimeSheet!) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('กรุณาเปิดGPS ก่อนทำรายการ'),
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

        context.goNamed(DashboardWidget.routeName);

        return;
      }
      _model.getLocationOnPageLoad = await actions.getLocation();

      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'Branch_View_TimeSheet',
        actionTime: getCurrentTimestamp,
        userLocation: _model.getLocationOnPageLoad,
      ));
      _model.createdUserLogBVSurvey = UserLogRecord.getDocumentFromData(
          createUserLogRecordData(
            employeeId: FFAppState().employeeID,
            action: 'Branch_View_TimeSheet',
            actionTime: getCurrentTimestamp,
            userLocation: _model.getLocationOnPageLoad,
          ),
          userLogRecordReference);
      FFAppState().isFromTimesheetPage = true;
      FFAppState().update(() {});
      Navigator.pop(context);
    });

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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: PopScope(
          canPop: false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Color(0xFFFF6500),
              automaticallyImplyLeading: false,
              leading: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed(DashboardWidget.routeName);
                  },
                  child: Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
              ),
              title: Text(
                'Branch View',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.poppins(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 10.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 40.0,
                      child: custom_widgets.ShowDateTime(
                        width: double.infinity,
                        height: 40.0,
                        currentTime: getCurrentTimestamp,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: FutureBuilder<ApiCallResponse>(
                        future: (_model.apiRequestCompleter ??=
                                Completer<ApiCallResponse>()
                                  ..complete(GetTimesheetAPICall.call(
                                    token: FFAppState().accessToken,
                                    apiUrl: FFAppState().apiURLLocalState,
                                  )))
                            .future,
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
                          final listViewGetTimesheetAPIResponse =
                              snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final timesheetDataList =
                                  GetTimesheetAPICall.timesheetData(
                                listViewGetTimesheetAPIResponse.jsonBody,
                              ).toList();

                              return RefreshIndicator(
                                color: FlutterFlowTheme.of(context).tertiary,
                                onRefresh: () async {
                                  safeSetState(
                                      () => _model.apiRequestCompleter = null);
                                  await _model.waitForApiRequestCompleted();
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: timesheetDataList.length,
                                  itemBuilder:
                                      (context, timesheetDataListIndex) {
                                    final timesheetDataListItem =
                                        timesheetDataList[
                                            timesheetDataListIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var _shouldSetState = false;
                                        HapticFeedback.mediumImpact();
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor: Color(0x00000000),
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
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

                                        if (functions.showJobType(getJsonField(
                                              timesheetDataListItem,
                                              r'''$.Job_Type''',
                                            ).toString()) ==
                                            'เช็คอิน') {
                                          _model.checkInTimesheetDetail =
                                              await TimesheetDetailAPICall.call(
                                            token: FFAppState().accessToken,
                                            apiUrl:
                                                FFAppState().apiURLLocalState,
                                            pageName: 'check-in',
                                            recordId: getJsonField(
                                              timesheetDataListItem,
                                              r'''$.RecordId''',
                                            ).toString(),
                                          );

                                          _shouldSetState = true;

                                          context.pushNamed(
                                            CheckInPageWidget.routeName,
                                            queryParameters: {
                                              'recordId': serializeParam(
                                                TimesheetDetailAPICall.recordID(
                                                  (_model.checkInTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'coordinate': serializeParam(
                                                functions.showLocationTimesheet(
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Latitude''',
                                                    ),
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Longitude''',
                                                    ),
                                                    true),
                                                ParamType.String,
                                              ),
                                              'remark': serializeParam(
                                                TimesheetDetailAPICall.remark(
                                                  (_model.checkInTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'clockIn': serializeParam(
                                                functions
                                                    .showClockIn(getJsonField(
                                                  timesheetDataListItem,
                                                  r'''$.ClockIn''',
                                                ).toString()),
                                                ParamType.DateTime,
                                              ),
                                            }.withoutNulls,
                                          );

                                          Navigator.pop(context);
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (functions.showJobType(getJsonField(
                                              timesheetDataListItem,
                                              r'''$.Job_Type''',
                                            ).toString()) ==
                                            'สำรวจลูกค้า') {
                                          _model.surveyTimesheetDetail =
                                              await TimesheetDetailAPICall.call(
                                            token: FFAppState().accessToken,
                                            apiUrl:
                                                FFAppState().apiURLLocalState,
                                            pageName: 'survey',
                                            recordId: getJsonField(
                                              timesheetDataListItem,
                                              r'''$.RecordId''',
                                            ).toString(),
                                          );

                                          _shouldSetState = true;

                                          context.pushNamed(
                                            SurveyPageWidget.routeName,
                                            queryParameters: {
                                              'recordId': serializeParam(
                                                TimesheetDetailAPICall.recordID(
                                                  (_model.surveyTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'idCardNumber': serializeParam(
                                                TimesheetDetailAPICall
                                                    .citizenID(
                                                  (_model.surveyTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'coordinate': serializeParam(
                                                functions.showLocationTimesheet(
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Latitude''',
                                                    ),
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Longitude''',
                                                    ),
                                                    true),
                                                ParamType.String,
                                              ),
                                              'customerName': serializeParam(
                                                TimesheetDetailAPICall
                                                    .customerName(
                                                  (_model.surveyTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'landmark': serializeParam(
                                                TimesheetDetailAPICall.landmark(
                                                  (_model.surveyTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'remark': serializeParam(
                                                TimesheetDetailAPICall.remark(
                                                  (_model.surveyTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'description': serializeParam(
                                                TimesheetDetailAPICall
                                                    .description(
                                                  (_model.surveyTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'clockIn': serializeParam(
                                                functions
                                                    .showClockIn(getJsonField(
                                                  timesheetDataListItem,
                                                  r'''$.ClockIn''',
                                                ).toString()),
                                                ParamType.DateTime,
                                              ),
                                            }.withoutNulls,
                                          );

                                          Navigator.pop(context);
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (functions.showJobType(getJsonField(
                                              timesheetDataListItem,
                                              r'''$.Job_Type''',
                                            ).toString()) ==
                                            'ติดตามหนี้') {
                                          _model.collectionTimesheetDetail =
                                              await TimesheetDetailAPICall.call(
                                            token: FFAppState().accessToken,
                                            apiUrl:
                                                FFAppState().apiURLLocalState,
                                            pageName: 'collection',
                                            recordId: getJsonField(
                                              timesheetDataListItem,
                                              r'''$.RecordId''',
                                            ).toString(),
                                          );

                                          _shouldSetState = true;

                                          context.pushNamed(
                                            CollectionPageWidget.routeName,
                                            queryParameters: {
                                              'coordinate': serializeParam(
                                                functions.showLocationTimesheet(
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Latitude''',
                                                    ),
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Longitude''',
                                                    ),
                                                    true),
                                                ParamType.String,
                                              ),
                                              'idCardNumber': serializeParam(
                                                TimesheetDetailAPICall
                                                    .citizenID(
                                                  (_model.collectionTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'contNo': serializeParam(
                                                TimesheetDetailAPICall.contNo(
                                                  (_model.collectionTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'customerName': serializeParam(
                                                TimesheetDetailAPICall
                                                    .customerName(
                                                  (_model.collectionTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'remark': serializeParam(
                                                TimesheetDetailAPICall.remark(
                                                  (_model.collectionTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'recordId': serializeParam(
                                                TimesheetDetailAPICall.recordID(
                                                  (_model.collectionTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'clockIn': serializeParam(
                                                functions
                                                    .showClockIn(getJsonField(
                                                  timesheetDataListItem,
                                                  r'''$.ClockIn''',
                                                ).toString()),
                                                ParamType.DateTime,
                                              ),
                                            }.withoutNulls,
                                          );

                                          Navigator.pop(context);
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (functions.showJobType(getJsonField(
                                              timesheetDataListItem,
                                              r'''$.Job_Type''',
                                            ).toString()) ==
                                            'ทำการตลาด') {
                                          _model.marketingTimesheetDetail =
                                              await TimesheetDetailAPICall.call(
                                            token: FFAppState().accessToken,
                                            apiUrl:
                                                FFAppState().apiURLLocalState,
                                            pageName: 'marketing',
                                            recordId: getJsonField(
                                              timesheetDataListItem,
                                              r'''$.RecordId''',
                                            ).toString(),
                                          );

                                          _shouldSetState = true;

                                          context.pushNamed(
                                            MarketingPageWidget.routeName,
                                            queryParameters: {
                                              'coordinate': serializeParam(
                                                functions.showLocationTimesheet(
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Latitude''',
                                                    ),
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Longitude''',
                                                    ),
                                                    true),
                                                ParamType.String,
                                              ),
                                              'branchCode': serializeParam(
                                                TimesheetDetailAPICall
                                                    .marketingBranchCode(
                                                  (_model.marketingTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'area': serializeParam(
                                                TimesheetDetailAPICall
                                                    .marketingAreaDescription(
                                                  (_model.marketingTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'detail': serializeParam(
                                                TimesheetDetailAPICall
                                                    .marketingDetail(
                                                  (_model.marketingTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'remark': serializeParam(
                                                TimesheetDetailAPICall
                                                    .marketingRemark(
                                                  (_model.marketingTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'recordId': serializeParam(
                                                getJsonField(
                                                  timesheetDataListItem,
                                                  r'''$.RecordId''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                              'clockIn': serializeParam(
                                                functions
                                                    .showClockIn(getJsonField(
                                                  timesheetDataListItem,
                                                  r'''$.ClockIn''',
                                                ).toString()),
                                                ParamType.DateTime,
                                              ),
                                            }.withoutNulls,
                                          );

                                          Navigator.pop(context);
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (functions.showJobType(getJsonField(
                                              timesheetDataListItem,
                                              r'''$.Job_Type''',
                                            ).toString()) ==
                                            'สำรวจ NPA') {
                                          _model.surveyNPATimesheetDetail =
                                              await TimesheetDetailAPICall.call(
                                            token: FFAppState().accessToken,
                                            apiUrl:
                                                FFAppState().apiURLLocalState,
                                            pageName: 'survey-npa',
                                            recordId: getJsonField(
                                              timesheetDataListItem,
                                              r'''$.RecordId''',
                                            ).toString(),
                                          );

                                          _shouldSetState = true;

                                          context.pushNamed(
                                            NPApageWidget.routeName,
                                            queryParameters: {
                                              'recordId': serializeParam(
                                                TimesheetDetailAPICall.recordID(
                                                  (_model.surveyNPATimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'coordinate': serializeParam(
                                                functions.showLocationTimesheet(
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Latitude''',
                                                    ),
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Longitude''',
                                                    ),
                                                    true),
                                                ParamType.String,
                                              ),
                                              'assetId': serializeParam(
                                                TimesheetDetailAPICall.assetID(
                                                  (_model.surveyNPATimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'remark': serializeParam(
                                                TimesheetDetailAPICall.remark(
                                                  (_model.surveyNPATimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'clockIn': serializeParam(
                                                functions
                                                    .showClockIn(getJsonField(
                                                  timesheetDataListItem,
                                                  r'''$.ClockIn''',
                                                ).toString()),
                                                ParamType.DateTime,
                                              ),
                                            }.withoutNulls,
                                          );

                                          Navigator.pop(context);
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (functions.showJobType(getJsonField(
                                              timesheetDataListItem,
                                              r'''$.Job_Type''',
                                            ).toString()) ==
                                            'OPS') {
                                          context.pushNamed(
                                              OPSpageWidget.routeName);

                                          Navigator.pop(context);
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (functions.showJobType(getJsonField(
                                              timesheetDataListItem,
                                              r'''$.Job_Type''',
                                            ).toString()) ==
                                            'ฝ่ายตรวจสอบ') {
                                          _model.checkerTimesheetDetail =
                                              await TimesheetDetailAPICall.call(
                                            token: FFAppState().accessToken,
                                            apiUrl:
                                                FFAppState().apiURLLocalState,
                                            pageName: 'checker',
                                            recordId: getJsonField(
                                              timesheetDataListItem,
                                              r'''$.RecordId''',
                                            ).toString(),
                                          );

                                          _shouldSetState = true;

                                          context.pushNamed(
                                            CheckerPageWidget.routeName,
                                            queryParameters: {
                                              'recordId': serializeParam(
                                                TimesheetDetailAPICall.recordID(
                                                  (_model.checkerTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'coordinate': serializeParam(
                                                functions.showLocationTimesheet(
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Latitude''',
                                                    ),
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Longitude''',
                                                    ),
                                                    true),
                                                ParamType.String,
                                              ),
                                              'idCardNumber': serializeParam(
                                                TimesheetDetailAPICall
                                                    .citizenID(
                                                  (_model.checkerTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'contNo': serializeParam(
                                                TimesheetDetailAPICall.contNo(
                                                  (_model.checkerTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'customerName': serializeParam(
                                                TimesheetDetailAPICall
                                                    .customerName(
                                                  (_model.checkerTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'remark': serializeParam(
                                                TimesheetDetailAPICall.remark(
                                                  (_model.checkerTimesheetDetail
                                                          ?.jsonBody ??
                                                      ''),
                                                ),
                                                ParamType.String,
                                              ),
                                              'clockIn': serializeParam(
                                                functions
                                                    .showClockIn(getJsonField(
                                                  timesheetDataListItem,
                                                  r'''$.ClockIn''',
                                                ).toString()),
                                                ParamType.DateTime,
                                              ),
                                            }.withoutNulls,
                                          );

                                          Navigator.pop(context);
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if ('${getJsonField(
                                              timesheetDataListItem,
                                              r'''$.Job_Type''',
                                            ).toString()}' ==
                                            'Law Led') {
                                          _model.typeDTimesheetDetail =
                                              await TimesheetDetailAPICall.call(
                                            token: FFAppState().accessToken,
                                            apiUrl:
                                                FFAppState().apiURLLocalState,
                                            pageName: 'law-led',
                                            recordId: getJsonField(
                                              timesheetDataListItem,
                                              r'''$.RecordId''',
                                            ).toString(),
                                          );

                                          _shouldSetState = true;
                                          if ((_model.typeDTimesheetDetail
                                                      ?.statusCode ??
                                                  200) !=
                                              200) {
                                            Navigator.pop(context);
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'พบข้อผิดพลาดConnection (${(_model.typeDTimesheetDetail?.statusCode ?? 200).toString()})'),
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
                                          if ('${getJsonField(
                                                (_model.typeDTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.code''',
                                              ).toString()}' !=
                                              '200') {
                                            Navigator.pop(context);
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content:
                                                        Text('${'${getJsonField(
                                                      (_model.typeDTimesheetDetail
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.message''',
                                                    ).toString()}'}'),
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

                                          context.pushNamed(
                                            RemarkTypeDPageWidget.routeName,
                                            queryParameters: {
                                              'recordId': serializeParam(
                                                '${getJsonField(
                                                  TimesheetDetailAPICall
                                                      .lawLedDataJson(
                                                    (_model.typeDTimesheetDetail
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  r'''$.RecordId''',
                                                ).toString()}',
                                                ParamType.String,
                                              ),
                                              'coordinate': serializeParam(
                                                functions.showLocationTimesheet(
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Latitude''',
                                                    ),
                                                    getJsonField(
                                                      timesheetDataListItem,
                                                      r'''$.Longitude''',
                                                    ),
                                                    true),
                                                ParamType.String,
                                              ),
                                              'remark': serializeParam(
                                                '${getJsonField(
                                                  TimesheetDetailAPICall
                                                      .lawLedDataJson(
                                                    (_model.typeDTimesheetDetail
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  r'''$.remark''',
                                                ).toString()}',
                                                ParamType.String,
                                              ),
                                              'clockIn': serializeParam(
                                                functions
                                                    .showClockIn(getJsonField(
                                                  timesheetDataListItem,
                                                  r'''$.ClockIn''',
                                                ).toString()),
                                                ParamType.DateTime,
                                              ),
                                              'contNo': serializeParam(
                                                '${getJsonField(
                                                  TimesheetDetailAPICall
                                                      .lawLedDataJson(
                                                    (_model.typeDTimesheetDetail
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  r'''$.contract_no''',
                                                ).toString()}',
                                                ParamType.String,
                                              ),
                                              'remarkTypeDName': serializeParam(
                                                '[${getJsonField(
                                                  TimesheetDetailAPICall
                                                      .lawLedDataJson(
                                                    (_model.typeDTimesheetDetail
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  r'''$.remark_code''',
                                                ).toString()}]${getJsonField(
                                                  TimesheetDetailAPICall
                                                      .lawLedDataJson(
                                                    (_model.typeDTimesheetDetail
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  r'''$.remark_name''',
                                                ).toString()}',
                                                ParamType.String,
                                              ),
                                              'cusName': serializeParam(
                                                '${'${getJsonField(
                                                  TimesheetDetailAPICall
                                                      .lawLedDataJson(
                                                    (_model.typeDTimesheetDetail
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  r'''$.firstname''',
                                                ).toString()}'} ${'${getJsonField(
                                                  TimesheetDetailAPICall
                                                      .lawLedDataJson(
                                                    (_model.typeDTimesheetDetail
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  r'''$.lastname''',
                                                ).toString()}'}',
                                                ParamType.String,
                                              ),
                                              'filesCount': serializeParam(
                                                functions.countFilesUploaded(
                                                    ((String image1,
                                                                String image2,
                                                                String image3,
                                                                String image4,
                                                                String image5,
                                                                String image6,
                                                                String image7,
                                                                String image8,
                                                                String image9,
                                                                String
                                                                    image10) {
                                                  return [
                                                    image1,
                                                    image2,
                                                    image3,
                                                    image4,
                                                    image5,
                                                    image6,
                                                    image7,
                                                    image8,
                                                    image9,
                                                    image10
                                                  ];
                                                }(
                                                            '${getJsonField(
                                                              TimesheetDetailAPICall
                                                                  .lawLedDataJson(
                                                                (_model.typeDTimesheetDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              r'''$.images_01''',
                                                            ).toString()}',
                                                            '${getJsonField(
                                                              TimesheetDetailAPICall
                                                                  .lawLedDataJson(
                                                                (_model.typeDTimesheetDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              r'''$.images_02''',
                                                            ).toString()}',
                                                            '${getJsonField(
                                                              TimesheetDetailAPICall
                                                                  .lawLedDataJson(
                                                                (_model.typeDTimesheetDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              r'''$.images_03''',
                                                            ).toString()}',
                                                            '${getJsonField(
                                                              TimesheetDetailAPICall
                                                                  .lawLedDataJson(
                                                                (_model.typeDTimesheetDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              r'''$.images_04''',
                                                            ).toString()}',
                                                            '${getJsonField(
                                                              TimesheetDetailAPICall
                                                                  .lawLedDataJson(
                                                                (_model.typeDTimesheetDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              r'''$.images_05''',
                                                            ).toString()}',
                                                            '${getJsonField(
                                                              TimesheetDetailAPICall
                                                                  .lawLedDataJson(
                                                                (_model.typeDTimesheetDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              r'''$.images_06''',
                                                            ).toString()}',
                                                            '${getJsonField(
                                                              TimesheetDetailAPICall
                                                                  .lawLedDataJson(
                                                                (_model.typeDTimesheetDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              r'''$.images_07''',
                                                            ).toString()}',
                                                            '${getJsonField(
                                                              TimesheetDetailAPICall
                                                                  .lawLedDataJson(
                                                                (_model.typeDTimesheetDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              r'''$.images_08''',
                                                            ).toString()}',
                                                            '${getJsonField(
                                                              TimesheetDetailAPICall
                                                                  .lawLedDataJson(
                                                                (_model.typeDTimesheetDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              r'''$.images_09''',
                                                            ).toString()}',
                                                            '${getJsonField(
                                                              TimesheetDetailAPICall
                                                                  .lawLedDataJson(
                                                                (_model.typeDTimesheetDetail
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              r'''$.images_10''',
                                                            ).toString()}'))
                                                        .toList()),
                                                ParamType.int,
                                              ),
                                            }.withoutNulls,
                                          );

                                          Navigator.pop(context);
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        Navigator.pop(context);
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: Text('ระบบ'),
                                                content:
                                                    Text('ไม่มีหน้าที่ตามหา'),
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
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          border: Border.all(
                                            color: Color(0x33000000),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    flex: 5,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          functions.showJobType(
                                                              getJsonField(
                                                            timesheetDataListItem,
                                                            r'''$.Job_Type''',
                                                          ).toString()),
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
                                                                color: Color(
                                                                    0xFFFF6500),
                                                                fontSize: 20.0,
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
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                          "Hm",
                                                          functions.showClockIn(
                                                              getJsonField(
                                                            timesheetDataListItem,
                                                            r'''$.ClockIn''',
                                                          ).toString()),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .grayIcon,
                                                                  fontSize:
                                                                      14.0,
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
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    20.0,
                                                                    0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .angleRight,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 1.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        functions.showLocationTimesheet(
                                                            (String latitude) {
                                                              return double.parse(
                                                                  '${latitude}');
                                                            }('${getJsonField(
                                                              timesheetDataListItem,
                                                              r'''$.Latitude''',
                                                            ).toString()}'),
                                                            (String longitude) {
                                                              return double.parse(
                                                                  '${longitude}');
                                                            }('${getJsonField(
                                                              timesheetDataListItem,
                                                              r'''$.Longitude''',
                                                            ).toString()}'),
                                                            false),
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
                                                                  fontSize:
                                                                      14.0,
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
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
