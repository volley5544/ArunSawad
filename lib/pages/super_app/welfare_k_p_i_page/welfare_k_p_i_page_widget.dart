import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'welfare_k_p_i_page_model.dart';
export 'welfare_k_p_i_page_model.dart';

class WelfareKPIPageWidget extends StatefulWidget {
  const WelfareKPIPageWidget({super.key});

  @override
  State<WelfareKPIPageWidget> createState() => _WelfareKPIPageWidgetState();
}

class _WelfareKPIPageWidgetState extends State<WelfareKPIPageWidget>
    with TickerProviderStateMixin {
  late WelfareKPIPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelfareKPIPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'WelfareKPIPage'});
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

      if (isAndroid) {
        await actions.allowScreenRecordAndroid();
      } else {
        await actions.allowScreenRecordIOS();
      }

      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'KPI_Welfare',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      ));
      _model.createdUserLogWelfareKPI = UserLogRecord.getDocumentFromData(
          createUserLogRecordData(
            employeeId: FFAppState().employeeID,
            action: 'KPI_Welfare',
            actionTime: getCurrentTimestamp,
            userLocation: currentUserLocationValue,
          ),
          userLogRecordReference);
      _model.getKpiWelfareCurrentMonth =
          await GetWelfareKpiCurrentMonthAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
      );
      _model.getKpiWelfareLastMonth = await GetWelfareKpiLastMonthAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
      );
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
    )..addListener(() => setState(() {}));
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
              'ยอดจัดสาขา',
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
            child: FutureBuilder<List<TextContentRecord>>(
              future: queryTextContentRecordOnce(
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
                List<TextContentRecord> tabBarTextContentRecordList =
                    snapshot.data!;
                final tabBarTextContentRecord =
                    tabBarTextContentRecordList.isNotEmpty
                        ? tabBarTextContentRecordList.first
                        : null;
                return Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primary,
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                        unselectedLabelStyle: TextStyle(),
                        indicatorColor: FlutterFlowTheme.of(context).secondary,
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
                              children: [
                                if (((FFAppState().profileLevel == 'สาขา') &&
                                            (GetWelfareKpiCurrentMonthAPICall
                                                    .statusLayer2(
                                                  (_model.getKpiWelfareCurrentMonth
                                                          ?.jsonBody ??
                                                      ''),
                                                ) ==
                                                200)
                                        ? true
                                        : false) ||
                                    (FFAppState().profileLevel != 'สาขา'))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 12.0, 24.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFAppState().profileLevel == 'สาขา'
                                              ? GetWelfareKpiCurrentMonthAPICall
                                                  .branchDetail(
                                                  (_model.getKpiWelfareCurrentMonth
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString()
                                              : valueOrDefault<String>(
                                                  '${FFAppState().profileLevel}: ${FFAppState().profileBranch}',
                                                  '[สาขา : ...]',
                                                ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 4.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          functions.showMonthYearWelfareKpiPage(
                                              GetDateTimeAPICall.currentDateYMD(
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
                                    ],
                                  ),
                                ),
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
                                      maxValue: functions.getMaxValueWelfareKpi(
                                          ((_model.getKpiWelfareCurrentMonth
                                                              ?.statusCode ??
                                                          200) ==
                                                      200) &&
                                                  (GetWelfareKpiCurrentMonthAPICall
                                                          .statusLayer2(
                                                        (_model.getKpiWelfareCurrentMonth
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      200)
                                              ? GetWelfareKpiCurrentMonthAPICall
                                                  .percentTarget(
                                                  (_model.getKpiWelfareCurrentMonth
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                              : '90'),
                                      value: ((_model.getKpiWelfareCurrentMonth
                                                          ?.statusCode ??
                                                      200) ==
                                                  200) &&
                                              (GetWelfareKpiCurrentMonthAPICall
                                                      .statusLayer2(
                                                    (_model.getKpiWelfareCurrentMonth
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  200)
                                          ? valueOrDefault<String>(
                                              GetWelfareKpiCurrentMonthAPICall
                                                  .percentSuccess(
                                                (_model.getKpiWelfareCurrentMonth
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              '0',
                                            )
                                          : '0',
                                      labelOffset: 50.0,
                                      axisLabelSize: 10.0,
                                      totalValueLabelSize: 18.0,
                                      valueUnitLabelSize: 14.0,
                                      valueUnitLabelText: 'เปอร์เซ็น',
                                      totalValueUnitLabelText: '%',
                                      endValue1: 0.45,
                                      startValue2: 0.45,
                                      endValue2: 0.5,
                                      startValue3: 0.5,
                                      color1: Color(0xFFEE4F22),
                                      color2: Color(0xFFEEC122),
                                      color3: Color(0xFF7BC722),
                                      startWidth1: 0.265,
                                      endWidth1: 0.265,
                                      startWidth2: 0.265,
                                      endWidth2: 0.265,
                                      startWidth3: 0.265,
                                      endWidth3: 0.265,
                                      isShowTick: false,
                                      startWidth4: 0.265,
                                      endWidth4: 0.265,
                                      startWidth5: 0.265,
                                      endWidth5: 0.265,
                                      color4: Color(0xFF20EEFF),
                                      color5: Color(0xFF0E2BFF),
                                      startValue4: 0.555555555,
                                      endValue4: 0.67,
                                      startValue5: 0.67,
                                      endValue5: 1.0,
                                      endValue3: 0.555555555,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Visibility(
                                    visible:
                                        tabBarTextContentRecord?.kpiHideText ??
                                            true,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 0.0, 0.0),
                                      child: Text(
                                        tabBarTextContentRecord!.kpiText,
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: tabBarTextContentRecord
                                                  ?.kpiTextcolor,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'ทำได้',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              ((_model.getKpiWelfareCurrentMonth
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) &&
                                                      (GetWelfareKpiCurrentMonthAPICall
                                                              .statusLayer2(
                                                            (_model.getKpiWelfareCurrentMonth
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          200)
                                                  ? valueOrDefault<String>(
                                                      '${((_model.getKpiWelfareCurrentMonth?.statusCode ?? 200) == 200) && (GetWelfareKpiCurrentMonthAPICall.statusLayer2(
                                                            (_model.getKpiWelfareCurrentMonth
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) == 200) ? valueOrDefault<String>(
                                                          GetWelfareKpiCurrentMonthAPICall
                                                              .percentSuccess(
                                                            (_model.getKpiWelfareCurrentMonth
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          '0',
                                                        ) : '-'}%',
                                                      '0%',
                                                    )
                                                  : '-',
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'เป้า',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              ((_model.getKpiWelfareCurrentMonth
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) &&
                                                      (GetWelfareKpiCurrentMonthAPICall
                                                              .statusLayer2(
                                                            (_model.getKpiWelfareCurrentMonth
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          200)
                                                  ? valueOrDefault<String>(
                                                      '${((_model.getKpiWelfareCurrentMonth?.statusCode ?? 200) == 200) && (GetWelfareKpiCurrentMonthAPICall.statusLayer2(
                                                            (_model.getKpiWelfareCurrentMonth
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) == 200) ? GetWelfareKpiCurrentMonthAPICall.percentTarget(
                                                          (_model.getKpiWelfareCurrentMonth
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) : '90'}%',
                                                      '90%',
                                                    )
                                                  : '-',
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'สถานะ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              ((_model.getKpiWelfareCurrentMonth
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) &&
                                                      (GetWelfareKpiCurrentMonthAPICall
                                                              .statusLayer2(
                                                            (_model.getKpiWelfareCurrentMonth
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          200)
                                                  ? valueOrDefault<String>(
                                                      functions
                                                          .getKpiWelfareStatusText(
                                                              ((_model.getKpiWelfareCurrentMonth?.statusCode ??
                                                                              200) ==
                                                                          200) &&
                                                                      (GetWelfareKpiCurrentMonthAPICall
                                                                              .statusLayer2(
                                                                            (_model.getKpiWelfareCurrentMonth?.jsonBody ??
                                                                                ''),
                                                                          ) ==
                                                                          200)
                                                                  ? valueOrDefault<
                                                                      String>(
                                                                      GetWelfareKpiCurrentMonthAPICall
                                                                          .percentSuccess(
                                                                        (_model.getKpiWelfareCurrentMonth?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                      '0',
                                                                    )
                                                                  : '0',
                                                              ((_model.getKpiWelfareCurrentMonth?.statusCode ??
                                                                              200) ==
                                                                          200) &&
                                                                      (GetWelfareKpiCurrentMonthAPICall
                                                                              .statusLayer2(
                                                                            (_model.getKpiWelfareCurrentMonth?.jsonBody ??
                                                                                ''),
                                                                          ) ==
                                                                          200)
                                                                  ? valueOrDefault<
                                                                      String>(
                                                                      GetWelfareKpiCurrentMonthAPICall
                                                                          .percentTarget(
                                                                        (_model.getKpiWelfareCurrentMonth?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                      '0',
                                                                    )
                                                                  : '90'),
                                                      'ไม่ผ่าน',
                                                    )
                                                  : (FFAppState()
                                                              .profileLevel ==
                                                          'สาขา'
                                                      ? 'สำหรับSize L,EL'
                                                      : 'ไม่พบข้อมูล'),
                                              '-',
                                            ),
                                            style:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          valueOrDefault<Color>(
                                                        functions
                                                            .getKpiWelfareStatusTextColor(
                                                                ((_model.getKpiWelfareCurrentMonth?.statusCode ??
                                                                                200) ==
                                                                            200) &&
                                                                        (GetWelfareKpiCurrentMonthAPICall
                                                                                .statusLayer2(
                                                                              (_model.getKpiWelfareCurrentMonth?.jsonBody ?? ''),
                                                                            ) ==
                                                                            200)
                                                                    ? valueOrDefault<
                                                                        String>(
                                                                        GetWelfareKpiCurrentMonthAPICall
                                                                            .percentSuccess(
                                                                          (_model.getKpiWelfareCurrentMonth?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        '0',
                                                                      )
                                                                    : '0',
                                                                FFAppState()
                                                                    .welfareKpiStatusTextColorList
                                                                    .toList(),
                                                                functions.getMaxValueWelfareKpi(((_model.getKpiWelfareCurrentMonth?.statusCode ??
                                                                                200) ==
                                                                            200) &&
                                                                        (GetWelfareKpiCurrentMonthAPICall
                                                                                .statusLayer2(
                                                                              (_model.getKpiWelfareCurrentMonth?.jsonBody ?? ''),
                                                                            ) ==
                                                                            200)
                                                                    ? GetWelfareKpiCurrentMonthAPICall
                                                                        .percentTarget(
                                                                        (_model.getKpiWelfareCurrentMonth?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                    : '90')),
                                                        Color(0xFFEE4F22),
                                                      ),
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
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (((FFAppState().profileLevel == 'สาขา') &&
                                            (GetWelfareKpiLastMonthAPICall
                                                    .statusLayer2(
                                                  (_model.getKpiWelfareLastMonth
                                                          ?.jsonBody ??
                                                      ''),
                                                ) ==
                                                200)
                                        ? true
                                        : false) ||
                                    (FFAppState().profileLevel != 'สาขา'))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 12.0, 24.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFAppState().profileLevel == 'สาขา'
                                              ? GetWelfareKpiLastMonthAPICall
                                                  .branchDetail(
                                                  (_model.getKpiWelfareLastMonth
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                              : valueOrDefault<String>(
                                                  '${FFAppState().profileLevel}: ${FFAppState().profileBranch}',
                                                  '[สาขา : ...]',
                                                ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 4.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          functions.getWelfareKpiDateLastMonth(
                                              GetDateTimeAPICall.currentDateYMD(
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
                                    ],
                                  ),
                                ),
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
                                      maxValue: ((_model.getKpiWelfareLastMonth
                                                          ?.statusCode ??
                                                      200) ==
                                                  200) &&
                                              (GetWelfareKpiLastMonthAPICall
                                                      .statusLayer2(
                                                    (_model.getKpiWelfareLastMonth
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  200)
                                          ? functions.getMaxValueWelfareKpi(
                                              GetWelfareKpiLastMonthAPICall
                                                  .percentTarget(
                                              (_model.getKpiWelfareLastMonth
                                                      ?.jsonBody ??
                                                  ''),
                                            ))
                                          : '180',
                                      value: ((_model.getKpiWelfareLastMonth
                                                          ?.statusCode ??
                                                      200) ==
                                                  200) &&
                                              (GetWelfareKpiLastMonthAPICall
                                                      .statusLayer2(
                                                    (_model.getKpiWelfareLastMonth
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  200)
                                          ? valueOrDefault<String>(
                                              GetWelfareKpiLastMonthAPICall
                                                  .percentSuccess(
                                                (_model.getKpiWelfareLastMonth
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              '0',
                                            )
                                          : '0',
                                      labelOffset: 50.0,
                                      axisLabelSize: 10.0,
                                      totalValueLabelSize: 18.0,
                                      valueUnitLabelSize: 14.0,
                                      valueUnitLabelText: 'เปอร์เซ็น',
                                      totalValueUnitLabelText: '%',
                                      endValue1: 0.45,
                                      startValue2: 0.45,
                                      endValue2: 0.5,
                                      startValue3: 0.5,
                                      color1: Color(0xFFEE4F22),
                                      color2: Color(0xFFEEC122),
                                      color3: Color(0xFF7BC722),
                                      startWidth1: 0.265,
                                      endWidth1: 0.265,
                                      startWidth2: 0.265,
                                      endWidth2: 0.265,
                                      startWidth3: 0.265,
                                      endWidth3: 0.265,
                                      isShowTick: false,
                                      startWidth4: 0.265,
                                      endWidth4: 0.265,
                                      startWidth5: 0.265,
                                      endWidth5: 0.265,
                                      color4: Color(0xFF20EEFF),
                                      color5: Color(0xFF0E2BFF),
                                      startValue4: 0.555555555,
                                      endValue4: 0.67,
                                      startValue5: 0.67,
                                      endValue5: 1.0,
                                      endValue3: 0.555555555,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Visibility(
                                    visible:
                                        tabBarTextContentRecord?.kpiHideText ??
                                            true,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 0.0, 0.0),
                                      child: Text(
                                        tabBarTextContentRecord!.kpiText,
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: tabBarTextContentRecord
                                                  ?.kpiTextcolor,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'ทำได้',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              ((_model.getKpiWelfareLastMonth
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) &&
                                                      (GetWelfareKpiLastMonthAPICall
                                                              .statusLayer2(
                                                            (_model.getKpiWelfareLastMonth
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          200)
                                                  ? valueOrDefault<String>(
                                                      '${((_model.getKpiWelfareLastMonth?.statusCode ?? 200) == 200) && (GetWelfareKpiLastMonthAPICall.statusLayer2(
                                                            (_model.getKpiWelfareLastMonth
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) == 200) ? valueOrDefault<String>(
                                                          GetWelfareKpiLastMonthAPICall
                                                              .percentSuccess(
                                                            (_model.getKpiWelfareLastMonth
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          '0',
                                                        ) : '0'}%',
                                                      '0%',
                                                    )
                                                  : '-',
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'เป้า',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              ((_model.getKpiWelfareLastMonth
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) &&
                                                      (GetWelfareKpiLastMonthAPICall
                                                              .statusLayer2(
                                                            (_model.getKpiWelfareLastMonth
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          200)
                                                  ? valueOrDefault<String>(
                                                      '${((_model.getKpiWelfareLastMonth?.statusCode ?? 200) == 200) && (GetWelfareKpiLastMonthAPICall.statusLayer2(
                                                            (_model.getKpiWelfareLastMonth
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) == 200) ? GetWelfareKpiLastMonthAPICall.percentTarget(
                                                          (_model.getKpiWelfareLastMonth
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) : '90'}%',
                                                      '90%',
                                                    )
                                                  : '-',
                                              '-',
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              'สถานะ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              ((_model.getKpiWelfareLastMonth
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) &&
                                                      (GetWelfareKpiLastMonthAPICall
                                                              .statusLayer2(
                                                            (_model.getKpiWelfareLastMonth
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          200)
                                                  ? valueOrDefault<String>(
                                                      functions
                                                          .getKpiWelfareStatusText(
                                                              ((_model.getKpiWelfareLastMonth?.statusCode ??
                                                                              200) ==
                                                                          200) &&
                                                                      (GetWelfareKpiLastMonthAPICall
                                                                              .statusLayer2(
                                                                            (_model.getKpiWelfareLastMonth?.jsonBody ??
                                                                                ''),
                                                                          ) ==
                                                                          200)
                                                                  ? valueOrDefault<
                                                                      String>(
                                                                      GetWelfareKpiLastMonthAPICall
                                                                          .percentSuccess(
                                                                        (_model.getKpiWelfareLastMonth?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                      '0',
                                                                    )
                                                                  : '0',
                                                              ((_model.getKpiWelfareLastMonth?.statusCode ??
                                                                              200) ==
                                                                          200) &&
                                                                      (GetWelfareKpiLastMonthAPICall
                                                                              .statusLayer2(
                                                                            (_model.getKpiWelfareLastMonth?.jsonBody ??
                                                                                ''),
                                                                          ) ==
                                                                          200)
                                                                  ? valueOrDefault<
                                                                      String>(
                                                                      GetWelfareKpiLastMonthAPICall
                                                                          .percentTarget(
                                                                        (_model.getKpiWelfareLastMonth?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                      '0',
                                                                    )
                                                                  : '90'),
                                                      'ไม่ผ่าน',
                                                    )
                                                  : (FFAppState()
                                                              .profileLevel ==
                                                          'สาขา'
                                                      ? 'สำหรับSize L,EL'
                                                      : 'ไม่พบข้อมูล'),
                                              '-',
                                            ),
                                            style:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          valueOrDefault<Color>(
                                                        functions
                                                            .getKpiWelfareStatusTextColor(
                                                                ((_model.getKpiWelfareLastMonth?.statusCode ??
                                                                                200) ==
                                                                            200) &&
                                                                        (GetWelfareKpiLastMonthAPICall
                                                                                .statusLayer2(
                                                                              (_model.getKpiWelfareLastMonth?.jsonBody ?? ''),
                                                                            ) ==
                                                                            200)
                                                                    ? valueOrDefault<
                                                                        String>(
                                                                        GetWelfareKpiLastMonthAPICall
                                                                            .percentSuccess(
                                                                          (_model.getKpiWelfareLastMonth?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        '0',
                                                                      )
                                                                    : '0',
                                                                FFAppState()
                                                                    .welfareKpiStatusTextColorList
                                                                    .toList(),
                                                                ((_model.getKpiWelfareLastMonth?.statusCode ??
                                                                                200) ==
                                                                            200) &&
                                                                        (GetWelfareKpiLastMonthAPICall
                                                                                .statusLayer2(
                                                                              (_model.getKpiWelfareLastMonth?.jsonBody ?? ''),
                                                                            ) ==
                                                                            200)
                                                                    ? functions.getMaxValueWelfareKpi(
                                                                        GetWelfareKpiLastMonthAPICall
                                                                            .percentTarget(
                                                                        (_model.getKpiWelfareLastMonth?.jsonBody ??
                                                                            ''),
                                                                      ))
                                                                    : '180'),
                                                        Color(0xFFEE4F22),
                                                      ),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
