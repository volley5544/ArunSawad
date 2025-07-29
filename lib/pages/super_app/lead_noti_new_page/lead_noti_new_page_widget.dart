import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/call_history/call_history_widget.dart';
import '/components/filter_lead_component_new_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/saved_lead_called_status/saved_lead_called_status_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lead_noti_new_page_model.dart';
export 'lead_noti_new_page_model.dart';

class LeadNotiNewPageWidget extends StatefulWidget {
  const LeadNotiNewPageWidget({
    super.key,
    this.color,
  });

  final List<Color>? color;

  static String routeName = 'LeadNotiNewPage';
  static String routePath = 'leadNotiNewPage';

  @override
  State<LeadNotiNewPageWidget> createState() => _LeadNotiNewPageWidgetState();
}

class _LeadNotiNewPageWidgetState extends State<LeadNotiNewPageWidget>
    with TickerProviderStateMixin {
  late LeadNotiNewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadNotiNewPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LeadNotiNewPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      );

      _model.getLeadDetail = await GetLeadDetailAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
      );

      if ((_model.getLeadDetail?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดConnection (${(_model.getLeadDetail?.statusCode ?? 200).toString()})'),
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
      if ('${getJsonField(
            (_model.getLeadDetail?.jsonBody ?? ''),
            r'''$.DataLeadInfo.status''',
          ).toString()}' !=
          '200') {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('${getJsonField(
                  (_model.getLeadDetail?.jsonBody ?? ''),
                  r'''$.DataLeadInfo.message''',
                ).toString()}'),
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
      _model.leadDataByCategory = functions.returnLeadListByChannel(
          functions
              .addDataToJson(GetLeadDetailAPICall.leadDataJson(
                (_model.getLeadDetail?.jsonBody ?? ''),
              )?.toList())
              ?.toList(),
          FFAppState().employeeID);
      safeSetState(() {});
      _model.leadNotiModifyJson = functions
          .addDataToJson(GetLeadDetailAPICall.leadDataJson(
            (_model.getLeadDetail?.jsonBody ?? ''),
          )?.toList())!
          .toList()
          .cast<dynamic>();
      safeSetState(() {});
      _model.leadSurveyDataJson = getJsonField(
        _model.leadDataByCategory,
        r'''$.LeadSurvey''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      _model.leadTeleDataJson = getJsonField(
        _model.leadDataByCategory,
        r'''$.LeadTelesale''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      _model.leadAgentDataJson = getJsonField(
        _model.leadDataByCategory,
        r'''$.LeadAgent''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      _model.leadTruckDataJson = getJsonField(
        _model.leadDataByCategory,
        r'''$.LeadTruck''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      _model.leadOwnerDataJson = getJsonField(
        _model.leadDataByCategory,
        r'''$.OwnerLead''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      _model.currentShowingDataJson =
          _model.leadNotiModifyJson.toList().cast<dynamic>();
      _model.allLeadDataJson =
          _model.leadNotiModifyJson.toList().cast<dynamic>();
      _model.subChannelFilterList = getJsonField(
        _model.leadDataByCategory,
        r'''$.SubChannelFilter''',
        true,
      )!
          .toList()
          .cast<String>();
      _model.assetTypeFilterList = getJsonField(
        _model.leadDataByCategory,
        r'''$.AssetTypeFilter''',
        true,
      )!
          .toList()
          .cast<String>();
      _model.leadHPDataJson = getJsonField(
        _model.leadDataByCategory,
        r'''$.LeadHP''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      _model.leadTopupDataJson = getJsonField(
        _model.leadDataByCategory,
        r'''$.LeadTopup''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      safeSetState(() {});
      Navigator.pop(context);
    });

    _model.textFieldSearchTextController ??= TextEditingController();
    _model.textFieldSearchFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 90.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      builder: (context) => FutureBuilder<List<LeadChannelColorRecord>>(
        future: queryLeadChannelColorRecordOnce(
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
          List<LeadChannelColorRecord>
              leadNotiNewPageLeadChannelColorRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final leadNotiNewPageLeadChannelColorRecord =
              leadNotiNewPageLeadChannelColorRecordList.isNotEmpty
                  ? leadNotiNewPageLeadChannelColorRecordList.first
                  : null;

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
                  leading: InkWell(
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
                  title: Text(
                    'รายชื่อลีด',
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
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                  ),
                  actions: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            HapticFeedback.mediumImpact();
                            _model.currentShowingDataJson = functions
                                .reverseJsonList(
                                    _model.currentShowingDataJson.toList())!
                                .toList()
                                .cast<dynamic>();
                            safeSetState(() {});
                          },
                          child: FaIcon(
                            FontAwesomeIcons.sortAmountDown,
                            color: Color(0xFBFFFFFF),
                            size: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                  centerTitle: true,
                  elevation: 10.0,
                ),
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 35.0,
                                  child: custom_widgets.ShowDateTime(
                                    width: double.infinity,
                                    height: 35.0,
                                    currentTime: getCurrentTimestamp,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 69.0,
                                  child: ListView(
                                    padding: EdgeInsets.fromLTRB(
                                      8.0,
                                      0,
                                      8.0,
                                      0,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          HapticFeedback.mediumImpact();
                                          _model.currentShowingDataJson = _model
                                              .leadSurveyDataJson
                                              .toList()
                                              .cast<dynamic>();
                                          _model.selectedTab = 'Survey';
                                          safeSetState(() {});
                                          _model.filterAssetType = 'ทั้งหมด';
                                          _model.filterSubChennel = 'ทั้งหมด';
                                          safeSetState(() {});
                                          _model.filterList =
                                              functions.returnLeadFilterList(
                                                  _model.leadSurveyDataJson
                                                      .toList());
                                          safeSetState(() {});
                                          _model.subChannelFilterList =
                                              getJsonField(
                                            _model.filterList,
                                            r'''$.SubChannelFilter''',
                                            true,
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          _model.assetTypeFilterList =
                                              getJsonField(
                                            _model.filterList,
                                            r'''$.AssetTypeFilter''',
                                            true,
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.textFieldSearchTextController
                                                ?.clear();
                                          });
                                          await _model.listViewController3
                                              ?.animateTo(
                                            0,
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(24.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: 95.0,
                                            height: 69.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedTab ==
                                                      'Survey'
                                                  ? (leadNotiNewPageLeadChannelColorRecord
                                                      ?.color
                                                      ?.elementAtOrNull(functions
                                                          .getIndexOfSomethingList(
                                                              leadNotiNewPageLeadChannelColorRecord
                                                                  ?.leadChannel
                                                                  ?.toList(),
                                                              'Lead Survey')))
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(24.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    'เดินตลาด',
                                                    textAlign: TextAlign.center,
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
                                                          fontSize: 11.0,
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
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions.showNumberWithComma(
                                                        _model
                                                            .leadSurveyDataJson
                                                            .length
                                                            .toString()),
                                                    '0',
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
                                                        fontSize: 11.0,
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
                                                ),
                                              ].addToStart(
                                                  SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          HapticFeedback.mediumImpact();
                                          _model.currentShowingDataJson = _model
                                              .leadTopupDataJson
                                              .toList()
                                              .cast<dynamic>();
                                          _model.selectedTab = 'Topup';
                                          safeSetState(() {});
                                          _model.filterAssetType = 'ทั้งหมด';
                                          _model.filterSubChennel = 'ทั้งหมด';
                                          safeSetState(() {});
                                          _model.filterList =
                                              functions.returnLeadFilterList(
                                                  _model.leadTopupDataJson
                                                      .toList());
                                          safeSetState(() {});
                                          _model.subChannelFilterList =
                                              getJsonField(
                                            _model.filterList,
                                            r'''$.SubChannelFilter''',
                                            true,
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          _model.assetTypeFilterList =
                                              getJsonField(
                                            _model.filterList,
                                            r'''$.AssetTypeFilter''',
                                            true,
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.textFieldSearchTextController
                                                ?.clear();
                                          });
                                          await _model.listViewController3
                                              ?.animateTo(
                                            0,
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: 95.0,
                                            height: 69.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedTab ==
                                                      'Topup'
                                                  ? (leadNotiNewPageLeadChannelColorRecord
                                                      ?.color
                                                      ?.elementAtOrNull(functions
                                                          .getIndexOfSomethingList(
                                                              leadNotiNewPageLeadChannelColorRecord
                                                                  ?.leadChannel
                                                                  ?.toList(),
                                                              'Lead Topup')))
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    'เติมวงเงิน',
                                                    textAlign: TextAlign.center,
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
                                                              color: _model
                                                                          .selectedTab ==
                                                                      'Topup'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              fontSize: 11.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .showNumberWithComma(
                                                            valueOrDefault<
                                                                String>(
                                                      _model.leadTopupDataJson
                                                          .length
                                                          .toString(),
                                                      '0',
                                                    )),
                                                    '0',
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
                                                        color: _model
                                                                    .selectedTab ==
                                                                'Topup'
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                        fontSize: 11.0,
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
                                                ),
                                              ].addToStart(
                                                  SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          HapticFeedback.mediumImpact();
                                          _model.currentShowingDataJson = _model
                                              .leadTeleDataJson
                                              .toList()
                                              .cast<dynamic>();
                                          _model.selectedTab = 'Telesale';
                                          safeSetState(() {});
                                          _model.filterAssetType = 'ทั้งหมด';
                                          _model.filterSubChennel = 'ทั้งหมด';
                                          safeSetState(() {});
                                          _model.filterList =
                                              functions.returnLeadFilterList(
                                                  _model.leadTeleDataJson
                                                      .toList());
                                          safeSetState(() {});
                                          _model.subChannelFilterList =
                                              getJsonField(
                                            _model.filterList,
                                            r'''$.SubChannelFilter''',
                                            true,
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          _model.assetTypeFilterList =
                                              getJsonField(
                                            _model.filterList,
                                            r'''$.AssetTypeFilter''',
                                            true,
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.textFieldSearchTextController
                                                ?.clear();
                                          });
                                          await _model.listViewController3
                                              ?.animateTo(
                                            0,
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: 95.0,
                                            height: 69.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedTab ==
                                                      'Telesale'
                                                  ? (leadNotiNewPageLeadChannelColorRecord
                                                      ?.color
                                                      ?.elementAtOrNull(functions
                                                          .getIndexOfSomethingList(
                                                              leadNotiNewPageLeadChannelColorRecord
                                                                  ?.leadChannel
                                                                  ?.toList(),
                                                              'Lead Telesale')))
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    'เทเล',
                                                    textAlign: TextAlign.center,
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
                                                          fontSize: 11.0,
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
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .showNumberWithComma(
                                                            valueOrDefault<
                                                                String>(
                                                      _model.leadTeleDataJson
                                                          .length
                                                          .toString(),
                                                      '0',
                                                    )),
                                                    '0',
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
                                                        fontSize: 11.0,
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
                                                ),
                                              ].addToStart(
                                                  SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          HapticFeedback.mediumImpact();
                                          _model.currentShowingDataJson = _model
                                              .leadHPDataJson
                                              .toList()
                                              .cast<dynamic>();
                                          _model.selectedTab = 'HP';
                                          safeSetState(() {});
                                          _model.filterAssetType = 'ทั้งหมด';
                                          _model.filterSubChennel = 'ทั้งหมด';
                                          safeSetState(() {});
                                          _model.filterList =
                                              functions.returnLeadFilterList(
                                                  _model.leadHPDataJson
                                                      .toList());
                                          safeSetState(() {});
                                          _model.subChannelFilterList =
                                              getJsonField(
                                            _model.filterList,
                                            r'''$.SubChannelFilter''',
                                            true,
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          _model.assetTypeFilterList =
                                              getJsonField(
                                            _model.filterList,
                                            r'''$.AssetTypeFilter''',
                                            true,
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.textFieldSearchTextController
                                                ?.clear();
                                          });
                                          await _model.listViewController3
                                              ?.animateTo(
                                            0,
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: 95.0,
                                            height: 69.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedTab == 'HP'
                                                  ? (leadNotiNewPageLeadChannelColorRecord
                                                      ?.color
                                                      ?.elementAtOrNull(functions
                                                          .getIndexOfSomethingList(
                                                              leadNotiNewPageLeadChannelColorRecord
                                                                  ?.leadChannel
                                                                  ?.toList(),
                                                              'Lead HP')))
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    'เช่าซื้อ',
                                                    textAlign: TextAlign.center,
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
                                                          fontSize: 11.0,
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
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .showNumberWithComma(
                                                            valueOrDefault<
                                                                String>(
                                                      _model
                                                          .leadHPDataJson.length
                                                          .toString(),
                                                      '0',
                                                    )),
                                                    '0',
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
                                                        fontSize: 11.0,
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
                                                ),
                                              ].addToStart(
                                                  SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          HapticFeedback.mediumImpact();
                                          _model.currentShowingDataJson = _model
                                              .leadTruckDataJson
                                              .toList()
                                              .cast<dynamic>();
                                          _model.selectedTab = 'Truck';
                                          safeSetState(() {});
                                          _model.filterAssetType = 'ทั้งหมด';
                                          _model.filterSubChennel = 'ทั้งหมด';
                                          safeSetState(() {});
                                          _model.filterList =
                                              functions.returnLeadFilterList(
                                                  _model.leadTruckDataJson
                                                      .toList());
                                          safeSetState(() {});
                                          _model.subChannelFilterList =
                                              getJsonField(
                                            _model.filterList,
                                            r'''$.SubChannelFilter''',
                                            true,
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          _model.assetTypeFilterList =
                                              getJsonField(
                                            _model.filterList,
                                            r'''$.AssetTypeFilter''',
                                            true,
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.textFieldSearchTextController
                                                ?.clear();
                                          });
                                          await _model.listViewController3
                                              ?.animateTo(
                                            0,
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: 95.0,
                                            height: 69.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedTab ==
                                                      'Truck'
                                                  ? (leadNotiNewPageLeadChannelColorRecord
                                                      ?.color
                                                      ?.elementAtOrNull(functions
                                                          .getIndexOfSomethingList(
                                                              leadNotiNewPageLeadChannelColorRecord
                                                                  ?.leadChannel
                                                                  ?.toList(),
                                                              'Lead Truck')))
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    'รถบรรทุก',
                                                    textAlign: TextAlign.center,
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
                                                              color: _model
                                                                          .selectedTab ==
                                                                      'Truck'
                                                                  ? Colors.white
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              fontSize: 11.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .showNumberWithComma(
                                                            valueOrDefault<
                                                                String>(
                                                      _model.leadTruckDataJson
                                                          .length
                                                          .toString(),
                                                      '0',
                                                    )),
                                                    '0',
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
                                                        color: _model
                                                                    .selectedTab ==
                                                                'Truck'
                                                            ? Colors.white
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                        fontSize: 11.0,
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
                                                ),
                                              ].addToStart(
                                                  SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          HapticFeedback.mediumImpact();
                                          _model.currentShowingDataJson = _model
                                              .leadAgentDataJson
                                              .toList()
                                              .cast<dynamic>();
                                          _model.selectedTab = 'Agent';
                                          safeSetState(() {});
                                          _model.filterAssetType = 'ทั้งหมด';
                                          _model.filterSubChennel = 'ทั้งหมด';
                                          safeSetState(() {});
                                          _model.filterList =
                                              functions.returnLeadFilterList(
                                                  _model.leadAgentDataJson
                                                      .toList());
                                          safeSetState(() {});
                                          _model.subChannelFilterList =
                                              getJsonField(
                                            _model.filterList,
                                            r'''$.SubChannelFilter''',
                                            true,
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          _model.assetTypeFilterList =
                                              getJsonField(
                                            _model.filterList,
                                            r'''$.AssetTypeFilter''',
                                            true,
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          safeSetState(() {});
                                          safeSetState(() {
                                            _model.textFieldSearchTextController
                                                ?.clear();
                                          });
                                          await _model.listViewController3
                                              ?.animateTo(
                                            0,
                                            duration:
                                                Duration(milliseconds: 100),
                                            curve: Curves.ease,
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(24.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: 95.0,
                                            height: 69.0,
                                            decoration: BoxDecoration(
                                              color: _model.selectedTab ==
                                                      'Agent'
                                                  ? (leadNotiNewPageLeadChannelColorRecord
                                                      ?.color
                                                      ?.elementAtOrNull(functions
                                                          .getIndexOfSomethingList(
                                                              leadNotiNewPageLeadChannelColorRecord
                                                                  ?.leadChannel
                                                                  ?.toList(),
                                                              'Lead Agent')))
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(24.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    'ตัวแทน',
                                                    textAlign: TextAlign.center,
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
                                                          fontSize: 11.0,
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
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .showNumberWithComma(
                                                            valueOrDefault<
                                                                String>(
                                                      _model.leadAgentDataJson
                                                          .length
                                                          .toString(),
                                                      '0',
                                                    )),
                                                    '0',
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
                                                        fontSize: 11.0,
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
                                                ),
                                              ].addToStart(
                                                  SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 2.0)),
                                    controller: _model.listViewController1,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Container(
                                    height: 69.0,
                                    decoration: BoxDecoration(),
                                    child: ListView(
                                      padding: EdgeInsets.fromLTRB(
                                        8.0,
                                        0,
                                        8.0,
                                        0,
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(24.0),
                                              bottomRight: Radius.circular(0.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: 95.0,
                                            height: 69.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(24.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                              border: Border.all(
                                                color: _model.selectedTab ==
                                                        'Owner'
                                                    ? Color(0xFFFF6500)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                width: _model.selectedTab ==
                                                        'Owner'
                                                    ? 1.5
                                                    : 0.0,
                                              ),
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                HapticFeedback.mediumImpact();
                                                _model.currentShowingDataJson =
                                                    _model.leadOwnerDataJson
                                                        .toList()
                                                        .cast<dynamic>();
                                                _model.selectedTab = 'Owner';
                                                safeSetState(() {});
                                                _model.filterAssetType =
                                                    'ทั้งหมด';
                                                _model.filterSubChennel =
                                                    'ทั้งหมด';
                                                safeSetState(() {});
                                                _model.filterList = functions
                                                    .returnLeadFilterList(_model
                                                        .leadOwnerDataJson
                                                        .toList());
                                                safeSetState(() {});
                                                _model.subChannelFilterList =
                                                    getJsonField(
                                                  _model.filterList,
                                                  r'''$.SubChannelFilter''',
                                                  true,
                                                )!
                                                        .toList()
                                                        .cast<String>();
                                                _model.assetTypeFilterList =
                                                    getJsonField(
                                                  _model.filterList,
                                                  r'''$.AssetTypeFilter''',
                                                  true,
                                                )!
                                                        .toList()
                                                        .cast<String>();
                                                safeSetState(() {});
                                                await _model.listViewController3
                                                    ?.animateTo(
                                                  0,
                                                  duration: Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Text(
                                                        'ลีดส่วนตัว',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      functions
                                                          .showNumberWithComma(
                                                              valueOrDefault<
                                                                  String>(
                                                        _model.leadOwnerDataJson
                                                            .length
                                                            .toString(),
                                                        '0',
                                                      )),
                                                      '0',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF101213),
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ].addToStart(
                                                    SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight:
                                                  Radius.circular(24.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: 95.0,
                                            height: 69.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(24.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                              border: Border.all(
                                                color: _model.selectedTab ==
                                                        'All'
                                                    ? Color(0xFFFF6500)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                width:
                                                    _model.selectedTab == 'All'
                                                        ? 1.5
                                                        : 0.0,
                                              ),
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                HapticFeedback.mediumImpact();
                                                _model.currentShowingDataJson =
                                                    _model.leadNotiModifyJson
                                                        .toList()
                                                        .cast<dynamic>();
                                                _model.selectedTab = 'All';
                                                safeSetState(() {});
                                                _model.filterAssetType =
                                                    'ทั้งหมด';
                                                _model.filterSubChennel =
                                                    'ทั้งหมด';
                                                safeSetState(() {});
                                                _model.filterList = functions
                                                    .returnLeadFilterList(_model
                                                        .leadNotiModifyJson
                                                        .toList());
                                                safeSetState(() {});
                                                _model.subChannelFilterList =
                                                    getJsonField(
                                                  _model.filterList,
                                                  r'''$.SubChannelFilter''',
                                                  true,
                                                )!
                                                        .toList()
                                                        .cast<String>();
                                                _model.assetTypeFilterList =
                                                    getJsonField(
                                                  _model.filterList,
                                                  r'''$.AssetTypeFilter''',
                                                  true,
                                                )!
                                                        .toList()
                                                        .cast<String>();
                                                safeSetState(() {});
                                                await _model.listViewController3
                                                    ?.animateTo(
                                                  0,
                                                  duration: Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Text(
                                                      'ลีดทั้งหมด',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .outfit(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 11.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      functions
                                                          .showNumberWithComma(
                                                              valueOrDefault<
                                                                  String>(
                                                        '${valueOrDefault<String>(
                                                          GetLeadDetailAPICall
                                                              .leadDataJson(
                                                            (_model.getLeadDetail
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.length?.toString(),
                                                          '0',
                                                        )}',
                                                        '0',
                                                      )),
                                                      '0',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF101213),
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ].addToStart(
                                                    SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              var _shouldSetState = false;
                                              if (() {
                                                if (_model.selectedTab ==
                                                    'Survey') {
                                                  return (_model
                                                          .leadSurveyDataJson
                                                          .length >
                                                      0);
                                                } else if (_model.selectedTab ==
                                                    'Telesale') {
                                                  return (_model
                                                          .leadTeleDataJson
                                                          .length >
                                                      0);
                                                } else if (_model.selectedTab ==
                                                    'Agent') {
                                                  return (_model
                                                          .leadAgentDataJson
                                                          .length >
                                                      0);
                                                } else if (_model.selectedTab ==
                                                    'Truck') {
                                                  return (_model
                                                          .leadTruckDataJson
                                                          .length >
                                                      0);
                                                } else if (_model.selectedTab ==
                                                    'All') {
                                                  return (_model
                                                          .leadNotiModifyJson
                                                          .length >
                                                      0);
                                                } else if (_model.selectedTab ==
                                                    'search') {
                                                  return false;
                                                } else {
                                                  return (_model
                                                          .leadOwnerDataJson
                                                          .length >
                                                      0);
                                                }
                                              }()) {
                                                await showDialog(
                                                  barrierColor:
                                                      Color(0xC0000000),
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Container(
                                                            height: 350.0,
                                                            child:
                                                                FilterLeadComponentNewWidget(
                                                              filterNameList1:
                                                                  _model
                                                                      .subChannelFilterList,
                                                              filterValueList1:
                                                                  _model
                                                                      .subChannelFilterList,
                                                              filterTitle:
                                                                  'กรองข้อมูล',
                                                              filterNameList2:
                                                                  _model
                                                                      .assetTypeFilterList,
                                                              filterValueList2:
                                                                  _model
                                                                      .assetTypeFilterList,
                                                              filter1Name:
                                                                  'ที่มาของลูกค้า',
                                                              filter2Name:
                                                                  'ประเภททรัพย์',
                                                              currentFilter1: _model
                                                                  .filterSubChennel,
                                                              currentFilter2: _model
                                                                  .filterAssetType,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => safeSetState(
                                                    () => _model.filterOutput =
                                                        value));

                                                _shouldSetState = true;
                                                if (!(('${_model.filterOutput?.toString()}' !=
                                                        'null') &&
                                                    ('${_model.filterOutput?.toString()}' !=
                                                        ''))) {
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                _model.filterSubChennel =
                                                    getJsonField(
                                                  _model.filterOutput,
                                                  r'''$.filter1Value''',
                                                ).toString();
                                                _model.filterAssetType =
                                                    getJsonField(
                                                  _model.filterOutput,
                                                  r'''$.filter2Value''',
                                                ).toString();
                                                safeSetState(() {});
                                                _model.currentShowingDataJson =
                                                    functions
                                                        .returnLeadByField(
                                                            () {
                                                              if (_model
                                                                      .selectedTab ==
                                                                  'Survey') {
                                                                return _model
                                                                    .leadSurveyDataJson;
                                                              } else if (_model
                                                                      .selectedTab ==
                                                                  'Telesale') {
                                                                return _model
                                                                    .leadTeleDataJson;
                                                              } else if (_model
                                                                      .selectedTab ==
                                                                  'Agent') {
                                                                return _model
                                                                    .leadAgentDataJson;
                                                              } else if (_model
                                                                      .selectedTab ==
                                                                  'Truck') {
                                                                return _model
                                                                    .leadTruckDataJson;
                                                              } else if (_model
                                                                      .selectedTab ==
                                                                  'All') {
                                                                return _model
                                                                    .allLeadDataJson;
                                                              } else {
                                                                return _model
                                                                    .leadOwnerDataJson;
                                                              }
                                                            }()
                                                                .toList(),
                                                            _model
                                                                .filterSubChennel,
                                                            _model
                                                                .filterAssetType)!
                                                        .toList()
                                                        .cast<dynamic>();
                                                safeSetState(() {});
                                              } else {
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(24.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 95.0,
                                                    height: 69.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                24.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                      border: Border.all(
                                                        color: _model
                                                                    .selectedTab ==
                                                                'SubChannelFilter'
                                                            ? Color(0xFFFF6500)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        width: _model
                                                                    .selectedTab ==
                                                                'SubChannelFilter'
                                                            ? 1.5
                                                            : 0.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Text(
                                                              'ที่มาของลูกค้า',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .outfit(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        11.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          _model
                                                              .filterSubChennel,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF101213),
                                                                fontSize: 11.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].addToStart(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(24.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                  ),
                                                  child: Container(
                                                    width: 95.0,
                                                    height: 69.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                24.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                      border: Border.all(
                                                        color: _model
                                                                    .selectedTab ==
                                                                'AssetTypeFilter'
                                                            ? Color(0xFFFF6500)
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        width: _model
                                                                    .selectedTab ==
                                                                'AssetTypeFilter'
                                                            ? 1.5
                                                            : 0.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Text(
                                                            'ประเภทสินทรัพย์',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      11.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          _model
                                                              .filterAssetType,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xFF101213),
                                                                fontSize: 11.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].addToStart(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 2.0)),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 2.0)),
                                      controller: _model.listViewController2,
                                    ),
                                  ),
                                ),
                              ),
                              if (false)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.45,
                                          height: 140.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          _model.currentShowingDataJson =
                                                              _model
                                                                  .leadSurveyDataJson
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
                                                          _model.selectedTab =
                                                              'Survey';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model
                                                                .textFieldSearchTextController
                                                                ?.clear();
                                                          });
                                                          await _model
                                                              .listViewController3
                                                              ?.animateTo(
                                                            0,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 69.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .selectedTab ==
                                                                    'Survey'
                                                                ? (leadNotiNewPageLeadChannelColorRecord
                                                                    ?.color
                                                                    ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                        leadNotiNewPageLeadChannelColorRecord
                                                                            ?.leadChannel
                                                                            ?.toList(),
                                                                        'Lead Survey')))
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      24.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child: Text(
                                                                  'Survey',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showNumberWithComma(_model
                                                                      .leadSurveyDataJson
                                                                      .length
                                                                      .toString()),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          _model.currentShowingDataJson =
                                                              _model
                                                                  .leadTeleDataJson
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
                                                          _model.selectedTab =
                                                              'Telesale';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model
                                                                .textFieldSearchTextController
                                                                ?.clear();
                                                          });
                                                          await _model
                                                              .listViewController3
                                                              ?.animateTo(
                                                            0,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 69.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .selectedTab ==
                                                                    'Telesale'
                                                                ? (leadNotiNewPageLeadChannelColorRecord
                                                                    ?.color
                                                                    ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                        leadNotiNewPageLeadChannelColorRecord
                                                                            ?.leadChannel
                                                                            ?.toList(),
                                                                        'Lead Telesale')))
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      24.0),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child: Text(
                                                                  'Telesale',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showNumberWithComma(
                                                                      valueOrDefault<
                                                                          String>(
                                                                    _model
                                                                        .leadTeleDataJson
                                                                        .length
                                                                        .toString(),
                                                                    '0',
                                                                  )),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          _model.currentShowingDataJson =
                                                              _model
                                                                  .leadAgentDataJson
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
                                                          _model.selectedTab =
                                                              'Agent';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model
                                                                .textFieldSearchTextController
                                                                ?.clear();
                                                          });
                                                          await _model
                                                              .listViewController3
                                                              ?.animateTo(
                                                            0,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 69.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .selectedTab ==
                                                                    'Agent'
                                                                ? (leadNotiNewPageLeadChannelColorRecord
                                                                    ?.color
                                                                    ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                        leadNotiNewPageLeadChannelColorRecord
                                                                            ?.leadChannel
                                                                            ?.toList(),
                                                                        'Lead Agent')))
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      24.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child: Text(
                                                                  'Agent',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showNumberWithComma(
                                                                      valueOrDefault<
                                                                          String>(
                                                                    _model
                                                                        .leadAgentDataJson
                                                                        .length
                                                                        .toString(),
                                                                    '0',
                                                                  )),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          _model.currentShowingDataJson =
                                                              _model
                                                                  .leadTruckDataJson
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
                                                          _model.selectedTab =
                                                              'Truck';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model
                                                                .textFieldSearchTextController
                                                                ?.clear();
                                                          });
                                                          await _model
                                                              .listViewController3
                                                              ?.animateTo(
                                                            0,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 69.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .selectedTab ==
                                                                    'Truck'
                                                                ? (leadNotiNewPageLeadChannelColorRecord
                                                                    ?.color
                                                                    ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                        leadNotiNewPageLeadChannelColorRecord
                                                                            ?.leadChannel
                                                                            ?.toList(),
                                                                        'Lead Truck')))
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  2.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          24.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child: Text(
                                                                  'Truck',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: _model.selectedTab ==
                                                                                'Truck'
                                                                            ? Colors.white
                                                                            : FlutterFlowTheme.of(context).primaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showNumberWithComma(
                                                                      valueOrDefault<
                                                                          String>(
                                                                    _model
                                                                        .leadTruckDataJson
                                                                        .length
                                                                        .toString(),
                                                                    '0',
                                                                  )),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: _model.selectedTab ==
                                                                              'Truck'
                                                                          ? Colors
                                                                              .white
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 8.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            HapticFeedback.mediumImpact();
                                            FFAppState().leadChannelSelected =
                                                'All';
                                            FFAppState().update(() {});
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.45,
                                            height: 140.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: Stack(
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: Container(
                                                            height: 69.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        24.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        24.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: _model
                                                                            .selectedTab ==
                                                                        'Owner'
                                                                    ? Color(
                                                                        0xFFFF6500)
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                width: _model
                                                                            .selectedTab ==
                                                                        'Owner'
                                                                    ? 3.0
                                                                    : 0.0,
                                                              ),
                                                            ),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                HapticFeedback
                                                                    .mediumImpact();
                                                                _model.currentShowingDataJson = _model
                                                                    .leadOwnerDataJson
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                                _model.selectedTab =
                                                                    'Owner';
                                                                safeSetState(
                                                                    () {});
                                                                await _model
                                                                    .listViewController3
                                                                    ?.animateTo(
                                                                  0,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .showNumberWithComma(valueOrDefault<String>(
                                                                            _model.leadOwnerDataJson.length.toString(),
                                                                            '0',
                                                                          )),
                                                                          '0',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .displaySmall
                                                                            .override(
                                                                              font: GoogleFonts.outfit(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF101213),
                                                                              fontSize: 20.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'จำนวนลีดส่วนตัว',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                font: GoogleFonts.outfit(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                ),
                                                                                color: Color(0xFF57636C),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            height: 69.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        24.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        24.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: _model
                                                                            .selectedTab ==
                                                                        'All'
                                                                    ? Color(
                                                                        0xFFFF6500)
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                width:
                                                                    _model.selectedTab ==
                                                                            'All'
                                                                        ? 3.0
                                                                        : 0.0,
                                                              ),
                                                            ),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                HapticFeedback
                                                                    .mediumImpact();
                                                                _model.currentShowingDataJson = _model
                                                                    .leadNotiModifyJson
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                                _model.selectedTab =
                                                                    'All';
                                                                safeSetState(
                                                                    () {});
                                                                await _model
                                                                    .listViewController3
                                                                    ?.animateTo(
                                                                  0,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          100),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .stretch,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            4.0,
                                                                            12.0,
                                                                            4.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        functions
                                                                            .showNumberWithComma(valueOrDefault<String>(
                                                                          '${valueOrDefault<String>(
                                                                            GetLeadDetailAPICall.leadDataJson(
                                                                              (_model.getLeadDetail?.jsonBody ?? ''),
                                                                            )?.length?.toString(),
                                                                            '0',
                                                                          )}',
                                                                          '0',
                                                                        )),
                                                                        '0',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.outfit(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).displaySmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            4.0),
                                                                    child: Text(
                                                                      'จำนวนลีดทั้งหมด',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.outfit(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Color(0xFF57636C),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                4.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Divider(
                                                          thickness: 1.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation']!),
                                      ),
                                    ),
                                  ],
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Container(
                                  height: 60.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: TextFormField(
                                              controller: _model
                                                  .textFieldSearchTextController,
                                              focusNode: _model
                                                  .textFieldSearchFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: false,
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
                                                    'ค้นหาชื่อ , เบอร์โทร, รหัสสาขา, LeadID',
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
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
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
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
                                                        fontSize: 16.0,
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
                                                  .textFieldSearchTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              HapticFeedback.mediumImpact();
                                              _model.leadSearchDataJson = functions
                                                  .returnLeadListBySearch(
                                                      _model.leadNotiModifyJson
                                                          .toList(),
                                                      _model
                                                          .textFieldSearchTextController
                                                          .text)!
                                                  .toList()
                                                  .cast<dynamic>();
                                              safeSetState(() {});
                                              _model.currentShowingDataJson =
                                                  _model.leadSearchDataJson
                                                      .toList()
                                                      .cast<dynamic>();
                                              _model.selectedTab = 'search';
                                              _model.filterSubChennel =
                                                  'ทั้งหมด';
                                              _model.filterAssetType =
                                                  'ทั้งหมด';
                                              safeSetState(() {});
                                              await _model.listViewController3
                                                  ?.animateTo(
                                                0,
                                                duration:
                                                    Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                              await actions.hideKeyboardAction(
                                                context,
                                              );
                                            },
                                            child: Container(
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Icon(
                                                Icons.search_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              HapticFeedback.mediumImpact();
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text('clear'),
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
                                              _model.currentShowingDataJson =
                                                  _model.leadNotiModifyJson
                                                      .toList()
                                                      .cast<dynamic>();
                                              _model.selectedTab = 'All';
                                              safeSetState(() {});
                                              await _model.listViewController3
                                                  ?.animateTo(
                                                0,
                                                duration:
                                                    Duration(milliseconds: 100),
                                                curve: Curves.ease,
                                              );
                                              safeSetState(() {
                                                _model
                                                    .textFieldSearchTextController
                                                    ?.clear();
                                              });
                                            },
                                            child: Container(
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Icon(
                                                Icons.cancel_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
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
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.59,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              if (_model.currentShowingDataJson.length > 0) {
                                return Visibility(
                                  visible:
                                      _model.currentShowingDataJson.length > 0,
                                  child: Builder(
                                    builder: (context) {
                                      final leadListItem = _model
                                          .currentShowingDataJson
                                          .toList();

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: leadListItem.length,
                                        itemBuilder:
                                            (context, leadListItemIndex) {
                                          final leadListItemItem =
                                              leadListItem[leadListItemIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 8.0, 12.0, 12.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: '${getJsonField(
                                                          leadListItemItem,
                                                          r'''$.actionCall''',
                                                        ).toString()}' !=
                                                        'N'
                                                    ? valueOrDefault<Color>(
                                                        '${getJsonField(
                                                                  leadListItemItem,
                                                                  r'''$.actionCall''',
                                                                ).toString()}' ==
                                                                'Call'
                                                            ? Color(0xFFFFFFE9)
                                                            : Color(0xFFE9FFEA),
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                      )
                                                    : valueOrDefault<Color>(
                                                        '${getJsonField(
                                                                  leadListItemItem,
                                                                  r'''$.call_status''',
                                                                ).toString()}' !=
                                                                'NEW'
                                                            ? Color(0xFFE9FFEA)
                                                            : Colors.white,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                      ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x2B202529),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: 110.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        () {
                                                          if ('${getJsonField(
                                                                leadListItemItem,
                                                                r'''$.channel''',
                                                              ).toString()}' ==
                                                              'Lead Survey') {
                                                            return valueOrDefault<
                                                                Color>(
                                                              leadNotiNewPageLeadChannelColorRecord
                                                                  ?.color
                                                                  ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                      leadNotiNewPageLeadChannelColorRecord
                                                                          ?.leadChannel
                                                                          ?.toList(),
                                                                      'Lead Survey')),
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                            );
                                                          } else if ('${getJsonField(
                                                                leadListItemItem,
                                                                r'''$.channel''',
                                                              ).toString()}' ==
                                                              'Lead Telesale') {
                                                            return (leadNotiNewPageLeadChannelColorRecord
                                                                ?.color
                                                                ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                    leadNotiNewPageLeadChannelColorRecord
                                                                        ?.leadChannel
                                                                        ?.toList(),
                                                                    'Lead Telesale')));
                                                          } else if ('${getJsonField(
                                                                leadListItemItem,
                                                                r'''$.channel''',
                                                              ).toString()}' ==
                                                              'Lead Agent') {
                                                            return (leadNotiNewPageLeadChannelColorRecord
                                                                ?.color
                                                                ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                    leadNotiNewPageLeadChannelColorRecord
                                                                        ?.leadChannel
                                                                        ?.toList(),
                                                                    'Lead Agent')));
                                                          } else if ('${getJsonField(
                                                                leadListItemItem,
                                                                r'''$.channel''',
                                                              ).toString()}' ==
                                                              'Lead Truck') {
                                                            return (leadNotiNewPageLeadChannelColorRecord
                                                                ?.color
                                                                ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                    leadNotiNewPageLeadChannelColorRecord
                                                                        ?.leadChannel
                                                                        ?.toList(),
                                                                    'Lead Truck')));
                                                          } else if ('${getJsonField(
                                                                leadListItemItem,
                                                                r'''$.channel''',
                                                              ).toString()}' ==
                                                              'Lead HP') {
                                                            return (leadNotiNewPageLeadChannelColorRecord
                                                                ?.color
                                                                ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                    leadNotiNewPageLeadChannelColorRecord
                                                                        ?.leadChannel
                                                                        ?.toList(),
                                                                    'Lead HP')));
                                                          } else if ('${getJsonField(
                                                                leadListItemItem,
                                                                r'''$.channel''',
                                                              ).toString()}' ==
                                                              'Lead Topup') {
                                                            return (leadNotiNewPageLeadChannelColorRecord
                                                                ?.color
                                                                ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                    leadNotiNewPageLeadChannelColorRecord
                                                                        ?.leadChannel
                                                                        ?.toList(),
                                                                    'Lead Topup')));
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1;
                                                          }
                                                        }(),
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                12.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            4.0,
                                                                            0.0,
                                                                            4.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Text(
                                                                              '${getJsonField(
                                                                                leadListItemItem,
                                                                                r'''$.channel''',
                                                                              ).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    font: GoogleFonts.outfit(
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 27.0,
                                                                                  height: 27.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFF1F4F8),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Icon(
                                                                                    Icons.timer_outlined,
                                                                                    color: Colors.black,
                                                                                    size: 20.0,
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    () {
                                                                                      if ('${getJsonField(
                                                                                            leadListItemItem,
                                                                                            r'''$.days_remaining''',
                                                                                          ).toString()}' ==
                                                                                          '0') {
                                                                                        return 'ไม่หมดอายุ';
                                                                                      } else if ('${getJsonField(
                                                                                            leadListItemItem,
                                                                                            r'''$.days_remaining''',
                                                                                          ).toString()}' ==
                                                                                          '1') {
                                                                                        return 'วันสุดท้าย';
                                                                                      } else {
                                                                                        return '${getJsonField(
                                                                                          leadListItemItem,
                                                                                          r'''$.days_remaining''',
                                                                                        ).toString()} วัน';
                                                                                      }
                                                                                    }(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.outfit(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: '${getJsonField(
                                                                                                    leadListItemItem,
                                                                                                    r'''$.days_remaining''',
                                                                                                  ).toString()}' ==
                                                                                                  '1'
                                                                                              ? Color(0xFFFF0000)
                                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Text(
                                                                              '${'${getJsonField(
                                                                                leadListItemItem,
                                                                                r'''$.first_name''',
                                                                              ).toString()}'} ${functions.showCensorPhoneNumber('${getJsonField(
                                                                                leadListItemItem,
                                                                                r'''$.phone_number''',
                                                                              ).toString()}')}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'Lead ID: ${'${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.lead_id''',
                                                                        ).toString()}'} (${'${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.branch_code''',
                                                                        ).toString()}'})',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              font: GoogleFonts.outfit(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF57636C),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'หลักทรัพย์: ${'${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.car_vehicle_name''',
                                                                        ).toString()}'}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              font: GoogleFonts.outfit(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF57636C),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'ยอดขอ: ${functions.returnNumberWithComma2Decimal('${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.amount_request''',
                                                                        ).toString()}')} บาท',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              font: GoogleFonts.outfit(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF57636C),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if ('${getJsonField(
                                                                      leadListItemItem,
                                                                      r'''$.StatusContract''',
                                                                    ).toString()}' !=
                                                                    'ทำสัญญาแล้ว')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        var _shouldSetState =
                                                                            false;
                                                                        HapticFeedback
                                                                            .mediumImpact();
                                                                        if (!functions
                                                                            .checkPhoneNumberChar('${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.phone_number''',
                                                                        ).toString()}')) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  content: Text('เบอร์โทรไม่ถูกต้อง ไม่สามารถโทรได้'),
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
                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    content: Text('คุณต้องการจะโทรออกหรือไม่?'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: Text('ยกเลิก'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: Text('โทร'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                        if (!confirmDialogResponse) {
                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                        if ('${getJsonField(
                                                                              leadListItemItem,
                                                                              r'''$.call_status''',
                                                                            ).toString()}' ==
                                                                            'NEW') {}
                                                                        _model.addCalledLead =
                                                                            await AddPhoneCalledLeadAPICall.call(
                                                                          apiUrl:
                                                                              FFAppState().apiURLLocalState,
                                                                          leadID:
                                                                              '${getJsonField(
                                                                            leadListItemItem,
                                                                            r'''$.lead_id''',
                                                                          ).toString()}',
                                                                          token:
                                                                              FFAppState().accessToken,
                                                                        );

                                                                        _shouldSetState =
                                                                            true;
                                                                        await actions
                                                                            .open3CXAction(
                                                                          '${getJsonField(
                                                                            leadListItemItem,
                                                                            r'''$.phone_number''',
                                                                          ).toString()}',
                                                                        );
                                                                        _model.leadDataByCategory = functions.returnLeadListByChannel(
                                                                            functions
                                                                                .updateActionCall(
                                                                                    _model.leadNotiModifyJson.toList(),
                                                                                    '${getJsonField(
                                                                                      leadListItemItem,
                                                                                      r'''$.lead_id''',
                                                                                    ).toString()}',
                                                                                    'Call')
                                                                                ?.toList(),
                                                                            FFAppState().employeeID);
                                                                        safeSetState(
                                                                            () {});
                                                                        _model.leadNotiModifyJson = functions
                                                                            .updateActionCall(
                                                                                _model.leadNotiModifyJson.toList(),
                                                                                '${getJsonField(
                                                                                  leadListItemItem,
                                                                                  r'''$.lead_id''',
                                                                                ).toString()}',
                                                                                'Call')!
                                                                            .toList()
                                                                            .cast<dynamic>();
                                                                        safeSetState(
                                                                            () {});
                                                                        _model
                                                                            .leadSurveyDataJson = getJsonField(
                                                                          _model
                                                                              .leadDataByCategory,
                                                                          r'''$.LeadSurvey''',
                                                                          true,
                                                                        )!
                                                                            .toList()
                                                                            .cast<dynamic>();
                                                                        _model
                                                                            .leadTeleDataJson = getJsonField(
                                                                          _model
                                                                              .leadDataByCategory,
                                                                          r'''$.LeadTelesale''',
                                                                          true,
                                                                        )!
                                                                            .toList()
                                                                            .cast<dynamic>();
                                                                        _model
                                                                            .leadAgentDataJson = getJsonField(
                                                                          _model
                                                                              .leadDataByCategory,
                                                                          r'''$.LeadAgent''',
                                                                          true,
                                                                        )!
                                                                            .toList()
                                                                            .cast<dynamic>();
                                                                        _model
                                                                            .leadTruckDataJson = getJsonField(
                                                                          _model
                                                                              .leadDataByCategory,
                                                                          r'''$.LeadTruck''',
                                                                          true,
                                                                        )!
                                                                            .toList()
                                                                            .cast<dynamic>();
                                                                        _model
                                                                            .leadOwnerDataJson = getJsonField(
                                                                          _model
                                                                              .leadDataByCategory,
                                                                          r'''$.OwnerLead''',
                                                                          true,
                                                                        )!
                                                                            .toList()
                                                                            .cast<dynamic>();
                                                                        _model.allLeadDataJson = _model
                                                                            .leadNotiModifyJson
                                                                            .toList()
                                                                            .cast<dynamic>();
                                                                        _model
                                                                            .leadHPDataJson = getJsonField(
                                                                          _model
                                                                              .leadDataByCategory,
                                                                          r'''$.LeadHP''',
                                                                          true,
                                                                        )!
                                                                            .toList()
                                                                            .cast<dynamic>();
                                                                        safeSetState(
                                                                            () {});
                                                                        _model
                                                                            .currentShowingDataJson = () {
                                                                          if (_model.selectedTab ==
                                                                              'Telesale') {
                                                                            return _model.leadTeleDataJson;
                                                                          } else if (_model.selectedTab ==
                                                                              'Survey') {
                                                                            return _model.leadSurveyDataJson;
                                                                          } else if (_model.selectedTab ==
                                                                              'Agent') {
                                                                            return _model.leadAgentDataJson;
                                                                          } else if (_model.selectedTab ==
                                                                              'Owner') {
                                                                            return _model.leadOwnerDataJson;
                                                                          } else if (_model.selectedTab ==
                                                                              'Truck') {
                                                                            return _model.leadTruckDataJson;
                                                                          } else if (_model.selectedTab ==
                                                                              'HP') {
                                                                            return _model.leadHPDataJson;
                                                                          } else {
                                                                            return _model.leadNotiModifyJson;
                                                                          }
                                                                        }()
                                                                            .toList()
                                                                            .cast<dynamic>();
                                                                        safeSetState(
                                                                            () {});
                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                      },
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(12.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(12.0),
                                                                        ),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/call-pic.gif',
                                                                          width:
                                                                              70.0,
                                                                          height:
                                                                              70.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ('${getJsonField(
                                                                      leadListItemItem,
                                                                      r'''$.StatusContract''',
                                                                    ).toString()}' ==
                                                                    'ทำสัญญาแล้ว')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(12.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(12.0),
                                                                      ),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/favpng_logo-telephone-call-icon-black.png',
                                                                        width:
                                                                            70.0,
                                                                        height:
                                                                            70.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (('${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.countCall''',
                                                                        ).toString()}' !=
                                                                        '0') &&
                                                                    ('${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.countCall''',
                                                                        ).toString()}' !=
                                                                        'NEW'))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${getJsonField(
                                                                                leadListItemItem,
                                                                                r'''$.countCall''',
                                                                              ).toString()}' ==
                                                                              '0'
                                                                          ? 'ยังไม่โทร'
                                                                          : 'โทร ${'${getJsonField(
                                                                              leadListItemItem,
                                                                              r'''$.countCall''',
                                                                            ).toString()}'} ครั้ง',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.poppins(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color: '${getJsonField(
                                                                                      leadListItemItem,
                                                                                      r'''$.countCall''',
                                                                                    ).toString()}' ==
                                                                                    '0'
                                                                                ? Color(0xFFFF0000)
                                                                                : Colors.black,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    16.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    () {
                                                                      if ('${getJsonField(
                                                                            leadListItemItem,
                                                                            r'''$.StatusContract''',
                                                                          ).toString()}' ==
                                                                          'ทำสัญญาแล้ว') {
                                                                        return '${'${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.StatusContract''',
                                                                        ).toString()}'}';
                                                                      } else if ('${getJsonField(
                                                                            leadListItemItem,
                                                                            r'''$.call_status''',
                                                                          ).toString()}' !=
                                                                          'NEW') {
                                                                        return '${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.call_status''',
                                                                        ).toString()} ${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.statusCallOut''',
                                                                        ).toString()}';
                                                                      } else {
                                                                        return 'ยังไม่ได้โทร';
                                                                      }
                                                                    }(),
                                                                    '[contract_status]',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .outfit(
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFFFF0000),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                      "Hm",
                                                                      functions
                                                                          .parseStringToDatetime(
                                                                              '${getJsonField(
                                                                        leadListItemItem,
                                                                        r'''$.created_at''',
                                                                      ).toString()}'),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.outfit(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                      "d/M/y",
                                                                      functions
                                                                          .parseStringToDatetime(
                                                                              '${getJsonField(
                                                                        leadListItemItem,
                                                                        r'''$.created_at''',
                                                                      ).toString()}'),
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.outfit(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    16.0,
                                                                    8.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                var _shouldSetState =
                                                                    false;
                                                                _model.getCalledStatusCode =
                                                                    await GetLeadCalledStatusDropdownAPICall
                                                                        .call(
                                                                  apiUrl: FFAppState()
                                                                      .apiURLLocalState,
                                                                  token: FFAppState()
                                                                      .accessToken,
                                                                  leadChannel:
                                                                      '${functions.getLeadChannelCode('${getJsonField(
                                                                    leadListItemItem,
                                                                    r'''$.channel''',
                                                                  ).toString()}')}',
                                                                );

                                                                _shouldSetState =
                                                                    true;
                                                                if (!(((_model.getCalledStatusCode?.statusCode ??
                                                                            200) ==
                                                                        200) &&
                                                                    (GetLeadCalledStatusDropdownAPICall
                                                                            .statusLayer1(
                                                                          (_model.getCalledStatusCode?.jsonBody ??
                                                                              ''),
                                                                        ) ==
                                                                        200))) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          content:
                                                                              Text('Connection Status ${(_model.getCalledStatusCode?.statusCode ?? 200).toString()} Status Layer1 ${GetLeadCalledStatusDropdownAPICall.statusLayer1(
                                                                            (_model.getCalledStatusCode?.jsonBody ??
                                                                                ''),
                                                                          )?.toString()}'),
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
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  barrierColor:
                                                                      Color(
                                                                          0x00000000),
                                                                  isDismissible:
                                                                      false,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(context)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.6,
                                                                            child:
                                                                                SavedLeadCalledStatusWidget(
                                                                              leadChannel: '${getJsonField(
                                                                                leadListItemItem,
                                                                                r'''$.channel''',
                                                                              ).toString()}',
                                                                              leadId: '${getJsonField(
                                                                                leadListItemItem,
                                                                                r'''$.lead_id''',
                                                                              ).toString()}',
                                                                              callStatusId: GetLeadCalledStatusDropdownAPICall.callStatusId(
                                                                                (_model.getCalledStatusCode?.jsonBody ?? ''),
                                                                              ),
                                                                              callStatussName: GetLeadCalledStatusDropdownAPICall.callStatusName(
                                                                                (_model.getCalledStatusCode?.jsonBody ?? ''),
                                                                              ),
                                                                              leadIndex: leadListItemIndex,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(() =>
                                                                        _model.savedCallStatus =
                                                                            value));

                                                                _shouldSetState =
                                                                    true;
                                                                if (('${_model.savedCallStatus}' !=
                                                                        '') &&
                                                                    ('${_model.savedCallStatus}' !=
                                                                        'null')) {
                                                                  _model.leadDataByCategory = functions.returnLeadListByChannel(
                                                                      functions
                                                                          .updateActionSave(
                                                                              _model.leadNotiModifyJson.toList(),
                                                                              '${getJsonField(
                                                                                leadListItemItem,
                                                                                r'''$.lead_id''',
                                                                              ).toString()}',
                                                                              'Save',
                                                                              FFAppState().savingLeadCallStatus,
                                                                              FFAppState().savingLeadStatusCallOut)
                                                                          ?.toList(),
                                                                      FFAppState().employeeID);
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.leadNotiModifyJson = functions
                                                                      .updateActionSave(
                                                                          _model.leadNotiModifyJson.toList(),
                                                                          '${getJsonField(
                                                                            leadListItemItem,
                                                                            r'''$.lead_id''',
                                                                          ).toString()}',
                                                                          'Save',
                                                                          FFAppState().savingLeadCallStatus,
                                                                          FFAppState().savingLeadStatusCallOut)!
                                                                      .toList()
                                                                      .cast<dynamic>();
                                                                  safeSetState(
                                                                      () {});
                                                                  _model.leadSurveyDataJson =
                                                                      getJsonField(
                                                                    _model
                                                                        .leadDataByCategory,
                                                                    r'''$.LeadSurvey''',
                                                                    true,
                                                                  )!
                                                                          .toList()
                                                                          .cast<
                                                                              dynamic>();
                                                                  _model.leadTeleDataJson =
                                                                      getJsonField(
                                                                    _model
                                                                        .leadDataByCategory,
                                                                    r'''$.LeadTelesale''',
                                                                    true,
                                                                  )!
                                                                          .toList()
                                                                          .cast<
                                                                              dynamic>();
                                                                  _model.leadAgentDataJson =
                                                                      getJsonField(
                                                                    _model
                                                                        .leadDataByCategory,
                                                                    r'''$.LeadAgent''',
                                                                    true,
                                                                  )!
                                                                          .toList()
                                                                          .cast<
                                                                              dynamic>();
                                                                  _model.leadTruckDataJson =
                                                                      getJsonField(
                                                                    _model
                                                                        .leadDataByCategory,
                                                                    r'''$.LeadTruck''',
                                                                    true,
                                                                  )!
                                                                          .toList()
                                                                          .cast<
                                                                              dynamic>();
                                                                  _model.leadOwnerDataJson =
                                                                      getJsonField(
                                                                    _model
                                                                        .leadDataByCategory,
                                                                    r'''$.OwnerLead''',
                                                                    true,
                                                                  )!
                                                                          .toList()
                                                                          .cast<
                                                                              dynamic>();
                                                                  _model.allLeadDataJson = _model
                                                                      .leadNotiModifyJson
                                                                      .toList()
                                                                      .cast<
                                                                          dynamic>();
                                                                  _model.leadHPDataJson =
                                                                      getJsonField(
                                                                    _model
                                                                        .leadDataByCategory,
                                                                    r'''$.LeadHP''',
                                                                    true,
                                                                  )!
                                                                          .toList()
                                                                          .cast<
                                                                              dynamic>();
                                                                  safeSetState(
                                                                      () {});
                                                                  _model
                                                                      .currentShowingDataJson = () {
                                                                    if (_model
                                                                            .selectedTab ==
                                                                        'Telesale') {
                                                                      return _model
                                                                          .leadTeleDataJson;
                                                                    } else if (_model
                                                                            .selectedTab ==
                                                                        'Survey') {
                                                                      return _model
                                                                          .leadSurveyDataJson;
                                                                    } else if (_model
                                                                            .selectedTab ==
                                                                        'Agent') {
                                                                      return _model
                                                                          .leadAgentDataJson;
                                                                    } else if (_model
                                                                            .selectedTab ==
                                                                        'Owner') {
                                                                      return _model
                                                                          .leadOwnerDataJson;
                                                                    } else if (_model
                                                                            .selectedTab ==
                                                                        'Truck') {
                                                                      return _model
                                                                          .leadTruckDataJson;
                                                                    } else if (_model
                                                                            .selectedTab ==
                                                                        'HP') {
                                                                      return _model
                                                                          .leadHPDataJson;
                                                                    } else {
                                                                      return _model
                                                                          .leadNotiModifyJson;
                                                                    }
                                                                  }()
                                                                      .toList()
                                                                      .cast<dynamic>();
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                              },
                                                              text:
                                                                  'บันทึกการโทร',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 130.0,
                                                                height: 40.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  () {
                                                                    if ('${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.channel''',
                                                                        ).toString()}' ==
                                                                        'Lead Survey') {
                                                                      return valueOrDefault<
                                                                          Color>(
                                                                        leadNotiNewPageLeadChannelColorRecord?.color?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                            leadNotiNewPageLeadChannelColorRecord?.leadChannel?.toList(),
                                                                            'Lead Survey')),
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                      );
                                                                    } else if ('${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.channel''',
                                                                        ).toString()}' ==
                                                                        'Lead Telesale') {
                                                                      return (leadNotiNewPageLeadChannelColorRecord
                                                                          ?.color
                                                                          ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                              leadNotiNewPageLeadChannelColorRecord?.leadChannel?.toList(),
                                                                              'Lead Telesale')));
                                                                    } else if ('${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.channel''',
                                                                        ).toString()}' ==
                                                                        'Lead Agent') {
                                                                      return (leadNotiNewPageLeadChannelColorRecord
                                                                          ?.color
                                                                          ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                              leadNotiNewPageLeadChannelColorRecord?.leadChannel?.toList(),
                                                                              'Lead Agent')));
                                                                    } else if ('${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.channel''',
                                                                        ).toString()}' ==
                                                                        'Lead Truck') {
                                                                      return (leadNotiNewPageLeadChannelColorRecord
                                                                          ?.color
                                                                          ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                              leadNotiNewPageLeadChannelColorRecord?.leadChannel?.toList(),
                                                                              'Lead Truck')));
                                                                    } else if ('${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.channel''',
                                                                        ).toString()}' ==
                                                                        'Lead HP') {
                                                                      return (leadNotiNewPageLeadChannelColorRecord
                                                                          ?.color
                                                                          ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                              leadNotiNewPageLeadChannelColorRecord?.leadChannel?.toList(),
                                                                              'Lead HP')));
                                                                    } else if ('${getJsonField(
                                                                          leadListItemItem,
                                                                          r'''$.channel''',
                                                                        ).toString()}' ==
                                                                        'Lead Topup') {
                                                                      return (leadNotiNewPageLeadChannelColorRecord
                                                                          ?.color
                                                                          ?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                              leadNotiNewPageLeadChannelColorRecord?.leadChannel?.toList(),
                                                                              'Lead Topup')));
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1;
                                                                    }
                                                                  }(),
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                elevation: 2.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                            ),
                                                            Builder(
                                                              builder:
                                                                  (context) =>
                                                                      Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    var _shouldSetState =
                                                                        false;
                                                                    HapticFeedback
                                                                        .mediumImpact();
                                                                    _model.getCallHistory =
                                                                        await GetLeadCalledHistoryAPICall
                                                                            .call(
                                                                      apiUrl: FFAppState()
                                                                          .apiURLLocalState,
                                                                      token: FFAppState()
                                                                          .accessToken,
                                                                      leadID:
                                                                          '${getJsonField(
                                                                        leadListItemItem,
                                                                        r'''$.lead_id''',
                                                                      ).toString()}',
                                                                    );

                                                                    _shouldSetState =
                                                                        true;
                                                                    if (!((((_model.getCallHistory?.statusCode ?? 200) ==
                                                                                200) &&
                                                                            (GetLeadCalledHistoryAPICall.statusLayer2(
                                                                                  (_model.getCallHistory?.jsonBody ?? ''),
                                                                                ) ==
                                                                                200)) ||
                                                                        (((_model.getCallHistory?.statusCode ?? 200) == 200) &&
                                                                            (GetLeadCalledHistoryAPICall.statusLayer2(
                                                                                  (_model.getCallHistory?.jsonBody ?? ''),
                                                                                ) ==
                                                                                404)))) {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
                                                                              content: Text('พบข้อผิดพลาดConnection (${(_model.getCallHistory?.statusCode ?? 200).toString()}) Layer2 (${GetLeadCalledHistoryAPICall.statusLayer2(
                                                                                (_model.getCallHistory?.jsonBody ?? ''),
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
                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Container(
                                                                                height: double.infinity,
                                                                                width: double.infinity,
                                                                                child: CallHistoryWidget(
                                                                                  leadCreatedTime: functions.parseStringToDatetime('${getJsonField(
                                                                                    leadListItemItem,
                                                                                    r'''$.created_at''',
                                                                                  ).toString()}'),
                                                                                  callStatusList: GetLeadCalledHistoryAPICall.statusLayer2(
                                                                                            (_model.getCallHistory?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          404
                                                                                      ? FFAppState().defaultList1
                                                                                      : functions.reverseList(GetLeadCalledHistoryAPICall.callStatus(
                                                                                          (_model.getCallHistory?.jsonBody ?? ''),
                                                                                        )?.toList()),
                                                                                  historyStatusList: GetLeadCalledHistoryAPICall.statusLayer2(
                                                                                            (_model.getCallHistory?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          404
                                                                                      ? FFAppState().defaultList1
                                                                                      : functions.reverseList(GetLeadCalledHistoryAPICall.historyStatus(
                                                                                          (_model.getCallHistory?.jsonBody ?? ''),
                                                                                        )?.toList()),
                                                                                  historyTimeCallList: GetLeadCalledHistoryAPICall.statusLayer2(
                                                                                            (_model.getCallHistory?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          404
                                                                                      ? FFAppState().defaultList1
                                                                                      : functions.reverseList(GetLeadCalledHistoryAPICall.callTime(
                                                                                          (_model.getCallHistory?.jsonBody ?? ''),
                                                                                        )?.toList()),
                                                                                  employeeIdList: GetLeadCalledHistoryAPICall.statusLayer2(
                                                                                            (_model.getCallHistory?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          404
                                                                                      ? FFAppState().defaultList1
                                                                                      : functions.reverseList(GetLeadCalledHistoryAPICall.employeeId(
                                                                                          (_model.getCallHistory?.jsonBody ?? ''),
                                                                                        )?.toList()),
                                                                                  reasonNameList: GetLeadCalledHistoryAPICall.statusLayer2(
                                                                                            (_model.getCallHistory?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          404
                                                                                      ? FFAppState().defaultList1
                                                                                      : functions.reverseList(GetLeadCalledHistoryAPICall.reasonName(
                                                                                          (_model.getCallHistory?.jsonBody ?? ''),
                                                                                        )?.toList()),
                                                                                  note: GetLeadCalledHistoryAPICall.statusLayer2(
                                                                                            (_model.getCallHistory?.jsonBody ?? ''),
                                                                                          ) ==
                                                                                          404
                                                                                      ? FFAppState().defaultList1
                                                                                      : functions.reverseList(GetLeadCalledHistoryAPICall.note(
                                                                                          (_model.getCallHistory?.jsonBody ?? ''),
                                                                                        )?.map((e) => e.toString()).toList()?.toList()),
                                                                                  apiStatusCode: GetLeadCalledHistoryAPICall.statusLayer2(
                                                                                    (_model.getCallHistory?.jsonBody ?? ''),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );

                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                  },
                                                                  text:
                                                                      'ประวัติการโทร',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        130.0,
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      () {
                                                                        if ('${getJsonField(
                                                                              leadListItemItem,
                                                                              r'''$.channel''',
                                                                            ).toString()}' ==
                                                                            'Lead Survey') {
                                                                          return valueOrDefault<
                                                                              Color>(
                                                                            leadNotiNewPageLeadChannelColorRecord?.color?.elementAtOrNull(functions.getIndexOfSomethingList(leadNotiNewPageLeadChannelColorRecord?.leadChannel?.toList(),
                                                                                'Lead Survey')),
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                          );
                                                                        } else if ('${getJsonField(
                                                                              leadListItemItem,
                                                                              r'''$.channel''',
                                                                            ).toString()}' ==
                                                                            'Lead Telesale') {
                                                                          return (leadNotiNewPageLeadChannelColorRecord?.color?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                              leadNotiNewPageLeadChannelColorRecord?.leadChannel?.toList(),
                                                                              'Lead Telesale')));
                                                                        } else if ('${getJsonField(
                                                                              leadListItemItem,
                                                                              r'''$.channel''',
                                                                            ).toString()}' ==
                                                                            'Lead Agent') {
                                                                          return (leadNotiNewPageLeadChannelColorRecord?.color?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                              leadNotiNewPageLeadChannelColorRecord?.leadChannel?.toList(),
                                                                              'Lead Agent')));
                                                                        } else if ('${getJsonField(
                                                                              leadListItemItem,
                                                                              r'''$.channel''',
                                                                            ).toString()}' ==
                                                                            'Lead Truck') {
                                                                          return (leadNotiNewPageLeadChannelColorRecord?.color?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                              leadNotiNewPageLeadChannelColorRecord?.leadChannel?.toList(),
                                                                              'Lead Truck')));
                                                                        } else if ('${getJsonField(
                                                                              leadListItemItem,
                                                                              r'''$.channel''',
                                                                            ).toString()}' ==
                                                                            'Lead HP') {
                                                                          return (leadNotiNewPageLeadChannelColorRecord?.color?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                              leadNotiNewPageLeadChannelColorRecord?.leadChannel?.toList(),
                                                                              'Lead HP')));
                                                                        } else if ('${getJsonField(
                                                                              leadListItemItem,
                                                                              r'''$.channel''',
                                                                            ).toString()}' ==
                                                                            'Lead Topup') {
                                                                          return (leadNotiNewPageLeadChannelColorRecord?.color?.elementAtOrNull(functions.getIndexOfSomethingList(
                                                                              leadNotiNewPageLeadChannelColorRecord?.leadChannel?.toList(),
                                                                              'Lead Topup')));
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .accent1;
                                                                        }
                                                                      }(),
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                    elevation:
                                                                        2.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        controller: _model.listViewController3,
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'ไม่พบข้อมูล',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .grayIcon,
                                                fontSize: 22.0,
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
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                );
                              }
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
        },
      ),
    );
  }
}
