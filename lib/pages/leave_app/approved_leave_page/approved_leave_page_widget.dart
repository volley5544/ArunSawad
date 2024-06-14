import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/show_checkin_image/show_checkin_image_widget.dart';
import '/components/url_link/url_link_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'approved_leave_page_model.dart';
export 'approved_leave_page_model.dart';

class ApprovedLeavePageWidget extends StatefulWidget {
  const ApprovedLeavePageWidget({super.key});

  @override
  State<ApprovedLeavePageWidget> createState() =>
      _ApprovedLeavePageWidgetState();
}

class _ApprovedLeavePageWidgetState extends State<ApprovedLeavePageWidget> {
  late ApprovedLeavePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApprovedLeavePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ApprovedLeavePage'});
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

      FFAppState().multiApprove = false;
      setState(() {});
      _model.leaveListAprroveAPIOutput = await LeaveListAprroveAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      if ((_model.leaveListAprroveAPIOutput?.statusCode ?? 200) == 200) {
        if (LeaveListAprroveAPICall.infoStatus(
              (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
            ) ==
            200) {
          FFAppState().positionApprove = '1';
          FFAppState().update(() {});
          FFAppState().selectApproveList = functions
              .createFalseList(
                  false,
                  LeaveListAprroveAPICall.leaveID(
                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                  )?.length)!
              .toList()
              .cast<bool>();
          FFAppState().multiApprove = false;
          setState(() {});
          Navigator.pop(context);
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text('ไม่พบข้อมูลการขออนุมัติลา'),
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
          context.pop();
          return;
        }
      } else {
        if ((LeaveListAprroveAPICall.massageLayer1(
                  (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                ) ==
                'The token has been blacklisted') ||
            (LeaveListAprroveAPICall.massageLayer1(
                  (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
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

          context.goNamed('LoginPage');

          return;
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content: Text(LeaveListAprroveAPICall.massageLayer1(
                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
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
          leading: Visibility(
            visible: !FFAppState().isFromTimesheetPage,
            child: InkWell(
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
          ),
          title: Text(
            'รายการอนุมัติลา',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!FFAppState().multiApprove)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 30.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  HapticFeedback.mediumImpact();
                                  FFAppState().multiApprove = true;
                                  FFAppState().selectApproveList = functions
                                      .createFalseList(
                                          false,
                                          LeaveListAprroveAPICall.leaveID(
                                            (_model.leaveListAprroveAPIOutput
                                                    ?.jsonBody ??
                                                ''),
                                          )?.length)!
                                      .toList()
                                      .cast<bool>();
                                  setState(() {});
                                },
                                text: 'อนุมัติหลายคน',
                                icon: Icon(
                                  Icons.check,
                                  size: 18.0,
                                ),
                                options: FFButtonOptions(
                                  width: 120.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (FFAppState().multiApprove)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue ??= false,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.checkboxValue = newValue!);
                                          if (newValue!) {
                                            FFAppState().ApproveAllCheck = true;
                                            FFAppState().selectApproveList =
                                                functions
                                                    .createFalseList(
                                                        true,
                                                        LeaveListAprroveAPICall
                                                            .leaveID(
                                                          (_model.leaveListAprroveAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.length)!
                                                    .toList()
                                                    .cast<bool>();
                                            setState(() {});
                                          } else {
                                            FFAppState().ApproveAllCheck =
                                                false;
                                            FFAppState().selectApproveList =
                                                functions
                                                    .createFalseList(
                                                        false,
                                                        LeaveListAprroveAPICall
                                                            .leaveID(
                                                          (_model.leaveListAprroveAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.length)!
                                                    .toList()
                                                    .cast<bool>();
                                            setState(() {});
                                          }
                                        },
                                        side: BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                      ),
                                    ),
                                    Text(
                                      'เลือกทั้งหมด',
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
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(functions
                                                    .returnMapListFromBoolList(
                                                        LeaveListAprroveAPICall
                                                            .leaveID(
                                                          (_model.leaveListAprroveAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.toList(),
                                                        FFAppState()
                                                            .selectApproveList
                                                            .toList(),
                                                        true)
                                                    .length
                                                    .toString()),
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
                                        if (functions.countTrueInBoolList(
                                                FFAppState()
                                                    .selectApproveList
                                                    .toList())! <=
                                            0) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณาเลือกรายการที่ต้องการจะอนุมัติอย่างน้อย 1 รายการ'),
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
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
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

                                        _model.leaveFlagApproveListOutput =
                                            await LeaveFlagApproveListAPICall
                                                .call(
                                          apiUrl: FFAppState().apiURLLocalState,
                                          token: FFAppState().accessToken,
                                          leaveIdList: functions
                                              .returnMappedListFromBoolList(
                                                  functions
                                                      .reverseList(
                                                          LeaveListAprroveAPICall
                                                              .leaveID(
                                                        (_model.leaveListAprroveAPIOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?.toList())
                                                      .toList(),
                                                  FFAppState()
                                                      .selectApproveList
                                                      .toList(),
                                                  true),
                                          flagApprove: 'Y',
                                        );
                                        _shouldSetState = true;
                                        if ((_model.leaveFlagApproveListOutput
                                                    ?.statusCode ??
                                                200) !=
                                            200) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'พบข้อผิดพลาดConnection (${(_model.leaveFlagApproveListOutput?.statusCode ?? 200).toString()})'),
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
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                        if (LeaveFlagApproveListAPICall
                                                .statusLayer2(
                                              (_model.leaveFlagApproveListOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      LeaveFlagApproveListAPICall
                                                          .messageLayer2(
                                                    (_model.leaveFlagApproveListOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!),
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
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      LeaveFlagApproveListAPICall
                                                          .messageLayer2(
                                                    (_model.leaveFlagApproveListOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!),
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
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        Navigator.pop(context);
                                        context.pop();

                                        context.pushNamed('ApprovedLeavePage');

                                        if (_shouldSetState) setState(() {});
                                      },
                                      text: 'อนุมัติที่เลือก',
                                      icon: Icon(
                                        Icons.check_circle_outline,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 110.0,
                                        height: 40.0,
                                        padding: EdgeInsets.all(0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF00968A),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: 1.0,
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().multiApprove = false;
                                      FFAppState().selectApproveList = functions
                                          .createFalseList(
                                              false,
                                              LeaveListAprroveAPICall.leaveID(
                                                (_model.leaveListAprroveAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.length)!
                                          .toList()
                                          .cast<bool>();
                                      setState(() {});
                                    },
                                    text: 'ยกเลิก',
                                    icon: FaIcon(
                                      FontAwesomeIcons.ban,
                                      size: 18.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 105.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context).error,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
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
              Expanded(
                child: Builder(
                  builder: (context) {
                    final leaveIdItem = LeaveListAprroveAPICall.leaveID(
                          (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                        )?.toList() ??
                        [];
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: leaveIdItem.length,
                      itemBuilder: (context, leaveIdItemIndex) {
                        final leaveIdItemItem = leaveIdItem[leaveIdItemIndex];
                        return FutureBuilder<List<UserCustomRecord>>(
                          future: queryUserCustomRecordOnce(
                            queryBuilder: (userCustomRecord) =>
                                userCustomRecord.where(
                              'employee_id',
                              isEqualTo: LeaveListAprroveAPICall.empIdBoss2(
                                        (_model.leaveListAprroveAPIOutput
                                                ?.jsonBody ??
                                            ''),
                                      ) !=
                                      ''
                                  ? LeaveListAprroveAPICall.empIdBoss2(
                                      (_model.leaveListAprroveAPIOutput
                                              ?.jsonBody ??
                                          ''),
                                    )
                                  : null,
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
                            List<UserCustomRecord>
                                bottomSheetUserCustomRecordList =
                                snapshot.data!;
                            final bottomSheetUserCustomRecord =
                                bottomSheetUserCustomRecordList.isNotEmpty
                                    ? bottomSheetUserCustomRecordList.first
                                    : null;
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (FFAppState().multiApprove) {
                                  FFAppState().updateSelectApproveListAtIndex(
                                    leaveIdItemIndex,
                                    (_) => FFAppState().selectApproveList[
                                                leaveIdItemIndex] ==
                                            true
                                        ? false
                                        : true,
                                  );
                                  setState(() {});
                                }
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (FFAppState().multiApprove)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (FFAppState()
                                                        .selectApproveList[
                                                    leaveIdItemIndex]) {
                                                  FFAppState()
                                                      .updateSelectApproveListAtIndex(
                                                    leaveIdItemIndex,
                                                    (_) => false,
                                                  );
                                                  setState(() {});
                                                } else {
                                                  FFAppState()
                                                      .updateSelectApproveListAtIndex(
                                                    leaveIdItemIndex,
                                                    (_) => true,
                                                  );
                                                  setState(() {});
                                                }
                                              },
                                              child: Container(
                                                width: 18.0,
                                                height: 18.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                child: Visibility(
                                                  visible: FFAppState()
                                                          .selectApproveList[
                                                      leaveIdItemIndex],
                                                  child: Icon(
                                                    Icons.check,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .success,
                                                    size: 18.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          FutureBuilder<List<UserCustomRecord>>(
                                            future: queryUserCustomRecordOnce(
                                              queryBuilder:
                                                  (userCustomRecord) =>
                                                      userCustomRecord.where(
                                                'employee_id',
                                                isEqualTo: functions
                                                            .showMatNameInList(
                                                                functions
                                                                    .reverseList(
                                                                        LeaveListAprroveAPICall
                                                                            .empCode(
                                                                      (_model.leaveListAprroveAPIOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )?.toList())
                                                                    .toList(),
                                                                leaveIdItemIndex) !=
                                                        ''
                                                    ? functions
                                                        .showMatNameInList(
                                                            functions
                                                                .reverseList(
                                                                    LeaveListAprroveAPICall
                                                                        .empCode(
                                                                  (_model.leaveListAprroveAPIOutput
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.toList())
                                                                .toList(),
                                                            leaveIdItemIndex)
                                                    : null,
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UserCustomRecord>
                                                  containerUserCustomRecordList =
                                                  snapshot.data!;
                                              final containerUserCustomRecord =
                                                  containerUserCustomRecordList
                                                          .isNotEmpty
                                                      ? containerUserCustomRecordList
                                                          .first
                                                      : null;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onLongPress: () async {
                                                  HapticFeedback.mediumImpact();
                                                  FFAppState().multiApprove =
                                                      true;
                                                  FFAppState()
                                                          .selectApproveList =
                                                      functions
                                                          .createFalseList(
                                                              false,
                                                              LeaveListAprroveAPICall
                                                                  .leaveID(
                                                                (_model.leaveListAprroveAPIOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.length)!
                                                          .toList()
                                                          .cast<bool>();
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  height: functions
                                                      .contrainerChange(380.0),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 10.0),
                                                    child: FutureBuilder<
                                                        List<FCMTokenRecord>>(
                                                      future:
                                                          queryFCMTokenRecordOnce(
                                                        queryBuilder: (fCMTokenRecord) =>
                                                            fCMTokenRecord
                                                                .where(
                                                                  'employee_id',
                                                                  isEqualTo: functions.showMatNameInList(
                                                                              functions
                                                                                  .reverseList(LeaveListAprroveAPICall.empCode(
                                                                                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                  )?.toList())
                                                                                  .toList(),
                                                                              leaveIdItemIndex) !=
                                                                          ''
                                                                      ? functions.showMatNameInList(
                                                                          functions
                                                                              .reverseList(LeaveListAprroveAPICall.empCode(
                                                                                (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                              )?.toList())
                                                                              .toList(),
                                                                          leaveIdItemIndex)
                                                                      : null,
                                                                )
                                                                .orderBy(
                                                                    'created_at',
                                                                    descending:
                                                                        true),
                                                        singleRecord: true,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                valueColor:
                                                                    AlwaysStoppedAnimation<
                                                                        Color>(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<FCMTokenRecord>
                                                            columnPlusFCMTokenRecordList =
                                                            snapshot.data!;
                                                        final columnPlusFCMTokenRecord =
                                                            columnPlusFCMTokenRecordList
                                                                    .isNotEmpty
                                                                ? columnPlusFCMTokenRecordList
                                                                    .first
                                                                : null;
                                                        return SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    FutureBuilder<
                                                                        List<
                                                                            UserCustomRecord>>(
                                                                      future:
                                                                          queryUserCustomRecordOnce(
                                                                        queryBuilder:
                                                                            (userCustomRecord) =>
                                                                                userCustomRecord.where(
                                                                          'employee_id',
                                                                          isEqualTo: valueOrDefault<String>(
                                                                                    functions.showMatNameInList(
                                                                                        functions
                                                                                            .reverseList(LeaveListAprroveAPICall.empCode(
                                                                                              (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                            )?.toList())
                                                                                            .toList(),
                                                                                        leaveIdItemIndex),
                                                                                    '[leave_name]',
                                                                                  ) !=
                                                                                  ''
                                                                              ? valueOrDefault<String>(
                                                                                  functions.showMatNameInList(
                                                                                      functions
                                                                                          .reverseList(LeaveListAprroveAPICall.empCode(
                                                                                            (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                          )?.toList())
                                                                                          .toList(),
                                                                                      leaveIdItemIndex),
                                                                                  '[leave_name]',
                                                                                )
                                                                              : null,
                                                                        ),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<UserCustomRecord>
                                                                            imageUserCustomRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final imageUserCustomRecord = imageUserCustomRecordList.isNotEmpty
                                                                            ? imageUserCustomRecordList.first
                                                                            : null;
                                                                        return ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            imageUserCustomRecord!.imgProfile,
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            FFAppState().updateSelectApproveListAtIndex(
                                                                              leaveIdItemIndex,
                                                                              (_) => FFAppState().selectApproveList[leaveIdItemIndex] == true ? false : true,
                                                                            );
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    flex: 7,
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 5.0),
                                                                                      child: SelectionArea(
                                                                                          child: Text(
                                                                                        '${valueOrDefault<String>(
                                                                                          functions.showMatNameInList(
                                                                                              functions
                                                                                                  .reverseList(LeaveListAprroveAPICall.leaveUserName(
                                                                                                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                                  )?.toList())
                                                                                                  .toList(),
                                                                                              leaveIdItemIndex),
                                                                                          '[leave_name]',
                                                                                        )}(${valueOrDefault<String>(
                                                                                          functions.showMatNameInList(
                                                                                              functions
                                                                                                  .reverseList(LeaveListAprroveAPICall.empCode(
                                                                                                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                                  )?.toList())
                                                                                                  .toList(),
                                                                                              leaveIdItemIndex),
                                                                                          '[leave_name]',
                                                                                        )})',
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      )),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: SelectionArea(
                                                                                                child: Text(
                                                                                              'สถานะ:',
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            )),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          SelectionArea(
                                                                                              child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              functions.leaveStatusToText(valueOrDefault<String>(
                                                                                                functions.showMatNameInList(
                                                                                                    functions
                                                                                                        .reverseList(LeaveListAprroveAPICall.leaveStatus(
                                                                                                          (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                                        )?.toList())
                                                                                                        .toList(),
                                                                                                    leaveIdItemIndex),
                                                                                                '[leave_name]',
                                                                                              )),
                                                                                              'leave_status',
                                                                                            ),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          )),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: SelectionArea(
                                                                                                child: Text(
                                                                                              'ชื่อเล่น:',
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            )),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          SelectionArea(
                                                                                              child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              functions.showMatNameInList(
                                                                                                  functions
                                                                                                      .reverseList(LeaveListAprroveAPICall.nickName(
                                                                                                        (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                                      )?.map((e) => e.toString()).toList()?.toList())
                                                                                                      .toList(),
                                                                                                  leaveIdItemIndex),
                                                                                              '[leave_name]',
                                                                                            ),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          )),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: SelectionArea(
                                                                                                child: Text(
                                                                                              'สังกัดแผนก:',
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            )),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          SelectionArea(
                                                                                              child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              functions.showMatNameInList(
                                                                                                  functions
                                                                                                      .reverseList(LeaveListAprroveAPICall.department(
                                                                                                        (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                                      )?.map((e) => e.toString()).toList()?.toList())
                                                                                                      .toList(),
                                                                                                  leaveIdItemIndex),
                                                                                              '[leave_name]',
                                                                                            ),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          )),
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
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            3.0),
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
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              'ประเภทการลา:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            )),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            valueOrDefault<String>(
                                                                              functions.showMatNameInList(
                                                                                  functions
                                                                                      .reverseList(LeaveListAprroveAPICall.leaveName(
                                                                                        (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                      )?.toList())
                                                                                      .toList(),
                                                                                  leaveIdItemIndex),
                                                                              '[leave_name]',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          )),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            'วันที่ทำรายการ:',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          )),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAprroveAPICall.createDate(
                                                                                      (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        )),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
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
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              'วันที่ลา:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            )),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            valueOrDefault<String>(
                                                                              functions.showMatNameInList(
                                                                                  functions
                                                                                      .reverseList(LeaveListAprroveAPICall.leaveDate(
                                                                                        (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                      )?.toList())
                                                                                      .toList(),
                                                                                  leaveIdItemIndex),
                                                                              '[leave_name]',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          )),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              if (valueOrDefault<
                                                                      String>(
                                                                    functions.showMatNameInList(
                                                                        functions
                                                                            .reverseList(LeaveListAprroveAPICall.leaveName(
                                                                              (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                            )?.toList())
                                                                            .toList(),
                                                                        leaveIdItemIndex),
                                                                    '[leave_name]',
                                                                  ) !=
                                                                  'ลาออก')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
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
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              SelectionArea(
                                                                                  child: Text(
                                                                                'จำนวนวันที่ลา:',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              valueOrDefault<String>(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(LeaveListAprroveAPICall.leaveCountDay(
                                                                                          (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    leaveIdItemIndex),
                                                                                '[leave_name]',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            )),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if (valueOrDefault<
                                                                      String>(
                                                                    functions.showMatNameInList(
                                                                        functions
                                                                            .reverseList(LeaveListAprroveAPICall.leaveName(
                                                                              (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                            )?.toList())
                                                                            .toList(),
                                                                        leaveIdItemIndex),
                                                                    '[leave_name]',
                                                                  ) !=
                                                                  'ลาออก')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
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
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              SelectionArea(
                                                                                  child: Text(
                                                                                'ช่วงเวลา:',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              valueOrDefault<String>(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(LeaveListAprroveAPICall.leavePeriod(
                                                                                          (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    leaveIdItemIndex),
                                                                                '[leave_name]',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            )),
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
                                                                            3.0,
                                                                            0.0,
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
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              valueOrDefault<String>(
                                                                                        functions.showMatNameInList(
                                                                                            functions
                                                                                                .reverseList(LeaveListAprroveAPICall.leaveName(
                                                                                                  (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                                )?.toList())
                                                                                                .toList(),
                                                                                            leaveIdItemIndex),
                                                                                        '[full_name]',
                                                                                      ) !=
                                                                                      'ลาออก'
                                                                                  ? 'เหตุผลการลา:'
                                                                                  : 'เหตุผลการลาออก:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            )),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            valueOrDefault<String>(
                                                                                      functions.showMatNameInList(
                                                                                          functions
                                                                                              .reverseList(LeaveListAprroveAPICall.leaveName(
                                                                                                (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                              )?.toList())
                                                                                              .toList(),
                                                                                          leaveIdItemIndex),
                                                                                      '[full_name]',
                                                                                    ) !=
                                                                                    'ลาออก'
                                                                                ? valueOrDefault<String>(
                                                                                    functions.showMatNameInList(
                                                                                        functions
                                                                                            .reverseList(LeaveListAprroveAPICall.leaveReason(
                                                                                              (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                            )?.toList())
                                                                                            .toList(),
                                                                                        leaveIdItemIndex),
                                                                                    '[full_name]',
                                                                                  )
                                                                                : valueOrDefault<String>(
                                                                                    functions.showMatNameInList(
                                                                                        functions
                                                                                            .reverseList(LeaveListAprroveAPICall.reasonResign(
                                                                                              (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                            )?.toList())
                                                                                            .toList(),
                                                                                        leaveIdItemIndex),
                                                                                    '[full_name]',
                                                                                  ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          )),
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
                                                                            3.0,
                                                                            0.0,
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
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              'เบอร์ติดต่อ:',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            )),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SelectionArea(
                                                                              child: Text(
                                                                            valueOrDefault<String>(
                                                                              functions.showMatNameInList(
                                                                                  functions
                                                                                      .reverseList(LeaveListAprroveAPICall.userPhoneNumber(
                                                                                        (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                      )?.toList())
                                                                                      .toList(),
                                                                                  leaveIdItemIndex),
                                                                              '[leave_name]',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          )),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              if (valueOrDefault<
                                                                      String>(
                                                                    functions.showMatNameInList(
                                                                        functions
                                                                            .reverseList(LeaveListAprroveAPICall.leaveDocument(
                                                                              (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                            )?.toList())
                                                                            .toList(),
                                                                        leaveIdItemIndex),
                                                                    '[leave_name]',
                                                                  ) !=
                                                                  '-')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          5.0),
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
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              SelectionArea(
                                                                                  child: Text(
                                                                                'ไฟล์เเนบ:',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                FFAppState().leaveDocImgPathList = functions
                                                                                    .leaveStringImgToImgPathList(valueOrDefault<String>(
                                                                                      functions.showMatNameInList(
                                                                                          functions
                                                                                              .reverseList(LeaveListAprroveAPICall.leaveDocument(
                                                                                                (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                              )?.toList())
                                                                                              .toList(),
                                                                                          leaveIdItemIndex),
                                                                                      '[leave_name]',
                                                                                    ))!
                                                                                    .toList()
                                                                                    .cast<String>();
                                                                                FFAppState().update(() {});
                                                                                if (FFAppState().leaveDocImgPathList.length <= 0) {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return WebViewAware(
                                                                                        child: AlertDialog(
                                                                                          content: Text('ไม่มีรูปภาพ'),
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
                                                                                if (functions.containWordinStringUrl(
                                                                                    '.pdf',
                                                                                    valueOrDefault<String>(
                                                                                      functions.showMatNameInList(
                                                                                          functions
                                                                                              .reverseList(LeaveListAprroveAPICall.leaveDocument(
                                                                                                (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                              )?.toList())
                                                                                              .toList(),
                                                                                          leaveIdItemIndex),
                                                                                      '[leave_name]',
                                                                                    ))!) {
                                                                                  showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return WebViewAware(
                                                                                        child: GestureDetector(
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: UrlLinkWidget(
                                                                                              leaveDoc: FFAppState().leaveDocImgPathList,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                } else {
                                                                                  showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Color(0xB3101213),
                                                                                    barrierColor: Color(0xB3101213),
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return WebViewAware(
                                                                                        child: GestureDetector(
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: ShowCheckinImageWidget(
                                                                                              leaveImage: FFAppState().leaveDocImgPathList,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                }
                                                                              },
                                                                              child: Icon(
                                                                                Icons.attach_file,
                                                                                color: Colors.black,
                                                                                size: 18.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              if (!FFAppState()
                                                                  .multiApprove)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
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
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                  var _shouldSetState = false;
                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              content: Text('ต้องการอนุมัติลาใช่หรือไม่'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                  child: Text('ไม่'),
                                                                                                ),
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                  child: Text('ใช่'),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ) ??
                                                                                      false;
                                                                                  if (!confirmDialogResponse) {
                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
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
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: LoadingSceneWidget(),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));

                                                                                  _model.leaveFlagApproveAPIOutput = await LeaveFlagApproveAPICall.call(
                                                                                    apiUrl: FFAppState().apiURLLocalState,
                                                                                    token: FFAppState().accessToken,
                                                                                    leaveId: valueOrDefault<String>(
                                                                                      functions.showMatNameInList(
                                                                                          functions
                                                                                              .reverseList(LeaveListAprroveAPICall.leaveID(
                                                                                                (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                              )?.toList())
                                                                                              .toList(),
                                                                                          leaveIdItemIndex),
                                                                                      '[leave_name]',
                                                                                    ),
                                                                                    flagApprove: 'Y',
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  if ((_model.leaveFlagApproveAPIOutput?.statusCode ?? 200) == 200) {
                                                                                    if (LeaveFlagApproveAPICall.infoStatus(
                                                                                          (_model.leaveFlagApproveAPIOutput?.jsonBody ?? ''),
                                                                                        ) !=
                                                                                        200) {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              content: Text('พบข้อผิดพลาด (${LeaveFlagApproveAPICall.infoStatus(
                                                                                                (_model.leaveFlagApproveAPIOutput?.jsonBody ?? ''),
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
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }
                                                                                    if (functions.showMatNameInList(
                                                                                            functions
                                                                                                .reverseList(LeaveListAprroveAPICall.leaveStatus(
                                                                                                  (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                                )?.toList())
                                                                                                .toList(),
                                                                                            leaveIdItemIndex) ==
                                                                                        '1') {
                                                                                      if (bottomSheetUserCustomRecord != null) {
                                                                                        var notificationRecordReference1 = NotificationRecord.createDoc(bottomSheetUserCustomRecord!.reference);
                                                                                        await notificationRecordReference1.set(createNotificationRecordData(
                                                                                          notiTime: getCurrentTimestamp,
                                                                                          notiTitle: 'แจ้งเตือนพนักงานขอลา',
                                                                                          notiBody: 'มีการขอ \"${functions.showMatNameInList(functions.reverseList(LeaveListAprroveAPICall.leaveName(
                                                                                                (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                              )?.toList()).toList(), leaveIdItemIndex)}\" โดย ${functions.showMatNameInList(functions.reverseList(LeaveListAprroveAPICall.leaveUserName(
                                                                                                (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                              )?.toList()).toList(), leaveIdItemIndex)}',
                                                                                          notiIsRead: false,
                                                                                          thisNotiIsRead: false,
                                                                                          notiType: 'Leave_Request',
                                                                                        ));
                                                                                        _model.createResignPageNotification = NotificationRecord.getDocumentFromData(
                                                                                            createNotificationRecordData(
                                                                                              notiTime: getCurrentTimestamp,
                                                                                              notiTitle: 'แจ้งเตือนพนักงานขอลา',
                                                                                              notiBody: 'มีการขอ \"${functions.showMatNameInList(functions.reverseList(LeaveListAprroveAPICall.leaveName(
                                                                                                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                                  )?.toList()).toList(), leaveIdItemIndex)}\" โดย ${functions.showMatNameInList(functions.reverseList(LeaveListAprroveAPICall.leaveUserName(
                                                                                                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                                  )?.toList()).toList(), leaveIdItemIndex)}',
                                                                                              notiIsRead: false,
                                                                                              thisNotiIsRead: false,
                                                                                              notiType: 'Leave_Request',
                                                                                            ),
                                                                                            notificationRecordReference1);
                                                                                        _shouldSetState = true;
                                                                                      }
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              content: Text('${LeaveFlagApproveAPICall.infoInfo(
                                                                                                (_model.leaveFlagApproveAPIOutput?.jsonBody ?? ''),
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
                                                                                    } else {
                                                                                      if (functions.showMatNameInList(
                                                                                              functions
                                                                                                  .reverseList(LeaveListAprroveAPICall.leaveStatus(
                                                                                                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                                  )?.toList())
                                                                                                  .toList(),
                                                                                              leaveIdItemIndex) ==
                                                                                          '2') {
                                                                                        if (containerUserCustomRecord != null) {
                                                                                          var notificationRecordReference2 = NotificationRecord.createDoc(containerUserCustomRecord!.reference);
                                                                                          await notificationRecordReference2.set(createNotificationRecordData(
                                                                                            notiTime: getCurrentTimestamp,
                                                                                            notiTitle: 'คำขออนุมัติการลา',
                                                                                            notiBody: 'คำขอ \'${functions.showMatNameInList(functions.reverseList(LeaveListAprroveAPICall.leaveName(
                                                                                                  (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                                )?.toList()).toList(), leaveIdItemIndex)} \' ของคุณ ได้รับการอนุมัติแล้ว',
                                                                                            notiIsRead: false,
                                                                                            thisNotiIsRead: false,
                                                                                            notiType: 'Leave_Request',
                                                                                          ));
                                                                                          _model.createResignPageNotificationRequester = NotificationRecord.getDocumentFromData(
                                                                                              createNotificationRecordData(
                                                                                                notiTime: getCurrentTimestamp,
                                                                                                notiTitle: 'คำขออนุมัติการลา',
                                                                                                notiBody: 'คำขอ \'${functions.showMatNameInList(functions.reverseList(LeaveListAprroveAPICall.leaveName(
                                                                                                      (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                                    )?.toList()).toList(), leaveIdItemIndex)} \' ของคุณ ได้รับการอนุมัติแล้ว',
                                                                                                notiIsRead: false,
                                                                                                thisNotiIsRead: false,
                                                                                                notiType: 'Leave_Request',
                                                                                              ),
                                                                                              notificationRecordReference2);
                                                                                          _shouldSetState = true;
                                                                                        }
                                                                                      }
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              content: Text('${LeaveFlagApproveAPICall.infoInfo(
                                                                                                (_model.leaveFlagApproveAPIOutput?.jsonBody ?? ''),
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
                                                                                    }

                                                                                    Navigator.pop(context);
                                                                                    context.pop();
                                                                                  } else {
                                                                                    if ((LeaveFlagApproveAPICall.messageLayer1(
                                                                                              (_model.leaveFlagApproveAPIOutput?.jsonBody ?? ''),
                                                                                            ) ==
                                                                                            'The token has been blacklisted') ||
                                                                                        (LeaveFlagApproveAPICall.messageLayer1(
                                                                                              (_model.leaveFlagApproveAPIOutput?.jsonBody ?? ''),
                                                                                            ) ==
                                                                                            'Token Signature could not be verified.')) {
                                                                                      var userLogRecordReference = UserLogRecord.collection.doc();
                                                                                      await userLogRecordReference.set(createUserLogRecordData(
                                                                                        employeeId: FFAppState().employeeID,
                                                                                        action: 'Logout',
                                                                                        actionTime: getCurrentTimestamp,
                                                                                        userLocation: currentUserLocationValue,
                                                                                      ));
                                                                                      _model.createdUserLogLogout127 = UserLogRecord.getDocumentFromData(
                                                                                          createUserLogRecordData(
                                                                                            employeeId: FFAppState().employeeID,
                                                                                            action: 'Logout',
                                                                                            actionTime: getCurrentTimestamp,
                                                                                            userLocation: currentUserLocationValue,
                                                                                          ),
                                                                                          userLogRecordReference);
                                                                                      _shouldSetState = true;
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

                                                                                      context.goNamed('LoginPage');

                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    } else {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              content: Text(LeaveFlagApproveAPICall.messageLayer1(
                                                                                                (_model.leaveFlagApproveAPIOutput?.jsonBody ?? ''),
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
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }
                                                                                  }

                                                                                  context.pushNamed('ApprovedLeavePage');

                                                                                  if (_shouldSetState) setState(() {});
                                                                                },
                                                                                text: 'อนุมัติ',
                                                                                icon: FaIcon(
                                                                                  FontAwesomeIcons.checkCircle,
                                                                                  size: 20.0,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: 100.0,
                                                                                  height: 40.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: Color(0xFF00968A),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: Colors.white,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                  var _shouldSetState = false;
                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              content: Text('ต้องการไม่อนุมัติลาใช่หรือไม่'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                  child: Text('ไม่'),
                                                                                                ),
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                  child: Text('ใช่'),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ) ??
                                                                                      false;
                                                                                  if (!confirmDialogResponse) {
                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
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
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: LoadingSceneWidget(),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));

                                                                                  _model.leaveFlagApproveAPIOutput2 = await LeaveFlagApproveAPICall.call(
                                                                                    apiUrl: FFAppState().apiURLLocalState,
                                                                                    token: FFAppState().accessToken,
                                                                                    leaveId: valueOrDefault<String>(
                                                                                      functions.showMatNameInList(
                                                                                          functions
                                                                                              .reverseList(LeaveListAprroveAPICall.leaveID(
                                                                                                (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                              )?.toList())
                                                                                              .toList(),
                                                                                          leaveIdItemIndex),
                                                                                      '[leave_name]',
                                                                                    ),
                                                                                    flagApprove: 'N',
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  if ((_model.leaveFlagApproveAPIOutput2?.statusCode ?? 200) == 200) {
                                                                                    if (LeaveFlagApproveAPICall.infoStatus(
                                                                                          (_model.leaveFlagApproveAPIOutput2?.jsonBody ?? ''),
                                                                                        ) ==
                                                                                        200) {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              content: Text(LeaveFlagApproveAPICall.infoInfo(
                                                                                                (_model.leaveFlagApproveAPIOutput2?.jsonBody ?? ''),
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
                                                                                    } else {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              content: Text('พบข้อผิดพลาด (${LeaveFlagApproveAPICall.infoStatus(
                                                                                                (_model.leaveFlagApproveAPIOutput2?.jsonBody ?? ''),
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
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }

                                                                                    if (containerUserCustomRecord != null) {
                                                                                      var notificationRecordReference = NotificationRecord.createDoc(containerUserCustomRecord!.reference);
                                                                                      await notificationRecordReference.set(createNotificationRecordData(
                                                                                        notiTime: getCurrentTimestamp,
                                                                                        notiTitle: 'คำขออนุมัติการลา',
                                                                                        notiBody: 'คำขอ \"${functions.showMatNameInList(functions.reverseList(LeaveListAprroveAPICall.leaveName(
                                                                                              (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                            )?.toList()).toList(), leaveIdItemIndex)}\" ของคุณ ไม่ได้รับการอนุมัติ',
                                                                                        notiIsRead: false,
                                                                                        thisNotiIsRead: false,
                                                                                        notiType: 'Leave_Request',
                                                                                      ));
                                                                                      _model.createNotApproveNotification = NotificationRecord.getDocumentFromData(
                                                                                          createNotificationRecordData(
                                                                                            notiTime: getCurrentTimestamp,
                                                                                            notiTitle: 'คำขออนุมัติการลา',
                                                                                            notiBody: 'คำขอ \"${functions.showMatNameInList(functions.reverseList(LeaveListAprroveAPICall.leaveName(
                                                                                                  (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                                )?.toList()).toList(), leaveIdItemIndex)}\" ของคุณ ไม่ได้รับการอนุมัติ',
                                                                                            notiIsRead: false,
                                                                                            thisNotiIsRead: false,
                                                                                            notiType: 'Leave_Request',
                                                                                          ),
                                                                                          notificationRecordReference);
                                                                                      _shouldSetState = true;
                                                                                    }
                                                                                    Navigator.pop(context);
                                                                                    context.pop();

                                                                                    context.pushNamed('ApprovedLeavePage');
                                                                                  } else {
                                                                                    if ((LeaveFlagApproveAPICall.messageLayer1(
                                                                                              (_model.leaveFlagApproveAPIOutput2?.jsonBody ?? ''),
                                                                                            ) ==
                                                                                            'The token has been blacklisted') ||
                                                                                        (LeaveFlagApproveAPICall.messageLayer1(
                                                                                              (_model.leaveFlagApproveAPIOutput2?.jsonBody ?? ''),
                                                                                            ) ==
                                                                                            'Token Signature could not be verified.')) {
                                                                                      var userLogRecordReference = UserLogRecord.collection.doc();
                                                                                      await userLogRecordReference.set(createUserLogRecordData(
                                                                                        employeeId: FFAppState().employeeID,
                                                                                        action: 'Logout',
                                                                                        actionTime: getCurrentTimestamp,
                                                                                        userLocation: currentUserLocationValue,
                                                                                      ));
                                                                                      _model.createdUserLogLogout128 = UserLogRecord.getDocumentFromData(
                                                                                          createUserLogRecordData(
                                                                                            employeeId: FFAppState().employeeID,
                                                                                            action: 'Logout',
                                                                                            actionTime: getCurrentTimestamp,
                                                                                            userLocation: currentUserLocationValue,
                                                                                          ),
                                                                                          userLogRecordReference);
                                                                                      _shouldSetState = true;
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

                                                                                      context.goNamed('LoginPage');

                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    } else {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              content: Text(LeaveFlagApproveAPICall.messageLayer1(
                                                                                                (_model.leaveFlagApproveAPIOutput2?.jsonBody ?? ''),
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
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }
                                                                                  }

                                                                                  if (_shouldSetState) setState(() {});
                                                                                },
                                                                                text: 'ไม่อนุมัติ',
                                                                                icon: FaIcon(
                                                                                  FontAwesomeIcons.ban,
                                                                                  size: 18.0,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: 105.0,
                                                                                  height: 40.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: Color(0xFFF46506),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: Colors.white,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
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
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
