import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/ibs_page_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'i_b_s_report_model.dart';
export 'i_b_s_report_model.dart';

class IBSReportWidget extends StatefulWidget {
  const IBSReportWidget({
    super.key,
    required this.employeeId,
  });

  final String? employeeId;

  static String routeName = 'IBSReport';
  static String routePath = 'iBSReport';

  @override
  State<IBSReportWidget> createState() => _IBSReportWidgetState();
}

class _IBSReportWidgetState extends State<IBSReportWidget>
    with TickerProviderStateMixin {
  late IBSReportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IBSReportModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'IBSReport'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (isAndroid) {
        await actions.allowScreenRecordAndroid();
      } else {
        await actions.allowScreenRecordIOS();
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
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      _model.kPIAllOutput = await GetKPIAllCall.call(
        apiUrl: FFAppState().apiURLLocalState,
        empCode: widget!.employeeId,
      );

      if (GetKPIAllCall.statusCode(
            (_model.kPIAllOutput?.jsonBody ?? ''),
          ) !=
          200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('ไม่พบข้อมูลรายงาน'),
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
        Navigator.pop(context);

        context.goNamed(SuperAppPageWidget.routeName);

        return;
      }
      Navigator.pop(context);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 6,
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0xFFFF6500),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.arrow_back,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 24.0,
              ),
              onPressed: () async {
                context.goNamed(SuperAppPageWidget.routeName);
              },
            ),
            title: Text(
              'เป้าและผลงานรายเดือน\n(ของแต่ละคน)',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    'รหัสพนักงาน ${widget!.employeeId}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'วันที่อัพเดทข้อมูล',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                        child: Text(
                          valueOrDefault<String>(
                            functions.showDateBE(valueOrDefault<String>(
                              GetKPIAllCall.etlCreateDate(
                                (_model.kPIAllOutput?.jsonBody ?? ''),
                              )?.elementAtOrNull(0),
                              '0',
                            )),
                            'date',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 4.0),
                        child: Text(
                          dateTimeFormat(
                            "Hm",
                            functions
                                .parseStringToDatetime(valueOrDefault<String>(
                              GetKPIAllCall.etlCreateDate(
                                (_model.kPIAllOutput?.jsonBody ?? ''),
                              )?.elementAtOrNull(0),
                              '0',
                            )),
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: FutureBuilder<List<KPIAllChangeRecord>>(
                      future: queryKPIAllChangeRecordOnce(
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
                        List<KPIAllChangeRecord> rowKPIAllChangeRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final rowKPIAllChangeRecord =
                            rowKPIAllChangeRecordList.isNotEmpty
                                ? rowKPIAllChangeRecordList.first
                                : null;

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor: Color(0xFF71797E),
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      unselectedLabelStyle: TextStyle(),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      padding: EdgeInsets.all(4.0),
                                      tabs: [
                                        Tab(
                                          text: (GetKPIAllCall.monthth(
                                            (_model.kPIAllOutput?.jsonBody ??
                                                ''),
                                          )!
                                              .elementAtOrNull(0))!,
                                        ),
                                        Tab(
                                          text: (GetKPIAllCall.monthth(
                                            (_model.kPIAllOutput?.jsonBody ??
                                                ''),
                                          )!
                                              .elementAtOrNull(1))!,
                                        ),
                                        Tab(
                                          text: (GetKPIAllCall.monthth(
                                            (_model.kPIAllOutput?.jsonBody ??
                                                ''),
                                          )!
                                              .elementAtOrNull(2))!,
                                        ),
                                        Tab(
                                          text: (GetKPIAllCall.monthth(
                                            (_model.kPIAllOutput?.jsonBody ??
                                                ''),
                                          )!
                                              .elementAtOrNull(3))!,
                                        ),
                                        Tab(
                                          text: (GetKPIAllCall.monthth(
                                            (_model.kPIAllOutput?.jsonBody ??
                                                ''),
                                          )!
                                              .elementAtOrNull(4))!,
                                        ),
                                        Tab(
                                          text: (GetKPIAllCall.monthth(
                                            (_model.kPIAllOutput?.jsonBody ??
                                                ''),
                                          )!
                                              .elementAtOrNull(5))!,
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [
                                          () async {},
                                          () async {},
                                          () async {},
                                          () async {},
                                          () async {},
                                          () async {}
                                        ][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        wrapWithModel(
                                          model: _model.ibsPageComponentModel1,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: IbsPageComponentWidget(
                                            textColor1: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            targetbranch:
                                                GetKPIAllCall.targetbranch(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            backgroundColor1:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            borderColor1: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            borderWidth: valueOrDefault<double>(
                                              _model.borderWidth,
                                              7.0,
                                            ),
                                            textColor2: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countleadsurvey:
                                                GetKPIAllCall.countleadsurvey(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            backgroundColor2:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            countLeadID:
                                                GetKPIAllCall.countLeadID(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            tagetUnit: GetKPIAllCall.tagetUnit(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            borderColor2: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                            ),
                                            textColor3: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(2),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            sumKEYINCSHPRCLead: GetKPIAllCall
                                                .sumKEYINCSHPRCLead(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            backgroundColor3:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(2),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            tAGETKEYINCSHPRC:
                                                GetKPIAllCall.tagetkeyincshprc(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            achieveKEYINCSHPRCLead:
                                                valueOrDefault<String>(
                                              GetKPIAllCall
                                                  .achieveKEYINCSHPRCLead(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(0),
                                              '0',
                                            ),
                                            achieveKEYINCSHPRCLead2:
                                                GetKPIAllCall
                                                    .achieveKEYINCSHPRCLead(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            danger:
                                                rowKPIAllChangeRecord?.danger,
                                            dangerColor: rowKPIAllChangeRecord
                                                ?.dangerColor,
                                            normal:
                                                rowKPIAllChangeRecord?.normal,
                                            normalColor: rowKPIAllChangeRecord
                                                ?.normalColor,
                                            goodColor: rowKPIAllChangeRecord
                                                ?.goodColor,
                                            borderColor3: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(2),
                                              Colors.transparent,
                                            ),
                                            targetPremium:
                                                GetKPIAllCall.targetPremium(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            targetUnitPolicy:
                                                GetKPIAllCall.targetUnitPolicy(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            borderColor4: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(8),
                                              Colors.transparent,
                                            ),
                                            textColor4: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            ibssumApp: GetKPIAllCall.ibssumApp(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            backgroundColor4:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            ibssumPremium:
                                                GetKPIAllCall.ibssumPremium(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            countPolicyNoAppman: GetKPIAllCall
                                                .countPolicyNoAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            totalPremiumAppman: GetKPIAllCall
                                                .totalPremiumAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            borderColor5: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            textColor5: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoMOTOR:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countPolicyNoMOTOR(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(0),
                                              '-',
                                            ),
                                            backgroundColor5:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalPremiumMOTOR:
                                                GetKPIAllCall.totalPremiumMOTOR(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            countPolicyNoMotorAppman:
                                                GetKPIAllCall
                                                    .countPolicyNoMotorAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            totalPremiumMotorAppman:
                                                GetKPIAllCall
                                                    .totalPremiumMotorAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            borderColor6: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                            ),
                                            textColor6: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoCMI:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countPolicyNoCMI(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(0),
                                              '-',
                                            ),
                                            backgroundColor6:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalPremiumCMI:
                                                GetKPIAllCall.totalPremiumCMI(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            borderColor7: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                            ),
                                            textColor7: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoTPB:
                                                GetKPIAllCall.countPolicyNoTPB(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            backgroundColor7:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            insureSumTotalPremiumTPB:
                                                GetKPIAllCall
                                                    .insureSumTotalPremiumTPB(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            borderColor8: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                            ),
                                            textColor8: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countpolicynoepa:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countpolicynoepa(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(0),
                                              '-',
                                            ),
                                            backgroundColor8:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalpremiumepa:
                                                GetKPIAllCall.totalpremiumepa(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            borderColor9: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            countPolicyNoHouse: GetKPIAllCall
                                                .countPolicyNoHouse(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            totalPremiumHouse:
                                                GetKPIAllCall.totalPremiumHouse(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(0),
                                            borderColor10:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(9),
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                            ),
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.ibsPageComponentModel2,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: IbsPageComponentWidget(
                                            textColor1: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            targetbranch:
                                                GetKPIAllCall.targetbranch(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            backgroundColor1:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            borderColor1: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            borderWidth: valueOrDefault<double>(
                                              _model.borderWidth,
                                              7.0,
                                            ),
                                            textColor2: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countleadsurvey:
                                                GetKPIAllCall.countleadsurvey(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            backgroundColor2:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            countLeadID:
                                                GetKPIAllCall.countLeadID(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            tagetUnit: GetKPIAllCall.tagetUnit(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            borderColor2: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                            ),
                                            textColor3: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(2),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            sumKEYINCSHPRCLead: GetKPIAllCall
                                                .sumKEYINCSHPRCLead(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            backgroundColor3:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(2),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            tAGETKEYINCSHPRC:
                                                GetKPIAllCall.tagetkeyincshprc(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            achieveKEYINCSHPRCLead:
                                                valueOrDefault<String>(
                                              GetKPIAllCall
                                                  .achieveKEYINCSHPRCLead(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(1),
                                              '0',
                                            ),
                                            achieveKEYINCSHPRCLead2:
                                                GetKPIAllCall
                                                    .achieveKEYINCSHPRCLead(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            danger:
                                                rowKPIAllChangeRecord?.danger,
                                            dangerColor: rowKPIAllChangeRecord
                                                ?.dangerColor,
                                            normal:
                                                rowKPIAllChangeRecord?.normal,
                                            normalColor: rowKPIAllChangeRecord
                                                ?.normalColor,
                                            goodColor: rowKPIAllChangeRecord
                                                ?.goodColor,
                                            borderColor3: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(2),
                                              Colors.transparent,
                                            ),
                                            targetPremium:
                                                GetKPIAllCall.targetPremium(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            targetUnitPolicy:
                                                GetKPIAllCall.targetUnitPolicy(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            borderColor4: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(8),
                                              Colors.transparent,
                                            ),
                                            textColor4: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            ibssumApp: GetKPIAllCall.ibssumApp(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            backgroundColor4:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            ibssumPremium:
                                                GetKPIAllCall.ibssumPremium(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            countPolicyNoAppman: GetKPIAllCall
                                                .countPolicyNoAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            totalPremiumAppman: GetKPIAllCall
                                                .totalPremiumAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            borderColor5: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            textColor5: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoMOTOR:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countPolicyNoMOTOR(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(1),
                                              '-',
                                            ),
                                            backgroundColor5:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalPremiumMOTOR:
                                                GetKPIAllCall.totalPremiumMOTOR(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            countPolicyNoMotorAppman:
                                                GetKPIAllCall
                                                    .countPolicyNoMotorAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            totalPremiumMotorAppman:
                                                GetKPIAllCall
                                                    .totalPremiumMotorAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            borderColor6: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                            ),
                                            textColor6: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoCMI:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countPolicyNoCMI(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(1),
                                              '-',
                                            ),
                                            backgroundColor6:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalPremiumCMI:
                                                GetKPIAllCall.totalPremiumCMI(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            borderColor7: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                            ),
                                            textColor7: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoTPB:
                                                GetKPIAllCall.countPolicyNoTPB(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            backgroundColor7:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            insureSumTotalPremiumTPB:
                                                GetKPIAllCall
                                                    .insureSumTotalPremiumTPB(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            borderColor8: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                            ),
                                            textColor8: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countpolicynoepa:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countpolicynoepa(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(1),
                                              '-',
                                            ),
                                            backgroundColor8:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalpremiumepa:
                                                GetKPIAllCall.totalpremiumepa(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            borderColor9: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            countPolicyNoHouse: GetKPIAllCall
                                                .countPolicyNoHouse(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            totalPremiumHouse:
                                                GetKPIAllCall.totalPremiumHouse(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(1),
                                            borderColor10:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(9),
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                            ),
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.ibsPageComponentModel3,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: IbsPageComponentWidget(
                                            textColor1: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            targetbranch:
                                                GetKPIAllCall.targetbranch(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            backgroundColor1:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            borderColor1: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            borderWidth: valueOrDefault<double>(
                                              _model.borderWidth,
                                              7.0,
                                            ),
                                            textColor2: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countleadsurvey:
                                                GetKPIAllCall.countleadsurvey(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            backgroundColor2:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            countLeadID:
                                                GetKPIAllCall.countLeadID(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            tagetUnit: GetKPIAllCall.tagetUnit(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            borderColor2: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                            ),
                                            textColor3: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(2),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            sumKEYINCSHPRCLead: GetKPIAllCall
                                                .sumKEYINCSHPRCLead(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            backgroundColor3:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(2),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            tAGETKEYINCSHPRC:
                                                GetKPIAllCall.tagetkeyincshprc(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            achieveKEYINCSHPRCLead:
                                                valueOrDefault<String>(
                                              GetKPIAllCall
                                                  .achieveKEYINCSHPRCLead(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(2),
                                              '0',
                                            ),
                                            achieveKEYINCSHPRCLead2:
                                                GetKPIAllCall
                                                    .achieveKEYINCSHPRCLead(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            danger:
                                                rowKPIAllChangeRecord?.danger,
                                            dangerColor: rowKPIAllChangeRecord
                                                ?.dangerColor,
                                            normal:
                                                rowKPIAllChangeRecord?.normal,
                                            normalColor: rowKPIAllChangeRecord
                                                ?.normalColor,
                                            goodColor: rowKPIAllChangeRecord
                                                ?.goodColor,
                                            borderColor3: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(2),
                                              Colors.transparent,
                                            ),
                                            targetPremium:
                                                GetKPIAllCall.targetPremium(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            targetUnitPolicy:
                                                GetKPIAllCall.targetUnitPolicy(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            borderColor4: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(8),
                                              Colors.transparent,
                                            ),
                                            textColor4: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            ibssumApp: GetKPIAllCall.ibssumApp(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            backgroundColor4:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            ibssumPremium:
                                                GetKPIAllCall.ibssumPremium(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            countPolicyNoAppman: GetKPIAllCall
                                                .countPolicyNoAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            totalPremiumAppman: GetKPIAllCall
                                                .totalPremiumAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            borderColor5: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            textColor5: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoMOTOR:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countPolicyNoMOTOR(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(2),
                                              '-',
                                            ),
                                            backgroundColor5:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalPremiumMOTOR:
                                                GetKPIAllCall.totalPremiumMOTOR(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            countPolicyNoMotorAppman:
                                                GetKPIAllCall
                                                    .countPolicyNoMotorAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            totalPremiumMotorAppman:
                                                GetKPIAllCall
                                                    .totalPremiumMotorAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            borderColor6: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                            ),
                                            textColor6: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoCMI:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countPolicyNoCMI(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(2),
                                              '-',
                                            ),
                                            backgroundColor6:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalPremiumCMI:
                                                GetKPIAllCall.totalPremiumCMI(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            borderColor7: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                            ),
                                            textColor7: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoTPB:
                                                GetKPIAllCall.countPolicyNoTPB(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            backgroundColor7:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            insureSumTotalPremiumTPB:
                                                GetKPIAllCall
                                                    .insureSumTotalPremiumTPB(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            borderColor8: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                            ),
                                            textColor8: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countpolicynoepa:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countpolicynoepa(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(2),
                                              '-',
                                            ),
                                            backgroundColor8:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalpremiumepa:
                                                GetKPIAllCall.totalpremiumepa(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            borderColor9: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            countPolicyNoHouse: GetKPIAllCall
                                                .countPolicyNoHouse(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            totalPremiumHouse:
                                                GetKPIAllCall.totalPremiumHouse(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(2),
                                            borderColor10:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(9),
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                            ),
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.ibsPageComponentModel4,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: IbsPageComponentWidget(
                                            textColor1: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            targetbranch:
                                                GetKPIAllCall.targetbranch(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            backgroundColor1:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            borderColor1: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            borderWidth: valueOrDefault<double>(
                                              _model.borderWidth,
                                              7.0,
                                            ),
                                            textColor2: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countleadsurvey:
                                                GetKPIAllCall.countleadsurvey(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            backgroundColor2:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            countLeadID:
                                                GetKPIAllCall.countLeadID(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            tagetUnit: GetKPIAllCall.tagetUnit(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            borderColor2: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                            ),
                                            textColor3: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(2),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            sumKEYINCSHPRCLead: GetKPIAllCall
                                                .sumKEYINCSHPRCLead(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            backgroundColor3:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(2),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            tAGETKEYINCSHPRC:
                                                GetKPIAllCall.tagetkeyincshprc(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            achieveKEYINCSHPRCLead:
                                                valueOrDefault<String>(
                                              GetKPIAllCall
                                                  .achieveKEYINCSHPRCLead(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(3),
                                              '0',
                                            ),
                                            achieveKEYINCSHPRCLead2:
                                                GetKPIAllCall
                                                    .achieveKEYINCSHPRCLead(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            danger:
                                                rowKPIAllChangeRecord?.danger,
                                            dangerColor: rowKPIAllChangeRecord
                                                ?.dangerColor,
                                            normal:
                                                rowKPIAllChangeRecord?.normal,
                                            normalColor: rowKPIAllChangeRecord
                                                ?.normalColor,
                                            goodColor: rowKPIAllChangeRecord
                                                ?.goodColor,
                                            borderColor3: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(2),
                                              Colors.transparent,
                                            ),
                                            targetPremium:
                                                GetKPIAllCall.targetPremium(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            targetUnitPolicy:
                                                GetKPIAllCall.targetUnitPolicy(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            borderColor4: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(8),
                                              Colors.transparent,
                                            ),
                                            textColor4: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            ibssumApp: GetKPIAllCall.ibssumApp(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            backgroundColor4:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            ibssumPremium:
                                                GetKPIAllCall.ibssumPremium(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            countPolicyNoAppman: GetKPIAllCall
                                                .countPolicyNoAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            totalPremiumAppman: GetKPIAllCall
                                                .totalPremiumAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            borderColor5: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            textColor5: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoMOTOR:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countPolicyNoMOTOR(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(3),
                                              '-',
                                            ),
                                            backgroundColor5:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalPremiumMOTOR:
                                                GetKPIAllCall.totalPremiumMOTOR(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            countPolicyNoMotorAppman:
                                                GetKPIAllCall
                                                    .countPolicyNoMotorAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            totalPremiumMotorAppman:
                                                GetKPIAllCall
                                                    .totalPremiumMotorAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            borderColor6: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                            ),
                                            textColor6: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoCMI:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countPolicyNoCMI(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(3),
                                              '-',
                                            ),
                                            backgroundColor6:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalPremiumCMI:
                                                GetKPIAllCall.totalPremiumCMI(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            borderColor7: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                            ),
                                            textColor7: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoTPB:
                                                GetKPIAllCall.countPolicyNoTPB(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            backgroundColor7:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            insureSumTotalPremiumTPB:
                                                GetKPIAllCall
                                                    .insureSumTotalPremiumTPB(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            borderColor8: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                            ),
                                            textColor8: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countpolicynoepa:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countpolicynoepa(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(3),
                                              '-',
                                            ),
                                            backgroundColor8:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalpremiumepa:
                                                GetKPIAllCall.totalpremiumepa(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            borderColor9: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            countPolicyNoHouse: GetKPIAllCall
                                                .countPolicyNoHouse(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            totalPremiumHouse:
                                                GetKPIAllCall.totalPremiumHouse(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(3),
                                            borderColor10:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(9),
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                            ),
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.ibsPageComponentModel5,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: IbsPageComponentWidget(
                                            textColor1: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            targetbranch:
                                                GetKPIAllCall.targetbranch(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            backgroundColor1:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            borderColor1: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            borderWidth: valueOrDefault<double>(
                                              _model.borderWidth,
                                              7.0,
                                            ),
                                            textColor2: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countleadsurvey:
                                                GetKPIAllCall.countleadsurvey(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            backgroundColor2:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            countLeadID:
                                                GetKPIAllCall.countLeadID(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            tagetUnit: GetKPIAllCall.tagetUnit(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            borderColor2: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                            ),
                                            textColor3: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(2),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            sumKEYINCSHPRCLead: GetKPIAllCall
                                                .sumKEYINCSHPRCLead(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            backgroundColor3:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(2),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            tAGETKEYINCSHPRC:
                                                GetKPIAllCall.tagetkeyincshprc(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            achieveKEYINCSHPRCLead:
                                                valueOrDefault<String>(
                                              GetKPIAllCall
                                                  .achieveKEYINCSHPRCLead(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(4),
                                              '0',
                                            ),
                                            achieveKEYINCSHPRCLead2:
                                                GetKPIAllCall
                                                    .achieveKEYINCSHPRCLead(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            danger:
                                                rowKPIAllChangeRecord?.danger,
                                            dangerColor: rowKPIAllChangeRecord
                                                ?.dangerColor,
                                            normal:
                                                rowKPIAllChangeRecord?.normal,
                                            normalColor: rowKPIAllChangeRecord
                                                ?.normalColor,
                                            goodColor: rowKPIAllChangeRecord
                                                ?.goodColor,
                                            borderColor3: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(2),
                                              Colors.transparent,
                                            ),
                                            targetPremium:
                                                GetKPIAllCall.targetPremium(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            targetUnitPolicy:
                                                GetKPIAllCall.targetUnitPolicy(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            borderColor4: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(8),
                                              Colors.transparent,
                                            ),
                                            textColor4: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            ibssumApp: GetKPIAllCall.ibssumApp(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            backgroundColor4:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            ibssumPremium:
                                                GetKPIAllCall.ibssumPremium(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            countPolicyNoAppman: GetKPIAllCall
                                                .countPolicyNoAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            totalPremiumAppman: GetKPIAllCall
                                                .totalPremiumAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            borderColor5: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            textColor5: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoMOTOR:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countPolicyNoMOTOR(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(4),
                                              '-',
                                            ),
                                            backgroundColor5:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalPremiumMOTOR:
                                                GetKPIAllCall.totalPremiumMOTOR(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            countPolicyNoMotorAppman:
                                                GetKPIAllCall
                                                    .countPolicyNoMotorAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            totalPremiumMotorAppman:
                                                GetKPIAllCall
                                                    .totalPremiumMotorAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            borderColor6: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                            ),
                                            textColor6: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoCMI:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countPolicyNoCMI(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(4),
                                              '-',
                                            ),
                                            backgroundColor6:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalPremiumCMI:
                                                GetKPIAllCall.totalPremiumCMI(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            borderColor7: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                            ),
                                            textColor7: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoTPB:
                                                GetKPIAllCall.countPolicyNoTPB(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            backgroundColor7:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            insureSumTotalPremiumTPB:
                                                GetKPIAllCall
                                                    .insureSumTotalPremiumTPB(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            borderColor8: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                            ),
                                            textColor8: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countpolicynoepa:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countpolicynoepa(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(4),
                                              '-',
                                            ),
                                            backgroundColor8:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalpremiumepa:
                                                GetKPIAllCall.totalpremiumepa(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            borderColor9: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            countPolicyNoHouse: GetKPIAllCall
                                                .countPolicyNoHouse(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            totalPremiumHouse:
                                                GetKPIAllCall.totalPremiumHouse(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(4),
                                            borderColor10:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(9),
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                            ),
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model.ibsPageComponentModel6,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: IbsPageComponentWidget(
                                            textColor1: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            targetbranch:
                                                GetKPIAllCall.targetbranch(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            backgroundColor1:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            borderColor1: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(0),
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            borderWidth: valueOrDefault<double>(
                                              _model.borderWidth,
                                              7.0,
                                            ),
                                            textColor2: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countleadsurvey:
                                                GetKPIAllCall.countleadsurvey(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            backgroundColor2:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            countLeadID:
                                                GetKPIAllCall.countLeadID(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            tagetUnit: GetKPIAllCall.tagetUnit(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            borderColor2: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(1),
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                            ),
                                            textColor3: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(2),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            sumKEYINCSHPRCLead: GetKPIAllCall
                                                .sumKEYINCSHPRCLead(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            backgroundColor3:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(2),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            tAGETKEYINCSHPRC:
                                                GetKPIAllCall.tagetkeyincshprc(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            achieveKEYINCSHPRCLead:
                                                valueOrDefault<String>(
                                              GetKPIAllCall
                                                  .achieveKEYINCSHPRCLead(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(5),
                                              '0',
                                            ),
                                            achieveKEYINCSHPRCLead2:
                                                GetKPIAllCall
                                                    .achieveKEYINCSHPRCLead(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            danger:
                                                rowKPIAllChangeRecord?.danger,
                                            dangerColor: rowKPIAllChangeRecord
                                                ?.dangerColor,
                                            normal:
                                                rowKPIAllChangeRecord?.normal,
                                            normalColor: rowKPIAllChangeRecord
                                                ?.normalColor,
                                            goodColor: rowKPIAllChangeRecord
                                                ?.goodColor,
                                            borderColor3: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(2),
                                              Colors.transparent,
                                            ),
                                            targetPremium:
                                                GetKPIAllCall.targetPremium(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            targetUnitPolicy:
                                                GetKPIAllCall.targetUnitPolicy(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            borderColor4: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(8),
                                              Colors.transparent,
                                            ),
                                            textColor4: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            ibssumApp: GetKPIAllCall.ibssumApp(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            backgroundColor4:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            ibssumPremium:
                                                GetKPIAllCall.ibssumPremium(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            countPolicyNoAppman: GetKPIAllCall
                                                .countPolicyNoAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            totalPremiumAppman: GetKPIAllCall
                                                .totalPremiumAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            borderColor5: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(4),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            textColor5: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoMOTOR:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countPolicyNoMOTOR(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(5),
                                              '-',
                                            ),
                                            backgroundColor5:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalPremiumMOTOR:
                                                GetKPIAllCall.totalPremiumMOTOR(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            countPolicyNoMotorAppman:
                                                GetKPIAllCall
                                                    .countPolicyNoMotorAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            totalPremiumMotorAppman:
                                                GetKPIAllCall
                                                    .totalPremiumMotorAppman(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            borderColor6: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(7),
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                            ),
                                            textColor6: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoCMI:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countPolicyNoCMI(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(5),
                                              '-',
                                            ),
                                            backgroundColor6:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalPremiumCMI:
                                                GetKPIAllCall.totalPremiumCMI(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            borderColor7: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(6),
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                            ),
                                            textColor7: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countPolicyNoTPB:
                                                GetKPIAllCall.countPolicyNoTPB(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            backgroundColor7:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            insureSumTotalPremiumTPB:
                                                GetKPIAllCall
                                                    .insureSumTotalPremiumTPB(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            borderColor8: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(3),
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                            ),
                                            textColor8: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.textColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                            ),
                                            countpolicynoepa:
                                                valueOrDefault<String>(
                                              GetKPIAllCall.countpolicynoepa(
                                                (_model.kPIAllOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.elementAtOrNull(5),
                                              '-',
                                            ),
                                            backgroundColor8:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord
                                                  ?.backgroundColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            totalpremiumepa:
                                                GetKPIAllCall.totalpremiumepa(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            borderColor9: valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(5),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            countPolicyNoHouse: GetKPIAllCall
                                                .countPolicyNoHouse(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            totalPremiumHouse:
                                                GetKPIAllCall.totalPremiumHouse(
                                              (_model.kPIAllOutput?.jsonBody ??
                                                  ''),
                                            )?.elementAtOrNull(5),
                                            borderColor10:
                                                valueOrDefault<Color>(
                                              rowKPIAllChangeRecord?.borderColor
                                                  ?.elementAtOrNull(9),
                                              FlutterFlowTheme.of(context)
                                                  .success,
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
    );
  }
}
