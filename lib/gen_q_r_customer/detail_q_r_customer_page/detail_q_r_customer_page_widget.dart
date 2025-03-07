import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/collection_page/appbar_follow_up_debt/appbar_follow_up_debt_widget.dart';
import '/components/data_not_found_component_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'detail_q_r_customer_page_model.dart';
export 'detail_q_r_customer_page_model.dart';

class DetailQRCustomerPageWidget extends StatefulWidget {
  const DetailQRCustomerPageWidget({
    super.key,
    required this.cusCod,
    required this.name,
    required this.lastName,
    required this.followupDebtTab,
    this.fromIconCall,
  });

  final String? cusCod;
  final String? name;
  final String? lastName;
  final int? followupDebtTab;
  final bool? fromIconCall;

  static String routeName = 'detailQRCustomerPage';
  static String routePath = 'detailQRCustomerPage';

  @override
  State<DetailQRCustomerPageWidget> createState() =>
      _DetailQRCustomerPageWidgetState();
}

class _DetailQRCustomerPageWidgetState extends State<DetailQRCustomerPageWidget>
    with TickerProviderStateMixin {
  late DetailQRCustomerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailQRCustomerPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'detailQRCustomerPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
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
                child: Container(
                  height: double.infinity,
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      _model.getListDataPerson = await CollectionApiGetDataPersonCall.call(
        apiUrl: FFAppState().apiUrlBranchViewCollection,
        idCard: widget!.cusCod,
        dataFilter: widget!.followupDebtTab,
      );

      if ((_model.getListDataPerson?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('เกิดข้อผิดพลาดในการเชื่อมต่อ'),
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
      if (CollectionApiGetDataPersonCall.statuscode(
            (_model.getListDataPerson?.jsonBody ?? ''),
          ) ==
          200) {
        FFAppState().selectCardList = functions
            .createFalseListByItemNumber(
                false,
                CollectionApiGetDataPersonCall.contno(
                  (_model.getListDataPerson?.jsonBody ?? ''),
                )?.length)!
            .toList()
            .cast<bool>();
        safeSetState(() {});
      } else {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(CollectionApiGetDataPersonCall.message(
                  (_model.getListDataPerson?.jsonBody ?? ''),
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
        context.safePop();
        return;
      }

      Navigator.pop(context);
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 1000.0.ms,
            begin: Offset(0.0, -500.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            top: true,
            child: Visibility(
              visible: ('200' ==
                      getJsonField(
                        (_model.getListDataPerson?.jsonBody ?? ''),
                        r'''$.statuscode''',
                      ).toString()) &&
                  ((_model.getListDataPerson?.statusCode ?? 200) == 200),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      children: [
                        wrapWithModel(
                          model: _model.appbarFollowUpDebtModel,
                          updateCallback: () => safeSetState(() {}),
                          child: AppbarFollowUpDebtWidget(),
                        ),
                        Text(
                          'สัญญาลูกค้า',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['stackOnPageLoadAnimation']!),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 20.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).lineColor,
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.person,
                                  color: FlutterFlowTheme.of(context).black600,
                                  size: 30.0,
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation1']!),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  '${widget!.name} ${widget!.lastName}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  () {
                                    if (widget!.followupDebtTab == 1) {
                                      return 'เตือนก่อนดิว';
                                    } else if (widget!.followupDebtTab == 2) {
                                      return 'ค้าง 1-3 งวด';
                                    } else if (widget!.followupDebtTab == 3) {
                                      return 'ค้าง 4-5 งวด';
                                    } else if (widget!.followupDebtTab == 4) {
                                      return 'ค้าง 6 งวดเป็นต้นไป';
                                    } else if (widget!.followupDebtTab == 5) {
                                      return 'ค้างด้วยยอดน้อยกว่า 250 บาท';
                                    } else if (widget!.followupDebtTab == 6) {
                                      return 'โทรชวนปิดปรับ';
                                    } else if (widget!.followupDebtTab == 11) {
                                      return 'OD1';
                                    } else if (widget!.followupDebtTab == 12) {
                                      return 'OD2';
                                    } else if (widget!.followupDebtTab == 13) {
                                      return 'OD3';
                                    } else if (widget!.followupDebtTab == 14) {
                                      return 'OD4 - OD5';
                                    } else if (widget!.followupDebtTab == 15) {
                                      return 'OD6 เป็นต้นไป';
                                    } else {
                                      return ' ';
                                    }
                                  }(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (false)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 10.0, 12.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              if (functions.countTrueInBoolList(
                                      FFAppState().selectCardList.toList())! <=
                                  0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'กรุณาเลือกการ์ดที่ต้องการทำรายการ'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                              if (functions.countTrueInBoolList(
                                      FFAppState().selectCardList.toList())! >
                                  1) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'การบันทึกลงพื้นที่ สามารถทำได้ครั้งละ 1 สัญญา'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                              _model.getVloanRemarkApiUrl =
                                  await queryUrlLinkStorageRecordOnce(
                                queryBuilder: (urlLinkStorageRecord) =>
                                    urlLinkStorageRecord.where(
                                  'url_name',
                                  isEqualTo: 'vloan_remark',
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;
                              FFAppState().apiUrlVloanRemark =
                                  _model.getVloanRemarkApiUrl!.urlLink;
                              FFAppState().tokenVloanRemark =
                                  _model.getVloanRemarkApiUrl!.urlToken;
                              safeSetState(() {});

                              context.pushNamed(
                                SaveOnSiteFollowUpDebtWidget.routeName,
                                queryParameters: {
                                  'firstname': serializeParam(
                                    widget!.name,
                                    ParamType.String,
                                  ),
                                  'lastname': serializeParam(
                                    widget!.lastName,
                                    ParamType.String,
                                  ),
                                  'contNo': serializeParam(
                                    functions
                                        .returnMappedListFromBoolList(
                                            CollectionApiGetDataPersonCall
                                                .contno(
                                              (_model.getListDataPerson
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            FFAppState()
                                                .selectCardList
                                                .toList(),
                                            true)
                                        ?.firstOrNull,
                                    ParamType.String,
                                  ),
                                  'dateOfExp': serializeParam(
                                    functions
                                        .returnMappedListFromBoolList(
                                            CollectionApiGetDataPersonCall
                                                .dateofexp(
                                              (_model.getListDataPerson
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            FFAppState()
                                                .selectCardList
                                                .toList(),
                                            true)
                                        ?.firstOrNull,
                                    ParamType.String,
                                  ),
                                  'tragetStat': serializeParam(
                                    functions
                                        .returnMappedListFromBoolList(
                                            CollectionApiGetDataPersonCall
                                                .targetstat(
                                              (_model.getListDataPerson
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            FFAppState()
                                                .selectCardList
                                                .toList(),
                                            true)
                                        ?.firstOrNull,
                                    ParamType.String,
                                  ),
                                  'contStat': serializeParam(
                                    functions
                                        .returnMappedListFromBoolList(
                                            CollectionApiGetDataPersonCall
                                                .contstat(
                                              (_model.getListDataPerson
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            FFAppState()
                                                .selectCardList
                                                .toList(),
                                            true)
                                        ?.firstOrNull,
                                    ParamType.String,
                                  ),
                                  'expAmt': serializeParam(
                                    functions
                                        .returnMappedListFromBoolList(
                                            CollectionApiGetDataPersonCall
                                                .expamt(
                                              (_model.getListDataPerson
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            FFAppState()
                                                .selectCardList
                                                .toList(),
                                            true)
                                        ?.firstOrNull,
                                    ParamType.String,
                                  ),
                                  'cusCode': serializeParam(
                                    functions
                                        .returnMappedListFromBoolList(
                                            CollectionApiGetDataPersonCall
                                                .cuscod(
                                              (_model.getListDataPerson
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            FFAppState()
                                                .selectCardList
                                                .toList(),
                                            true)
                                        ?.firstOrNull,
                                    ParamType.String,
                                  ),
                                  'database': serializeParam(
                                    functions
                                        .returnMappedListFromBoolList(
                                            CollectionApiGetDataPersonCall
                                                .database(
                                              (_model.getListDataPerson
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            FFAppState()
                                                .selectCardList
                                                .toList(),
                                            true)
                                        ?.firstOrNull,
                                    ParamType.String,
                                  ),
                                  'expFrm': serializeParam(
                                    functions
                                        .returnMappedListFromBoolList(
                                            CollectionApiGetDataPersonCall
                                                .expFrm(
                                              (_model.getListDataPerson
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            FFAppState()
                                                .selectCardList
                                                .toList(),
                                            true)
                                        ?.firstOrNull,
                                    ParamType.String,
                                  ),
                                  'dateOfDue': serializeParam(
                                    functions
                                        .returnMappedListFromBoolList(
                                            CollectionApiGetDataPersonCall
                                                .dateofdue(
                                              (_model.getListDataPerson
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            FFAppState()
                                                .selectCardList
                                                .toList(),
                                            true)
                                        ?.firstOrNull,
                                    ParamType.String,
                                  ),
                                  'followupDebtTab': serializeParam(
                                    widget!.followupDebtTab,
                                    ParamType.int,
                                  ),
                                  'dateOfData': serializeParam(
                                    functions
                                        .returnMappedListFromBoolList(
                                            CollectionApiGetDataPersonCall
                                                .dateOfData(
                                              (_model.getListDataPerson
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            FFAppState()
                                                .selectCardList
                                                .toList(),
                                            true)
                                        ?.firstOrNull,
                                    ParamType.String,
                                  ),
                                  'sumCurrentDueAmt': serializeParam(
                                    functions
                                        .returnMappedListFromBoolList(
                                            CollectionApiGetDataPersonCall
                                                .sumCurrentDueAmt(
                                              (_model.getListDataPerson
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            FFAppState()
                                                .selectCardList
                                                .toList(),
                                            true)
                                        ?.firstOrNull,
                                    ParamType.String,
                                  ),
                                  'lastPayDate': serializeParam(
                                    functions
                                        .returnMappedListFromBoolList(
                                            CollectionApiGetDataPersonCall
                                                .lastPayDate(
                                              (_model.getListDataPerson
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            FFAppState()
                                                .selectCardList
                                                .toList(),
                                            true)
                                        ?.firstOrNull,
                                    ParamType.String,
                                  ),
                                  'historyCount': serializeParam(
                                    functions
                                        .returnMappedListFromBoolList(
                                            CollectionApiGetDataPersonCall
                                                .historyCount(
                                              (_model.getListDataPerson
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            FFAppState()
                                                .selectCardList
                                                .toList(),
                                            true)
                                        ?.firstOrNull,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              if (_shouldSetState) safeSetState(() {});
                            },
                            text: 'ลงพื้นที่',
                            options: FFButtonOptions(
                              width: 160.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF004984),
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
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation1']!),
                          FFButtonWidget(
                            onPressed: () async {
                              if (functions.countTrueInBoolList(
                                      FFAppState().selectCardList.toList())! <=
                                  0) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            'กรุณาเลือกการ์ดที่ต้องการทำรายการ'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                              FFAppState().saveCalled =
                                  SaveCallStruct.fromSerializableMap(jsonDecode(
                                      '{\"CONTNO_ID\":\"[]\",\"CONTNO\":\"[]\",\"HISTORY_LEAD_STATUS\":\"[]\",\"HISTORY_REASON_NAME\":\"[]\",\"CREATED_USERID\":\"[]\",\"UPDATED_USERID\":\"[]\",\"ARAPPDATE\":\"[]\",\"ARDESC\":\"[]\",\"USERID\":\"[]\",\"REMGCODE\":\"[]\",\"REMDETCODE\":\"[]\",\"AMOUNT\":\"[]\"}'));
                              safeSetState(() {});

                              context.pushNamed(
                                SaveCallFollowUpDebtWidget.routeName,
                                queryParameters: {
                                  'countNo': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall.contno(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'dateOfExp': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall
                                            .dateofexp(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'targetStat': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall
                                            .targetstat(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'contStat': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall.contstat(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'expAmt': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall.expamt(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'name1': serializeParam(
                                    widget!.name,
                                    ParamType.String,
                                  ),
                                  'name2': serializeParam(
                                    widget!.lastName,
                                    ParamType.String,
                                  ),
                                  'id': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall.id(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'expFrm': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall.expFrm(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'dateOfDue': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall
                                            .dateofdue(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'followupDebtTab': serializeParam(
                                    widget!.followupDebtTab,
                                    ParamType.int,
                                  ),
                                  'dateOfData': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall
                                            .dateOfData(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'sumCurrentDueAmt': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall
                                            .sumCurrentDueAmt(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'lastPayDate': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall
                                            .lastPayDate(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'historyCount': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall
                                            .historyCount(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'arnow': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall.arnow(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                  'dbName': serializeParam(
                                    functions.returnMapListFromBoolList(
                                        CollectionApiGetDataPersonCall.database(
                                          (_model.getListDataPerson?.jsonBody ??
                                              ''),
                                        )?.toList(),
                                        FFAppState().selectCardList.toList(),
                                        true),
                                    ParamType.String,
                                    isList: true,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'บันทึกผลการโทร',
                            options: FFButtonOptions(
                              width: 160.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF4BB718),
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
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['buttonOnPageLoadAnimation2']!),
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 10.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFEBEBED),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (CollectionApiGetDataPersonCall.contno(
                                  (_model.getListDataPerson?.jsonBody ?? ''),
                                )!
                                    .length >
                                2)
                              Expanded(
                                flex: 5,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 100),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText: 'ค้นหาเลขที่สัญญา',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            10.0, 2.0, 5.0, 2.0),
                                    suffixIcon: _model
                                            .textController!.text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.textController?.clear();
                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color: Color(0xFF5F6060),
                                              size: 16.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  textAlign: TextAlign.start,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation2']!),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: ((_model.getListDataPerson?.statusCode ??
                                    200) ==
                                200) &&
                            (CollectionApiGetDataPersonCall.statuscode(
                                  (_model.getListDataPerson?.jsonBody ?? ''),
                                ) ==
                                200),
                        child: Builder(
                          builder: (context) {
                            final listCard = getJsonField(
                              (_model.getListDataPerson?.jsonBody ?? ''),
                              r'''$.data''',
                            ).toList();
                            if (listCard.isEmpty) {
                              return DataNotFoundComponentWidget();
                            }

                            return ListView.builder(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                24.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listCard.length,
                              itemBuilder: (context, listCardIndex) {
                                final listCardItem = listCard[listCardIndex];
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if ((_model.textController.text == null ||
                                                _model.textController.text == ''
                                            ? true
                                            : functions.containWordinStringUrl(
                                                _model.textController.text,
                                                getJsonField(
                                                  listCardItem,
                                                  r'''$.CONTNO''',
                                                ).toString())!) &&
                                        ('0' !=
                                            getJsonField(
                                              listCardItem,
                                              r'''$.EXP_DAY''',
                                            ).toString()))
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 15.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 5.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  (CollectionApiGetDataPersonCall
                                                              .calltype(
                                                            (_model.getListDataPerson
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.elementAtOrNull(
                                                              listCardIndex)) ==
                                                          'Y'
                                                      ? Color(0xFFFADEC2)
                                                      : Color(0xFFFADEC2),
                                                  Color(0xFFFADEC2),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Stack(
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
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
                                                            if (FFAppState()
                                                                .selectCardList
                                                                .elementAtOrNull(
                                                                    listCardIndex)!) {
                                                              FFAppState()
                                                                  .updateSelectCardListAtIndex(
                                                                listCardIndex,
                                                                (_) => false,
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              FFAppState()
                                                                  .updateSelectCardListAtIndex(
                                                                listCardIndex,
                                                                (_) => true,
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
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
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'เลขที่สัญญา',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  listCardItem,
                                                                                  r'''$.CONTNO''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
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
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 1.0,
                                                        color: Colors.white,
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: Text(
                                                                  'วันที่ครบกำหนดชำระ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        ':',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${functions.dateToBEDate(getJsonField(
                                                                            listCardItem,
                                                                            r'''$.DATEOFDUE''',
                                                                          ).toString())}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
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
                                                      ),
                                                      if ('0' !=
                                                          getJsonField(
                                                            listCardItem,
                                                            r'''$.EXP_FRM''',
                                                          ).toString())
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    'วันค้าง/งวดค้าง',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          ':',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${functions.dateToBEDate(getJsonField(
                                                                              listCardItem,
                                                                              r'''$.DATEOFEXP''',
                                                                            ).toString())}(งวด${getJsonField(
                                                                              listCardItem,
                                                                              r'''$.EXP_FRM''',
                                                                            ).toString()})',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
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
                                                        ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: Text(
                                                                  'สถานะสัญญา (เป้าเริ่มต้น)',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        ':',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            listCardItem,
                                                                            r'''$.TARGETSTAT''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
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
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: Text(
                                                                  'เป้าเร่งรัด',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        ':',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            listCardItem,
                                                                            r'''$.CONTSTAT''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
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
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: Text(
                                                                  'วันที่ชำระล่าสุด',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        ':',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${functions.dateToBEDate(CollectionApiGetDataPersonCall.lastPayDate(
                                                                            (_model.getListDataPerson?.jsonBody ??
                                                                                ''),
                                                                          )?.elementAtOrNull(listCardIndex))}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
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
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child: Text(
                                                                  'ยอดหนี้ค้างชำระ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        ':',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          ('0.00' ==
                                                                                      getJsonField(
                                                                                        listCardItem,
                                                                                        r'''$.EXP_AMT''',
                                                                                      ).toString()) ||
                                                                                  ('0' ==
                                                                                      getJsonField(
                                                                                        listCardItem,
                                                                                        r'''$.EXP_AMT''',
                                                                                      ).toString())
                                                                              ? '-'
                                                                              : '${functions.showNumberWithComma(getJsonField(
                                                                                  listCardItem,
                                                                                  r'''$.EXP_AMT''',
                                                                                ).toString())} บาท',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
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
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if ((widget!.followupDebtTab ==
                                                                  1) ||
                                                              (valueOrDefault<
                                                                      String>(
                                                                    CollectionApiGetDataPersonCall
                                                                        .dataTab(
                                                                      (_model.getListDataPerson
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )?.firstOrNull,
                                                                    '-',
                                                                  ) ==
                                                                  'นัดชำระ'))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        'ค่างวดที่ต้องชำระ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              ':',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '${functions.showNumberWithComma(CollectionApiGetDataPersonCall.sumCurrentDueAmt(
                                                                                  (_model.getListDataPerson?.jsonBody ?? ''),
                                                                                )?.elementAtOrNull(listCardIndex))} บาท',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
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
                                                            ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      'ข้อมูล ณ วันที่',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            ':',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                functions.dateToBEDate(valueOrDefault<String>(
                                                                                  CollectionApiGetDataPersonCall.dateOfData(
                                                                                    (_model.getListDataPerson?.jsonBody ?? ''),
                                                                                  )?.elementAtOrNull(listCardIndex),
                                                                                  'date_of_data',
                                                                                )),
                                                                                'date_of_data',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
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
                                                          ),
                                                        ],
                                                      ),
                                                      if (false)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        10.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    'จำนวนครั้งที่บันทึกการโทร',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          ':',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${'${getJsonField(
                                                                              listCardItem,
                                                                              r'''$.historyCount''',
                                                                            ).toString()}'} ครั้ง',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: int.parse(getJsonField(
                                                                                            listCardItem,
                                                                                            r'''$.historyCount''',
                                                                                          ).toString()) ==
                                                                                          0
                                                                                      ? Color(0xFFFF0000)
                                                                                      : FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
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
                                                        ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (false)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          9.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    RecordFollowUpDebtWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'contNo':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          listCardItem,
                                                                          r'''$.CONTNO''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                text:
                                                                    'ประวัติการโทร',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 160.0,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFFDB771A),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                              ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'buttonOnPageLoadAnimation3']!),
                                                            ),
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  var _shouldSetState =
                                                                      false;
                                                                  showDialog(
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
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                LoadingSceneWidget(),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          content:
                                                                              Text('${getJsonField(
                                                                            listCardItem,
                                                                            r'''$.DBNAME''',
                                                                          ).toString()} ${getJsonField(
                                                                            listCardItem,
                                                                            r'''$.COMCODE''',
                                                                          ).toString()} ${getJsonField(
                                                                            listCardItem,
                                                                            r'''$.CONTNO''',
                                                                          ).toString()} ${getJsonField(
                                                                            listCardItem,
                                                                            r'''$.CUSCOD''',
                                                                          ).toString()}${getJsonField(
                                                                            listCardItem,
                                                                            r'''$.NAME1''',
                                                                          ).toString()} ${getJsonField(
                                                                            listCardItem,
                                                                            r'''$.NAME2''',
                                                                          ).toString()} ${getJsonField(
                                                                            listCardItem,
                                                                            r'''$.SUM_CURRENTDUEAMT''',
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
                                                                  _model.qrCodeAPIOutput =
                                                                      await PaymentQrGenCall
                                                                          .call(
                                                                    dbname:
                                                                        getJsonField(
                                                                      listCardItem,
                                                                      r'''$.DBNAME''',
                                                                    ).toString(),
                                                                    comcode:
                                                                        getJsonField(
                                                                      listCardItem,
                                                                      r'''$.COMCODE''',
                                                                    ).toString(),
                                                                    contno:
                                                                        getJsonField(
                                                                      listCardItem,
                                                                      r'''$.CONTNO''',
                                                                    ).toString(),
                                                                    cuscod:
                                                                        getJsonField(
                                                                      listCardItem,
                                                                      r'''$.CUSCOD''',
                                                                    ).toString(),
                                                                    name1:
                                                                        getJsonField(
                                                                      listCardItem,
                                                                      r'''$.NAME1''',
                                                                    ).toString(),
                                                                    name2:
                                                                        getJsonField(
                                                                      listCardItem,
                                                                      r'''$.NAME2''',
                                                                    ).toString(),
                                                                    sumCurrentdueamt:
                                                                        getJsonField(
                                                                      listCardItem,
                                                                      r'''$.SUM_CURRENTDUEAMT''',
                                                                    ).toString(),
                                                                    token: FFAppState()
                                                                        .accessToken,
                                                                    apiUrl:
                                                                        'https://dev.swpfin.com:8179',
                                                                  );

                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model.qrCodeAPIOutput
                                                                              ?.statusCode ??
                                                                          200) !=
                                                                      200) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            content:
                                                                                Text('พบข้อผิดพลาด Connection (${(_model.qrCodeAPIOutput?.statusCode ?? 200).toString()})'),
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
                                                                    Navigator.pop(
                                                                        context);
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  if (PaymentQrGenCall
                                                                          .code(
                                                                        (_model.qrCodeAPIOutput?.jsonBody ??
                                                                            ''),
                                                                      ) !=
                                                                      '200') {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            content:
                                                                                Text('${PaymentQrGenCall.message(
                                                                              (_model.qrCodeAPIOutput?.jsonBody ?? ''),
                                                                            )}'),
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
                                                                    Navigator.pop(
                                                                        context);
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                  Navigator.pop(
                                                                      context);

                                                                  context
                                                                      .pushNamed(
                                                                    PaymentQRcodeWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'firstName':
                                                                          serializeParam(
                                                                        widget!
                                                                            .name,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'lastName':
                                                                          serializeParam(
                                                                        widget!
                                                                            .lastName,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'dataPayment':
                                                                          serializeParam(
                                                                        PaymentQrGenCall
                                                                            .results(
                                                                          (_model.qrCodeAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        ParamType
                                                                            .DataStruct,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                text:
                                                                    'QR ชำระเงิน',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 160.0,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFF4BB718),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ].addToEnd(
                                                        SizedBox(height: 12.0)),
                                                  ),
                                                  if (false)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.81, -0.9),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    100.0,
                                                                    14.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 3.0,
                                                          child: Container(
                                                            width: 20.0,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            child: Visibility(
                                                              visible: false,
                                                              child: Theme(
                                                                data: ThemeData(
                                                                  checkboxTheme:
                                                                      CheckboxThemeData(
                                                                    visualDensity:
                                                                        VisualDensity
                                                                            .compact,
                                                                    materialTapTargetSize:
                                                                        MaterialTapTargetSize
                                                                            .shrinkWrap,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                    ),
                                                                  ),
                                                                  unselectedWidgetColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                ),
                                                                child: Checkbox(
                                                                  value: _model
                                                                          .checkboxValueMap[
                                                                      listCardItem] ??= false,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    safeSetState(() =>
                                                                        _model.checkboxValueMap[listCardItem] =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      HapticFeedback
                                                                          .mediumImpact();
                                                                      FFAppState()
                                                                          .updateSelectCardListAtIndex(
                                                                        listCardIndex,
                                                                        (_) =>
                                                                            true,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      HapticFeedback
                                                                          .mediumImpact();
                                                                      FFAppState()
                                                                          .updateSelectCardListAtIndex(
                                                                        listCardIndex,
                                                                        (_) =>
                                                                            false,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  side:
                                                                      BorderSide(
                                                                    width: 2,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  activeColor:
                                                                      Color(
                                                                          0xFFFB8447),
                                                                  checkColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (false)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.83, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    100.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.check_box,
                                                          color:
                                                              Color(0xFFFB8447),
                                                          size: 25.0,
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
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation3']!),
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
