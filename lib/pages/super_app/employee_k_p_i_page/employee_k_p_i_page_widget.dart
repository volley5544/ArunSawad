import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/p_d_f_viewer/p_d_f_viewer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'employee_k_p_i_page_model.dart';
export 'employee_k_p_i_page_model.dart';

class EmployeeKPIPageWidget extends StatefulWidget {
  const EmployeeKPIPageWidget({
    super.key,
    this.annoucementUrl,
  });

  final String? annoucementUrl;

  static String routeName = 'EmployeeKPIPage';
  static String routePath = 'employeeKPIPage';

  @override
  State<EmployeeKPIPageWidget> createState() => _EmployeeKPIPageWidgetState();
}

class _EmployeeKPIPageWidgetState extends State<EmployeeKPIPageWidget>
    with TickerProviderStateMixin {
  late EmployeeKPIPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmployeeKPIPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EmployeeKPIPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x00000000),
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
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

      if (isAndroid) {
        await actions.allowScreenRecordAndroid();
      } else {
        await actions.allowScreenRecordIOS();
      }

      var userLogRecordReference1 = UserLogRecord.collection.doc();
      await userLogRecordReference1.set(createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'KPI',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      ));
      _model.createdUserLogKPI = UserLogRecord.getDocumentFromData(
          createUserLogRecordData(
            employeeId: FFAppState().employeeID,
            action: 'KPI',
            actionTime: getCurrentTimestamp,
            userLocation: currentUserLocationValue,
          ),
          userLogRecordReference1);
      _model.getTargetContractKPI = await GetTargetContractKPIAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );

      if ((_model.getTargetContractKPI?.statusCode ?? 200) != 200) {
        if ((GetTargetContractKPIAPICall.messageLayer1(
                  (_model.getTargetContractKPI?.jsonBody ?? ''),
                ) ==
                'The token has been blacklisted') ||
            (GetTargetContractKPIAPICall.messageLayer1(
                  (_model.getTargetContractKPI?.jsonBody ?? ''),
                ) ==
                'Token Signature could not be verified.')) {
          var userLogRecordReference2 = UserLogRecord.collection.doc();
          await userLogRecordReference2.set(createUserLogRecordData(
            employeeId: FFAppState().employeeID,
            action: 'Logout',
            actionTime: getCurrentTimestamp,
            userLocation: currentUserLocationValue,
          ));
          _model.createdUserLogLogout543 = UserLogRecord.getDocumentFromData(
              createUserLogRecordData(
                employeeId: FFAppState().employeeID,
                action: 'Logout',
                actionTime: getCurrentTimestamp,
                userLocation: currentUserLocationValue,
              ),
              userLogRecordReference2);
          FFAppState().loginStateFirebase = '[loginStateFirebase]';
          FFAppState().deleteAccessToken();
          FFAppState().accessToken = 'access_token';

          FFAppState().update(() {});
          FFAppState().deleteEmployeeID();
          FFAppState().employeeID = 'employee_id';

          FFAppState().QRCodeLink = 'qrcode_link';
          FFAppState().update(() {});
          FFAppState().deleteApiURLLocalState();
          FFAppState().apiURLLocalState = 'api_url_local_state';

          FFAppState().deleteBranchCode();
          FFAppState().branchCode = 'branch_code';

          FFAppState().update(() {});
          FFAppState().isFromSetPinPage = false;
          FFAppState().leadChannelColor = [];
          FFAppState().update(() {});
          FFAppState().leadChannelList = [];
          FFAppState().isFromLoginPage = false;
          FFAppState().update(() {});
          FFAppState().deletePinCodeAuthen();
          FFAppState().pinCodeAuthen = '013972';

          FFAppState().isFromAuthenPage = false;
          FFAppState().update(() {});
          FFAppState().deleteDateDoNotShowAgain();
          FFAppState().dateDoNotShowAgain = null;

          FFAppState().deleteDoNotShowAgain();
          FFAppState().doNotShowAgain = false;

          FFAppState().update(() {});
          FFAppState().inAppViaNotification = true;
          FFAppState().isInApp = false;
          FFAppState().update(() {});
          FFAppState().fcmToken = 'fcm_token';
          FFAppState().isPassLoginSection = false;
          FFAppState().update(() {});
          FFAppState().leadID = [];
          FFAppState().leadCreatedTimeList = [];
          FFAppState().update(() {});
          FFAppState().leadCustomerNameList = [];
          FFAppState().leadChannelList = [];
          FFAppState().update(() {});
          FFAppState().leadChannelColor = [];
          FFAppState().leadCallStatus = [];
          FFAppState().update(() {});
          FFAppState().leadPhoneNumberList = [];
          FFAppState().leadEmployeeID = [];
          FFAppState().update(() {});
          FFAppState().leadChannelLabelColor = [];
          FFAppState().deleteLeadIdCalledInApp();
          FFAppState().leadIdCalledInApp = [];

          FFAppState().update(() {});
          FFAppState().leadBranchCode = [];
          FFAppState().leadUserLevel = 'lead_user_level';
          FFAppState().update(() {});
          FFAppState().leadChannelAmountList = [];
          FFAppState().update(() {});
          Navigator.pop(context);
          await actions.a22();

          context.goNamed(LoginPageWidget.routeName);

          return;
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(GetTargetContractKPIAPICall.messageLayer1(
                    (_model.getTargetContractKPI?.jsonBody ?? ''),
                  )!),
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
      if (GetTargetContractKPIAPICall.statusLayer2(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) !=
          200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดLayer2 (${GetTargetContractKPIAPICall.statusLayer2(
                  (_model.getTargetContractKPI?.jsonBody ?? ''),
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
      if (GetTargetContractKPIAPICall.statusLayer3TM(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) ==
          200) {
        FFAppState().kpiProductType = GetTargetContractKPIAPICall.productType(
          (_model.getTargetContractKPI?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().kpiTargetQuantity =
            GetTargetContractKPIAPICall.targetQuantity(
          (_model.getTargetContractKPI?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().update(() {});
        FFAppState().kpiActual = GetTargetContractKPIAPICall.actual(
          (_model.getTargetContractKPI?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().kpiYearMonth = GetTargetContractKPIAPICall.month(
          (_model.getTargetContractKPI?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().update(() {});
        FFAppState().kpiEmployeePosition = GetTargetContractKPIAPICall.position(
          (_model.getTargetContractKPI?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().update(() {});
        FFAppState().areaResponsKPI = functions.showMatNameInList(
            GetTargetContractKPIAPICall.areaRespons(
              (_model.getTargetContractKPI?.jsonBody ?? ''),
            )?.toList(),
            0)!;
        FFAppState().update(() {});
      } else {
        if (GetTargetContractKPIAPICall.statusLayer3TM(
              (_model.getTargetContractKPI?.jsonBody ?? ''),
            ) !=
            404) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาดContract Current Month (${GetTargetContractKPIAPICall.statusLayer3TM(
                    (_model.getTargetContractKPI?.jsonBody ?? ''),
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
        }
      }

      if (GetTargetContractKPIAPICall.statusLayer3LM(
            (_model.getTargetContractKPI?.jsonBody ?? ''),
          ) ==
          200) {
        FFAppState().kpiProductTypeLM =
            GetTargetContractKPIAPICall.productTypeLM(
          (_model.getTargetContractKPI?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().kpiEmployeePositionLM =
            GetTargetContractKPIAPICall.positionLM(
          (_model.getTargetContractKPI?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().kpiActualLM = GetTargetContractKPIAPICall.actualLM(
          (_model.getTargetContractKPI?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().kpiTargetQuantityLM =
            GetTargetContractKPIAPICall.targetQuantityLM(
          (_model.getTargetContractKPI?.jsonBody ?? ''),
        )!
                .toList()
                .cast<String>();
        FFAppState().kpiYearMonthLM = GetTargetContractKPIAPICall.monthLM(
          (_model.getTargetContractKPI?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().kpiAreaResponsLM = functions.showMatNameInList(
            GetTargetContractKPIAPICall.areaResponsLM(
              (_model.getTargetContractKPI?.jsonBody ?? ''),
            )?.toList(),
            0)!;
        FFAppState().update(() {});
      } else {
        if (GetTargetContractKPIAPICall.statusLayer3LM(
              (_model.getTargetContractKPI?.jsonBody ?? ''),
            ) !=
            404) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาดContract Last Month (${GetTargetContractKPIAPICall.statusLayer3LM(
                    (_model.getTargetContractKPI?.jsonBody ?? ''),
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
        }
      }

      _model.getTargetBudget = await GetTargetBudgetKPIAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );

      if ((_model.getTargetBudget?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดBudget (${(_model.getTargetBudget?.statusCode ?? 200).toString()})'),
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
      if (GetTargetBudgetKPIAPICall.statusLayer2(
            (_model.getTargetBudget?.jsonBody ?? ''),
          ) !=
          200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดLayer2 (${GetTargetBudgetKPIAPICall.statusLayer2(
                  (_model.getTargetBudget?.jsonBody ?? ''),
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
      if (GetTargetBudgetKPIAPICall.statusLayer3TM(
            (_model.getTargetBudget?.jsonBody ?? ''),
          ) ==
          200) {
        FFAppState().kpiTargetBudget = valueOrDefault<String>(
          GetTargetBudgetKPIAPICall.targetBudget(
            (_model.getTargetBudget?.jsonBody ?? ''),
          ),
          '100.0',
        );
        FFAppState().kpiActualBudget = valueOrDefault<String>(
          GetTargetBudgetKPIAPICall.actual(
            (_model.getTargetBudget?.jsonBody ?? ''),
          ),
          '0.0',
        );
        FFAppState().update(() {});
        FFAppState().areaResponsKPI = valueOrDefault<String>(
          GetTargetBudgetKPIAPICall.areaRespons(
            (_model.getTargetBudget?.jsonBody ?? ''),
          ),
          '[area]',
        );
        FFAppState().update(() {});
      } else {
        if (GetTargetBudgetKPIAPICall.statusLayer3TM(
              (_model.getTargetBudget?.jsonBody ?? ''),
            ) !=
            404) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาดBudget Current Month (${GetTargetBudgetKPIAPICall.statusLayer3TM(
                    (_model.getTargetBudget?.jsonBody ?? ''),
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
        }
      }

      if (GetTargetBudgetKPIAPICall.statusLayer3LM(
            (_model.getTargetBudget?.jsonBody ?? ''),
          ) ==
          200) {
        FFAppState().kpiTargetBudgetLM =
            GetTargetBudgetKPIAPICall.targetBudgetLM(
          (_model.getTargetBudget?.jsonBody ?? ''),
        )!;
        FFAppState().kpiActualBudgetLM =
            GetTargetBudgetKPIAPICall.actualBudgetLM(
          (_model.getTargetBudget?.jsonBody ?? ''),
        )!;
        FFAppState().kpiAreaResponsLM = GetTargetBudgetKPIAPICall.areaResponsLM(
          (_model.getTargetBudget?.jsonBody ?? ''),
        )!;
        FFAppState().update(() {});
      } else {
        if (GetTargetBudgetKPIAPICall.statusLayer3LM(
              (_model.getTargetBudget?.jsonBody ?? ''),
            ) !=
            404) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาดBudget Last Month (${GetTargetBudgetKPIAPICall.statusLayer3LM(
                    (_model.getTargetBudget?.jsonBody ?? ''),
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
        }
      }

      _model.getServerDateTime = await GetDateTimeAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );

      Navigator.pop(context);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
                  context.goNamed(SuperAppPageWidget.routeName);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFBFFFFFF),
                  size: 30.0,
                ),
              ),
            ),
            title: Text(
              'PIP และเกรดโบนัส',
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
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'ดูรายงาน : ',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.tableauBaseUrlQueryPip =
                                    await queryUrlLinkStorageRecordOnce(
                                  queryBuilder: (urlLinkStorageRecord) =>
                                      urlLinkStorageRecord.where(
                                    'url_name',
                                    isEqualTo: 'tableau_report_base_url',
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                _model.reportStoragePIPKPIQueryPip =
                                    await queryReportStorageRecordOnce(
                                  queryBuilder: (reportStorageRecord) =>
                                      reportStorageRecord.where(
                                    'report_name',
                                    isEqualTo: 'PIP/KPI',
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                await actions.openTableauBrowser(
                                  FFAppState().accessToken,
                                  '${_model.tableauBaseUrlQueryPip?.urlLink}${_model.reportStoragePIPKPIQueryPip?.reportUrl?.elementAtOrNull(functions.getIndexOfSomethingList(_model.reportStoragePIPKPIQueryPip?.reportUrlName?.toList(), 'pip'))}',
                                  FFAppState().isOpenAndroidTableauBrowser,
                                );

                                safeSetState(() {});
                              },
                              text: 'PIP',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFFFC000),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.tableauBaseUrlQueryKpi =
                                    await queryUrlLinkStorageRecordOnce(
                                  queryBuilder: (urlLinkStorageRecord) =>
                                      urlLinkStorageRecord.where(
                                    'url_name',
                                    isEqualTo: 'tableau_report_base_url',
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                _model.reportStoragePIPKPIQueryKpi =
                                    await queryReportStorageRecordOnce(
                                  queryBuilder: (reportStorageRecord) =>
                                      reportStorageRecord.where(
                                    'report_name',
                                    isEqualTo: 'PIP/KPI',
                                  ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                await actions.openTableauBrowser(
                                  FFAppState().accessToken,
                                  '${_model.tableauBaseUrlQueryKpi?.urlLink}${_model.reportStoragePIPKPIQueryKpi?.reportUrl?.elementAtOrNull(functions.getIndexOfSomethingList(_model.reportStoragePIPKPIQueryKpi?.reportUrlName?.toList(), 'kpi'))}',
                                  FFAppState().isOpenAndroidTableauBrowser,
                                );

                                safeSetState(() {});
                              },
                              text: 'เกรดโบนัส',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF23CA69),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            labelColor: FlutterFlowTheme.of(context).primary,
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                            unselectedLabelStyle: TextStyle(),
                            indicatorColor:
                                FlutterFlowTheme.of(context).secondary,
                            tabs: [
                              Tab(
                                text: 'เดือนปัจจุบัน',
                              ),
                              Tab(
                                text: 'เดือนที่แล้ว',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 4.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              functions
                                                  .showMonthYearWelfareKpiPage(
                                                      GetDateTimeAPICall
                                                          .currentDateYMD(
                                                (_model.getServerDateTime
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString()),
                                              '[Month_Year]',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            '[${GetDateTimeAPICall.currentDate(
                                              (_model.getServerDateTime
                                                      ?.jsonBody ??
                                                  ''),
                                            )}]',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (((_model.getTargetBudget?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall.statusLayer2(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall
                                                .statusLayer3TM(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Container(
                                        width: double.infinity,
                                        height: 300.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: custom_widgets.RadialGauge(
                                            width: double.infinity,
                                            height: double.infinity,
                                            maxValue:
                                                FFAppState().kpiTargetBudget,
                                            value: FFAppState().kpiActualBudget,
                                            labelOffset: 15.0,
                                            axisLabelSize: 10.0,
                                            totalValueLabelSize: 18.0,
                                            valueUnitLabelSize: 14.0,
                                            valueUnitLabelText: 'จำนวนเงิน',
                                            totalValueUnitLabelText: 'บาท',
                                            endValue1: 0.5,
                                            startValue2: 0.5,
                                            endValue2: 0.8,
                                            startValue3: 0.8,
                                            color1: Color(0xFFEE4F22),
                                            color2: Color(0xFFEEC122),
                                            color3: Color(0xFF7BC722),
                                            startWidth1: 0.265,
                                            endWidth1: 0.265,
                                            startWidth2: 0.265,
                                            endWidth2: 0.265,
                                            startWidth3: 0.265,
                                            endWidth3: 0.265,
                                            isShowTick: true,
                                            startWidth4: 0.265,
                                            endWidth4: 0.265,
                                            startWidth5: 0.265,
                                            endWidth5: 0.265,
                                            color4: Colors.black,
                                            color5: Colors.black,
                                            startValue4: 1.0,
                                            endValue4: 1.0,
                                            startValue5: 1.0,
                                            endValue5: 1.0,
                                            endValue3: 1.0,
                                          ),
                                        ),
                                      ),
                                    if (((_model.getTargetBudget?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall.statusLayer2(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall
                                                .statusLayer3TM(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Text(
                                                'รหัสพนักงาน : ${GetTargetBudgetKPIAPICall.employeeID(
                                                  (_model.getTargetBudget
                                                          ?.jsonBody ??
                                                      ''),
                                                )}${GetTargetBudgetKPIAPICall.branchCodeTM(
                                                      (_model.getTargetBudget
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) == '-' ? '' : '(${GetTargetBudgetKPIAPICall.branchCodeTM(
                                                    (_model.getTargetBudget
                                                            ?.jsonBody ??
                                                        ''),
                                                  )})'}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (((_model.getTargetBudget?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall.statusLayer2(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall
                                                .statusLayer3TM(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              GetTargetBudgetKPIAPICall
                                                  .ageOfPositionTM(
                                                (_model.getTargetBudget
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (((_model.getTargetBudget?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall.statusLayer2(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall
                                                .statusLayer3TM(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                'พื้นที่ : ${GetTargetBudgetKPIAPICall.areaTypeTM(
                                                  (_model.getTargetBudget
                                                          ?.jsonBody ??
                                                      ''),
                                                )}',
                                                'พื้นที่ : ...',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (((_model.getTargetBudget?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall.statusLayer2(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall
                                                .statusLayer3TM(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                'เกรดพื้นที่ (เป้ารายบุคคล) : ${GetTargetBudgetKPIAPICall.areaGradeTM(
                                                  (_model.getTargetBudget
                                                          ?.jsonBody ??
                                                      ''),
                                                )}',
                                                'เกรดพื้นที่ (เป้ารายบุคคล) : ...',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor: Colors.black,
                                                  barrierColor:
                                                      Color(0x00000000),
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.7,
                                                            child:
                                                                PDFViewerWidget(
                                                              pdfUrl: widget!
                                                                  .annoucementUrl,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              text: 'ดูประกาศ',
                                              options: FFButtonOptions(
                                                width: 85.0,
                                                height: 28.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFFFF0000),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (((_model.getTargetBudget?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall.statusLayer2(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall
                                                .statusLayer3TM(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    'ทำได้',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  FFAppState().kpiActualBudget,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    'เป้า',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  FFAppState().kpiTargetBudget,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    'สถานะ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  functions.checkMeanBudgetKPI(
                                                      functions
                                                          .removeCommaFromNumText(
                                                              FFAppState()
                                                                  .kpiActualBudget),
                                                      functions
                                                          .removeCommaFromNumText(
                                                              FFAppState()
                                                                  .kpiTargetBudget)),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    Divider(
                                      thickness: 1.0,
                                      color: Color(0x8095A1AC),
                                    ),
                                    if (((_model.getTargetContractKPI
                                                    ?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetContractKPIAPICall
                                                .statusLayer2(
                                              (_model.getTargetContractKPI
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetContractKPIAPICall
                                                .statusLayer3TM(
                                              (_model.getTargetContractKPI
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.9,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final kpiProductList = FFAppState()
                                                .kpiProductType
                                                .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  kpiProductList.length,
                                                  (kpiProductListIndex) {
                                                final kpiProductListItem =
                                                    kpiProductList[
                                                        kpiProductListIndex];
                                                return Container(
                                                  width: double.infinity,
                                                  height: 200.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        height: 80.0,
                                                        child: custom_widgets
                                                            .LinearGauge(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          height: 80.0,
                                                          maxValue: functions
                                                              .getDoubleFromStringList(
                                                                  FFAppState()
                                                                      .kpiTargetQuantity
                                                                      .toList(),
                                                                  kpiProductListIndex),
                                                          value: functions
                                                              .getDoubleFromStringList(
                                                                  FFAppState()
                                                                      .kpiActual
                                                                      .toList(),
                                                                  kpiProductListIndex),
                                                          interval: 1.0,
                                                          trackThickness: 24.0,
                                                          rangeColor: functions
                                                              .getLinearGaugeColor(
                                                                  FFAppState()
                                                                      .kpiGaugeColorListMain
                                                                      .toList(),
                                                                  kpiProductListIndex),
                                                          gaugeAnimationMillisec:
                                                              2000,
                                                          markerAnimationMillisec:
                                                              1500,
                                                          widgetPointerWidth:
                                                              40.0,
                                                          widgetPointerHeight:
                                                              40.0,
                                                          widgetPointerColor: functions
                                                              .getLinearGaugeColor(
                                                                  FFAppState()
                                                                      .kpiGaugeColorListMain
                                                                      .toList(),
                                                                  kpiProductListIndex),
                                                          widgetPointerShadowColor:
                                                              valueOrDefault<
                                                                  Color>(
                                                            functions.getLinearGaugeColor(
                                                                FFAppState()
                                                                    .kpiGaugeColorList2
                                                                    .toList(),
                                                                kpiProductListIndex),
                                                            Color(0xFF93FF41),
                                                          ),
                                                          widgetPointerTextColor:
                                                              Colors.white,
                                                          widgetPointerText: functions
                                                              .showMatNameInList(
                                                                  FFAppState()
                                                                      .kpiProductType
                                                                      .toList(),
                                                                  kpiProductListIndex),
                                                          isHorizontal: true,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    'ทำได้',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  functions.stringDoubleToStringInt(
                                                                      valueOrDefault<
                                                                          String>(
                                                                    functions.showMatNameInList(
                                                                        FFAppState()
                                                                            .kpiActual
                                                                            .toList(),
                                                                        kpiProductListIndex),
                                                                    '[actual]',
                                                                  )),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    'เป้า',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  functions.stringDoubleToStringInt(
                                                                      valueOrDefault<
                                                                          String>(
                                                                    functions.showMatNameInList(
                                                                        FFAppState()
                                                                            .kpiTargetQuantity
                                                                            .toList(),
                                                                        kpiProductListIndex),
                                                                    '[target_quantity]',
                                                                  )),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    'สถานะ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  functions.checkMeanBudgetKPI(
                                                                      functions.showMatNameInList(
                                                                          FFAppState()
                                                                              .kpiActual
                                                                              .toList(),
                                                                          kpiProductListIndex),
                                                                      functions.showMatNameInList(
                                                                          FFAppState()
                                                                              .kpiTargetQuantity
                                                                              .toList(),
                                                                          kpiProductListIndex)),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 1.0,
                                                        color:
                                                            Color(0x8095A1AC),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 4.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              functions
                                                  .getWelfareKpiDateLastMonth(
                                                      GetDateTimeAPICall
                                                          .currentDateYMD(
                                                (_model.getServerDateTime
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString()),
                                              '[MMYY_Last_Month]',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Text(
                                            '[${GetDateTimeAPICall.currentDate(
                                              (_model.getServerDateTime
                                                      ?.jsonBody ??
                                                  ''),
                                            )}]',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (((_model.getTargetBudget?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall.statusLayer2(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall
                                                .statusLayer3LM(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Container(
                                        width: double.infinity,
                                        height: 300.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: custom_widgets.RadialGauge(
                                            width: double.infinity,
                                            height: double.infinity,
                                            maxValue:
                                                FFAppState().kpiTargetBudgetLM,
                                            value:
                                                FFAppState().kpiActualBudgetLM,
                                            labelOffset: 15.0,
                                            axisLabelSize: 10.0,
                                            totalValueLabelSize: 18.0,
                                            valueUnitLabelSize: 14.0,
                                            valueUnitLabelText: 'จำนวนเงิน',
                                            totalValueUnitLabelText: 'บาท',
                                            endValue1: 0.5,
                                            startValue2: 0.5,
                                            endValue2: 0.8,
                                            startValue3: 0.8,
                                            color1: Color(0xFFEE4F22),
                                            color2: Color(0xFFEEC122),
                                            color3: Color(0xFF7BC722),
                                            startWidth1: 0.265,
                                            endWidth1: 0.265,
                                            startWidth2: 0.265,
                                            endWidth2: 0.265,
                                            startWidth3: 0.265,
                                            endWidth3: 0.265,
                                            isShowTick: true,
                                            startWidth4: 0.265,
                                            endWidth4: 0.265,
                                            startWidth5: 0.265,
                                            endWidth5: 0.265,
                                            color4: FlutterFlowTheme.of(context)
                                                .black600,
                                            color5: FlutterFlowTheme.of(context)
                                                .black600,
                                            startValue4: 1.0,
                                            endValue4: 1.0,
                                            startValue5: 1.0,
                                            endValue5: 1.0,
                                            endValue3: 1.0,
                                          ),
                                        ),
                                      ),
                                    if (((_model.getTargetBudget?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall.statusLayer2(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall
                                                .statusLayer3LM(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Text(
                                                'รหัสพนักงาน : ${GetTargetBudgetKPIAPICall.employeeIDLM(
                                                  (_model.getTargetBudget
                                                          ?.jsonBody ??
                                                      ''),
                                                )}${GetTargetBudgetKPIAPICall.branchCodeLM(
                                                      (_model.getTargetBudget
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) == '-' ? '' : '(${GetTargetBudgetKPIAPICall.branchCodeLM(
                                                    (_model.getTargetBudget
                                                            ?.jsonBody ??
                                                        ''),
                                                  )})'}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (((_model.getTargetBudget?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall.statusLayer2(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall
                                                .statusLayer3LM(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              GetTargetBudgetKPIAPICall
                                                  .ageOfPositionLM(
                                                (_model.getTargetBudget
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (((_model.getTargetBudget?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall.statusLayer2(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall
                                                .statusLayer3LM(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                'พื้นที่ : ${GetTargetBudgetKPIAPICall.areaTypeLM(
                                                  (_model.getTargetBudget
                                                          ?.jsonBody ??
                                                      ''),
                                                )}',
                                                'พื้นที่ : ...',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (((_model.getTargetBudget?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall.statusLayer2(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall
                                                .statusLayer3LM(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                'เกรดพื้นที่ (เป้ารายบุคคล) : ${GetTargetBudgetKPIAPICall.areaGradeLM(
                                                  (_model.getTargetBudget
                                                          ?.jsonBody ??
                                                      ''),
                                                )}',
                                                'เกรดพื้นที่ (เป้ารายบุคคล) : ...',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor: Colors.black,
                                                  barrierColor:
                                                      Color(0x00000000),
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.7,
                                                            child:
                                                                PDFViewerWidget(
                                                              pdfUrl: widget!
                                                                  .annoucementUrl,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              text: 'ดูประกาศ',
                                              options: FFButtonOptions(
                                                width: 85.0,
                                                height: 28.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFFFF0000),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (((_model.getTargetBudget?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall.statusLayer2(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetBudgetKPIAPICall
                                                .statusLayer3LM(
                                              (_model.getTargetBudget
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    'ทำได้',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  FFAppState()
                                                      .kpiActualBudgetLM,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    'เป้า',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  FFAppState()
                                                      .kpiTargetBudgetLM,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    'สถานะ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  functions.checkMeanBudgetKPI(
                                                      functions
                                                          .removeCommaFromNumText(
                                                              FFAppState()
                                                                  .kpiActualBudgetLM),
                                                      functions
                                                          .removeCommaFromNumText(
                                                              FFAppState()
                                                                  .kpiTargetBudgetLM)),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    Divider(
                                      thickness: 1.0,
                                      color: Color(0x8095A1AC),
                                    ),
                                    if (((_model.getTargetContractKPI
                                                    ?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetTargetContractKPIAPICall
                                                .statusLayer2(
                                              (_model.getTargetContractKPI
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) &&
                                        (GetTargetContractKPIAPICall
                                                .statusLayer3LM(
                                              (_model.getTargetContractKPI
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))
                                      Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.9,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final kpiProductLMList =
                                                FFAppState()
                                                    .kpiProductTypeLM
                                                    .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  kpiProductLMList.length,
                                                  (kpiProductLMListIndex) {
                                                final kpiProductLMListItem =
                                                    kpiProductLMList[
                                                        kpiProductLMListIndex];
                                                return Container(
                                                  width: double.infinity,
                                                  height: 200.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        height: 80.0,
                                                        child: custom_widgets
                                                            .LinearGauge(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          height: 80.0,
                                                          maxValue: functions
                                                              .getDoubleFromStringList(
                                                                  FFAppState()
                                                                      .kpiTargetQuantityLM
                                                                      .toList(),
                                                                  kpiProductLMListIndex),
                                                          value: functions
                                                              .getDoubleFromStringList(
                                                                  FFAppState()
                                                                      .kpiActualLM
                                                                      .toList(),
                                                                  kpiProductLMListIndex),
                                                          interval: 1.0,
                                                          trackThickness: 24.0,
                                                          rangeColor:
                                                              valueOrDefault<
                                                                  Color>(
                                                            functions.getLinearGaugeColor(
                                                                FFAppState()
                                                                    .kpiGaugeColorListMain
                                                                    .toList(),
                                                                kpiProductLMListIndex),
                                                            Color(0xFF932424),
                                                          ),
                                                          gaugeAnimationMillisec:
                                                              2000,
                                                          markerAnimationMillisec:
                                                              1500,
                                                          widgetPointerWidth:
                                                              40.0,
                                                          widgetPointerHeight:
                                                              40.0,
                                                          widgetPointerColor:
                                                              valueOrDefault<
                                                                  Color>(
                                                            functions.getLinearGaugeColor(
                                                                FFAppState()
                                                                    .kpiGaugeColorListMain
                                                                    .toList(),
                                                                kpiProductLMListIndex),
                                                            Color(0xFF932424),
                                                          ),
                                                          widgetPointerShadowColor:
                                                              valueOrDefault<
                                                                  Color>(
                                                            functions.getLinearGaugeColor(
                                                                FFAppState()
                                                                    .kpiGaugeColorList2
                                                                    .toList(),
                                                                kpiProductLMListIndex),
                                                            Color(0xFFFF2929),
                                                          ),
                                                          widgetPointerTextColor:
                                                              Colors.white,
                                                          widgetPointerText: functions
                                                              .showMatNameInList(
                                                                  FFAppState()
                                                                      .kpiProductType
                                                                      .toList(),
                                                                  kpiProductLMListIndex),
                                                          isHorizontal: true,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    'ทำได้',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  functions.stringDoubleToStringInt(
                                                                      valueOrDefault<
                                                                          String>(
                                                                    functions.showMatNameInList(
                                                                        FFAppState()
                                                                            .kpiActualLM
                                                                            .toList(),
                                                                        kpiProductLMListIndex),
                                                                    '[actual]',
                                                                  )),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    'เป้า',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  functions.stringDoubleToStringInt(
                                                                      valueOrDefault<
                                                                          String>(
                                                                    functions.showMatNameInList(
                                                                        FFAppState()
                                                                            .kpiTargetQuantityLM
                                                                            .toList(),
                                                                        kpiProductLMListIndex),
                                                                    '[target_quantity]',
                                                                  )),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    'สถานะ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  functions.checkMeanBudgetKPI(
                                                                      functions.showMatNameInList(
                                                                          FFAppState()
                                                                              .kpiActualLM
                                                                              .toList(),
                                                                          kpiProductLMListIndex),
                                                                      functions.showMatNameInList(
                                                                          FFAppState()
                                                                              .kpiTargetQuantityLM
                                                                              .toList(),
                                                                          kpiProductLMListIndex)),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 1.0,
                                                        color:
                                                            Color(0x8095A1AC),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
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
                      ],
                    ),
                  ),
                ].addToStart(SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
