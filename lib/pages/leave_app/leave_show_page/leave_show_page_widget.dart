import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/input_copy2/input_copy2_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/show_checkin_image/show_checkin_image_widget.dart';
import '/components/url_link/url_link_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'leave_show_page_model.dart';
export 'leave_show_page_model.dart';

class LeaveShowPageWidget extends StatefulWidget {
  const LeaveShowPageWidget({super.key});

  @override
  State<LeaveShowPageWidget> createState() => _LeaveShowPageWidgetState();
}

class _LeaveShowPageWidgetState extends State<LeaveShowPageWidget>
    with TickerProviderStateMixin {
  late LeaveShowPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaveShowPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LeaveShowPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x00000000),
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      _model.leaveListAPIOutput = await LeaveListAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      if ((_model.leaveListAPIOutput?.statusCode ?? 200) != 200) {
        if ((LeaveListAPICall.messageLayer1(
                  (_model.leaveListAPIOutput?.jsonBody ?? ''),
                ) ==
                'The token has been blacklisted') ||
            (LeaveListAPICall.messageLayer1(
                  (_model.leaveListAPIOutput?.jsonBody ?? ''),
                ) ==
                'Token Signature could not be verified.')) {
          var userLogRecordReference = UserLogRecord.collection.doc();
          await userLogRecordReference.set(createUserLogRecordData(
            employeeId: FFAppState().employeeID,
            action: 'Logout',
            actionTime: getCurrentTimestamp,
            userLocation: currentUserLocationValue,
          ));
          _model.createdUserLogLogout125 = UserLogRecord.getDocumentFromData(
              createUserLogRecordData(
                employeeId: FFAppState().employeeID,
                action: 'Logout',
                actionTime: getCurrentTimestamp,
                userLocation: currentUserLocationValue,
              ),
              userLogRecordReference);
          FFAppState().update(() {
            FFAppState().loginStateFirebase = '[loginStateFirebase]';
            FFAppState().deleteAccessToken();
            FFAppState().accessToken = 'access_token';
          });
          FFAppState().update(() {
            FFAppState().deleteEmployeeID();
            FFAppState().employeeID = 'employee_id';

            FFAppState().QRCodeLink = 'qrcode_link';
          });
          FFAppState().update(() {
            FFAppState().deleteApiURLLocalState();
            FFAppState().apiURLLocalState = 'api_url_local_state';

            FFAppState().deleteBranchCode();
            FFAppState().branchCode = 'branch_code';
          });
          FFAppState().update(() {
            FFAppState().isFromSetPinPage = false;
            FFAppState().leadChannelColor = [];
          });
          FFAppState().update(() {
            FFAppState().leadChannelList = [];
            FFAppState().isFromLoginPage = false;
          });
          FFAppState().update(() {
            FFAppState().deletePinCodeAuthen();
            FFAppState().pinCodeAuthen = '013972';

            FFAppState().isFromAuthenPage = false;
          });
          FFAppState().update(() {
            FFAppState().deleteDateDoNotShowAgain();
            FFAppState().dateDoNotShowAgain = null;

            FFAppState().deleteDoNotShowAgain();
            FFAppState().doNotShowAgain = false;
          });
          FFAppState().update(() {
            FFAppState().inAppViaNotification = true;
            FFAppState().isInApp = false;
          });
          FFAppState().update(() {
            FFAppState().fcmToken = 'fcm_token';
            FFAppState().isPassLoginSection = false;
          });
          FFAppState().update(() {
            FFAppState().leadID = [];
            FFAppState().leadCreatedTimeList = [];
          });
          FFAppState().update(() {
            FFAppState().leadCustomerNameList = [];
            FFAppState().leadChannelList = [];
          });
          FFAppState().update(() {
            FFAppState().leadChannelColor = [];
            FFAppState().leadCallStatus = [];
          });
          FFAppState().update(() {
            FFAppState().leadPhoneNumberList = [];
            FFAppState().leadEmployeeID = [];
          });
          FFAppState().update(() {
            FFAppState().leadChannelLabelColor = [];
            FFAppState().deleteLeadIdCalledInApp();
            FFAppState().leadIdCalledInApp = [];
          });
          FFAppState().update(() {
            FFAppState().leadBranchCode = [];
            FFAppState().leadUserLevel = 'lead_user_level';
          });
          FFAppState().update(() {
            FFAppState().leadChannelAmountList = [];
          });
          Navigator.pop(context);
          await actions.a22();

          context.goNamed('LoginPage');

          return;
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(LeaveListAPICall.messageLayer1(
                    (_model.leaveListAPIOutput?.jsonBody ?? ''),
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
      _model.resignListAPIOutput = await ResignListAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      if ((_model.resignListAPIOutput?.statusCode ?? 200) == 200) {
        Navigator.pop(context);
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.resignListAPIOutput?.statusCode ?? 200).toString()}'),
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
        return;
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 1,
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
              context.goNamed('DashboardLeavePage');
            },
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFBFFFFFF),
              size: 30.0,
            ),
          ),
          title: Text(
            'รายการขออนุมัติลา',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 18.0,
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
            children: [
              FlutterFlowDropDown<String>(
                controller: _model.monthSelectValueController ??=
                    FormFieldController<String>(
                  _model.monthSelectValue ??=
                      functions.currentTimeToMonthThai(getCurrentTimestamp),
                ),
                options: [
                  'มกราคม',
                  'กุมภาพันธ์',
                  'มีนาคม',
                  'เมษายน',
                  'พฤษภาคม',
                  'มิถุนายน',
                  'กรกฎาคม',
                  'สิงหาคม',
                  'กันยายน',
                  'ตุลาคม',
                  'พฤศจิกายน',
                  'ธันวาคม'
                ],
                onChanged: (val) =>
                    setState(() => _model.monthSelectValue = val),
                width: double.infinity,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                hintText: 'กรุณาเลือกเดือนที่ต้องการหา',
                icon: FaIcon(
                  FontAwesomeIcons.solidCalendarAlt,
                ),
                fillColor: Colors.white,
                elevation: 2.0,
                borderColor: Colors.transparent,
                borderWidth: 0.0,
                borderRadius: 0.0,
                margin: EdgeInsetsDirectional.fromSTEB(160.0, 4.0, 12.0, 4.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).black600,
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                ),
                        unselectedLabelStyle: TextStyle(),
                        indicatorColor: FlutterFlowTheme.of(context).secondary,
                        tabs: [
                          Tab(
                            text: 'ลา',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                final leaveIdItem = LeaveListAPICall.leaveID(
                                      (_model.leaveListAPIOutput?.jsonBody ??
                                          ''),
                                    )?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: leaveIdItem.length,
                                  itemBuilder: (context, leaveIdItemIndex) {
                                    final leaveIdItemItem =
                                        leaveIdItem[leaveIdItemIndex];
                                    return Visibility(
                                      visible: functions.checkMonthLeave(
                                              _model.monthSelectValue,
                                              functions.splitDateintoStartDate(
                                                  valueOrDefault<String>(
                                                functions.showMatNameInList(
                                                    functions
                                                        .reverseList(
                                                            LeaveListAPICall
                                                                .leaveDate(
                                                          (_model.leaveListAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.toList())
                                                        .toList(),
                                                    leaveIdItemIndex),
                                                '[leave_name]',
                                              )))! ||
                                          functions.checkMonthLeave(
                                              _model.monthSelectValue,
                                              functions.splitDateintoEndDate(
                                                  valueOrDefault<String>(
                                                functions.showMatNameInList(
                                                    functions
                                                        .reverseList(
                                                            LeaveListAPICall
                                                                .leaveDate(
                                                          (_model.leaveListAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.toList())
                                                        .toList(),
                                                    leaveIdItemIndex),
                                                '[leave_name]',
                                              )))!,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 8.0, 8.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height:
                                              functions.contrainerChange(365.0),
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              functions.getResignCardColor(
                                                  functions.showMatNameInList(
                                                      functions
                                                          .reverseList(
                                                              LeaveListAPICall
                                                                  .leaveName(
                                                            (_model.leaveListAPIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList())
                                                          .toList(),
                                                      leaveIdItemIndex),
                                                  Color(0x80C29999)),
                                              Color(0x80C29999),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(0.0, 2.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 5.0),
                                                    child: SelectionArea(
                                                        child: AutoSizeText(
                                                      FFAppState()
                                                          .profileFullName,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'ประเภทการลา:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.leaveName(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'วันที่ทำรายการ:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.createDate(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'วันที่ลา:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.leaveDate(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'จำนวนวันที่ลา:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.leaveCountDay(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'ช่วงเวลา:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.leavePeriod(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'เหตุผลการลา:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.leaveReason(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ).maybeHandleOverflow(
                                                                  maxChars:
                                                                      200),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'ผู้อนุมัติ:',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.headBefore(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                            if (valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(LeaveListAPICall.headAfter(
                                                                            (_model.leaveListAPIOutput?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      leaveIdItemIndex),
                                                                  '[leave_name]',
                                                                ) !=
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(LeaveListAPICall.headBefore(
                                                                            (_model.leaveListAPIOutput?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      leaveIdItemIndex),
                                                                  '[leave_name]',
                                                                ))
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(LeaveListAPICall.headAfter(
                                                                            (_model.leaveListAPIOutput?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      leaveIdItemIndex),
                                                                  '[leave_name]',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'สถานะ:',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.leaveStatusToText(
                                                                    valueOrDefault<
                                                                        String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(LeaveListAPICall.leaveStatus(
                                                                            (_model.leaveListAPIOutput?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      leaveIdItemIndex),
                                                                  '[leave_name]',
                                                                )),
                                                                'leave_status',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (valueOrDefault<String>(
                                                      functions
                                                          .showMatNameInList(
                                                              functions
                                                                  .reverseList(
                                                                      LeaveListAPICall
                                                                          .leaveDocument(
                                                                    (_model.leaveListAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?.toList())
                                                                  .toList(),
                                                              leaveIdItemIndex),
                                                      '[leave_name]',
                                                    ) !=
                                                    '-')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 5.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SelectionArea(
                                                                    child:
                                                                        AutoSizeText(
                                                                  'ไฟล์เเนบ:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
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
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                            .leaveDocImgPathList =
                                                                        functions
                                                                            .leaveStringImgToImgPathList(valueOrDefault<String>(
                                                                              functions.showMatNameInList(
                                                                                  functions
                                                                                      .reverseList(LeaveListAPICall.leaveDocument(
                                                                                        (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                      )?.toList())
                                                                                      .toList(),
                                                                                  leaveIdItemIndex),
                                                                              '[leave_name]',
                                                                            ))!
                                                                            .toList()
                                                                            .cast<String>();
                                                                  });
                                                                  if (FFAppState()
                                                                          .leaveDocImgPathList
                                                                          .length <=
                                                                      0) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            content:
                                                                                Text('ไม่มีรูปภาพ'),
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
                                                                  if (functions
                                                                      .containWordinStringUrl(
                                                                          '.pdf',
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveDocument(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ))!) {
                                                                    showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: double.infinity,
                                                                                child: UrlLinkWidget(
                                                                                  leaveDoc: FFAppState().leaveDocImgPathList,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  } else {
                                                                    showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Color(
                                                                              0xB4000000),
                                                                      barrierColor:
                                                                          Color(
                                                                              0xB3000000),
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.7,
                                                                                child: ShowCheckinImageWidget(
                                                                                  leaveImage: FFAppState().leaveDocImgPathList,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  }
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .attach_file,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 18.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if ((valueOrDefault<String>(
                                                          functions
                                                              .showMatNameInList(
                                                                  functions
                                                                      .reverseList(
                                                                          LeaveListAPICall
                                                                              .checkEdit(
                                                                        (_model.leaveListAPIOutput?.jsonBody ??
                                                                            ''),
                                                                      )?.toList())
                                                                      .toList(),
                                                                  leaveIdItemIndex),
                                                          '[leave_name]',
                                                        ) ==
                                                        'Y') &&
                                                    (valueOrDefault<String>(
                                                          functions
                                                              .showMatNameInList(
                                                                  functions
                                                                      .reverseList(
                                                                          LeaveListAPICall
                                                                              .leaveStatus(
                                                                        (_model.leaveListAPIOutput?.jsonBody ??
                                                                            ''),
                                                                      )?.toList())
                                                                      .toList(),
                                                                  leaveIdItemIndex),
                                                          '[leave_name]',
                                                        ) !=
                                                        '0'))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    HapticFeedback
                                                                        .mediumImpact();
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState().leaveDocImgPathList = functions
                                                                          .leaveStringImgToImgPathList(valueOrDefault<String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveDocument(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ))!
                                                                          .toList()
                                                                          .cast<String>();
                                                                    });
                                                                    if (functions.showMatNameInList(
                                                                            functions
                                                                                .reverseList(LeaveListAPICall.leaveName(
                                                                                  (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                )?.toList())
                                                                                .toList(),
                                                                            leaveIdItemIndex) ==
                                                                        'ลาออก') {
                                                                      context
                                                                          .goNamed(
                                                                        'AddResignPage',
                                                                        queryParameters:
                                                                            {
                                                                          'isFromDashboard':
                                                                              serializeParam(
                                                                            false,
                                                                            ParamType.bool,
                                                                          ),
                                                                          'phone':
                                                                              serializeParam(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.userPhoneNumber(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            ParamType.String,
                                                                          ),
                                                                          'endDate':
                                                                              serializeParam(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveDate(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            ParamType.String,
                                                                          ),
                                                                          'leaveReason':
                                                                              serializeParam(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveReason(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            ParamType.String,
                                                                          ),
                                                                          'leaveListId':
                                                                              serializeParam(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveID(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      return;
                                                                    }

                                                                    context
                                                                        .goNamed(
                                                                      'EditLeavePage',
                                                                      queryParameters:
                                                                          {
                                                                        'leaveType':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveName(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'leavePeriod':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leavePeriod(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'leaveDay':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveCountDay(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'leaveReason':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveReason(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'leaveListID':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveID(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'leaveDate':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveDate(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'userPhoneNumber':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.userPhoneNumber(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'leaveDocumentOld':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .leaveDocImgPathList,
                                                                          ParamType
                                                                              .String,
                                                                          true,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  text: 'แก้ไข',
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .edit,
                                                                    size: 22.0,
                                                                  ),
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
                                                                    color: Color(
                                                                        0xFF00968A),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    elevation:
                                                                        2.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              // กรณียกเลิก ดักให้กรอกเหตุผลการยกเลิกด้วยก่อนบันทึกข้อมูล
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  HapticFeedback
                                                                      .mediumImpact();
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xFFFFE700),
                                                                    barrierColor:
                                                                        Colors
                                                                            .transparent,
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
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.sizeOf(context).height * 0.5,
                                                                              child: InputCopy2Widget(
                                                                                leaveID: valueOrDefault<String>(
                                                                                  functions.showMatNameInList(
                                                                                      functions
                                                                                          .reverseList(LeaveListAPICall.leaveID(
                                                                                            (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                          )?.toList())
                                                                                          .toList(),
                                                                                      leaveIdItemIndex),
                                                                                  '[leave_name]',
                                                                                ),
                                                                                isFromApprovePage: false,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                },
                                                                text: 'ยกเลิก',
                                                                icon: Icon(
                                                                  Icons.cancel,
                                                                  size: 22.0,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 130.0,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFFB32A33),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  elevation:
                                                                      2.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
