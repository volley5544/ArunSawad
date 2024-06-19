import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/input_copy2/input_copy2_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'approve_show_page_model.dart';
export 'approve_show_page_model.dart';

class ApproveShowPageWidget extends StatefulWidget {
  const ApproveShowPageWidget({super.key});

  @override
  State<ApproveShowPageWidget> createState() => _ApproveShowPageWidgetState();
}

class _ApproveShowPageWidgetState extends State<ApproveShowPageWidget>
    with TickerProviderStateMixin {
  late ApproveShowPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApproveShowPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ApproveShowPage'});
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
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      _model.dateTimeAPIOutput = await GetDateTimeAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );

      _model.getDisapprove = await GetApprovedAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
        approvedTypes: 'disapprove',
      );

      if ((_model.getDisapprove?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดConnection (${(_model.getDisapprove?.statusCode ?? 200).toString()})'),
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
      if (!((GetApprovedAPICall.statusLayer2(
                (_model.getDisapprove?.jsonBody ?? ''),
              ) ==
              200) ||
          (GetApprovedAPICall.statusLayer2(
                (_model.getDisapprove?.jsonBody ?? ''),
              ) ==
              404))) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content:
                    Text('พบข้อผิดพลาดLayer2 (${GetApprovedAPICall.statusLayer2(
                  (_model.getDisapprove?.jsonBody ?? ''),
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
      _model.getCancelApprove = await GetApprovedAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
        approvedTypes: 'cancelapprove',
      );

      if ((_model.getCancelApprove?.statusCode ?? 200) != 200) {
        if ((GetApprovedAPICall.messageLayer1(
                  (_model.getCancelApprove?.jsonBody ?? ''),
                ) ==
                'The token has been blacklisted') ||
            (GetApprovedAPICall.messageLayer1(
                  (_model.getCancelApprove?.jsonBody ?? ''),
                ) ==
                'Token Signature could not be verified.')) {
          var userLogRecordReference = UserLogRecord.collection.doc();
          await userLogRecordReference.set(createUserLogRecordData(
            employeeId: FFAppState().employeeID,
            action: 'Logout',
            actionTime: getCurrentTimestamp,
            userLocation: currentUserLocationValue,
          ));
          _model.createdUserLogLogout55 = UserLogRecord.getDocumentFromData(
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
                  content: Text(GetApprovedAPICall.messageLayer1(
                    (_model.getCancelApprove?.jsonBody ?? ''),
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
      if (!((GetApprovedAPICall.statusLayer2(
                (_model.getCancelApprove?.jsonBody ?? ''),
              ) ==
              200) ||
          (GetApprovedAPICall.statusLayer2(
                (_model.getCancelApprove?.jsonBody ?? ''),
              ) ==
              404))) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content:
                    Text('พบข้อผิดพลาดLayer2 (${GetApprovedAPICall.statusLayer2(
                  (_model.getCancelApprove?.jsonBody ?? ''),
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
      _model.getApproved = await GetApprovedAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
        approvedTypes: 'approve-leave',
      );

      if ((_model.getApproved?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดConnection (${(_model.getApproved?.statusCode ?? 200).toString()})'),
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
      if (!((GetApprovedAPICall.statusLayer2(
                (_model.getApproved?.jsonBody ?? ''),
              ) ==
              200) ||
          (GetApprovedAPICall.statusLayer2(
                (_model.getApproved?.jsonBody ?? ''),
              ) ==
              404))) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content:
                    Text('พบข้อผิดพลาดLayer2 (${GetApprovedAPICall.statusLayer2(
                  (_model.getApproved?.jsonBody ?? ''),
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
      Navigator.pop(context);
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
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
              'รายการ',
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
                if (true)
                  FlutterFlowDropDown<String>(
                    controller: _model.monthSelectValueController ??=
                        FormFieldController<String>(
                      _model.monthSelectValue ??= true
                          ? ''
                          : functions
                              .currentTimeToMonthThai(getCurrentTimestamp),
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
                          letterSpacing: 0.0,
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
                    margin:
                        EdgeInsetsDirectional.fromSTEB(160.0, 4.0, 12.0, 4.0),
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
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                          unselectedLabelStyle: TextStyle(),
                          indicatorColor:
                              FlutterFlowTheme.of(context).secondary,
                          tabs: [
                            Tab(
                              text: 'อนุมัติ',
                            ),
                            Tab(
                              text: 'ไม่อนุมัติ',
                            ),
                            Tab(
                              text: 'ยกเลิก',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Builder(
                              builder: (context) {
                                final approvedList =
                                    GetApprovedAPICall.approvedEmpName(
                                          (_model.getApproved?.jsonBody ?? ''),
                                        )?.toList() ??
                                        [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: approvedList.length,
                                  itemBuilder: (context, approvedListIndex) {
                                    final approvedListItem =
                                        approvedList[approvedListIndex];
                                    return Visibility(
                                      visible: (_model.monthSelectValue ==
                                                  null ||
                                              _model.monthSelectValue == '') ||
                                          (functions.checkMonthLeave(
                                                  _model.monthSelectValue,
                                                  functions
                                                      .splitDateintoStartDate(
                                                          valueOrDefault<
                                                              String>(
                                                    functions.showMatNameInList(
                                                        functions
                                                            .reverseList(
                                                                GetApprovedAPICall
                                                                    .approvedLeaveDate(
                                                              (_model.getApproved
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )?.toList())
                                                            .toList(),
                                                        approvedListIndex),
                                                    '[leave_name]',
                                                  )))! ||
                                              functions.checkMonthLeave(
                                                  _model.monthSelectValue,
                                                  functions
                                                      .splitDateintoEndDate(
                                                          valueOrDefault<
                                                              String>(
                                                    functions.showMatNameInList(
                                                        functions
                                                            .reverseList(
                                                                GetApprovedAPICall
                                                                    .approvedLeaveDate(
                                                              (_model.getApproved
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )?.toList())
                                                            .toList(),
                                                        approvedListIndex),
                                                    '[leave_name]',
                                                  )))!),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 8.0, 8.0),
                                        child: Container(
                                          width: double.infinity,
                                          height:
                                              functions.contrainerChange(290.0),
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              functions.getResignCardColor(
                                                  functions.showMatNameInList(
                                                      functions
                                                          .reverseList(
                                                              GetApprovedAPICall
                                                                  .approvedLeaveName(
                                                            (_model.getApproved
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList())
                                                          .toList(),
                                                      approvedListIndex),
                                                  Color(0x80C29999)),
                                              Color(0x80C29999),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 10.0),
                                            child: SingleChildScrollView(
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
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: SelectionArea(
                                                          child: Text(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .showMatNameInList(
                                                                  functions
                                                                      .reverseList(
                                                                          GetApprovedAPICall
                                                                              .approvedEmpName(
                                                                        (_model.getApproved?.jsonBody ??
                                                                            ''),
                                                                      )?.toList())
                                                                      .toList(),
                                                                  approvedListIndex),
                                                          '[full_name]',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      )),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'ประเภทการลา:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeaveName(
                                                                            (_model.getApproved?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      approvedListIndex),
                                                                  '[full_name]',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'วันที่ทำรายการ:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeaveCreateDate(
                                                                            (_model.getApproved?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      approvedListIndex),
                                                                  '[full_name]',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'วันที่ลา:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeaveDate(
                                                                            (_model.getApproved?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      approvedListIndex),
                                                                  '[full_name]',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'จำนวนวันที่ลา:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeaveCountDay(
                                                                            (_model.getApproved?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      approvedListIndex),
                                                                  '[full_name]',
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
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'ช่วงเวลา:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeavePeriod(
                                                                            (_model.getApproved?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      approvedListIndex),
                                                                  '[full_name]',
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
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(GetApprovedAPICall.approvedLeaveName(
                                                                                      (_model.getApproved?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                approvedListIndex),
                                                                            '[full_name]',
                                                                          ) !=
                                                                          'ลาออก'
                                                                      ? 'เหตุผลการลา:'
                                                                      : 'เหตุผลการลาออก:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                            String>(
                                                                          functions.showMatNameInList(
                                                                              functions
                                                                                  .reverseList(GetApprovedAPICall.approvedLeaveName(
                                                                                    (_model.getApproved?.jsonBody ?? ''),
                                                                                  )?.toList())
                                                                                  .toList(),
                                                                              approvedListIndex),
                                                                          '[full_name]',
                                                                        ) !=
                                                                        'ลาออก'
                                                                    ? valueOrDefault<
                                                                        String>(
                                                                        functions.showMatNameInList(
                                                                            functions
                                                                                .reverseList(GetApprovedAPICall.approvedLeaveReason(
                                                                                  (_model.getApproved?.jsonBody ?? ''),
                                                                                )?.toList())
                                                                                .toList(),
                                                                            approvedListIndex),
                                                                        '[full_name]',
                                                                      )
                                                                    : valueOrDefault<
                                                                        String>(
                                                                        functions.showMatNameInList(
                                                                            functions
                                                                                .reverseList(GetApprovedAPICall.reasonResign(
                                                                                  (_model.getApproved?.jsonBody ?? ''),
                                                                                )?.toList())
                                                                                .toList(),
                                                                            approvedListIndex),
                                                                        '[full_name]',
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
                                                                      letterSpacing:
                                                                          0.0,
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
                                                  if (functions
                                                          .checkCurrentDateAfterStartDate(
                                                              functions.getDateFormatAPIFromThaiFormat(
                                                                  functions.leaveDateToStartLeaveDate(
                                                                      valueOrDefault<
                                                                          String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(GetApprovedAPICall.approvedLeaveDate(
                                                                          (_model.getApproved?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    approvedListIndex),
                                                                '[full_name]',
                                                              ))),
                                                              getCurrentTimestamp)! ||
                                                      (valueOrDefault<String>(
                                                            functions.showMatNameInList(
                                                                functions
                                                                    .reverseList(GetApprovedAPICall.approvedLeaveName(
                                                                      (_model.getApproved
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )?.toList())
                                                                    .toList(),
                                                                approvedListIndex),
                                                            '[full_name]',
                                                          ) ==
                                                          'ลาป่วย'))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
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
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Color(
                                                                              0xFFFFE700),
                                                                      barrierColor:
                                                                          Colors
                                                                              .transparent,
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
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.5,
                                                                                child: InputCopy2Widget(
                                                                                  leaveID: functions.showMatNameInList(
                                                                                      functions
                                                                                          .reverseList(GetApprovedAPICall.approvedID(
                                                                                            (_model.getApproved?.jsonBody ?? ''),
                                                                                          )?.toList())
                                                                                          .toList(),
                                                                                      approvedListIndex),
                                                                                  employeeID: functions.showMatNameInList(
                                                                                      functions
                                                                                          .reverseList(GetApprovedAPICall.approvedEmpID(
                                                                                            (_model.getApproved?.jsonBody ?? ''),
                                                                                          )?.toList())
                                                                                          .toList(),
                                                                                      approvedListIndex),
                                                                                  leaveName: functions.showMatNameInList(
                                                                                      functions
                                                                                          .reverseList(GetApprovedAPICall.approvedLeaveName(
                                                                                            (_model.getApproved?.jsonBody ?? ''),
                                                                                          )?.toList())
                                                                                          .toList(),
                                                                                      approvedListIndex),
                                                                                  isFromApprovePage: true,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));

                                                                    context
                                                                        .pop();

                                                                    context.pushNamed(
                                                                        'ApproveShowPage');
                                                                  },
                                                                  text:
                                                                      'ยกเลิก',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .cancel,
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
                                                                        0xFFB32A33),
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
                                                                          letterSpacing:
                                                                              0.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            Builder(
                              builder: (context) {
                                final disapproveList =
                                    GetApprovedAPICall.approvedEmpName(
                                          (_model.getDisapprove?.jsonBody ??
                                              ''),
                                        )?.toList() ??
                                        [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: disapproveList.length,
                                  itemBuilder: (context, disapproveListIndex) {
                                    final disapproveListItem =
                                        disapproveList[disapproveListIndex];
                                    return Visibility(
                                      visible: (_model.monthSelectValue ==
                                                  null ||
                                              _model.monthSelectValue == '') ||
                                          (functions.checkMonthLeave(
                                                  _model.monthSelectValue,
                                                  functions
                                                      .splitDateintoStartDate(
                                                          valueOrDefault<
                                                              String>(
                                                    functions.showMatNameInList(
                                                        GetApprovedAPICall
                                                            .approvedLeaveDate(
                                                          (_model.getDisapprove
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.toList(),
                                                        disapproveListIndex),
                                                    '[leave_name]',
                                                  )))! ||
                                              functions.checkMonthLeave(
                                                  _model.monthSelectValue,
                                                  functions
                                                      .splitDateintoEndDate(
                                                          valueOrDefault<
                                                              String>(
                                                    functions.showMatNameInList(
                                                        GetApprovedAPICall
                                                            .approvedLeaveDate(
                                                          (_model.getDisapprove
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.toList(),
                                                        disapproveListIndex),
                                                    '[leave_name]',
                                                  )))!),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 8.0, 8.0),
                                        child: Container(
                                          width: double.infinity,
                                          height:
                                              functions.contrainerChange(260.0),
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              functions.getResignCardColor(
                                                  functions.showMatNameInList(
                                                      functions
                                                          .reverseList(
                                                              GetApprovedAPICall
                                                                  .approvedLeaveName(
                                                            (_model.getDisapprove
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList())
                                                          .toList(),
                                                      disapproveListIndex),
                                                  Color(0x80C29999)),
                                              Color(0x80C29999),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 10.0),
                                            child: SingleChildScrollView(
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
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: SelectionArea(
                                                          child: Text(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .showMatNameInList(
                                                                  functions
                                                                      .reverseList(
                                                                          GetApprovedAPICall
                                                                              .approvedEmpName(
                                                                        (_model.getDisapprove?.jsonBody ??
                                                                            ''),
                                                                      )?.toList())
                                                                      .toList(),
                                                                  disapproveListIndex),
                                                          '[full_name]',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      )),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'ประเภทการลา:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeaveName(
                                                                            (_model.getDisapprove?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      disapproveListIndex),
                                                                  '[full_name]',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'วันที่ทำรายการ:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeaveCreateDate(
                                                                            (_model.getDisapprove?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      disapproveListIndex),
                                                                  '[full_name]',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'วันที่ลา:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeaveDate(
                                                                            (_model.getDisapprove?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      disapproveListIndex),
                                                                  '[full_name]',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'จำนวนวันที่ลา:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeaveCountDay(
                                                                            (_model.getDisapprove?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      disapproveListIndex),
                                                                  '[full_name]',
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
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'ช่วงเวลา:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeavePeriod(
                                                                            (_model.getDisapprove?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      disapproveListIndex),
                                                                  '[full_name]',
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
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(GetApprovedAPICall.approvedLeaveName(
                                                                                      (_model.getDisapprove?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                disapproveListIndex),
                                                                            '[full_name]',
                                                                          ) !=
                                                                          'ลาออก'
                                                                      ? 'เหตุผลการลา:'
                                                                      : 'เหตุผลการลาออก:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                            String>(
                                                                          functions.showMatNameInList(
                                                                              functions
                                                                                  .reverseList(GetApprovedAPICall.approvedLeaveName(
                                                                                    (_model.getDisapprove?.jsonBody ?? ''),
                                                                                  )?.toList())
                                                                                  .toList(),
                                                                              disapproveListIndex),
                                                                          '[full_name]',
                                                                        ) !=
                                                                        'ลาออก'
                                                                    ? valueOrDefault<
                                                                        String>(
                                                                        functions.showMatNameInList(
                                                                            functions
                                                                                .reverseList(GetApprovedAPICall.approvedLeaveReason(
                                                                                  (_model.getDisapprove?.jsonBody ?? ''),
                                                                                )?.toList())
                                                                                .toList(),
                                                                            disapproveListIndex),
                                                                        '[full_name]',
                                                                      )
                                                                    : valueOrDefault<
                                                                        String>(
                                                                        functions.showMatNameInList(
                                                                            functions
                                                                                .reverseList(GetApprovedAPICall.reasonResign(
                                                                                  (_model.getDisapprove?.jsonBody ?? ''),
                                                                                )?.toList())
                                                                                .toList(),
                                                                            disapproveListIndex),
                                                                        '[full_name]',
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
                                                                      letterSpacing:
                                                                          0.0,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            Builder(
                              builder: (context) {
                                final cancelApproveList =
                                    GetApprovedAPICall.approvedEmpName(
                                          (_model.getCancelApprove?.jsonBody ??
                                              ''),
                                        )?.toList() ??
                                        [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: cancelApproveList.length,
                                  itemBuilder:
                                      (context, cancelApproveListIndex) {
                                    final cancelApproveListItem =
                                        cancelApproveList[
                                            cancelApproveListIndex];
                                    return Visibility(
                                      visible: (_model.monthSelectValue ==
                                                  null ||
                                              _model.monthSelectValue == '') ||
                                          (functions.checkMonthLeave(
                                                  _model.monthSelectValue,
                                                  functions
                                                      .splitDateintoStartDate(
                                                          valueOrDefault<
                                                              String>(
                                                    functions.showMatNameInList(
                                                        GetApprovedAPICall
                                                            .approvedLeaveDate(
                                                          (_model.getCancelApprove
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.toList(),
                                                        cancelApproveListIndex),
                                                    '[leave_name]',
                                                  )))! ||
                                              functions.checkMonthLeave(
                                                  _model.monthSelectValue,
                                                  functions
                                                      .splitDateintoEndDate(
                                                          valueOrDefault<
                                                              String>(
                                                    functions.showMatNameInList(
                                                        GetApprovedAPICall
                                                            .approvedLeaveDate(
                                                          (_model.getCancelApprove
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.toList(),
                                                        cancelApproveListIndex),
                                                    '[leave_name]',
                                                  )))!),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 8.0, 8.0),
                                        child: Container(
                                          width: double.infinity,
                                          height:
                                              functions.contrainerChange(260.0),
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              functions.getResignCardColor(
                                                  functions.showMatNameInList(
                                                      functions
                                                          .reverseList(
                                                              GetApprovedAPICall
                                                                  .approvedLeaveName(
                                                            (_model.getCancelApprove
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList())
                                                          .toList(),
                                                      cancelApproveListIndex),
                                                  Color(0x80C29999)),
                                              Color(0x80C29999),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 10.0),
                                            child: SingleChildScrollView(
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
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: SelectionArea(
                                                          child: Text(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .showMatNameInList(
                                                                  functions
                                                                      .reverseList(
                                                                          GetApprovedAPICall
                                                                              .approvedEmpName(
                                                                        (_model.getCancelApprove?.jsonBody ??
                                                                            ''),
                                                                      )?.toList())
                                                                      .toList(),
                                                                  cancelApproveListIndex),
                                                          '[full_name]',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      )),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'ประเภทการลา:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeaveName(
                                                                            (_model.getCancelApprove?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      cancelApproveListIndex),
                                                                  '[full_name]',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'วันที่ทำรายการ:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeaveCreateDate(
                                                                            (_model.getCancelApprove?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      cancelApproveListIndex),
                                                                  '[full_name]',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'วันที่ลา:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeaveDate(
                                                                            (_model.getCancelApprove?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      cancelApproveListIndex),
                                                                  '[full_name]',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'จำนวนวันที่ลา:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeaveCountDay(
                                                                            (_model.getCancelApprove?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      cancelApproveListIndex),
                                                                  '[full_name]',
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
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'ช่วงเวลา:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.approvedLeavePeriod(
                                                                            (_model.getCancelApprove?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      cancelApproveListIndex),
                                                                  '[full_name]',
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
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(GetApprovedAPICall.approvedLeaveName(
                                                                                      (_model.getCancelApprove?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                cancelApproveListIndex),
                                                                            '[full_name]',
                                                                          ) !=
                                                                          'ลาออก'
                                                                      ? 'เหตุผลการลา:'
                                                                      : 'เหตุผลการลาออก:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                            String>(
                                                                          functions.showMatNameInList(
                                                                              functions
                                                                                  .reverseList(GetApprovedAPICall.approvedLeaveName(
                                                                                    (_model.getCancelApprove?.jsonBody ?? ''),
                                                                                  )?.toList())
                                                                                  .toList(),
                                                                              cancelApproveListIndex),
                                                                          '[full_name]',
                                                                        ) !=
                                                                        'ลาออก'
                                                                    ? valueOrDefault<
                                                                        String>(
                                                                        functions.showMatNameInList(
                                                                            functions
                                                                                .reverseList(GetApprovedAPICall.approvedLeaveReason(
                                                                                  (_model.getCancelApprove?.jsonBody ?? ''),
                                                                                )?.toList())
                                                                                .toList(),
                                                                            cancelApproveListIndex),
                                                                        '[full_name]',
                                                                      )
                                                                    : valueOrDefault<
                                                                        String>(
                                                                        functions.showMatNameInList(
                                                                            functions
                                                                                .reverseList(GetApprovedAPICall.reasonResign(
                                                                                  (_model.getCancelApprove?.jsonBody ?? ''),
                                                                                )?.toList())
                                                                                .toList(),
                                                                            cancelApproveListIndex),
                                                                        '[full_name]',
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
                                                                      letterSpacing:
                                                                          0.0,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 3.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                                                    child: Text(
                                                                  'ถูกยกเลิกโดย:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
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
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(GetApprovedAPICall.cancelBy(
                                                                            (_model.getCancelApprove?.jsonBody ??
                                                                                ''),
                                                                          )?.map((e) => e.toString()).toList()?.toList())
                                                                          .toList(),
                                                                      cancelApproveListIndex),
                                                                  '[full_name]',
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
                                                                      letterSpacing:
                                                                          0.0,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
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
  }
}
