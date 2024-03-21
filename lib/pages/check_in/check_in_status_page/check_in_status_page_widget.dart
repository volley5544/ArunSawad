import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/checkin_status/checkin_status_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/p_d_f_viewer/p_d_f_viewer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'check_in_status_page_model.dart';
export 'check_in_status_page_model.dart';

class CheckInStatusPageWidget extends StatefulWidget {
  const CheckInStatusPageWidget({
    super.key,
    this.checkinImage,
    this.date,
    this.checkinTimeIn,
    this.checkinTimeOut,
    this.checkinLastMonthDate,
    this.checkinLastMonthTimeIn,
    this.checkinLastMonthTimeOut,
    this.holidayDate,
    this.holidayName,
  });

  final String? checkinImage;
  final List<String>? date;
  final List<String>? checkinTimeIn;
  final List<String>? checkinTimeOut;
  final List<String>? checkinLastMonthDate;
  final List<String>? checkinLastMonthTimeIn;
  final List<String>? checkinLastMonthTimeOut;
  final List<String>? holidayDate;
  final List<String>? holidayName;

  @override
  State<CheckInStatusPageWidget> createState() =>
      _CheckInStatusPageWidgetState();
}

class _CheckInStatusPageWidgetState extends State<CheckInStatusPageWidget>
    with TickerProviderStateMixin {
  late CheckInStatusPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckInStatusPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CheckInStatusPage'});
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

      if (FFAppState().isGetDataViaFirebase) {
        setState(() {
          FFAppState().checkinStatusDate = functions
              .reverseList(widget.date?.toList())
              .toList()
              .cast<String>();
          FFAppState().checkinStatusTimeIn = functions
              .reverseList(widget.checkinTimeIn?.toList())
              .toList()
              .cast<String>();
          FFAppState().checkinStatusTimeOut = functions
              .reverseList(widget.checkinTimeOut?.toList())
              .toList()
              .cast<String>();
        });
        setState(() {
          FFAppState().checkinLastMonthDate =
              widget.checkinLastMonthDate!.toList().cast<String>();
          FFAppState().checkinLastMonthTimeIn =
              widget.checkinLastMonthTimeIn!.toList().cast<String>();
          FFAppState().checkinLastMonthTimeOut =
              widget.checkinLastMonthTimeOut!.toList().cast<String>();
        });
      } else {
        _model.checkinThisMonthOutput = await CheckinoutThisMonthAPICall.call(
          apiUrl: FFAppState().apiURLLocalState,
          token: FFAppState().accessToken,
        );
        if ((_model.checkinThisMonthOutput?.statusCode ?? 200) != 200) {
          if ((CheckinoutThisMonthAPICall.messageLayer1(
                    (_model.checkinThisMonthOutput?.jsonBody ?? ''),
                  ) ==
                  'The token has been blacklisted') ||
              (CheckinoutThisMonthAPICall.messageLayer1(
                    (_model.checkinThisMonthOutput?.jsonBody ?? ''),
                  ) ==
                  'Token Signature could not be verified.')) {
            var userLogRecordReference1 = UserLogRecord.collection.doc();
            await userLogRecordReference1.set(createUserLogRecordData(
              employeeId: FFAppState().employeeID,
              action: 'Logout',
              actionTime: getCurrentTimestamp,
              userLocation: currentUserLocationValue,
            ));
            _model.createdUserLogLogout3 = UserLogRecord.getDocumentFromData(
                createUserLogRecordData(
                  employeeId: FFAppState().employeeID,
                  action: 'Logout',
                  actionTime: getCurrentTimestamp,
                  userLocation: currentUserLocationValue,
                ),
                userLogRecordReference1);
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
                    content: Text(CheckinoutThisMonthAPICall.messageLayer1(
                      (_model.checkinThisMonthOutput?.jsonBody ?? ''),
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
        if (!((CheckinoutThisMonthAPICall.statusLayer2(
                  (_model.checkinThisMonthOutput?.jsonBody ?? ''),
                ) ==
                200) ||
            (CheckinoutThisMonthAPICall.statusLayer2(
                  (_model.checkinThisMonthOutput?.jsonBody ?? ''),
                ) ==
                201) ||
            (CheckinoutThisMonthAPICall.statusLayer2(
                  (_model.checkinThisMonthOutput?.jsonBody ?? ''),
                ) ==
                202))) {
          if (CheckinoutThisMonthAPICall.statusLayer2(
                (_model.checkinThisMonthOutput?.jsonBody ?? ''),
              ) ==
              404) {
            Navigator.pop(context);
            return;
          } else {
            Navigator.pop(context);
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาดเบื้องหลัง (${CheckinoutThisMonthAPICall.statusLayer2(
                      (_model.checkinThisMonthOutput?.jsonBody ?? ''),
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
        _model.checkinLastMonthOutput = await CheckinoutLastMonthAPICall.call(
          apiUrl: FFAppState().apiURLLocalState,
          token: FFAppState().accessToken,
        );
        if ((_model.checkinLastMonthOutput?.statusCode ?? 200) != 200) {
          if ((CheckinoutLastMonthAPICall.messageLayer1(
                    (_model.checkinLastMonthOutput?.jsonBody ?? ''),
                  ) ==
                  'The token has been blacklisted') ||
              (CheckinoutLastMonthAPICall.messageLayer1(
                    (_model.checkinLastMonthOutput?.jsonBody ?? ''),
                  ) ==
                  'Token Signature could not be verified.')) {
            var userLogRecordReference2 = UserLogRecord.collection.doc();
            await userLogRecordReference2.set(createUserLogRecordData(
              employeeId: FFAppState().employeeID,
              action: 'Logout',
              actionTime: getCurrentTimestamp,
              userLocation: currentUserLocationValue,
            ));
            _model.createdUserLogLogout4 = UserLogRecord.getDocumentFromData(
                createUserLogRecordData(
                  employeeId: FFAppState().employeeID,
                  action: 'Logout',
                  actionTime: getCurrentTimestamp,
                  userLocation: currentUserLocationValue,
                ),
                userLogRecordReference2);
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
                    content: Text(CheckinoutLastMonthAPICall.messageLayer1(
                      (_model.checkinLastMonthOutput?.jsonBody ?? ''),
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
        if ((CheckinoutLastMonthAPICall.statusLayer2(
                  (_model.checkinLastMonthOutput?.jsonBody ?? ''),
                ) ==
                200) ||
            (CheckinoutLastMonthAPICall.statusLayer2(
                  (_model.checkinLastMonthOutput?.jsonBody ?? ''),
                ) ==
                201) ||
            (CheckinoutLastMonthAPICall.statusLayer2(
                  (_model.checkinLastMonthOutput?.jsonBody ?? ''),
                ) ==
                202)) {
          setState(() {
            FFAppState().checkinStatusDate = functions
                .reverseList(CheckinoutThisMonthAPICall.date(
                  (_model.checkinThisMonthOutput?.jsonBody ?? ''),
                )?.toList())
                .toList()
                .cast<String>();
            FFAppState().checkinStatusTimeIn = functions
                .reverseList(CheckinoutThisMonthAPICall.workInTime(
                  (_model.checkinThisMonthOutput?.jsonBody ?? ''),
                )?.toList())
                .toList()
                .cast<String>();
            FFAppState().checkinStatusTimeOut = functions
                .reverseList(CheckinoutThisMonthAPICall.workOutTime(
                  (_model.checkinThisMonthOutput?.jsonBody ?? ''),
                )?.toList())
                .toList()
                .cast<String>();
          });
          setState(() {
            FFAppState().checkinLastMonthDate = CheckinoutLastMonthAPICall.date(
              (_model.checkinLastMonthOutput?.jsonBody ?? ''),
            )!
                .toList()
                .cast<String>();
            FFAppState().checkinLastMonthTimeIn =
                CheckinoutLastMonthAPICall.workInTime(
              (_model.checkinLastMonthOutput?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
            FFAppState().checkinLastMonthTimeOut =
                CheckinoutLastMonthAPICall.workOutTime(
              (_model.checkinLastMonthOutput?.jsonBody ?? ''),
            )!
                    .toList()
                    .cast<String>();
          });
        } else {
          if (CheckinoutLastMonthAPICall.statusLayer2(
                (_model.checkinLastMonthOutput?.jsonBody ?? ''),
              ) ==
              404) {
            Navigator.pop(context);
            return;
          } else {
            Navigator.pop(context);
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(
                        'พบข้อผิดพลาดเบื้องหลัง (${CheckinoutLastMonthAPICall.statusLayer2(
                      (_model.checkinLastMonthOutput?.jsonBody ?? ''),
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
      }

      _model.getPersonalLeaveDate = await GetLeaveDateCheckinAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      if ((_model.getPersonalLeaveDate?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดConnection (${(_model.getPersonalLeaveDate?.statusCode ?? 200).toString()})'),
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
      if (!(((GetLeaveDateCheckinAPICall.statusLayer3CM(
                    (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                  ) ==
                  200) ||
              (GetLeaveDateCheckinAPICall.statusLayer3CM(
                    (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                  ) ==
                  404)) &&
          ((GetLeaveDateCheckinAPICall.statusLayer3LM(
                    (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                  ) ==
                  200) ||
              (GetLeaveDateCheckinAPICall.statusLayer3LM(
                    (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                  ) ==
                  404)))) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดCurrentMonth (${GetLeaveDateCheckinAPICall.statusLayer3CM(
                  (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                )?.toString()}) CurrentMonth (${GetLeaveDateCheckinAPICall.statusLayer3LM(
                  (_model.getPersonalLeaveDate?.jsonBody ?? ''),
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
        Navigator.pop(context);
        return;
      }
      Navigator.pop(context);
    });

    _model.expandableController = ExpandableController(initialExpanded: false);
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

    return FutureBuilder<List<UserCheckinHistoryRecord>>(
      future: queryUserCheckinHistoryRecordOnce(
        parent: FFAppState().userRef,
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
        List<UserCheckinHistoryRecord>
            checkInStatusPageUserCheckinHistoryRecordList = snapshot.data!;
        final checkInStatusPageUserCheckinHistoryRecord =
            checkInStatusPageUserCheckinHistoryRecordList.isNotEmpty
                ? checkInStatusPageUserCheckinHistoryRecordList.first
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
                    context.goNamed('DashboardCheckin');
                  },
                  child: Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ),
                title: Text(
                  'เวลาเข้างาน - ออกงาน',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                ),
                actions: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          HapticFeedback.mediumImpact();
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Color(0x7F000000),
                            barrierColor: Color(0x00000000),
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.7,
                                      child: CheckinStatusWidget(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: FaIcon(
                          FontAwesomeIcons.exclamationTriangle,
                          color: Colors.white,
                          size: 35.0,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: Color(0xB2000000),
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: GestureDetector(
                                onTap: () => _model.unfocusNode.canRequestFocus
                                    ? FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode)
                                    : FocusScope.of(context).unfocus(),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: PDFViewerWidget(
                                    pdfUrl:
                                        'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/AnnouncementPDF%2F%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B2%E0%B8%A8%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%AB%E0%B8%A2%E0%B8%B8%E0%B8%94%E0%B8%95%E0%B8%B2%E0%B8%A1%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B9%80%E0%B8%9E%E0%B8%93%E0%B8%B5%20%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%88%E0%B8%B3%E0%B8%9B%E0%B8%B5%202567.pdf?alt=media&token=15daf745-a5c8-477f-aed0-acebb73d8cee',
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Icon(
                                Icons.read_more,
                                color: Color(0xFFF46506),
                                size: 32.0,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.35, -0.09),
                              child: SelectionArea(
                                  child: Text(
                                'ประกาศวันหยุดตามประเพณี ประจำปี  2567',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              color: Color(0x00000000),
                              child: ExpandableNotifier(
                                controller: _model.expandableController,
                                child: ExpandablePanel(
                                  header: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.asterisk,
                                        color: Color(0xFFFF0000),
                                        size: 10.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.asterisk,
                                          color: Color(0xFFFF0000),
                                          size: 10.0,
                                        ),
                                      ),
                                      Text(
                                        'สาขาที่เวลาทำการพิเศษและสาขาที่มีสองกะ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFFFF0000),
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w900,
                                            ),
                                      ),
                                    ],
                                  ),
                                  collapsed: Container(
                                    width: double.infinity,
                                    height: 20.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Text(
                                      'แตะเพื่ออ่านเพิ่มเติม',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                    ),
                                  ),
                                  expanded: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Text(
                                                    '- ให้บันทึกเวลาในโปรแกรมอรุณสวัสดิ์ ระบบจะส่งเวลาทำงานไปยังระบบ coach อัตโนมัติ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .black600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Text(
                                                      '- ให้ตรวจสอบเวลางานผ่านระบบ coach อีกครั้งในวันถัดไป',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black600,
                                                              ),
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
                                  theme: ExpandableThemeData(
                                    tapHeaderToExpand: true,
                                    tapBodyToExpand: false,
                                    tapBodyToCollapse: false,
                                    headerAlignment:
                                        ExpandablePanelHeaderAlignment.center,
                                    hasIcon: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              labelColor: FlutterFlowTheme.of(context).primary,
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
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
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: SelectionArea(
                                                        child: Text(
                                                      'วันที่',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 14.0,
                                                              ),
                                                    )),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'เข้างาน',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  )),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'ออกงาน',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  )),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'สถานะ',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Builder(
                                        builder: (context) {
                                          final checkinActionStatusList =
                                              FFAppState()
                                                  .checkinStatusDate
                                                  .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                checkinActionStatusList.length,
                                            itemBuilder: (context,
                                                checkinActionStatusListIndex) {
                                              final checkinActionStatusListItem =
                                                  checkinActionStatusList[
                                                      checkinActionStatusListIndex];
                                              return Container(
                                                width: 100.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
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
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: SelectionArea(
                                                            child: AutoSizeText(
                                                          functions.showCheckinDate(
                                                              functions.showMatNameInList(
                                                                  FFAppState()
                                                                      .checkinStatusDate
                                                                      .toList(),
                                                                  checkinActionStatusListIndex)),
                                                          textAlign:
                                                              TextAlign.justify,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12.0,
                                                              ),
                                                        )),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: SelectionArea(
                                                          child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          functions.showMatNameInList(
                                                              FFAppState()
                                                                  .checkinStatusTimeIn
                                                                  .toList(),
                                                              checkinActionStatusListIndex),
                                                          '[time_in]',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12.0,
                                                            ),
                                                      )),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: SelectionArea(
                                                          child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          functions.showMatNameInList(
                                                              FFAppState()
                                                                  .checkinStatusTimeOut
                                                                  .toList(),
                                                              checkinActionStatusListIndex),
                                                          '[time_out]',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12.0,
                                                            ),
                                                      )),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 12.0,
                                                                height: 12.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: functions.getCheckinStatusColor(
                                                                      functions.showMatNameInList(FFAppState().checkinStatusTimeIn.toList(), checkinActionStatusListIndex),
                                                                      functions.showMatNameInList(FFAppState().checkinStatusTimeOut.toList(), checkinActionStatusListIndex),
                                                                      functions.showMatNameInList(FFAppState().checkinStatusDate.toList(), checkinActionStatusListIndex),
                                                                      FFAppState().branchCode,
                                                                      FFAppState().checkinStatusColor.toList(),
                                                                      widget.holidayDate?.toList(),
                                                                      checkinActionStatusListIndex,
                                                                      true,
                                                                      GetLeaveDateCheckinAPICall.statusLayer3CM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? functions.checkLeaveCheckin(
                                                                              GetLeaveDateCheckinAPICall.startLeaveDateCM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              GetLeaveDateCheckinAPICall.endLeaveDateCM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              FFAppState().checkinStatusDate[checkinActionStatusListIndex])
                                                                          : false),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child:
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.getCheckinStatusText(
                                                                      functions.showMatNameInList(FFAppState().checkinStatusTimeIn.toList(), checkinActionStatusListIndex),
                                                                      functions.showMatNameInList(FFAppState().checkinStatusTimeOut.toList(), checkinActionStatusListIndex),
                                                                      functions.showMatNameInList(FFAppState().checkinStatusDate.toList(), checkinActionStatusListIndex),
                                                                      FFAppState().branchCode,
                                                                      widget.holidayDate?.toList(),
                                                                      checkinActionStatusListIndex,
                                                                      true,
                                                                      widget.holidayName?.toList(),
                                                                      GetLeaveDateCheckinAPICall.statusLayer3CM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? functions.checkLeaveCheckin(
                                                                              GetLeaveDateCheckinAPICall.startLeaveDateCM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              GetLeaveDateCheckinAPICall.endLeaveDateCM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              FFAppState().checkinStatusDate[checkinActionStatusListIndex])
                                                                          : false,
                                                                      GetLeaveDateCheckinAPICall.statusLayer3CM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? functions.checkLeaveCheckinType(
                                                                              GetLeaveDateCheckinAPICall.startLeaveDateCM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              GetLeaveDateCheckinAPICall.endLeaveDateCM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              FFAppState().checkinStatusDate[checkinActionStatusListIndex],
                                                                              GetLeaveDateCheckinAPICall.leaveTypeCM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              GetLeaveDateCheckinAPICall.subLeaveTypeCM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList())
                                                                          : '-'),
                                                                  '[checkin_status]',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                              )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: SelectionArea(
                                                        child: Text(
                                                      'วันที่',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 14.0,
                                                              ),
                                                    )),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'เข้างาน',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  )),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'ออกงาน',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  )),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'สถานะ',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Builder(
                                        builder: (context) {
                                          final checkinStatusLMList =
                                              FFAppState()
                                                  .checkinLastMonthDate
                                                  .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                checkinStatusLMList.length,
                                            itemBuilder: (context,
                                                checkinStatusLMListIndex) {
                                              final checkinStatusLMListItem =
                                                  checkinStatusLMList[
                                                      checkinStatusLMListIndex];
                                              return Container(
                                                width: 100.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
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
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: SelectionArea(
                                                            child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions.showCheckinDate(
                                                                functions.showMatNameInList(
                                                                    FFAppState()
                                                                        .checkinLastMonthDate
                                                                        .toList(),
                                                                    checkinStatusLMListIndex)),
                                                            '[date]',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12.0,
                                                              ),
                                                        )),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: SelectionArea(
                                                          child: Text(
                                                        valueOrDefault<String>(
                                                          functions.showMatNameInList(
                                                              FFAppState()
                                                                  .checkinLastMonthTimeIn
                                                                  .toList(),
                                                              checkinStatusLMListIndex),
                                                          '[time_in]',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12.0,
                                                            ),
                                                      )),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: SelectionArea(
                                                          child: Text(
                                                        valueOrDefault<String>(
                                                          functions.showMatNameInList(
                                                              FFAppState()
                                                                  .checkinLastMonthTimeOut
                                                                  .toList(),
                                                              checkinStatusLMListIndex),
                                                          '[time_out]',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12.0,
                                                            ),
                                                      )),
                                                    ),
                                                    Expanded(
                                                      flex: 3,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 12.0,
                                                                height: 12.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    functions.getCheckinStatusColor(
                                                                        functions.showMatNameInList(FFAppState().checkinLastMonthTimeIn.toList(), checkinStatusLMListIndex),
                                                                        functions.showMatNameInList(FFAppState().checkinLastMonthTimeOut.toList(), checkinStatusLMListIndex),
                                                                        functions.showMatNameInList(FFAppState().checkinLastMonthDate.toList(), checkinStatusLMListIndex),
                                                                        FFAppState().branchCode,
                                                                        FFAppState().checkinStatusColor.toList(),
                                                                        widget.holidayDate?.toList(),
                                                                        checkinStatusLMListIndex,
                                                                        false,
                                                                        GetLeaveDateCheckinAPICall.statusLayer3LM(
                                                                                  (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                                ) ==
                                                                                200
                                                                            ? functions.checkLeaveCheckin(
                                                                                GetLeaveDateCheckinAPICall.startLeaveDateLM(
                                                                                  (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                                )?.toList(),
                                                                                GetLeaveDateCheckinAPICall.endLeaveDateLM(
                                                                                  (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                                )?.toList(),
                                                                                FFAppState().checkinLastMonthDate[checkinStatusLMListIndex])
                                                                            : false),
                                                                    Color(
                                                                        0xFF9D6969),
                                                                  ),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child:
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.getCheckinStatusText(
                                                                      functions.showMatNameInList(FFAppState().checkinLastMonthTimeIn.toList(), checkinStatusLMListIndex),
                                                                      functions.showMatNameInList(FFAppState().checkinLastMonthTimeOut.toList(), checkinStatusLMListIndex),
                                                                      functions.showMatNameInList(FFAppState().checkinLastMonthDate.toList(), checkinStatusLMListIndex),
                                                                      FFAppState().branchCode,
                                                                      widget.holidayDate?.toList(),
                                                                      checkinStatusLMListIndex,
                                                                      false,
                                                                      widget.holidayName?.toList(),
                                                                      GetLeaveDateCheckinAPICall.statusLayer3LM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? functions.checkLeaveCheckin(
                                                                              GetLeaveDateCheckinAPICall.startLeaveDateLM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              GetLeaveDateCheckinAPICall.endLeaveDateLM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              FFAppState().checkinLastMonthDate[checkinStatusLMListIndex])
                                                                          : false,
                                                                      GetLeaveDateCheckinAPICall.statusLayer3LM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              ) ==
                                                                              200
                                                                          ? functions.checkLeaveCheckinType(
                                                                              GetLeaveDateCheckinAPICall.startLeaveDateLM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              GetLeaveDateCheckinAPICall.endLeaveDateLM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              FFAppState().checkinLastMonthDate[checkinStatusLMListIndex],
                                                                              GetLeaveDateCheckinAPICall.leaveTypeLM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              GetLeaveDateCheckinAPICall.subLeaveTypeLM(
                                                                                (_model.getPersonalLeaveDate?.jsonBody ?? ''),
                                                                              )?.toList())
                                                                          : '-'),
                                                                  '[checkin_status]',
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
                                                                    ),
                                                              )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
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
  }
}
