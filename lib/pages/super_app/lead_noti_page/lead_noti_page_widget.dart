import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/call_history/call_history_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/saved_lead_called_status/saved_lead_called_status_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lead_noti_page_model.dart';
export 'lead_noti_page_model.dart';

class LeadNotiPageWidget extends StatefulWidget {
  const LeadNotiPageWidget({
    super.key,
    this.color,
  });

  final List<Color>? color;

  @override
  State<LeadNotiPageWidget> createState() => _LeadNotiPageWidgetState();
}

class _LeadNotiPageWidgetState extends State<LeadNotiPageWidget>
    with TickerProviderStateMixin {
  late LeadNotiPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadNotiPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LeadNotiPage'});
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

      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'Lead_Detail',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      ));
      _model.createdLeadDetailLog = UserLogRecord.getDocumentFromData(
          createUserLogRecordData(
            employeeId: FFAppState().employeeID,
            action: 'Lead_Detail',
            actionTime: getCurrentTimestamp,
            userLocation: currentUserLocationValue,
          ),
          userLogRecordReference);
      _model.getLeadDetail = await GetLeadDetailAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
      );

      if (!(_model.getLeadDetail?.succeeded ?? true)) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.getLeadDetail?.statusCode ?? 200).toString()})'),
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
      if (GetLeadDetailAPICall.dataStatus(
            (_model.getLeadDetail?.jsonBody ?? ''),
          ) !=
          200) {
        if (GetLeadDetailAPICall.dataMessage(
              (_model.getLeadDetail?.jsonBody ?? ''),
            ) !=
            'Data Not Found') {
          Navigator.pop(context);
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(
                      'พบข้อผิดพลาด (${GetLeadDetailAPICall.connectionMessage(
                    (_model.getLeadDetail?.jsonBody ?? ''),
                  )})'),
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
        Navigator.pop(context);
        return;
      }
      FFAppState().leadID = GetLeadDetailAPICall.dataLeadID(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().leadCustomerNameList = GetLeadDetailAPICall.dataFirstName(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().update(() {});
      FFAppState().leadCreatedTimeList = GetLeadDetailAPICall.dataCreatedAt(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().leadCallStatus = GetLeadDetailAPICall.dataCallStatus(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().update(() {});
      FFAppState().leadPhoneNumberList = functions
          .checkLeadPhoneNumber(GetLeadDetailAPICall.dataPhoneNum(
            (_model.getLeadDetail?.jsonBody ?? ''),
          )?.toList())!
          .toList()
          .cast<String>();
      FFAppState().leadEmployeeID = GetLeadDetailAPICall.dataEmployeeID(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().update(() {});
      FFAppState().leadChannelList = GetLeadDetailAPICall.dataLeadChannel(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().leadIdCalledInApp = functions
          .checkLeadIDInAppAndLeadID(
              FFAppState().leadIdCalledInApp.toList(),
              FFAppState().leadID.toList(),
              FFAppState().leadCallStatus.toList())
          .toList()
          .cast<String>();
      FFAppState().update(() {});
      FFAppState().leadBranchCode = GetLeadDetailAPICall.dataBranchCode(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().leadUserLevel = '${GetLeadDetailAPICall.dataLevel(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )}';
      FFAppState().update(() {});
      FFAppState().leadChannelAmountList = functions
          .setLeadChannelAmount(FFAppState().leadChannelList.toList())
          .toList()
          .cast<int>();
      FFAppState().leadCountCalled = GetLeadDetailAPICall.countCalled(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().leadCarVehicleName = GetLeadDetailAPICall.carVehicleName(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().leadAmountRequest = GetLeadDetailAPICall.amountRequest(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().amountRequestJson = getJsonField(
        (_model.getLeadDetail?.jsonBody ?? ''),
        r'''$.DataLeadInfo.DataInfo[:].amount_request''',
        true,
      )!
          .toList()
          .cast<dynamic>();
      FFAppState().update(() {});
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
            child: AlertDialog(
              content: Text(FFAppState().amountRequestJson.length.toString()),
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
      FFAppState().leadCalledStatusReason = GetLeadDetailAPICall.statusReason(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().leadContractStatus = GetLeadDetailAPICall.contractStatus(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      FFAppState().leadContractDate = GetLeadDetailAPICall.contractDate(
        (_model.getLeadDetail?.jsonBody ?? ''),
      )!
          .toList()
          .cast<String>();
      setState(() {});
      if (valueOrDefault<String>(
            functions
                .showMatAmountInList(
                    FFAppState().leadChannelAmountList.toList(), 1)
                .toString(),
            '0',
          ) !=
          '0') {
        if (valueOrDefault<int>(
              functions.showMatAmountInList(
                  FFAppState().leadChannelAmountList.toList(), 1),
              0,
            ) ==
            functions.countTheValueInList(
                GetLeadDetailAPICall.leadSystem(
                  (_model.getLeadDetail?.jsonBody ?? ''),
                )?.toList(),
                'Lead_Telesale')) {
          FFAppState().leadName2 = functions
              .createLeadName2List(
                  FFAppState().leadChannelList.toList(),
                  GetLeadDetailAPICall.firstName2(
                    (_model.getLeadDetail?.jsonBody ?? ''),
                  )?.toList())
              .toList()
              .cast<String>();
          FFAppState().leadPhone2 = functions
              .createLeadPhone2List(
                  FFAppState().leadChannelList.toList(),
                  GetLeadDetailAPICall.phoneNumber2(
                    (_model.getLeadDetail?.jsonBody ?? ''),
                  )?.toList())
              .toList()
              .cast<String>();
          setState(() {});
        }
      }
      Navigator.pop(context);
    });

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

    return FutureBuilder<List<LeadChannelColorRecord>>(
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
        List<LeadChannelColorRecord> leadNotiPageLeadChannelColorRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final leadNotiPageLeadChannelColorRecord =
            leadNotiPageLeadChannelColorRecordList.isNotEmpty
                ? leadNotiPageLeadChannelColorRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
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
                    context.goNamed('SuperAppPage');
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
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
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
                          FFAppState().leadID = functions
                              .reverseList(FFAppState().leadID.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().leadCustomerNameList = functions
                              .reverseList(
                                  FFAppState().leadCustomerNameList.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().update(() {});
                          FFAppState().leadChannelList = functions
                              .reverseList(
                                  FFAppState().leadChannelList.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().leadCreatedTimeList = functions
                              .reverseList(
                                  FFAppState().leadCreatedTimeList.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().update(() {});
                          FFAppState().leadCallStatus = functions
                              .reverseList(FFAppState().leadCallStatus.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().leadPhoneNumberList = functions
                              .reverseList(
                                  FFAppState().leadPhoneNumberList.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().update(() {});
                          FFAppState().leadEmployeeID = functions
                              .reverseList(FFAppState().leadEmployeeID.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().leadBranchCode = functions
                              .reverseList(FFAppState().leadBranchCode.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().leadCountCalled = functions
                              .reverseList(
                                  FFAppState().leadCountCalled.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().update(() {});
                          FFAppState().leadName2 = functions
                              .reverseList(FFAppState().leadName2.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().leadPhone2 = functions
                              .reverseList(FFAppState().leadPhone2.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().leadCarVehicleName = functions
                              .reverseList(
                                  FFAppState().leadCarVehicleName.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().leadAmountRequest = functions
                              .reverseList(
                                  FFAppState().leadAmountRequest.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().amountRequestJson = functions
                              .reverseListJson(
                                  FFAppState().amountRequestJson.toList())
                              .toList()
                              .cast<dynamic>();
                          setState(() {});
                          FFAppState().leadCalledStatusReason = functions
                              .reverseList(GetLeadDetailAPICall.statusReason(
                                (_model.getLeadDetail?.jsonBody ?? ''),
                              )?.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().leadContractStatus = functions
                              .reverseList(GetLeadDetailAPICall.contractStatus(
                                (_model.getLeadDetail?.jsonBody ?? ''),
                              )?.toList())
                              .toList()
                              .cast<String>();
                          FFAppState().leadContractDate = functions
                              .reverseList(GetLeadDetailAPICall.contractDate(
                                (_model.getLeadDetail?.jsonBody ?? ''),
                              )?.toList())
                              .toList()
                              .cast<String>();
                          setState(() {});
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 3.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      height: 220.0,
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
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
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
                                                      FFAppState()
                                                              .leadChannelSelected =
                                                          'Lead Survey';
                                                      FFAppState()
                                                          .update(() {});
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: functions
                                                            .leadChannelAmountCardColor(
                                                                'Lead Survey',
                                                                leadNotiPageLeadChannelColorRecord
                                                                    ?.color
                                                                    ?.toList()),
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
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  24.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .showMatAmountInList(
                                                                      FFAppState()
                                                                          .leadChannelAmountList
                                                                          .toList(),
                                                                      0)
                                                                  .toString(),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
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
                                                      FFAppState()
                                                              .leadChannelSelected =
                                                          'Lead Telesale';
                                                      FFAppState()
                                                          .update(() {});
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: functions
                                                            .leadChannelAmountCardColor(
                                                                'Lead Telesale',
                                                                leadNotiPageLeadChannelColorRecord
                                                                    ?.color
                                                                    ?.toList()),
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
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  24.0),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .showMatAmountInList(
                                                                      FFAppState()
                                                                          .leadChannelAmountList
                                                                          .toList(),
                                                                      1)
                                                                  .toString(),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
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
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
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
                                                      FFAppState()
                                                              .leadChannelSelected =
                                                          'Lead Agent';
                                                      FFAppState()
                                                          .update(() {});
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: functions
                                                            .leadChannelAmountCardColor(
                                                                'Lead Agent',
                                                                leadNotiPageLeadChannelColorRecord
                                                                    ?.color
                                                                    ?.toList()),
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
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .showMatAmountInList(
                                                                      FFAppState()
                                                                          .leadChannelAmountList
                                                                          .toList(),
                                                                      2)
                                                                  .toString(),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
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
                                                      FFAppState()
                                                              .leadChannelSelected =
                                                          'Lead GSB';
                                                      FFAppState()
                                                          .update(() {});
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: functions
                                                            .leadChannelAmountCardColor(
                                                                'Lead GSB',
                                                                leadNotiPageLeadChannelColorRecord
                                                                    ?.color
                                                                    ?.toList()),
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
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                              'GSB',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .showMatAmountInList(
                                                                      FFAppState()
                                                                          .leadChannelAmountList
                                                                          .toList(),
                                                                      3)
                                                                  .toString(),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
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
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.45,
                                        height: 220.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  HapticFeedback.mediumImpact();
                                                  FFAppState()
                                                          .leadChannelSelected =
                                                      FFAppState().employeeID;
                                                  FFAppState().update(() {});
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.person,
                                                        color:
                                                            Color(0xFF101213),
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  4.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          functions.returnAmountValueInList(
                                                              FFAppState()
                                                                  .employeeID,
                                                              FFAppState()
                                                                  .leadEmployeeID
                                                                  .toList()),
                                                          '0',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .displaySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: Color(
                                                                  0xFF101213),
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Text(
                                                        'จำนวนลีดส่วนตัว',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: Color(
                                                                  0xFF57636C),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  HapticFeedback.mediumImpact();
                                                  FFAppState()
                                                          .leadChannelSelected =
                                                      'All';
                                                  FFAppState().update(() {});
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .supervisor_account_rounded,
                                                      color: Color(0xFF101213),
                                                      size: 30.0,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  4.0),
                                                      child: Text(
                                                        FFAppState()
                                                            .leadID
                                                            .length
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .displaySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: Color(
                                                                  0xFF101213),
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Text(
                                                        'จำนวนลีดทั้งหมด',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: Color(
                                                                  0xFF57636C),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
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
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation']!),
                                  ),
                                ),
                              ],
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
                            final leadList = FFAppState().leadID.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: leadList.length,
                              itemBuilder: (context, leadListIndex) {
                                final leadListItem = leadList[leadListIndex];
                                return Visibility(
                                  visible: (FFAppState().leadChannelSelected ==
                                          '${functions.showMatNameInList(FFAppState().leadChannelList.toList(), leadListIndex)}') ||
                                      (FFAppState().leadChannelSelected ==
                                          'All') ||
                                      (FFAppState().leadChannelSelected ==
                                          '${functions.showMatNameInList(FFAppState().leadEmployeeID.toList(), leadListIndex)}'),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 8.0, 12.0, 12.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          functions.leadDetailCardColor(
                                              FFAppState()
                                                  .leadCallStatus
                                                  .toList(),
                                              leadListIndex,
                                              Colors.white,
                                              Color(0xFFE9FFEA),
                                              Color(0xFFFFFFE9),
                                              FFAppState()
                                                  .leadIdCalledInApp
                                                  .toList(),
                                              functions.showMatNameInList(
                                                  FFAppState().leadID.toList(),
                                                  leadListIndex)),
                                          FlutterFlowTheme.of(context).tertiary,
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
                                              color: valueOrDefault<Color>(
                                                functions.leadChannelLabelColor(
                                                    FFAppState()
                                                        .leadChannelList
                                                        .toList(),
                                                    leadNotiPageLeadChannelColorRecord
                                                        ?.color
                                                        ?.toList(),
                                                    leadListIndex),
                                                FlutterFlowTheme.of(context)
                                                    .textColor,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(12.0),
                                                topLeft: Radius.circular(12.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
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
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      '${functions.showMatNameInList(FFAppState().leadChannelList.toList(), leadListIndex)}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Colors.white,
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
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              27.0,
                                                                          height:
                                                                              27.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFF1F4F8),
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Icon(
                                                                            Icons.timer_outlined,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '${functions.showLeadTimeRemain(functions.leadTimeRemain(FFAppState().leadCreatedTimeList.toList(), getCurrentTimestamp, leadListIndex, leadNotiPageLeadChannelColorRecord?.leadAge?[functions.getLeadAgeIndex(leadNotiPageLeadChannelColorRecord?.leadChannel?.toList(), FFAppState().leadChannelList[leadListIndex])!]))}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: valueOrDefault<Color>(
                                                                                    functions.leadTimeRemainTextColor(functions.leadTimeRemain(FFAppState().leadCreatedTimeList.toList(), getCurrentTimestamp, leadListIndex, leadNotiPageLeadChannelColorRecord?.leadAge?[functions.getLeadAgeIndex(leadNotiPageLeadChannelColorRecord?.leadChannel?.toList(), FFAppState().leadChannelList[leadListIndex])!]), Colors.black, Color(0xFFFF0000)),
                                                                                    Colors.black,
                                                                                  ),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
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
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Text(
                                                                      '${functions.showMatNameInList(FFAppState().leadCustomerNameList.toList(), leadListIndex)}${' ${functions.showCensorPhoneNumber(functions.showMatNameInList(FFAppState().leadPhoneNumberList.toList(), leadListIndex))}'}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                '${functions.showLeadIdInList(FFAppState().leadID.toList(), leadListIndex, FFAppState().leadBranchCode.toList())}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'หลักทรัพย์: ${functions.checkNullValueAndReturn('${functions.showMatNameInList(FFAppState().leadCarVehicleName.toList(), leadListIndex)}')}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'ยอดขอ: ${functions.returnNumberWithComma2Decimal('${FFAppState().amountRequestJson[leadListIndex].toString()}')} บาท',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
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
                                                        if ('${functions.showMatNameInList(FFAppState().leadContractStatus.toList(), leadListIndex)}' !=
                                                            'ทำสัญญาแล้ว')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
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
                                                                var _shouldSetState =
                                                                    false;
                                                                HapticFeedback
                                                                    .mediumImpact();
                                                                var confirmDialogResponse =
                                                                    await showDialog<
                                                                            bool>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
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
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                }
                                                                if (functions.showMatNameInList(
                                                                        FFAppState()
                                                                            .leadCallStatus
                                                                            .toList(),
                                                                        leadListIndex) ==
                                                                    'NEW') {
                                                                  if (!functions.checkLeadIdCalledInApp(
                                                                      FFAppState()
                                                                          .leadIdCalledInApp
                                                                          .toList(),
                                                                      functions.showMatNameInList(
                                                                          FFAppState()
                                                                              .leadID
                                                                              .toList(),
                                                                          leadListIndex))) {
                                                                    FFAppState().addToLeadIdCalledInApp(functions.showMatNameInList(
                                                                        FFAppState()
                                                                            .leadID
                                                                            .toList(),
                                                                        leadListIndex)!);
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                  }
                                                                }
                                                                _model.addCalledLead =
                                                                    await AddPhoneCalledLeadAPICall
                                                                        .call(
                                                                  apiUrl: FFAppState()
                                                                      .apiURLLocalState,
                                                                  leadID: functions.showMatNameInList(
                                                                      FFAppState()
                                                                          .leadID
                                                                          .toList(),
                                                                      leadListIndex),
                                                                  token: FFAppState()
                                                                      .accessToken,
                                                                );

                                                                _shouldSetState =
                                                                    true;
                                                                FFAppState().leadCountCalled = functions
                                                                    .increasedValueIntStringInList(
                                                                        FFAppState().leadCountCalled.toList(),
                                                                        leadListIndex,
                                                                        AddPhoneCalledLeadAPICall.countCalled(
                                                                          (_model.addCalledLead?.jsonBody ??
                                                                              ''),
                                                                        ).toString())!
                                                                    .toList()
                                                                    .cast<String>();
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                await actions
                                                                    .open3CXAction(
                                                                  functions.showMatNameInList(
                                                                      FFAppState()
                                                                          .leadPhoneNumberList
                                                                          .toList(),
                                                                      leadListIndex),
                                                                );
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          12.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12.0),
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/call-pic.gif',
                                                                  width: 70.0,
                                                                  height: 70.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        if ('${functions.showMatNameInList(FFAppState().leadContractStatus.toList(), leadListIndex)}' ==
                                                            'ทำสัญญาแล้ว')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/favpng_logo-telephone-call-icon-black.png',
                                                                width: 70.0,
                                                                height: 70.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                        if (('${functions.showMatNameInList(FFAppState().leadCountCalled.toList(), leadListIndex)}' !=
                                                                '0') &&
                                                            ('${functions.showMatNameInList(FFAppState().leadCallStatus.toList(), leadListIndex)}' !=
                                                                'NEW'))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${functions.showMatNameInList(FFAppState().leadCountCalled.toList(), leadListIndex)}' ==
                                                                      '0'
                                                                  ? 'ยังไม่โทร'
                                                                  : 'โทร ${functions.showMatNameInList(FFAppState().leadCountCalled.toList(), leadListIndex)} ครั้ง',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: functions.showMatNameInList(FFAppState().leadCountCalled.toList(), leadListIndex) ==
                                                                            '0'
                                                                        ? Color(
                                                                            0xFFFF0000)
                                                                        : Colors
                                                                            .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 16.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                                            '${functions.showMatNameInList(FFAppState().leadContractStatus.toList(), leadListIndex)}' ==
                                                                    'ทำสัญญาแล้ว'
                                                                ? '${functions.showMatNameInList(FFAppState().leadContractStatus.toList(), leadListIndex)}'
                                                                : '${functions.leadCalledStatusText('${functions.leadDetailCardColorForStatus(FFAppState().leadCallStatus.toList(), leadListIndex, FFAppState().leadIdCalledInApp.toList(), functions.showMatNameInList(FFAppState().leadID.toList(), leadListIndex))}', '${functions.showMatNameInList(FFAppState().leadCallStatus.toList(), leadListIndex)}', '${functions.showMatNameInList(FFAppState().leadCalledStatusReason.toList(), leadListIndex)}')}',
                                                            '[contract_status]',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFFFF0000),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
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
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            dateTimeFormat(
                                                              'Hm',
                                                              functions.showLeadCreatedTime(
                                                                  FFAppState()
                                                                      .leadCreatedTimeList
                                                                      .toList(),
                                                                  leadListIndex),
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF101213),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            dateTimeFormat(
                                                              'd/M/y',
                                                              functions.showLeadCreatedTime(
                                                                  FFAppState()
                                                                      .leadCreatedTimeList
                                                                      .toList(),
                                                                  leadListIndex),
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF101213),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 16.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          barrierColor:
                                                              Color(0x00000000),
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
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
                                                                  child:
                                                                      Container(
                                                                    height: double
                                                                        .infinity,
                                                                    child:
                                                                        LoadingSceneWidget(),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));

                                                        _model.getCalledStatusCode =
                                                            await GetLeadCalledStatusDropdownAPICall
                                                                .call(
                                                          apiUrl: FFAppState()
                                                              .apiURLLocalState,
                                                          token: FFAppState()
                                                              .accessToken,
                                                          leadChannel:
                                                              '${functions.getLeadChannelCode('${functions.showMatNameInList(FFAppState().leadChannelList.toList(), leadListIndex)}')}',
                                                        );

                                                        _shouldSetState = true;
                                                        if (!(((_model.getCalledStatusCode
                                                                        ?.statusCode ??
                                                                    200) ==
                                                                200) &&
                                                            (GetLeadCalledStatusDropdownAPICall
                                                                    .statusLayer1(
                                                                  (_model.getCalledStatusCode
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ) ==
                                                                200))) {
                                                          Navigator.pop(
                                                              context);
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      'Connection Status ${(_model.getCalledStatusCode?.statusCode ?? 200).toString()} Status Layer1 ${GetLeadCalledStatusDropdownAPICall.statusLayer1(
                                                                    (_model.getCalledStatusCode
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?.toString()}'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
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
                                                        Navigator.pop(context);
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          barrierColor:
                                                              Color(0x00000000),
                                                          isDismissible: false,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
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
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.6,
                                                                    child:
                                                                        SavedLeadCalledStatusWidget(
                                                                      leadChannel:
                                                                          '${functions.showMatNameInList(FFAppState().leadChannelList.toList(), leadListIndex)}',
                                                                      leadId:
                                                                          '${functions.showMatNameInList(FFAppState().leadID.toList(), leadListIndex)}',
                                                                      callStatusId:
                                                                          GetLeadCalledStatusDropdownAPICall
                                                                              .callStatusId(
                                                                        (_model.getCalledStatusCode?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                      callStatussName:
                                                                          GetLeadCalledStatusDropdownAPICall
                                                                              .callStatusName(
                                                                        (_model.getCalledStatusCode?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                      leadIndex:
                                                                          leadListIndex,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                      text: 'บันทึกการโทร',
                                                      options: FFButtonOptions(
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
                                                        color: valueOrDefault<
                                                            Color>(
                                                          functions.leadChannelLabelColor(
                                                              FFAppState()
                                                                  .leadChannelList
                                                                  .toList(),
                                                              leadNotiPageLeadChannelColorRecord
                                                                  ?.color
                                                                  ?.toList(),
                                                              leadListIndex),
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                        ),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 2.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor: Color(
                                                                0x00000000),
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                child:
                                                                    GestureDetector(
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
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      height: double
                                                                          .infinity,
                                                                      child:
                                                                          LoadingSceneWidget(),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));

                                                          _model.getCallHistory =
                                                              await GetLeadCalledHistoryAPICall
                                                                  .call(
                                                            apiUrl: FFAppState()
                                                                .apiURLLocalState,
                                                            token: FFAppState()
                                                                .accessToken,
                                                            leadID:
                                                                '${functions.showMatNameInList(FFAppState().leadID.toList(), leadListIndex)}',
                                                          );

                                                          _shouldSetState =
                                                              true;
                                                          if (!((((_model.getCallHistory
                                                                              ?.statusCode ??
                                                                          200) ==
                                                                      200) &&
                                                                  (GetLeadCalledHistoryAPICall
                                                                          .statusLayer2(
                                                                        (_model.getCallHistory?.jsonBody ??
                                                                            ''),
                                                                      ) ==
                                                                      200)) ||
                                                              (((_model.getCallHistory
                                                                              ?.statusCode ??
                                                                          200) ==
                                                                      200) &&
                                                                  (GetLeadCalledHistoryAPICall
                                                                          .statusLayer2(
                                                                        (_model.getCallHistory?.jsonBody ??
                                                                            ''),
                                                                      ) ==
                                                                      404)))) {
                                                            Navigator.pop(
                                                                context);
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'พบข้อผิดพลาดConnection (${(_model.getCallHistory?.statusCode ?? 200).toString()}) Layer2 (${GetLeadCalledHistoryAPICall.statusLayer2(
                                                                      (_model.getCallHistory
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )?.toString()})'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
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
                                                          Navigator.pop(
                                                              context);
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Color(
                                                                    0xB3000000),
                                                            barrierColor: Color(
                                                                0x00000000),
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                child:
                                                                    GestureDetector(
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
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.8,
                                                                      child:
                                                                          CallHistoryWidget(
                                                                        leadCreatedTime: functions.showLeadCreatedTime(
                                                                            FFAppState().leadCreatedTimeList.toList(),
                                                                            leadListIndex),
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
                                                                        apiStatusCode:
                                                                            GetLeadCalledHistoryAPICall.statusLayer2(
                                                                          (_model.getCallHistory?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        text: 'ประวัติการโทร',
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
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.leadChannelLabelColor(
                                                                FFAppState()
                                                                    .leadChannelList
                                                                    .toList(),
                                                                leadNotiPageLeadChannelColorRecord
                                                                    ?.color
                                                                    ?.toList(),
                                                                leadListIndex),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textColor,
                                                          ),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
