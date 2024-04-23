import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pin_code_page_model.dart';
export 'pin_code_page_model.dart';

class PinCodePageWidget extends StatefulWidget {
  const PinCodePageWidget({super.key});

  @override
  State<PinCodePageWidget> createState() => _PinCodePageWidgetState();
}

class _PinCodePageWidgetState extends State<PinCodePageWidget>
    with TickerProviderStateMixin {
  late PinCodePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PinCodePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PinCodePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(await getPermissionStatus(notificationsPermission))) {
        await requestPermission(notificationsPermission);
      }
      if (isAndroid) {
        _model.androidIMEI1st = await actions.a3();
        FFAppState().update(() {
          FFAppState().imei = _model.androidIMEI1st!;
        });
      } else {
        _model.iOSidentifierForVendor1st = await actions.a4();
        FFAppState().update(() {
          FFAppState().imei = _model.iOSidentifierForVendor1st!;
        });
      }

      _model.checkDeviceLocSer = await actions.a1();
      _model.checkDeviceLocPer = await actions.a2();
      FFAppState().update(() {
        FFAppState().isLoadedInsuranceData = false;
      });
      _model.getDeviceVersion = await actions.getBuildVersion();
      _model.checkFirebaseOutput = await actions.checkStatusFirebase(
        FFAppState().employeeID,
      );
      if (!_model.checkFirebaseOutput!) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('เกิดข้อผิดพลาด กรุณาเข้าสู่ระบบใหม่'),
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

        context.goNamed('LoginPage');

        return;
      }
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1100.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1100.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
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

    return FutureBuilder<List<SplashPageImgRecord>>(
      future: querySplashPageImgRecordOnce(
        queryBuilder: (splashPageImgRecord) => splashPageImgRecord.where(
          'day',
          isEqualTo: functions.checkDateWeekDay(getCurrentTimestamp) != ''
              ? functions.checkDateWeekDay(getCurrentTimestamp)
              : null,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<SplashPageImgRecord> pinCodePageSplashPageImgRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final pinCodePageSplashPageImgRecord =
            pinCodePageSplashPageImgRecordList.isNotEmpty
                ? pinCodePageSplashPageImgRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: SafeArea(
                top: true,
                child: FutureBuilder<List<SplashPageHolidayImgRecord>>(
                  future: querySplashPageHolidayImgRecordOnce(
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
                    List<SplashPageHolidayImgRecord>
                        columnfirstSplashPageHolidayImgRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final columnfirstSplashPageHolidayImgRecord =
                        columnfirstSplashPageHolidayImgRecordList.isNotEmpty
                            ? columnfirstSplashPageHolidayImgRecordList.first
                            : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<List<BuildVersionRecord>>(
                          future: queryBuildVersionRecordOnce(
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
                            List<BuildVersionRecord>
                                columnsecBuildVersionRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final columnsecBuildVersionRecord =
                                columnsecBuildVersionRecordList.isNotEmpty
                                    ? columnsecBuildVersionRecordList.first
                                    : null;
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FutureBuilder<List<KeyStorageRecord>>(
                                    future: queryKeyStorageRecordOnce(
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<KeyStorageRecord>
                                          columntriKeyStorageRecordList =
                                          snapshot.data!;
                                      final columntriKeyStorageRecord =
                                          columntriKeyStorageRecordList
                                                  .isNotEmpty
                                              ? columntriKeyStorageRecordList
                                                  .first
                                              : null;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FutureBuilder<List<UserCustomRecord>>(
                                            future: queryUserCustomRecordOnce(
                                              queryBuilder:
                                                  (userCustomRecord) =>
                                                      userCustomRecord.where(
                                                'employee_id',
                                                isEqualTo: FFAppState()
                                                            .employeeID !=
                                                        ''
                                                    ? FFAppState().employeeID
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
                                                  columnfourUserCustomRecordList =
                                                  snapshot.data!;
                                              final columnfourUserCustomRecord =
                                                  columnfourUserCustomRecordList
                                                          .isNotEmpty
                                                      ? columnfourUserCustomRecordList
                                                          .first
                                                      : null;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FutureBuilder<
                                                      List<
                                                          UrlLinkStorageRecord>>(
                                                    future:
                                                        queryUrlLinkStorageRecordOnce(
                                                      queryBuilder:
                                                          (urlLinkStorageRecord) =>
                                                              urlLinkStorageRecord
                                                                  .where(
                                                        'url_name',
                                                        isEqualTo:
                                                            'lead_url_link',
                                                      ),
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
                                                      List<UrlLinkStorageRecord>
                                                          containerUrlLinkStorageRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final containerUrlLinkStorageRecord =
                                                          containerUrlLinkStorageRecordList
                                                                  .isNotEmpty
                                                              ? containerUrlLinkStorageRecordList
                                                                  .first
                                                              : null;
                                                      return Container(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Colors.white,
                                                              Color(0xFFFF9E35)
                                                            ],
                                                            stops: [0.0, 1.0],
                                                            begin:
                                                                AlignmentDirectional(
                                                                    0.0, -1.0),
                                                            end:
                                                                AlignmentDirectional(
                                                                    0, 1.0),
                                                          ),
                                                        ),
                                                        child: FutureBuilder<
                                                            List<
                                                                AuthorizationRecord>>(
                                                          future:
                                                              queryAuthorizationRecordOnce(
                                                            queryBuilder:
                                                                (authorizationRecord) =>
                                                                    authorizationRecord
                                                                        .where(
                                                              'content_name',
                                                              isEqualTo:
                                                                  'skip_version_id',
                                                            ),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            List<AuthorizationRecord>
                                                                columnfifthAuthorizationRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final columnfifthAuthorizationRecord =
                                                                columnfifthAuthorizationRecordList
                                                                        .isNotEmpty
                                                                    ? columnfifthAuthorizationRecordList
                                                                        .first
                                                                    : null;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                AuthUserStreamWidget(
                                                                  builder: (context) =>
                                                                      FutureBuilder<
                                                                          List<
                                                                              UserCustomRecord>>(
                                                                    future:
                                                                        queryUserCustomRecordOnce(
                                                                      queryBuilder:
                                                                          (userCustomRecord) =>
                                                                              userCustomRecord.where(
                                                                        'employee_id',
                                                                        isEqualTo: valueOrDefault(currentUserDocument?.employeeId, 0).toString() !=
                                                                                ''
                                                                            ? valueOrDefault(currentUserDocument?.employeeId, 0).toString()
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
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<UserCustomRecord>
                                                                          containerUserCustomRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      final containerUserCustomRecord = containerUserCustomRecordList
                                                                              .isNotEmpty
                                                                          ? containerUserCustomRecordList
                                                                              .first
                                                                          : null;
                                                                      return Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            50.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                  child: FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 30.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 55.0,
                                                                                    icon: Icon(
                                                                                      Icons.logout,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 35.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                      var _shouldSetState = false;
                                                                                      HapticFeedback.mediumImpact();
                                                                                      showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        barrierColor: Color(0x00000000),
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return WebViewAware(
                                                                                            child: GestureDetector(
                                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
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

                                                                                      _model.checkDeviceLocSerLogout = await actions.a1();
                                                                                      _shouldSetState = true;
                                                                                      if (!_model.checkDeviceLocSerLogout!) {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return WebViewAware(
                                                                                              child: AlertDialog(
                                                                                                content: Text('กรุณาเปิดGPSเพื่อทำรายการ'),
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
                                                                                      _model.checkDeviceLocPerLogout = await actions.a2();
                                                                                      _shouldSetState = true;
                                                                                      if (!_model.checkDeviceLocPerLogout!) {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return WebViewAware(
                                                                                              child: AlertDialog(
                                                                                                content: Text('กรุณาให้อรุณสวัสดิ์เข้าถึงGPSของคุณ'),
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
                                                                                      _model.checkLatLngLogout = await actions.a8(
                                                                                        currentUserLocationValue,
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      if (!_model.checkLatLngLogout!) {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return WebViewAware(
                                                                                              child: AlertDialog(
                                                                                                content: Text('กรุณาเปิดGPSเพื่อทำรายการ'),
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

                                                                                      var userLogRecordReference = UserLogRecord.collection.doc();
                                                                                      await userLogRecordReference.set(createUserLogRecordData(
                                                                                        employeeId: FFAppState().employeeID,
                                                                                        action: 'Logout',
                                                                                        actionTime: getCurrentTimestamp,
                                                                                        userLocation: currentUserLocationValue,
                                                                                      ));
                                                                                      _model.createdUserLogLogout = UserLogRecord.getDocumentFromData(
                                                                                          createUserLogRecordData(
                                                                                            employeeId: FFAppState().employeeID,
                                                                                            action: 'Logout',
                                                                                            actionTime: getCurrentTimestamp,
                                                                                            userLocation: currentUserLocationValue,
                                                                                          ),
                                                                                          userLogRecordReference);
                                                                                      _shouldSetState = true;
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

                                                                                      if (_shouldSetState) setState(() {});
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                SelectionArea(
                                                                                    child: Text(
                                                                                  'ออกจากระบบ',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                )),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                  child: FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 30.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 55.0,
                                                                                    icon: Icon(
                                                                                      Icons.app_blocking_rounded,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 33.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      HapticFeedback.mediumImpact();
                                                                                      var confirmDialogResponse = await showDialog<bool>(
                                                                                            context: context,
                                                                                            builder: (alertDialogContext) {
                                                                                              return WebViewAware(
                                                                                                child: AlertDialog(
                                                                                                  content: Text('คุณต้องการจะล้างข้อมูลแอพหรือไม่?'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                      child: Text('ยกเลิก'),
                                                                                                    ),
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                      child: Text('ตกลง'),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ) ??
                                                                                          false;
                                                                                      if (!confirmDialogResponse) {
                                                                                        return;
                                                                                      }
                                                                                      await actions.a22();
                                                                                      await actions.clearAllAppDataCopy();
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              content: Text('เคลียร์แคชเรียบร้อยกรุณาปิดแอปเปิดใหม่'),
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
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                  child: SelectionArea(
                                                                                      child: Text(
                                                                                    'ล้างข้อมูลแอพ',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  )),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                ),
                                                                Image.asset(
                                                                  'assets/images/ArunSawadQR.png',
                                                                  width: 140.0,
                                                                  height: 140.0,
                                                                  fit: BoxFit
                                                                      .fitHeight,
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'imageOnPageLoadAnimation']!),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        'ยินดีต้อนรับสู่อรุณสวัสดิ์',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Colors.black,
                                                                              fontSize: 28.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        AuthorizationRecord>>(
                                                                  stream:
                                                                      queryAuthorizationRecord(
                                                                    queryBuilder:
                                                                        (authorizationRecord) =>
                                                                            authorizationRecord.where(
                                                                      'content_name',
                                                                      isEqualTo:
                                                                          'kpi_menu',
                                                                    ),
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<AuthorizationRecord>
                                                                        columnAuthorizationRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    // Return an empty Container when the item does not exist.
                                                                    if (snapshot
                                                                        .data!
                                                                        .isEmpty) {
                                                                      return Container();
                                                                    }
                                                                    final columnAuthorizationRecord = columnAuthorizationRecordList
                                                                            .isNotEmpty
                                                                        ? columnAuthorizationRecordList
                                                                            .first
                                                                        : null;
                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              StreamBuilder<List<InsuranceNotiDataRecord>>(
                                                                            stream:
                                                                                queryInsuranceNotiDataRecord(
                                                                              queryBuilder: (insuranceNotiDataRecord) => insuranceNotiDataRecord.where(
                                                                                'emp_id',
                                                                                isEqualTo: FFAppState().employeeID != '' ? FFAppState().employeeID : null,
                                                                              ),
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
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).tertiary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<InsuranceNotiDataRecord> notidatacolumnInsuranceNotiDataRecordList = snapshot.data!;
                                                                              final notidatacolumnInsuranceNotiDataRecord = notidatacolumnInsuranceNotiDataRecordList.isNotEmpty ? notidatacolumnInsuranceNotiDataRecordList.first : null;
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    'โปรดใส่พินเพื่อเข้าใช้งาน',
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: Colors.black,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  FutureBuilder<List<NotificationRecord>>(
                                                                                    future: queryNotificationRecordOnce(
                                                                                      parent: columnfourUserCustomRecord?.reference,
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
                                                                                      List<NotificationRecord> containerpinNotificationRecordList = snapshot.data!;
                                                                                      return Container(
                                                                                        width: double.infinity,
                                                                                        height: 200.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: FutureBuilder<List<UserProfileRecord>>(
                                                                                          future: queryUserProfileRecordOnce(
                                                                                            parent: columnfourUserCustomRecord?.reference,
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
                                                                                            List<UserProfileRecord> columnUserProfileRecordList = snapshot.data!;
                                                                                            final columnUserProfileRecord = columnUserProfileRecordList.isNotEmpty ? columnUserProfileRecordList.first : null;
                                                                                            return Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 32.0, 12.0, 0.0),
                                                                                                  child: FutureBuilder<List<InsuranceLicenseDataRecord>>(
                                                                                                    future: queryInsuranceLicenseDataRecordOnce(
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
                                                                                                      List<InsuranceLicenseDataRecord> pinCodeInsuranceLicenseDataRecordList = snapshot.data!;
                                                                                                      final pinCodeInsuranceLicenseDataRecord = pinCodeInsuranceLicenseDataRecordList.isNotEmpty ? pinCodeInsuranceLicenseDataRecordList.first : null;
                                                                                                      return PinCodeTextField(
                                                                                                        autoDisposeControllers: false,
                                                                                                        appContext: context,
                                                                                                        length: 6,
                                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                        enableActiveFill: true,
                                                                                                        autoFocus: false,
                                                                                                        enablePinAutofill: true,
                                                                                                        errorTextSpace: 16.0,
                                                                                                        showCursor: false,
                                                                                                        cursorColor: FlutterFlowTheme.of(context).primary,
                                                                                                        obscureText: true,
                                                                                                        obscuringCharacter: '●',
                                                                                                        hintCharacter: '*',
                                                                                                        keyboardType: TextInputType.number,
                                                                                                        pinTheme: PinTheme(
                                                                                                          fieldHeight: 55.0,
                                                                                                          fieldWidth: 50.0,
                                                                                                          borderWidth: 2.0,
                                                                                                          borderRadius: BorderRadius.only(
                                                                                                            bottomLeft: Radius.circular(12.0),
                                                                                                            bottomRight: Radius.circular(12.0),
                                                                                                            topLeft: Radius.circular(12.0),
                                                                                                            topRight: Radius.circular(12.0),
                                                                                                          ),
                                                                                                          shape: PinCodeFieldShape.box,
                                                                                                          activeColor: Colors.white,
                                                                                                          inactiveColor: Colors.white,
                                                                                                          selectedColor: Color(0x66FFFFFF),
                                                                                                          activeFillColor: Colors.white,
                                                                                                          inactiveFillColor: Colors.white,
                                                                                                          selectedFillColor: Color(0x66FFFFFF),
                                                                                                        ),
                                                                                                        controller: _model.pinCodeController,
                                                                                                        onChanged: (_) {},
                                                                                                        onCompleted: (_) async {
                                                                                                          currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                                          var _shouldSetState = false;
                                                                                                          HapticFeedback.mediumImpact();
                                                                                                          if (FFAppState().isProduction) {
                                                                                                            if (!functions.checkIsHaveThisValueInList(columnfifthAuthorizationRecord?.employeeIdList?.toList(), FFAppState().employeeID)!) {
                                                                                                              if (isiOS) {
                                                                                                                if (columnsecBuildVersionRecord?.appVersionIos != _model.getDeviceVersion) {
                                                                                                                  await showDialog(
                                                                                                                    context: context,
                                                                                                                    builder: (alertDialogContext) {
                                                                                                                      return WebViewAware(
                                                                                                                        child: AlertDialog(
                                                                                                                          content: Text('แอพอรุณสวัสดิ์ได้มีการอัพเดทเวอร์ชั่นใหม่ในสโตร์แล้ว กรุณาอัพเดทอรุณสวัสดิ์ก่อนใช้งาน เวอร์ชั่นในTestFlight: ${columnsecBuildVersionRecord?.appVersionIos}เวอร์ชั่นปัจจุบันของคุณ: ${_model.getDeviceVersion}'),
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
                                                                                                                  await launchURL('https://testflight.apple.com/join/8sA3XObM');
                                                                                                                  await actions.terminateAppAction();
                                                                                                                  if (_shouldSetState) setState(() {});
                                                                                                                  return;
                                                                                                                }
                                                                                                              } else {
                                                                                                                if (columnsecBuildVersionRecord?.appVersion != _model.getDeviceVersion) {
                                                                                                                  await showDialog(
                                                                                                                    context: context,
                                                                                                                    builder: (alertDialogContext) {
                                                                                                                      return WebViewAware(
                                                                                                                        child: AlertDialog(
                                                                                                                          content: Text('แอพอรุณสวัสดิ์ได้มีการอัพเดทเวอร์ชั่นใหม่ในสโตร์แล้ว กรุณาอัพเดทอรุณสวัสดิ์ก่อนใช้งาน เวอร์ชั่นในสโตร์: ${columnsecBuildVersionRecord?.appVersion}เวอร์ชั่นปัจจุบันของคุณ: ${_model.getDeviceVersion}'),
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
                                                                                                                  await launchURL('https://play.google.com/store/apps/details?id=com.mycompany.publicarunsawad');
                                                                                                                  await actions.terminateAppAction();
                                                                                                                  if (_shouldSetState) setState(() {});
                                                                                                                  return;
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                          if (_model.pinCodeController!.text != FFAppState().pinCodeAuthen) {
                                                                                                            await showDialog(
                                                                                                              context: context,
                                                                                                              builder: (alertDialogContext) {
                                                                                                                return WebViewAware(
                                                                                                                  child: AlertDialog(
                                                                                                                    content: Text('พินไม่ถูกต้อง โปรดลองอีกครั้งหรือใช้การยืนยันตัวตนของมือถือแทน'),
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
                                                                                                          showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            barrierColor: Color(0x00000000),
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return WebViewAware(
                                                                                                                child: GestureDetector(
                                                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
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

                                                                                                          setState(() {
                                                                                                            FFAppState().userRef = columnfourUserCustomRecord?.reference;
                                                                                                            FFAppState().profileImage = columnfourUserCustomRecord!.imgProfile;
                                                                                                          });
                                                                                                          setState(() {
                                                                                                            FFAppState().adminEMP = columnAuthorizationRecord!.employeeIdList.toList().cast<String>();
                                                                                                          });
                                                                                                          FFAppState().update(() {
                                                                                                            FFAppState().apiURLLocalState = columntriKeyStorageRecord!.apiURL;
                                                                                                          });
                                                                                                          if (FFAppState().isGetDataViaFirebase) {
                                                                                                            setState(() {
                                                                                                              FFAppState().userNickname = columnUserProfileRecord!.nickname;
                                                                                                              FFAppState().profileFullName = columnUserProfileRecord!.fullname;
                                                                                                              FFAppState().profileBirthDate = columnUserProfileRecord!.birthDate;
                                                                                                              FFAppState().profileUnitCodeName = columnUserProfileRecord!.unitCodeName;
                                                                                                              FFAppState().profileParentUnit = columnUserProfileRecord!.parentUnit;
                                                                                                              FFAppState().profileRegion = columnUserProfileRecord!.region;
                                                                                                              FFAppState().profileHiredDate = columnUserProfileRecord!.hiredDate;
                                                                                                              FFAppState().profileServiceDuration = functions.profileServiceDuration(columnUserProfileRecord?.serviceDurationYear, columnUserProfileRecord?.serviceDurationMonth, columnUserProfileRecord?.serviceDurationDay);
                                                                                                              FFAppState().profilePositionAge = functions.positionAgeText(columnUserProfileRecord?.positionAgeYear, columnUserProfileRecord?.positionAgeMonth, columnUserProfileRecord?.positionAgeDay);
                                                                                                              FFAppState().profilePositionAgeCheck = columnUserProfileRecord!.positionAgeCheck;
                                                                                                              FFAppState().profilePositionName = columnUserProfileRecord!.positionName;
                                                                                                              FFAppState().ProfilePhoneNumber = columnUserProfileRecord!.phoneNumber;
                                                                                                              FFAppState().profileFirstBossEmpID = columnUserProfileRecord!.firstBossEmpId;
                                                                                                              FFAppState().profileSecondBossEmpID = columnUserProfileRecord!.secondBossEmpId;
                                                                                                              FFAppState().insurancePlanNumber = columnUserProfileRecord!.insurancePlanNumber;
                                                                                                              FFAppState().profileLevel = columnUserProfileRecord!.level;
                                                                                                              FFAppState().profileBranch = columnUserProfileRecord!.branchName;
                                                                                                              FFAppState().branchCode = columnUserProfileRecord!.branchCode;
                                                                                                              FFAppState().QRCodeLink = '${containerUrlLinkStorageRecord?.urlLink}${FFAppState().employeeID}';
                                                                                                            });
                                                                                                            setState(() {
                                                                                                              FFAppState().userRef = columnfourUserCustomRecord?.reference;
                                                                                                            });
                                                                                                            setState(() {
                                                                                                              FFAppState().profileFirstName = functions.getFirstLastNameFromFullName(columnUserProfileRecord?.fullname, 'first_name')!;
                                                                                                              FFAppState().profileLastName = functions.getFirstLastNameFromFullName(columnUserProfileRecord?.fullname, 'last_name')!;
                                                                                                            });
                                                                                                            setState(() {
                                                                                                              FFAppState().insuranceLicenseStatusCode = columnUserProfileRecord!.insuranceLicenseStatusCode.toList().cast<int>();
                                                                                                            });
                                                                                                            setState(() {
                                                                                                              FFAppState().profileInsuLicenseIdCard = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess) ? functions.createSomethingListWithNullValue(FFAppState().insuranceLicenseStatusCode.toList(), columnUserProfileRecord?.insuranceLicenseIdCard?.toList())! : FFAppState().profileInsuLicenseIdCard.toList().cast<String>();
                                                                                                              FFAppState().profileInsuLicenseNumLicense = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess) ? functions.createSomethingListWithNullValue(FFAppState().insuranceLicenseStatusCode.toList(), columnUserProfileRecord?.insuranceLicenseLicenseNumber?.toList())! : FFAppState().profileInsuLicenseNumLicense.toList().cast<String>();
                                                                                                              FFAppState().profileInsuLicenseStartDate = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess) ? functions.createSomethingListWithNullValue(FFAppState().insuranceLicenseStatusCode.toList(), columnUserProfileRecord?.insuranceLicenseStartDate?.toList())! : FFAppState().profileInsuLicenseStartDate.toList().cast<String>();
                                                                                                              FFAppState().profileInsuLicenseExpireDate = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess) ? functions.createSomethingListWithNullValue(FFAppState().insuranceLicenseStatusCode.toList(), columnUserProfileRecord?.insuranceLicenseExpireDate?.toList())! : FFAppState().profileInsuLicenseExpireDate.toList().cast<String>();
                                                                                                              FFAppState().profileInsuLicenseFullName = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess) ? functions.createSomethingListWithNullValue(FFAppState().insuranceLicenseStatusCode.toList(), columnUserProfileRecord?.insuranceLicenseFullname?.toList())! : FFAppState().profileInsuLicenseFullName.toList().cast<String>();
                                                                                                            });
                                                                                                          } else {
                                                                                                            _model.getUserProfilePin = await GetUserProfileAPICall.call(
                                                                                                              token: FFAppState().accessToken,
                                                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                                                              projectName: 'SSW_ARUNSAWAD_API',
                                                                                                            );
                                                                                                            _shouldSetState = true;
                                                                                                            if ((_model.getUserProfilePin?.statusCode ?? 200) == 200) {
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().userNickname = '${GetUserProfileAPICall.profileNickName(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                                FFAppState().profileFullName = '${GetUserProfileAPICall.profileFullName(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                              });
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().profileBirthDate = '${GetUserProfileAPICall.profileBirthDate(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                                FFAppState().profileUnitCodeName = '${GetUserProfileAPICall.profileBranchName(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                              });
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().profileParentUnit = '${GetUserProfileAPICall.profileArea(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                                FFAppState().profileRegion = '${GetUserProfileAPICall.profileRegion(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                              });
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().profileHiredDate = '${GetUserProfileAPICall.profileHiredDate(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                                FFAppState().profileServiceDuration = '${functions.profileServiceDuration('${GetUserProfileAPICall.profileServiceDurationYY(
                                                                                                                      (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                    )}', '${GetUserProfileAPICall.profileServiceDurationMM(
                                                                                                                      (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                    )}', '${GetUserProfileAPICall.profileServiceDurationDD(
                                                                                                                      (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                    )}')}';
                                                                                                              });
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().profilePositionAge = '${functions.positionAgeText('${GetUserProfileAPICall.profilePositionAgeYY(
                                                                                                                      (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                    )}', '${GetUserProfileAPICall.profilePositionAgeMM(
                                                                                                                      (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                    )}', '${GetUserProfileAPICall.profilePositionAgeDD(
                                                                                                                      (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                    )}')}';
                                                                                                                FFAppState().profilePositionAgeCheck = '${GetUserProfileAPICall.profilePositionAgeCheck(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                              });
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().profilePositionName = '${GetUserProfileAPICall.profliePositionName(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                                FFAppState().QRCodeLink = '${containerUrlLinkStorageRecord?.urlLink}${FFAppState().employeeID}';
                                                                                                              });
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().ProfilePhoneNumber = '${GetUserProfileAPICall.profilePhoneNumber(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                                FFAppState().profileFirstBossEmpID = '${GetUserProfileAPICall.profileFirstBossEmpID(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                                FFAppState().profileSecondBossEmpID = '${GetUserProfileAPICall.profileSecondBossEmpID(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                                FFAppState().insurancePlanNumber = '${GetUserProfileAPICall.insurancePlan(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                                FFAppState().profileLevel = '${GetUserProfileAPICall.profileLevel(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                                FFAppState().profileBranch = '${GetUserProfileAPICall.profileBranch(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                              });
                                                                                                              setState(() {
                                                                                                                FFAppState().branchCode = '${GetUserProfileAPICall.branchCode(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                                FFAppState().userRef = columnfourUserCustomRecord?.reference;
                                                                                                              });
                                                                                                              setState(() {
                                                                                                                FFAppState().profileFirstName = '${functions.getFirstLastNameFromFullName('${FFAppState().profileFullName}', 'first_name')}';
                                                                                                                FFAppState().profileLastName = '${functions.getFirstLastNameFromFullName('${FFAppState().profileFullName}', 'last_name')}';
                                                                                                              });
                                                                                                              setState(() {
                                                                                                                FFAppState().departmentProfile = '${GetUserProfileAPICall.department(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                                FFAppState().profileRoleName = '${GetUserProfileAPICall.profileRoleName(
                                                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                )}';
                                                                                                              });
                                                                                                              _model.getUserInsuranceLicense = await GetUserInsuranceLicenseCall.call(
                                                                                                                token: FFAppState().accessToken,
                                                                                                                apiUrl: FFAppState().apiURLLocalState,
                                                                                                              );
                                                                                                              _shouldSetState = true;
                                                                                                              if ((_model.getUserInsuranceLicense?.statusCode ?? 200) == 200) {
                                                                                                                setState(() {
                                                                                                                  FFAppState().insuranceLicenseStatusCode = functions
                                                                                                                      .convertDynamicListToIntList(getJsonField(
                                                                                                                        (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                                                                        r'''$.dataInfo[*].status''',
                                                                                                                        true,
                                                                                                                      ))!
                                                                                                                      .toList()
                                                                                                                      .cast<int>();
                                                                                                                });
                                                                                                                setState(() {
                                                                                                                  FFAppState().profileInsuLicenseIdCard = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess)
                                                                                                                      ? functions.createSomethingListWithNullValue(
                                                                                                                          FFAppState().insuranceLicenseStatusCode.toList(),
                                                                                                                          GetUserInsuranceLicenseCall.idCard(
                                                                                                                            (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                                                                          )?.toList())!
                                                                                                                      : FFAppState().profileInsuLicenseIdCard.toList().cast<String>();
                                                                                                                  FFAppState().profileInsuLicenseNumLicense = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess)
                                                                                                                      ? functions.createSomethingListWithNullValue(
                                                                                                                          FFAppState().insuranceLicenseStatusCode.toList(),
                                                                                                                          GetUserInsuranceLicenseCall.licenseNumber(
                                                                                                                            (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                                                                          )?.toList())!
                                                                                                                      : FFAppState().profileInsuLicenseNumLicense.toList().cast<String>();
                                                                                                                  FFAppState().profileInsuLicenseStartDate = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess)
                                                                                                                      ? functions.createSomethingListWithNullValue(
                                                                                                                          FFAppState().insuranceLicenseStatusCode.toList(),
                                                                                                                          GetUserInsuranceLicenseCall.startDate(
                                                                                                                            (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                                                                          )?.toList())!
                                                                                                                      : FFAppState().profileInsuLicenseStartDate.toList().cast<String>();
                                                                                                                  FFAppState().profileInsuLicenseExpireDate = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess)
                                                                                                                      ? functions.createSomethingListWithNullValue(
                                                                                                                          FFAppState().insuranceLicenseStatusCode.toList(),
                                                                                                                          GetUserInsuranceLicenseCall.expireDate(
                                                                                                                            (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                                                                          )?.toList())!
                                                                                                                      : FFAppState().profileInsuLicenseExpireDate.toList().cast<String>();
                                                                                                                  FFAppState().profileInsuLicenseFullName = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess)
                                                                                                                      ? functions.createSomethingListWithNullValue(
                                                                                                                          FFAppState().insuranceLicenseStatusCode.toList(),
                                                                                                                          GetUserInsuranceLicenseCall.fullName(
                                                                                                                            (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                                                                          )?.toList())!
                                                                                                                      : FFAppState().profileInsuLicenseFullName.toList().cast<String>();
                                                                                                                });
                                                                                                              }
                                                                                                            } else {
                                                                                                              if (!((GetUserProfileAPICall.message(
                                                                                                                        (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                      ) ==
                                                                                                                      'The token has been blacklisted') ||
                                                                                                                  (GetUserProfileAPICall.message(
                                                                                                                        (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                                                      ) ==
                                                                                                                      'Token Signature could not be verified.'))) {
                                                                                                                await showDialog(
                                                                                                                  context: context,
                                                                                                                  builder: (alertDialogContext) {
                                                                                                                    return WebViewAware(
                                                                                                                      child: AlertDialog(
                                                                                                                        content: Text('พบข้อผิดพลาด (${(_model.getUserProfilePin?.statusCode ?? 200).toString()})${(_model.getUserProfilePin?.jsonBody ?? '').toString()}'),
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
                                                                                                              await showDialog(
                                                                                                                context: context,
                                                                                                                builder: (alertDialogContext) {
                                                                                                                  return WebViewAware(
                                                                                                                    child: AlertDialog(
                                                                                                                      content: Text('Session Loginหมดอายุ'),
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
                                                                                                              Navigator.pop(context);
                                                                                                              await actions.a22();

                                                                                                              context.goNamed('LoginPage');

                                                                                                              if (_shouldSetState) setState(() {});
                                                                                                              return;
                                                                                                            }
                                                                                                          }

                                                                                                          _model.checkLatLngBeforeEnterApp = await actions.a8(
                                                                                                            currentUserLocationValue,
                                                                                                          );
                                                                                                          _shouldSetState = true;
                                                                                                          if (!_model.checkLatLngBeforeEnterApp!) {
                                                                                                            Navigator.pop(context);
                                                                                                            await showDialog(
                                                                                                              context: context,
                                                                                                              builder: (alertDialogContext) {
                                                                                                                return WebViewAware(
                                                                                                                  child: AlertDialog(
                                                                                                                    content: Text('กรุณาเปิดGPS เพื่อเข้าใช้งานอรุณสวัสดิ์'),
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

                                                                                                          var userLogRecordReference = UserLogRecord.collection.doc();
                                                                                                          await userLogRecordReference.set(createUserLogRecordData(
                                                                                                            employeeId: FFAppState().employeeID,
                                                                                                            action: 'Login_With_Pin',
                                                                                                            actionTime: getCurrentTimestamp,
                                                                                                            userLocation: currentUserLocationValue,
                                                                                                          ));
                                                                                                          _model.createdUserLogLoginPin = UserLogRecord.getDocumentFromData(
                                                                                                              createUserLogRecordData(
                                                                                                                employeeId: FFAppState().employeeID,
                                                                                                                action: 'Login_With_Pin',
                                                                                                                actionTime: getCurrentTimestamp,
                                                                                                                userLocation: currentUserLocationValue,
                                                                                                              ),
                                                                                                              userLogRecordReference);
                                                                                                          _shouldSetState = true;
                                                                                                          FFAppState().update(() {
                                                                                                            FFAppState().isFromAuthenPage = true;
                                                                                                            FFAppState().dailyText = functions.helloDailyRandomText(pinCodePageSplashPageImgRecord?.text?.toList());
                                                                                                          });
                                                                                                          FFAppState().update(() {
                                                                                                            FFAppState().DateHoliday = columnfirstSplashPageHolidayImgRecord?.date;
                                                                                                            FFAppState().DateExpHoliday = columnfirstSplashPageHolidayImgRecord?.dateExp;
                                                                                                          });
                                                                                                          setState(() {
                                                                                                            FFAppState().profileInsuExpdateAD = functions.stringlistToDateAD(FFAppState().profileInsuLicenseExpireDate.toList())!.toList().cast<DateTime>();
                                                                                                          });
                                                                                                          setState(() {
                                                                                                            FFAppState().expInsuLessthen30 = functions.compareDate30(FFAppState().profileInsuExpdateAD.toList(), getCurrentTimestamp.toString())!.toList().cast<bool>();
                                                                                                          });
                                                                                                          if (notidatacolumnInsuranceNotiDataRecord != null) {
                                                                                                            if (!functions.compareListof2Date(notidatacolumnInsuranceNotiDataRecord?.expInsuDate?.toList(), FFAppState().profileInsuExpdateAD.toList())!) {
                                                                                                              await notidatacolumnInsuranceNotiDataRecord!.reference.update({
                                                                                                                ...mapToFirestore(
                                                                                                                  {
                                                                                                                    'exp_insu_date': FFAppState().profileInsuExpdateAD,
                                                                                                                  },
                                                                                                                ),
                                                                                                              });
                                                                                                            }
                                                                                                            if (pinCodeInsuranceLicenseDataRecord?.licenseName?.length != notidatacolumnInsuranceNotiDataRecord?.licenseType?.length) {
                                                                                                              await notidatacolumnInsuranceNotiDataRecord!.reference.update({
                                                                                                                ...mapToFirestore(
                                                                                                                  {
                                                                                                                    'license_type': pinCodeInsuranceLicenseDataRecord?.licenseName,
                                                                                                                  },
                                                                                                                ),
                                                                                                              });
                                                                                                            }
                                                                                                            if (notidatacolumnInsuranceNotiDataRecord?.expInsuDate?.length != FFAppState().profileInsuExpdateAD.length) {
                                                                                                              await notidatacolumnInsuranceNotiDataRecord!.reference.update({
                                                                                                                ...mapToFirestore(
                                                                                                                  {
                                                                                                                    'exp_insu_date': FFAppState().profileInsuExpdateAD,
                                                                                                                  },
                                                                                                                ),
                                                                                                              });
                                                                                                            }
                                                                                                          } else {
                                                                                                            var insuranceNotiDataRecordReference = InsuranceNotiDataRecord.collection.doc();
                                                                                                            await insuranceNotiDataRecordReference.set({
                                                                                                              ...createInsuranceNotiDataRecordData(
                                                                                                                empId: FFAppState().employeeID,
                                                                                                              ),
                                                                                                              ...mapToFirestore(
                                                                                                                {
                                                                                                                  'license_type': pinCodeInsuranceLicenseDataRecord?.licenseName,
                                                                                                                  'noti_is_sent': FFAppState().defaultlistFalse,
                                                                                                                  'exp_insu_date': FFAppState().profileInsuExpdateAD,
                                                                                                                },
                                                                                                              ),
                                                                                                            });
                                                                                                            _model.createInsuNotidadta = InsuranceNotiDataRecord.getDocumentFromData({
                                                                                                              ...createInsuranceNotiDataRecordData(
                                                                                                                empId: FFAppState().employeeID,
                                                                                                              ),
                                                                                                              ...mapToFirestore(
                                                                                                                {
                                                                                                                  'license_type': pinCodeInsuranceLicenseDataRecord?.licenseName,
                                                                                                                  'noti_is_sent': FFAppState().defaultlistFalse,
                                                                                                                  'exp_insu_date': FFAppState().profileInsuExpdateAD,
                                                                                                                },
                                                                                                              ),
                                                                                                            }, insuranceNotiDataRecordReference);
                                                                                                            _shouldSetState = true;
                                                                                                            Navigator.pop(context);

                                                                                                            context.goNamed('SuperAppPage');

                                                                                                            if (_shouldSetState) setState(() {});
                                                                                                            return;
                                                                                                          }

                                                                                                          while (FFAppState().superAppi <= functions.lengthMinus1(FFAppState().insuranceLicenseStatusCode.toList())!) {
                                                                                                            if (FFAppState().insuranceLicenseStatusCode[FFAppState().superAppi] == 200) {
                                                                                                              if (FFAppState().expInsuLessthen30[FFAppState().superAppi]) {
                                                                                                                if ((notidatacolumnInsuranceNotiDataRecord?.notiIsSent?[FFAppState().superAppi]) == false) {
                                                                                                                  setState(() {
                                                                                                                    FFAppState().falselistPersistd = functions.changelistFalseToTrue(FFAppState().falselistPersistd.toList(), FFAppState().superAppi)!.toList().cast<bool>();
                                                                                                                  });

                                                                                                                  var notificationRecordReference = NotificationRecord.createDoc(columnfourUserCustomRecord!.reference);
                                                                                                                  await notificationRecordReference.set(createNotificationRecordData(
                                                                                                                    notiTime: getCurrentTimestamp,
                                                                                                                    notiTitle: 'แจ้งเตือนใบอนุญาตประกัน',
                                                                                                                    notiBody: 'ใบอนุญาต${notidatacolumnInsuranceNotiDataRecord?.licenseType?[FFAppState().superAppi]}จะหมดอายุใน 30 วัน',
                                                                                                                    notiIsRead: false,
                                                                                                                    thisNotiIsRead: false,
                                                                                                                    notiType: 'insurance',
                                                                                                                  ));
                                                                                                                  _model.createInsuPageNotification = NotificationRecord.getDocumentFromData(
                                                                                                                      createNotificationRecordData(
                                                                                                                        notiTime: getCurrentTimestamp,
                                                                                                                        notiTitle: 'แจ้งเตือนใบอนุญาตประกัน',
                                                                                                                        notiBody: 'ใบอนุญาต${notidatacolumnInsuranceNotiDataRecord?.licenseType?[FFAppState().superAppi]}จะหมดอายุใน 30 วัน',
                                                                                                                        notiIsRead: false,
                                                                                                                        thisNotiIsRead: false,
                                                                                                                        notiType: 'insurance',
                                                                                                                      ),
                                                                                                                      notificationRecordReference);
                                                                                                                  _shouldSetState = true;
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                            setState(() {
                                                                                                              FFAppState().superAppi = FFAppState().superAppi + 1;
                                                                                                            });
                                                                                                          }

                                                                                                          await notidatacolumnInsuranceNotiDataRecord!.reference.update({
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'noti_is_sent': FFAppState().falselistPersistd,
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          Navigator.pop(context);

                                                                                                          context.goNamed('SuperAppPage');

                                                                                                          if (_shouldSetState) setState(() {});
                                                                                                        },
                                                                                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                                                        validator: _model.pinCodeControllerValidator.asValidator(context),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                                FutureBuilder<List<InsuranceLicenseDataRecord>>(
                                                                                                  future: queryInsuranceLicenseDataRecordOnce(
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
                                                                                                    List<InsuranceLicenseDataRecord> iconButtonInsuranceLicenseDataRecordList = snapshot.data!;
                                                                                                    final iconButtonInsuranceLicenseDataRecord = iconButtonInsuranceLicenseDataRecordList.isNotEmpty ? iconButtonInsuranceLicenseDataRecordList.first : null;
                                                                                                    return FlutterFlowIconButton(
                                                                                                      borderColor: Color(0x004B39EF),
                                                                                                      borderRadius: 20.0,
                                                                                                      borderWidth: 1.0,
                                                                                                      buttonSize: 75.0,
                                                                                                      fillColor: Color(0x004B39EF),
                                                                                                      icon: Icon(
                                                                                                        Icons.fingerprint_sharp,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        size: 60.0,
                                                                                                      ),
                                                                                                      onPressed: () async {
                                                                                                        currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                                        var _shouldSetState = false;
                                                                                                        HapticFeedback.mediumImpact();
                                                                                                        if (FFAppState().isProduction) {
                                                                                                          if (!functions.checkIsHaveThisValueInList(columnfifthAuthorizationRecord?.employeeIdList?.toList(), FFAppState().employeeID)!) {
                                                                                                            if (isiOS) {
                                                                                                              if (columnsecBuildVersionRecord?.appVersionIos != _model.getDeviceVersion) {
                                                                                                                await showDialog(
                                                                                                                  context: context,
                                                                                                                  builder: (alertDialogContext) {
                                                                                                                    return WebViewAware(
                                                                                                                      child: AlertDialog(
                                                                                                                        content: Text('แอพอรุณสวัสดิ์ได้มีการอัพเดทเวอร์ชั่นใหม่ในสโตร์แล้ว กรุณาอัพเดทอรุณสวัสดิ์ก่อนใช้งาน เวอร์ชั่นในTestFlight: ${columnsecBuildVersionRecord?.appVersionIos}เวอร์ชั่นปัจจุบันของคุณ: ${_model.getDeviceVersion}'),
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
                                                                                                                await launchURL('https://testflight.apple.com/join/8sA3XObM');
                                                                                                                await actions.terminateAppAction();
                                                                                                                if (_shouldSetState) setState(() {});
                                                                                                                return;
                                                                                                              }
                                                                                                            } else {
                                                                                                              if (columnsecBuildVersionRecord?.appVersion != _model.getDeviceVersion) {
                                                                                                                await showDialog(
                                                                                                                  context: context,
                                                                                                                  builder: (alertDialogContext) {
                                                                                                                    return WebViewAware(
                                                                                                                      child: AlertDialog(
                                                                                                                        content: Text('แอพอรุณสวัสดิ์ได้มีการอัพเดทเวอร์ชั่นใหม่ในสโตร์แล้ว กรุณาอัพเดทอรุณสวัสดิ์ก่อนใช้งาน เวอร์ชั่นในสโตร์: ${columnsecBuildVersionRecord?.appVersion}เวอร์ชั่นปัจจุบันของคุณ: ${_model.getDeviceVersion}'),
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
                                                                                                                await launchURL('https://play.google.com/store/apps/details?id=com.mycompany.publicarunsawad');
                                                                                                                await actions.terminateAppAction();
                                                                                                                if (_shouldSetState) setState(() {});
                                                                                                                return;
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                        if (!FFAppState().BioAuthCheck) {
                                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                                context: context,
                                                                                                                builder: (alertDialogContext) {
                                                                                                                  return WebViewAware(
                                                                                                                    child: AlertDialog(
                                                                                                                      content: Text('คุณต้องการจะเปิดใช้งานเข้าสู่ระบบด้วย Face id หรือ สแกนลายนิ้วมือหรือไม่?'),
                                                                                                                      actions: [
                                                                                                                        TextButton(
                                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                          child: Text('ไม่เปิด'),
                                                                                                                        ),
                                                                                                                        TextButton(
                                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                          child: Text('เปิด'),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ) ??
                                                                                                              false;
                                                                                                          if (confirmDialogResponse) {
                                                                                                            setState(() {
                                                                                                              FFAppState().BioAuthCheck = true;
                                                                                                            });
                                                                                                            await showDialog(
                                                                                                              context: context,
                                                                                                              builder: (alertDialogContext) {
                                                                                                                return WebViewAware(
                                                                                                                  child: AlertDialog(
                                                                                                                    content: Text('คุณได้เปิดการใช้งาน Face id หรือ สแกนนิ้วเรียบร้อย'),
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
                                                                                                            if (_shouldSetState) setState(() {});
                                                                                                            return;
                                                                                                          }
                                                                                                        }
                                                                                                        final _localAuth = LocalAuthentication();
                                                                                                        bool _isBiometricSupported = await _localAuth.isDeviceSupported();
                                                                                                        bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
                                                                                                        if (_isBiometricSupported && canCheckBiometrics) {
                                                                                                          _model.bioAuthCheck = await _localAuth.authenticate(localizedReason: 'ยืนยันตัวตนด้วย Face id หรือ สแกนลายนิ้วมือ', options: const AuthenticationOptions(biometricOnly: true));
                                                                                                          setState(() {});
                                                                                                        }

                                                                                                        _shouldSetState = true;
                                                                                                        if (!_model.bioAuthCheck!) {
                                                                                                          if (_shouldSetState) setState(() {});
                                                                                                          return;
                                                                                                        }
                                                                                                        showModalBottomSheet(
                                                                                                          isScrollControlled: true,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          barrierColor: Color(0x00000000),
                                                                                                          context: context,
                                                                                                          builder: (context) {
                                                                                                            return WebViewAware(
                                                                                                              child: GestureDetector(
                                                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
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

                                                                                                        setState(() {
                                                                                                          FFAppState().userRef = columnfourUserCustomRecord?.reference;
                                                                                                          FFAppState().profileImage = columnfourUserCustomRecord!.imgProfile;
                                                                                                        });
                                                                                                        setState(() {
                                                                                                          FFAppState().adminEMP = columnAuthorizationRecord!.employeeIdList.toList().cast<String>();
                                                                                                        });
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().apiURLLocalState = columntriKeyStorageRecord!.apiURL;
                                                                                                        });
                                                                                                        if (FFAppState().isGetDataViaFirebase) {
                                                                                                          setState(() {
                                                                                                            FFAppState().userNickname = columnUserProfileRecord!.nickname;
                                                                                                            FFAppState().profileFullName = columnUserProfileRecord!.fullname;
                                                                                                            FFAppState().profileBirthDate = columnUserProfileRecord!.birthDate;
                                                                                                            FFAppState().profileUnitCodeName = columnUserProfileRecord!.unitCodeName;
                                                                                                            FFAppState().profileParentUnit = columnUserProfileRecord!.parentUnit;
                                                                                                            FFAppState().profileRegion = columnUserProfileRecord!.region;
                                                                                                            FFAppState().profileHiredDate = columnUserProfileRecord!.hiredDate;
                                                                                                            FFAppState().profileServiceDuration = functions.profileServiceDuration(columnUserProfileRecord?.serviceDurationYear, columnUserProfileRecord?.serviceDurationMonth, columnUserProfileRecord?.serviceDurationDay);
                                                                                                            FFAppState().profilePositionAge = functions.positionAgeText(columnUserProfileRecord?.positionAgeYear, columnUserProfileRecord?.positionAgeMonth, columnUserProfileRecord?.positionAgeDay);
                                                                                                            FFAppState().profilePositionAgeCheck = columnUserProfileRecord!.positionAgeCheck;
                                                                                                            FFAppState().profilePositionName = columnUserProfileRecord!.positionName;
                                                                                                            FFAppState().ProfilePhoneNumber = columnUserProfileRecord!.phoneNumber;
                                                                                                            FFAppState().profileFirstBossEmpID = columnUserProfileRecord!.firstBossEmpId;
                                                                                                            FFAppState().profileSecondBossEmpID = columnUserProfileRecord!.secondBossEmpId;
                                                                                                            FFAppState().insurancePlanNumber = columnUserProfileRecord!.insurancePlanNumber;
                                                                                                            FFAppState().profileLevel = columnUserProfileRecord!.level;
                                                                                                            FFAppState().profileBranch = columnUserProfileRecord!.branchName;
                                                                                                            FFAppState().branchCode = columnUserProfileRecord!.branchCode;
                                                                                                            FFAppState().QRCodeLink = '${containerUrlLinkStorageRecord?.urlLink}${FFAppState().employeeID}';
                                                                                                          });
                                                                                                          setState(() {
                                                                                                            FFAppState().userRef = columnfourUserCustomRecord?.reference;
                                                                                                          });
                                                                                                          setState(() {
                                                                                                            FFAppState().profileFirstName = functions.getFirstLastNameFromFullName(columnUserProfileRecord?.fullname, 'first_name')!;
                                                                                                            FFAppState().profileLastName = functions.getFirstLastNameFromFullName(columnUserProfileRecord?.fullname, 'last_name')!;
                                                                                                          });
                                                                                                          setState(() {
                                                                                                            FFAppState().insuranceLicenseStatusCode = columnUserProfileRecord!.insuranceLicenseStatusCode.toList().cast<int>();
                                                                                                          });
                                                                                                          setState(() {
                                                                                                            FFAppState().profileInsuLicenseIdCard = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess) ? functions.createSomethingListWithNullValue(FFAppState().insuranceLicenseStatusCode.toList(), columnUserProfileRecord?.insuranceLicenseIdCard?.toList())! : FFAppState().profileInsuLicenseIdCard.toList().cast<String>();
                                                                                                            FFAppState().profileInsuLicenseNumLicense = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess) ? functions.createSomethingListWithNullValue(FFAppState().insuranceLicenseStatusCode.toList(), columnUserProfileRecord?.insuranceLicenseLicenseNumber?.toList())! : FFAppState().profileInsuLicenseNumLicense.toList().cast<String>();
                                                                                                            FFAppState().profileInsuLicenseStartDate = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess) ? functions.createSomethingListWithNullValue(FFAppState().insuranceLicenseStatusCode.toList(), columnUserProfileRecord?.insuranceLicenseStartDate?.toList())! : FFAppState().profileInsuLicenseStartDate.toList().cast<String>();
                                                                                                            FFAppState().profileInsuLicenseExpireDate = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess) ? functions.createSomethingListWithNullValue(FFAppState().insuranceLicenseStatusCode.toList(), columnUserProfileRecord?.insuranceLicenseExpireDate?.toList())! : FFAppState().profileInsuLicenseExpireDate.toList().cast<String>();
                                                                                                            FFAppState().profileInsuLicenseFullName = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess) ? functions.createSomethingListWithNullValue(FFAppState().insuranceLicenseStatusCode.toList(), columnUserProfileRecord?.insuranceLicenseFullname?.toList())! : FFAppState().profileInsuLicenseFullName.toList().cast<String>();
                                                                                                          });
                                                                                                        } else {
                                                                                                          _model.getUserProfileBio = await GetUserProfileAPICall.call(
                                                                                                            token: FFAppState().accessToken,
                                                                                                            apiUrl: FFAppState().apiURLLocalState,
                                                                                                            projectName: 'SSW_ARUNSAWAD_API',
                                                                                                          );
                                                                                                          _shouldSetState = true;
                                                                                                          if ((_model.getUserProfileBio?.statusCode ?? 200) == 200) {
                                                                                                            FFAppState().update(() {
                                                                                                              FFAppState().userNickname = '${GetUserProfileAPICall.profileNickName(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                              FFAppState().profileFullName = '${GetUserProfileAPICall.profileFullName(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                            });
                                                                                                            FFAppState().update(() {
                                                                                                              FFAppState().profileBirthDate = '${GetUserProfileAPICall.profileBirthDate(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                              FFAppState().profileUnitCodeName = '${GetUserProfileAPICall.profileBranchName(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                            });
                                                                                                            FFAppState().update(() {
                                                                                                              FFAppState().profileParentUnit = '${GetUserProfileAPICall.profileArea(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                              FFAppState().profileRegion = '${GetUserProfileAPICall.profileRegion(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                            });
                                                                                                            FFAppState().update(() {
                                                                                                              FFAppState().profileHiredDate = '${GetUserProfileAPICall.profileHiredDate(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                              FFAppState().profileServiceDuration = '${functions.profileServiceDuration('${GetUserProfileAPICall.profileServiceDurationYY(
                                                                                                                    (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                                  )}', '${GetUserProfileAPICall.profileServiceDurationMM(
                                                                                                                    (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                                  )}', '${GetUserProfileAPICall.profileServiceDurationDD(
                                                                                                                    (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                                  )}')}';
                                                                                                            });
                                                                                                            FFAppState().update(() {
                                                                                                              FFAppState().profilePositionAge = '${functions.positionAgeText('${GetUserProfileAPICall.profilePositionAgeYY(
                                                                                                                    (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                                  )}', '${GetUserProfileAPICall.profilePositionAgeMM(
                                                                                                                    (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                                  )}', '${GetUserProfileAPICall.profilePositionAgeDD(
                                                                                                                    (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                                  )}')}';
                                                                                                              FFAppState().profilePositionAgeCheck = '${GetUserProfileAPICall.profilePositionAgeCheck(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                            });
                                                                                                            FFAppState().update(() {
                                                                                                              FFAppState().profilePositionName = '${GetUserProfileAPICall.profliePositionName(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                              FFAppState().QRCodeLink = '${containerUrlLinkStorageRecord?.urlLink}${FFAppState().employeeID}';
                                                                                                            });
                                                                                                            FFAppState().update(() {
                                                                                                              FFAppState().ProfilePhoneNumber = '${GetUserProfileAPICall.profilePhoneNumber(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                              FFAppState().profileFirstBossEmpID = '${GetUserProfileAPICall.profileFirstBossEmpID(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                              FFAppState().profileSecondBossEmpID = '${GetUserProfileAPICall.profileSecondBossEmpID(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                              FFAppState().insurancePlanNumber = '${GetUserProfileAPICall.insurancePlan(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                              FFAppState().profileLevel = '${GetUserProfileAPICall.profileLevel(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                              FFAppState().profileBranch = '${GetUserProfileAPICall.profileBranch(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                            });
                                                                                                            setState(() {
                                                                                                              FFAppState().branchCode = '${GetUserProfileAPICall.branchCode(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                              FFAppState().userRef = columnfourUserCustomRecord?.reference;
                                                                                                            });
                                                                                                            setState(() {
                                                                                                              FFAppState().profileFirstName = '${functions.getFirstLastNameFromFullName('${FFAppState().profileFullName}', 'first_name')}';
                                                                                                              FFAppState().profileLastName = '${functions.getFirstLastNameFromFullName('${FFAppState().profileFullName}', 'last_name')}';
                                                                                                            });
                                                                                                            setState(() {
                                                                                                              FFAppState().departmentProfile = '${GetUserProfileAPICall.department(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                              FFAppState().profileRoleName = '${GetUserProfileAPICall.profileRoleName(
                                                                                                                (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                              )}';
                                                                                                            });
                                                                                                            _model.getUserInsuranceLicenseBio = await GetUserInsuranceLicenseCall.call(
                                                                                                              token: FFAppState().accessToken,
                                                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                                                            );
                                                                                                            _shouldSetState = true;
                                                                                                            if ((_model.getUserInsuranceLicenseBio?.statusCode ?? 200) == 200) {
                                                                                                              setState(() {
                                                                                                                FFAppState().insuranceLicenseStatusCode = functions
                                                                                                                    .convertDynamicListToIntList(getJsonField(
                                                                                                                      (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                                                                      r'''$.dataInfo[*].status''',
                                                                                                                      true,
                                                                                                                    ))!
                                                                                                                    .toList()
                                                                                                                    .cast<int>();
                                                                                                              });
                                                                                                              setState(() {
                                                                                                                FFAppState().profileInsuLicenseIdCard = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess)
                                                                                                                    ? functions.createSomethingListWithNullValue(
                                                                                                                        FFAppState().insuranceLicenseStatusCode.toList(),
                                                                                                                        GetUserInsuranceLicenseCall.idCard(
                                                                                                                          (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                                                                        )?.toList())!
                                                                                                                    : FFAppState().profileInsuLicenseIdCard.toList().cast<String>();
                                                                                                                FFAppState().profileInsuLicenseNumLicense = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess)
                                                                                                                    ? functions.createSomethingListWithNullValue(
                                                                                                                        FFAppState().insuranceLicenseStatusCode.toList(),
                                                                                                                        GetUserInsuranceLicenseCall.licenseNumber(
                                                                                                                          (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                                                                        )?.toList())!
                                                                                                                    : FFAppState().profileInsuLicenseNumLicense.toList().cast<String>();
                                                                                                                FFAppState().profileInsuLicenseStartDate = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess)
                                                                                                                    ? functions.createSomethingListWithNullValue(
                                                                                                                        FFAppState().insuranceLicenseStatusCode.toList(),
                                                                                                                        GetUserInsuranceLicenseCall.startDate(
                                                                                                                          (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                                                                        )?.toList())!
                                                                                                                    : FFAppState().profileInsuLicenseStartDate.toList().cast<String>();
                                                                                                                FFAppState().profileInsuLicenseExpireDate = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess)
                                                                                                                    ? functions.createSomethingListWithNullValue(
                                                                                                                        FFAppState().insuranceLicenseStatusCode.toList(),
                                                                                                                        GetUserInsuranceLicenseCall.expireDate(
                                                                                                                          (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                                                                        )?.toList())!
                                                                                                                    : FFAppState().profileInsuLicenseExpireDate.toList().cast<String>();
                                                                                                                FFAppState().profileInsuLicenseFullName = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess)
                                                                                                                    ? functions.createSomethingListWithNullValue(
                                                                                                                        FFAppState().insuranceLicenseStatusCode.toList(),
                                                                                                                        GetUserInsuranceLicenseCall.fullName(
                                                                                                                          (_model.getUserInsuranceLicenseBio?.jsonBody ?? ''),
                                                                                                                        )?.toList())!
                                                                                                                    : FFAppState().profileInsuLicenseFullName.toList().cast<String>();
                                                                                                              });
                                                                                                            }
                                                                                                          } else {
                                                                                                            if (!((GetUserProfileAPICall.message(
                                                                                                                      (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                                    ) ==
                                                                                                                    'The token has been blacklisted') ||
                                                                                                                (GetUserProfileAPICall.message(
                                                                                                                      (_model.getUserProfileBio?.jsonBody ?? ''),
                                                                                                                    ) ==
                                                                                                                    'Token Signature could not be verified.'))) {
                                                                                                              await showDialog(
                                                                                                                context: context,
                                                                                                                builder: (alertDialogContext) {
                                                                                                                  return WebViewAware(
                                                                                                                    child: AlertDialog(
                                                                                                                      content: Text('พบข้อผิดพลาด (${(_model.getUserProfileBio?.statusCode ?? 200).toString()})'),
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
                                                                                                            await showDialog(
                                                                                                              context: context,
                                                                                                              builder: (alertDialogContext) {
                                                                                                                return WebViewAware(
                                                                                                                  child: AlertDialog(
                                                                                                                    content: Text('Session Loginหมดอายุ'),
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
                                                                                                            Navigator.pop(context);
                                                                                                            await actions.a22();

                                                                                                            context.goNamed('LoginPage');

                                                                                                            if (_shouldSetState) setState(() {});
                                                                                                            return;
                                                                                                          }
                                                                                                        }

                                                                                                        _model.checkLatLngBeforeEnterAppBio = await actions.a8(
                                                                                                          currentUserLocationValue,
                                                                                                        );
                                                                                                        _shouldSetState = true;
                                                                                                        if (!_model.checkLatLngBeforeEnterAppBio!) {
                                                                                                          Navigator.pop(context);
                                                                                                          await showDialog(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return WebViewAware(
                                                                                                                child: AlertDialog(
                                                                                                                  content: Text('กรุณาเปิดGPS เพื่อเข้าใช้งานอรุณสวัสดิ์'),
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

                                                                                                        var userLogRecordReference = UserLogRecord.collection.doc();
                                                                                                        await userLogRecordReference.set(createUserLogRecordData(
                                                                                                          employeeId: FFAppState().employeeID,
                                                                                                          action: 'Login_With_Bio',
                                                                                                          actionTime: getCurrentTimestamp,
                                                                                                          userLocation: currentUserLocationValue,
                                                                                                        ));
                                                                                                        _model.createdUserLogLoginPinCopy = UserLogRecord.getDocumentFromData(
                                                                                                            createUserLogRecordData(
                                                                                                              employeeId: FFAppState().employeeID,
                                                                                                              action: 'Login_With_Bio',
                                                                                                              actionTime: getCurrentTimestamp,
                                                                                                              userLocation: currentUserLocationValue,
                                                                                                            ),
                                                                                                            userLogRecordReference);
                                                                                                        _shouldSetState = true;
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().isFromAuthenPage = true;
                                                                                                          FFAppState().dailyText = functions.helloDailyRandomText(pinCodePageSplashPageImgRecord?.text?.toList());
                                                                                                        });
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().DateHoliday = columnfirstSplashPageHolidayImgRecord?.date;
                                                                                                          FFAppState().DateExpHoliday = columnfirstSplashPageHolidayImgRecord?.dateExp;
                                                                                                        });
                                                                                                        setState(() {
                                                                                                          FFAppState().profileInsuExpdateAD = functions.stringlistToDateAD(FFAppState().profileInsuLicenseExpireDate.toList())!.toList().cast<DateTime>();
                                                                                                        });
                                                                                                        setState(() {
                                                                                                          FFAppState().expInsuLessthen30 = functions.compareDate30(FFAppState().profileInsuExpdateAD.toList(), getCurrentTimestamp.toString())!.toList().cast<bool>();
                                                                                                        });
                                                                                                        if (notidatacolumnInsuranceNotiDataRecord != null) {
                                                                                                          if (!functions.compareListof2Date(notidatacolumnInsuranceNotiDataRecord?.expInsuDate?.toList(), FFAppState().profileInsuExpdateAD.toList())!) {
                                                                                                            await notidatacolumnInsuranceNotiDataRecord!.reference.update({
                                                                                                              ...mapToFirestore(
                                                                                                                {
                                                                                                                  'exp_insu_date': FFAppState().profileInsuExpdateAD,
                                                                                                                },
                                                                                                              ),
                                                                                                            });
                                                                                                          }
                                                                                                          if (iconButtonInsuranceLicenseDataRecord?.licenseName?.length != notidatacolumnInsuranceNotiDataRecord?.licenseType?.length) {
                                                                                                            await notidatacolumnInsuranceNotiDataRecord!.reference.update({
                                                                                                              ...mapToFirestore(
                                                                                                                {
                                                                                                                  'license_type': iconButtonInsuranceLicenseDataRecord?.licenseName,
                                                                                                                },
                                                                                                              ),
                                                                                                            });
                                                                                                          }
                                                                                                          if (notidatacolumnInsuranceNotiDataRecord?.expInsuDate?.length != FFAppState().profileInsuExpdateAD.length) {
                                                                                                            await notidatacolumnInsuranceNotiDataRecord!.reference.update({
                                                                                                              ...mapToFirestore(
                                                                                                                {
                                                                                                                  'exp_insu_date': FFAppState().profileInsuExpdateAD,
                                                                                                                },
                                                                                                              ),
                                                                                                            });
                                                                                                          }
                                                                                                        } else {
                                                                                                          var insuranceNotiDataRecordReference = InsuranceNotiDataRecord.collection.doc();
                                                                                                          await insuranceNotiDataRecordReference.set({
                                                                                                            ...createInsuranceNotiDataRecordData(
                                                                                                              empId: FFAppState().employeeID,
                                                                                                            ),
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'license_type': iconButtonInsuranceLicenseDataRecord?.licenseName,
                                                                                                                'noti_is_sent': FFAppState().defaultlistFalse,
                                                                                                                'exp_insu_date': FFAppState().profileInsuExpdateAD,
                                                                                                              },
                                                                                                            ),
                                                                                                          });
                                                                                                          _model.createInsuNotidadta2 = InsuranceNotiDataRecord.getDocumentFromData({
                                                                                                            ...createInsuranceNotiDataRecordData(
                                                                                                              empId: FFAppState().employeeID,
                                                                                                            ),
                                                                                                            ...mapToFirestore(
                                                                                                              {
                                                                                                                'license_type': iconButtonInsuranceLicenseDataRecord?.licenseName,
                                                                                                                'noti_is_sent': FFAppState().defaultlistFalse,
                                                                                                                'exp_insu_date': FFAppState().profileInsuExpdateAD,
                                                                                                              },
                                                                                                            ),
                                                                                                          }, insuranceNotiDataRecordReference);
                                                                                                          _shouldSetState = true;
                                                                                                          Navigator.pop(context);

                                                                                                          context.goNamed('SuperAppPage');

                                                                                                          if (_shouldSetState) setState(() {});
                                                                                                          return;
                                                                                                        }

                                                                                                        while (FFAppState().superAppi <= functions.lengthMinus1(FFAppState().insuranceLicenseStatusCode.toList())!) {
                                                                                                          if (FFAppState().insuranceLicenseStatusCode[FFAppState().superAppi] == 200) {
                                                                                                            if (FFAppState().expInsuLessthen30[FFAppState().superAppi]) {
                                                                                                              if ((notidatacolumnInsuranceNotiDataRecord?.notiIsSent?[FFAppState().superAppi]) == false) {
                                                                                                                setState(() {
                                                                                                                  FFAppState().falselistPersistd = functions.changelistFalseToTrue(FFAppState().falselistPersistd.toList(), FFAppState().superAppi)!.toList().cast<bool>();
                                                                                                                });

                                                                                                                var notificationRecordReference = NotificationRecord.createDoc(columnfourUserCustomRecord!.reference);
                                                                                                                await notificationRecordReference.set(createNotificationRecordData(
                                                                                                                  notiTime: getCurrentTimestamp,
                                                                                                                  notiTitle: 'แจ้งเตือนใบอนุญาตประกัน',
                                                                                                                  notiBody: 'ใบอนุญาต${notidatacolumnInsuranceNotiDataRecord?.licenseType?[FFAppState().superAppi]}จะหมดอายุใน 30 วัน',
                                                                                                                  notiIsRead: false,
                                                                                                                  thisNotiIsRead: false,
                                                                                                                  notiType: 'insurance',
                                                                                                                ));
                                                                                                                _model.createInsuPageNotificationBio = NotificationRecord.getDocumentFromData(
                                                                                                                    createNotificationRecordData(
                                                                                                                      notiTime: getCurrentTimestamp,
                                                                                                                      notiTitle: 'แจ้งเตือนใบอนุญาตประกัน',
                                                                                                                      notiBody: 'ใบอนุญาต${notidatacolumnInsuranceNotiDataRecord?.licenseType?[FFAppState().superAppi]}จะหมดอายุใน 30 วัน',
                                                                                                                      notiIsRead: false,
                                                                                                                      thisNotiIsRead: false,
                                                                                                                      notiType: 'insurance',
                                                                                                                    ),
                                                                                                                    notificationRecordReference);
                                                                                                                _shouldSetState = true;
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                          setState(() {
                                                                                                            FFAppState().superAppi = FFAppState().superAppi + 1;
                                                                                                          });
                                                                                                        }

                                                                                                        await notidatacolumnInsuranceNotiDataRecord!.reference.update({
                                                                                                          ...mapToFirestore(
                                                                                                            {
                                                                                                              'noti_is_sent': FFAppState().falselistPersistd,
                                                                                                            },
                                                                                                          ),
                                                                                                        });
                                                                                                        Navigator.pop(context);

                                                                                                        context.goNamed('SuperAppPage');

                                                                                                        if (_shouldSetState) setState(() {});
                                                                                                      },
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'กดเพื่อเข้าใช้งาน Face id หรือ สแกนนิ้ว',
                                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: Colors.black,
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
