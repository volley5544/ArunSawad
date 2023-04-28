import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'pin_code_page_model.dart';
export 'pin_code_page_model.dart';

class PinCodePageWidget extends StatefulWidget {
  const PinCodePageWidget({Key? key}) : super(key: key);

  @override
  _PinCodePageWidgetState createState() => _PinCodePageWidgetState();
}

class _PinCodePageWidgetState extends State<PinCodePageWidget>
    with TickerProviderStateMixin {
  late PinCodePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1100.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 1100.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PinCodePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PinCodePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<SplashPageImgRecord>>(
      future: querySplashPageImgRecordOnce(
        queryBuilder: (splashPageImgRecord) => splashPageImgRecord.where('day',
            isEqualTo: functions.checkDateWeekDay(getCurrentTimestamp) != ''
                ? functions.checkDateWeekDay(getCurrentTimestamp)
                : null),
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
                color: FlutterFlowTheme.of(context).primary,
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
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: SafeArea(
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
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      );
                    }
                    List<SplashPageHolidayImgRecord>
                        columnSplashPageHolidayImgRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final columnSplashPageHolidayImgRecord =
                        columnSplashPageHolidayImgRecordList.isNotEmpty
                            ? columnSplashPageHolidayImgRecordList.first
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
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              );
                            }
                            List<BuildVersionRecord>
                                columnBuildVersionRecordList = snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final columnBuildVersionRecord =
                                columnBuildVersionRecordList.isNotEmpty
                                    ? columnBuildVersionRecordList.first
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      List<KeyStorageRecord>
                                          columnKeyStorageRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final columnKeyStorageRecord =
                                          columnKeyStorageRecordList.isNotEmpty
                                              ? columnKeyStorageRecordList.first
                                              : null;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FutureBuilder<
                                              List<UrlLinkStorageRecord>>(
                                            future:
                                                queryUrlLinkStorageRecordOnce(
                                              queryBuilder:
                                                  (urlLinkStorageRecord) =>
                                                      urlLinkStorageRecord.where(
                                                          'url_name',
                                                          isEqualTo:
                                                              'lead_url_link'),
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UrlLinkStorageRecord>
                                                  containerUrlLinkStorageRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final containerUrlLinkStorageRecord =
                                                  containerUrlLinkStorageRecordList
                                                          .isNotEmpty
                                                      ? containerUrlLinkStorageRecordList
                                                          .first
                                                      : null;
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  currentUserLocationValue =
                                                      await getCurrentUserLocation(
                                                          defaultLocation:
                                                              LatLng(0.0, 0.0));
                                                  var _shouldSetState = false;
                                                  HapticFeedback.mediumImpact();
                                                  if (FFAppState()
                                                      .isProduction) {
                                                    if (!((FFAppState()
                                                                .employeeID ==
                                                            '31622') ||
                                                        (FFAppState()
                                                                .employeeID ==
                                                            '33511'))) {
                                                      if (isiOS) {
                                                        if (columnBuildVersionRecord!
                                                                .appVersionIos !=
                                                            _model
                                                                .getDeviceVersion) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                content: Text(
                                                                    'แอพอรุณสวัสดิ์ได้มีการอัพเดทเวอร์ชั่นใหม่ในสโตร์แล้ว กรุณาอัพเดทอรุณสวัสดิ์ก่อนใช้งาน เวอร์ชั่นในTestFlight: ${columnBuildVersionRecord!.appVersionIos}เวอร์ชั่นปัจจุบันของคุณ: ${_model.getDeviceVersion}'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          await launchURL(
                                                              'https://testflight.apple.com/join/8sA3XObM');
                                                          await actions
                                                              .terminateAppAction();
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }
                                                      } else {
                                                        if (columnBuildVersionRecord!
                                                                .appVersion !=
                                                            _model
                                                                .getDeviceVersion) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                content: Text(
                                                                    'แอพอรุณสวัสดิ์ได้มีการอัพเดทเวอร์ชั่นใหม่ในสโตร์แล้ว กรุณาอัพเดทอรุณสวัสดิ์ก่อนใช้งาน เวอร์ชั่นในสโตร์: ${columnBuildVersionRecord!.appVersion}เวอร์ชั่นปัจจุบันของคุณ: ${_model.getDeviceVersion}'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          await launchURL(
                                                              'https://play.google.com/store/apps/details?id=com.mycompany.publicarunsawad');
                                                          await actions
                                                              .terminateAppAction();
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }
                                                      }
                                                    }
                                                  }
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                            .apiURLLocalState =
                                                        columnKeyStorageRecord!
                                                            .apiURL!;
                                                  });
                                                  final _localAuth =
                                                      LocalAuthentication();
                                                  bool _isBiometricSupported =
                                                      await _localAuth
                                                          .isDeviceSupported();

                                                  if (_isBiometricSupported) {
                                                    _model.bioMetricAuthen =
                                                        await _localAuth
                                                            .authenticate(
                                                                localizedReason:
                                                                    'โปรดยืนยันตัวตนโดยใช้การยืนยันตัวตนของมือถือ');
                                                    setState(() {});
                                                  }

                                                  _shouldSetState = true;
                                                  if (!_model
                                                      .bioMetricAuthen!) {
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                  HapticFeedback.mediumImpact();
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        Color(0x00000000),
                                                    context: context,
                                                    builder:
                                                        (bottomSheetContext) {
                                                      return GestureDetector(
                                                        onTap: () => FocusScope
                                                                .of(context)
                                                            .requestFocus(
                                                                _unfocusNode),
                                                        child: Padding(
                                                          padding: MediaQuery.of(
                                                                  bottomSheetContext)
                                                              .viewInsets,
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                LoadingSceneWidget(),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));

                                                  _model.getUserProfileBioAuthen =
                                                      await GetUserProfileAPICall
                                                          .call(
                                                    token: FFAppState()
                                                        .accessToken,
                                                    apiUrl: FFAppState()
                                                        .apiURLLocalState,
                                                  );
                                                  _shouldSetState = true;
                                                  if ((_model.getUserProfileBioAuthen
                                                              ?.statusCode ??
                                                          200) ==
                                                      200) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .userNickname =
                                                          GetUserProfileAPICall
                                                              .profileNickName(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .profileFullName =
                                                          GetUserProfileAPICall
                                                              .profileFullName(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .profileBirthDate =
                                                          GetUserProfileAPICall
                                                              .profileBirthDate(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .profileUnitCodeName =
                                                          GetUserProfileAPICall
                                                              .profileBranchName(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .profileParentUnit =
                                                          GetUserProfileAPICall
                                                              .profileArea(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .profileRegion =
                                                          GetUserProfileAPICall
                                                              .profileRegion(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .profileHiredDate =
                                                          GetUserProfileAPICall
                                                              .profileHiredDate(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState().profileServiceDuration = functions
                                                          .profileServiceDuration(
                                                              GetUserProfileAPICall
                                                                  .profileServiceDurationYY(
                                                                (_model.getUserProfileBioAuthen
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString(),
                                                              GetUserProfileAPICall
                                                                  .profileServiceDurationMM(
                                                                (_model.getUserProfileBioAuthen
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString(),
                                                              GetUserProfileAPICall
                                                                  .profileServiceDurationDD(
                                                                (_model.getUserProfileBioAuthen
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString());
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState().profilePositionAge = functions
                                                          .positionAgeText(
                                                              GetUserProfileAPICall
                                                                  .profilePositionAgeYY(
                                                                (_model.getUserProfileBioAuthen
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString(),
                                                              GetUserProfileAPICall
                                                                  .profilePositionAgeMM(
                                                                (_model.getUserProfileBioAuthen
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString(),
                                                              GetUserProfileAPICall
                                                                  .profilePositionAgeDD(
                                                                (_model.getUserProfileBioAuthen
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString());
                                                      FFAppState()
                                                              .profilePositionAgeCheck =
                                                          GetUserProfileAPICall
                                                              .profilePositionAgeCheck(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .profilePositionName =
                                                          GetUserProfileAPICall
                                                              .profliePositionName(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState().QRCodeLink =
                                                          '${containerUrlLinkStorageRecord!.urlLink}${FFAppState().employeeID}';
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .ProfilePhoneNumber =
                                                          GetUserProfileAPICall
                                                              .profilePhoneNumber(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .profileFirstBossEmpID =
                                                          GetUserProfileAPICall
                                                              .profileFirstBossEmpID(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .profileSecondBossEmpID =
                                                          GetUserProfileAPICall
                                                              .profileSecondBossEmpID(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .insurancePlanNumber =
                                                          GetUserProfileAPICall
                                                              .insurancePlan(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .profileLevel =
                                                          GetUserProfileAPICall
                                                              .profileLevel(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                      FFAppState()
                                                              .profileBranch =
                                                          GetUserProfileAPICall
                                                              .profileBranch(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                    });
                                                    setState(() {
                                                      FFAppState().branchCode =
                                                          GetUserProfileAPICall
                                                              .branchCode(
                                                        (_model.getUserProfileBioAuthen
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString();
                                                    });
                                                  } else {
                                                    if (!((GetUserProfileAPICall
                                                                .message(
                                                              (_model.getUserProfileBioAuthen
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() ==
                                                            'The token has been blacklisted') ||
                                                        (GetUserProfileAPICall
                                                                .message(
                                                              (_model.getUserProfileBioAuthen
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString() ==
                                                            'Token Signature could not be verified.'))) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'พบข้อผิดพลาด (${(_model.getUserProfileBioAuthen?.statusCode ?? 200).toString()})'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              'Session Loginหมดอายุ'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .loginStateFirebase =
                                                          '[loginStateFirebase]';
                                                      FFAppState()
                                                          .deleteAccessToken();
                                                      FFAppState().accessToken =
                                                          'access_token';
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .deleteEmployeeID();
                                                      FFAppState().employeeID =
                                                          'employee_id';

                                                      FFAppState().QRCodeLink =
                                                          'qrcode_link';
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .deleteApiURLLocalState();
                                                      FFAppState()
                                                              .apiURLLocalState =
                                                          'api_url_local_state';

                                                      FFAppState()
                                                          .deleteBranchCode();
                                                      FFAppState().branchCode =
                                                          'branch_code';
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .isFromSetPinPage =
                                                          false;
                                                      FFAppState()
                                                          .leadChannelColor = [];
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .leadChannelList = [];
                                                      FFAppState()
                                                              .isFromLoginPage =
                                                          false;
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .deletePinCodeAuthen();
                                                      FFAppState()
                                                              .pinCodeAuthen =
                                                          '013972';

                                                      FFAppState()
                                                              .isFromAuthenPage =
                                                          false;
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                          .deleteDateDoNotShowAgain();
                                                      FFAppState()
                                                              .dateDoNotShowAgain =
                                                          null;

                                                      FFAppState()
                                                          .deleteDoNotShowAgain();
                                                      FFAppState()
                                                              .doNotShowAgain =
                                                          false;
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .inAppViaNotification =
                                                          true;
                                                      FFAppState().isInApp =
                                                          false;
                                                    });
                                                    FFAppState().update(() {
                                                      FFAppState().fcmToken =
                                                          'fcm_token';
                                                      FFAppState()
                                                              .isPassLoginSection =
                                                          false;
                                                    });
                                                    Navigator.pop(context);
                                                    await actions.a22();

                                                    context
                                                        .goNamed('LoginPage');

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }

                                                  _model.checkLatLngBeforeEnterApp1 =
                                                      await actions.a8(
                                                    currentUserLocationValue,
                                                  );
                                                  _shouldSetState = true;
                                                  if (!_model
                                                      .checkLatLngBeforeEnterApp1!) {
                                                    Navigator.pop(context);
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              'กรุณาเปิดGPS เพื่อเข้าใช้งานอรุณสวัสดิ์'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }

                                                  final userLogCreateData =
                                                      createUserLogRecordData(
                                                    employeeId:
                                                        FFAppState().employeeID,
                                                    action: 'Login_With_Pin',
                                                    actionTime:
                                                        getCurrentTimestamp,
                                                    userLocation:
                                                        currentUserLocationValue,
                                                  );
                                                  var userLogRecordReference =
                                                      UserLogRecord.collection
                                                          .doc();
                                                  await userLogRecordReference
                                                      .set(userLogCreateData);
                                                  _model.createdUserLogLoginPin1 =
                                                      UserLogRecord
                                                          .getDocumentFromData(
                                                              userLogCreateData,
                                                              userLogRecordReference);
                                                  _shouldSetState = true;
                                                  FFAppState().update(() {
                                                    FFAppState()
                                                            .isFromAuthenPage =
                                                        true;
                                                    FFAppState().dailyText = functions
                                                        .helloDailyRandomText(
                                                            pinCodePageSplashPageImgRecord!
                                                                .text!
                                                                .toList());
                                                  });
                                                  FFAppState().update(() {
                                                    FFAppState().DateHoliday =
                                                        columnSplashPageHolidayImgRecord!
                                                            .date;
                                                    FFAppState()
                                                            .DateExpHoliday =
                                                        columnSplashPageHolidayImgRecord!
                                                            .dateExp;
                                                  });
                                                  Navigator.pop(context);

                                                  context
                                                      .goNamed('SuperAppPage');

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      1.0,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.white,
                                                        Color(0xFFFF9E35)
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: AlignmentDirectional(
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
                                                              authorizationRecord.where(
                                                                  'content_name',
                                                                  isEqualTo:
                                                                      'skip_version_id'),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<AuthorizationRecord>
                                                          columnAuthorizationRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final columnAuthorizationRecord =
                                                          columnAuthorizationRecordList
                                                                  .isNotEmpty
                                                              ? columnAuthorizationRecordList
                                                                  .first
                                                              : null;
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            30.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            55.0,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .logout,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              35.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          currentUserLocationValue =
                                                                              await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                          var _shouldSetState =
                                                                              false;
                                                                          HapticFeedback
                                                                              .mediumImpact();
                                                                          showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            barrierColor:
                                                                                Color(0x00000000),
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (bottomSheetContext) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                  child: Container(
                                                                                    height: double.infinity,
                                                                                    child: LoadingSceneWidget(),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));

                                                                          _model.checkDeviceLocSerLogout =
                                                                              await actions.a1();
                                                                          _shouldSetState =
                                                                              true;
                                                                          if (!_model
                                                                              .checkDeviceLocSerLogout!) {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  content: Text('กรุณาเปิดGPSเพื่อทำรายการ'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                            return;
                                                                          }
                                                                          _model.checkDeviceLocPerLogout =
                                                                              await actions.a2();
                                                                          _shouldSetState =
                                                                              true;
                                                                          if (!_model
                                                                              .checkDeviceLocPerLogout!) {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  content: Text('กรุณาให้อรุณสวัสดิ์เข้าถึงGPSของคุณ'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                            return;
                                                                          }
                                                                          _model.checkLatLngLogout =
                                                                              await actions.a8(
                                                                            currentUserLocationValue,
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          if (!_model
                                                                              .checkLatLngLogout!) {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  content: Text('กรุณาเปิดGPSเพื่อทำรายการ'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                            return;
                                                                          }
                                                                          _model.logoutAction =
                                                                              await LogoutAPICall.call(
                                                                            token:
                                                                                FFAppState().accessToken,
                                                                            apiUrl:
                                                                                FFAppState().apiURLLocalState,
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          if ((_model.logoutAction?.statusCode ?? 200) !=
                                                                              200) {
                                                                            if (!((LogoutAPICall.message(
                                                                                      (_model.logoutAction?.jsonBody ?? ''),
                                                                                    ).toString() ==
                                                                                    'The token has been blacklisted') ||
                                                                                (LogoutAPICall.message(
                                                                                      (_model.logoutAction?.jsonBody ?? ''),
                                                                                    ).toString() ==
                                                                                    'Token Signature could not be verified.'))) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('พบข้อผิดพลาด (${(_model.logoutAction?.statusCode ?? 200).toString()})${(_model.logoutAction?.jsonBody ?? '').toString()}'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
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

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                            return;
                                                                          }

                                                                          final userLogCreateData =
                                                                              createUserLogRecordData(
                                                                            employeeId:
                                                                                FFAppState().employeeID,
                                                                            action:
                                                                                'Logout',
                                                                            actionTime:
                                                                                getCurrentTimestamp,
                                                                            userLocation:
                                                                                currentUserLocationValue,
                                                                          );
                                                                          var userLogRecordReference = UserLogRecord
                                                                              .collection
                                                                              .doc();
                                                                          await userLogRecordReference
                                                                              .set(userLogCreateData);
                                                                          _model.createdUserLogLogout = UserLogRecord.getDocumentFromData(
                                                                              userLogCreateData,
                                                                              userLogRecordReference);
                                                                          _shouldSetState =
                                                                              true;
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().loginStateFirebase =
                                                                                '[loginStateFirebase]';
                                                                            FFAppState().deleteAccessToken();
                                                                            FFAppState().accessToken =
                                                                                'access_token';
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().deleteEmployeeID();
                                                                            FFAppState().employeeID =
                                                                                'employee_id';

                                                                            FFAppState().QRCodeLink =
                                                                                'qrcode_link';
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().deleteApiURLLocalState();
                                                                            FFAppState().apiURLLocalState =
                                                                                'api_url_local_state';

                                                                            FFAppState().deleteBranchCode();
                                                                            FFAppState().branchCode =
                                                                                'branch_code';
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().isFromSetPinPage =
                                                                                false;
                                                                            FFAppState().leadChannelColor =
                                                                                [];
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().leadChannelList =
                                                                                [];
                                                                            FFAppState().isFromLoginPage =
                                                                                false;
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().deletePinCodeAuthen();
                                                                            FFAppState().pinCodeAuthen =
                                                                                '013972';

                                                                            FFAppState().isFromAuthenPage =
                                                                                false;
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().deleteDateDoNotShowAgain();
                                                                            FFAppState().dateDoNotShowAgain =
                                                                                null;

                                                                            FFAppState().deleteDoNotShowAgain();
                                                                            FFAppState().doNotShowAgain =
                                                                                false;
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().inAppViaNotification =
                                                                                true;
                                                                            FFAppState().isInApp =
                                                                                false;
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().fcmToken =
                                                                                'fcm_token';
                                                                            FFAppState().isPassLoginSection =
                                                                                false;
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().leadID =
                                                                                [];
                                                                            FFAppState().leadCreatedTimeList =
                                                                                [];
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().leadCustomerNameList =
                                                                                [];
                                                                            FFAppState().leadChannelList =
                                                                                [];
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().leadChannelColor =
                                                                                [];
                                                                            FFAppState().leadCallStatus =
                                                                                [];
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().leadPhoneNumberList =
                                                                                [];
                                                                            FFAppState().leadEmployeeID =
                                                                                [];
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().leadChannelLabelColor =
                                                                                [];
                                                                            FFAppState().deleteLeadIdCalledInApp();
                                                                            FFAppState().leadIdCalledInApp =
                                                                                [];
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().leadBranchCode =
                                                                                [];
                                                                            FFAppState().leadUserLevel =
                                                                                'lead_user_level';
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().leadChannelAmountList =
                                                                                [];
                                                                          });
                                                                          Navigator.pop(
                                                                              context);
                                                                          await actions
                                                                              .a22();

                                                                          context
                                                                              .goNamed('LoginPage');

                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                        },
                                                                      ),
                                                                    ),
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      'ออกจากระบบ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            30.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            55.0,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .app_blocking_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              33.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          HapticFeedback
                                                                              .mediumImpact();
                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
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
                                                                                  );
                                                                                },
                                                                              ) ??
                                                                              false;
                                                                          if (!confirmDialogResponse) {
                                                                            return;
                                                                          }
                                                                          await actions
                                                                              .a22();
                                                                          await actions
                                                                              .clearAllAppDataCopy();
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text('เคลียร์แคชเรียบร้อยกรุณาปิดแอปเปิดใหม่'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child: SelectionArea(
                                                                          child: Text(
                                                                        'ล้างข้อมูลแอพ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 14.0,
                                                                            ),
                                                                      )),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
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
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'ยินดีต้อนรับสู่อรุณสวัสดิ์',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            28.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        24.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'โปรดใส่พินเพื่อเข้าใช้งาน',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          32.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child:
                                                                      PinCodeTextField(
                                                                    autoDisposeControllers:
                                                                        false,
                                                                    appContext:
                                                                        context,
                                                                    length: 6,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    enableActiveFill:
                                                                        true,
                                                                    autoFocus:
                                                                        true,
                                                                    enablePinAutofill:
                                                                        true,
                                                                    errorTextSpace:
                                                                        16.0,
                                                                    showCursor:
                                                                        false,
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    obscureText:
                                                                        true,
                                                                    obscuringCharacter:
                                                                        '●',
                                                                    hintCharacter:
                                                                        '*',
                                                                    pinTheme:
                                                                        PinTheme(
                                                                      fieldHeight:
                                                                          55.0,
                                                                      fieldWidth:
                                                                          50.0,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      shape: PinCodeFieldShape
                                                                          .box,
                                                                      activeColor:
                                                                          Colors
                                                                              .white,
                                                                      inactiveColor:
                                                                          Colors
                                                                              .white,
                                                                      selectedColor:
                                                                          Color(
                                                                              0x66FFFFFF),
                                                                      activeFillColor:
                                                                          Colors
                                                                              .white,
                                                                      inactiveFillColor:
                                                                          Colors
                                                                              .white,
                                                                      selectedFillColor:
                                                                          Color(
                                                                              0x66FFFFFF),
                                                                    ),
                                                                    controller:
                                                                        _model
                                                                            .pinCodeController,
                                                                    onChanged:
                                                                        (_) {},
                                                                    onCompleted:
                                                                        (_) async {
                                                                      currentUserLocationValue = await getCurrentUserLocation(
                                                                          defaultLocation: LatLng(
                                                                              0.0,
                                                                              0.0));
                                                                      var _shouldSetState =
                                                                          false;
                                                                      HapticFeedback
                                                                          .mediumImpact();
                                                                      if (FFAppState()
                                                                          .isProduction) {
                                                                        if (!functions.checkIsHaveThisValueInList(
                                                                            columnAuthorizationRecord!.employeeIdList!.toList(),
                                                                            FFAppState().employeeID)!) {
                                                                          if (isiOS) {
                                                                            if (columnBuildVersionRecord!.appVersionIos !=
                                                                                _model.getDeviceVersion) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('แอพอรุณสวัสดิ์ได้มีการอัพเดทเวอร์ชั่นใหม่ในสโตร์แล้ว กรุณาอัพเดทอรุณสวัสดิ์ก่อนใช้งาน เวอร์ชั่นในTestFlight: ${columnBuildVersionRecord!.appVersionIos}เวอร์ชั่นปัจจุบันของคุณ: ${_model.getDeviceVersion}'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              await launchURL('https://testflight.apple.com/join/8sA3XObM');
                                                                              await actions.terminateAppAction();
                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                          } else {
                                                                            if (columnBuildVersionRecord!.appVersion !=
                                                                                _model.getDeviceVersion) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('แอพอรุณสวัสดิ์ได้มีการอัพเดทเวอร์ชั่นใหม่ในสโตร์แล้ว กรุณาอัพเดทอรุณสวัสดิ์ก่อนใช้งาน เวอร์ชั่นในสโตร์: ${columnBuildVersionRecord!.appVersion}เวอร์ชั่นปัจจุบันของคุณ: ${_model.getDeviceVersion}'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              await launchURL('https://play.google.com/store/apps/details?id=com.mycompany.publicarunsawad');
                                                                              await actions.terminateAppAction();
                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                      if (_model
                                                                              .pinCodeController!
                                                                              .text !=
                                                                          FFAppState()
                                                                              .pinCodeAuthen) {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              content: Text('พินไม่ถูกต้อง โปรดลองอีกครั้งหรือใช้การยืนยันตัวตนของมือถือแทน'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }
                                                                      showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        barrierColor:
                                                                            Color(0x00000000),
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (bottomSheetContext) {
                                                                          return GestureDetector(
                                                                            onTap: () =>
                                                                                FocusScope.of(context).requestFocus(_unfocusNode),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                              child: Container(
                                                                                height: double.infinity,
                                                                                child: LoadingSceneWidget(),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));

                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().apiURLLocalState =
                                                                            columnKeyStorageRecord!.apiURL!;
                                                                      });
                                                                      _model.getUserProfilePin =
                                                                          await GetUserProfileAPICall
                                                                              .call(
                                                                        token: FFAppState()
                                                                            .accessToken,
                                                                        apiUrl:
                                                                            FFAppState().apiURLLocalState,
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      if ((_model.getUserProfilePin?.statusCode ??
                                                                              200) ==
                                                                          200) {
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().userNickname =
                                                                              GetUserProfileAPICall.profileNickName(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                          FFAppState().profileFullName =
                                                                              GetUserProfileAPICall.profileFullName(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().profileBirthDate =
                                                                              GetUserProfileAPICall.profileBirthDate(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                          FFAppState().profileUnitCodeName =
                                                                              GetUserProfileAPICall.profileBranchName(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().profileParentUnit =
                                                                              GetUserProfileAPICall.profileArea(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                          FFAppState().profileRegion =
                                                                              GetUserProfileAPICall.profileRegion(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().profileHiredDate =
                                                                              GetUserProfileAPICall.profileHiredDate(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                          FFAppState().profileServiceDuration = functions.profileServiceDuration(
                                                                              GetUserProfileAPICall.profileServiceDurationYY(
                                                                                (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                              ).toString(),
                                                                              GetUserProfileAPICall.profileServiceDurationMM(
                                                                                (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                              ).toString(),
                                                                              GetUserProfileAPICall.profileServiceDurationDD(
                                                                                (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                              ).toString());
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().profilePositionAge = functions.positionAgeText(
                                                                              GetUserProfileAPICall.profilePositionAgeYY(
                                                                                (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                              ).toString(),
                                                                              GetUserProfileAPICall.profilePositionAgeMM(
                                                                                (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                              ).toString(),
                                                                              GetUserProfileAPICall.profilePositionAgeDD(
                                                                                (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                              ).toString());
                                                                          FFAppState().profilePositionAgeCheck =
                                                                              GetUserProfileAPICall.profilePositionAgeCheck(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().profilePositionName =
                                                                              GetUserProfileAPICall.profliePositionName(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                          FFAppState().QRCodeLink =
                                                                              '${containerUrlLinkStorageRecord!.urlLink}${FFAppState().employeeID}';
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().ProfilePhoneNumber =
                                                                              GetUserProfileAPICall.profilePhoneNumber(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                          FFAppState().profileFirstBossEmpID =
                                                                              GetUserProfileAPICall.profileFirstBossEmpID(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                          FFAppState().profileSecondBossEmpID =
                                                                              GetUserProfileAPICall.profileSecondBossEmpID(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                          FFAppState().insurancePlanNumber =
                                                                              GetUserProfileAPICall.insurancePlan(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                          FFAppState().profileLevel =
                                                                              GetUserProfileAPICall.profileLevel(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                          FFAppState().profileBranch =
                                                                              GetUserProfileAPICall.profileBranch(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          FFAppState().branchCode =
                                                                              GetUserProfileAPICall.branchCode(
                                                                            (_model.getUserProfilePin?.jsonBody ??
                                                                                ''),
                                                                          ).toString();
                                                                        });
                                                                      } else {
                                                                        if (!((GetUserProfileAPICall.message(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                ).toString() ==
                                                                                'The token has been blacklisted') ||
                                                                            (GetUserProfileAPICall.message(
                                                                                  (_model.getUserProfilePin?.jsonBody ?? ''),
                                                                                ).toString() ==
                                                                                'Token Signature could not be verified.'))) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text('พบข้อผิดพลาด (${(_model.getUserProfilePin?.statusCode ?? 200).toString()})${(_model.getUserProfilePin?.jsonBody ?? '').toString()}'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              content: Text('Session Loginหมดอายุ'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().loginStateFirebase =
                                                                              '[loginStateFirebase]';
                                                                          FFAppState()
                                                                              .deleteAccessToken();
                                                                          FFAppState().accessToken =
                                                                              'access_token';
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState()
                                                                              .deleteEmployeeID();
                                                                          FFAppState().employeeID =
                                                                              'employee_id';

                                                                          FFAppState().QRCodeLink =
                                                                              'qrcode_link';
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState()
                                                                              .deleteApiURLLocalState();
                                                                          FFAppState().apiURLLocalState =
                                                                              'api_url_local_state';

                                                                          FFAppState()
                                                                              .deleteBranchCode();
                                                                          FFAppState().branchCode =
                                                                              'branch_code';
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().isFromSetPinPage =
                                                                              false;
                                                                          FFAppState().leadChannelColor =
                                                                              [];
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().leadChannelList =
                                                                              [];
                                                                          FFAppState().isFromLoginPage =
                                                                              false;
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState()
                                                                              .deletePinCodeAuthen();
                                                                          FFAppState().pinCodeAuthen =
                                                                              '013972';

                                                                          FFAppState().isFromAuthenPage =
                                                                              false;
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState()
                                                                              .deleteDateDoNotShowAgain();
                                                                          FFAppState().dateDoNotShowAgain =
                                                                              null;

                                                                          FFAppState()
                                                                              .deleteDoNotShowAgain();
                                                                          FFAppState().doNotShowAgain =
                                                                              false;
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().inAppViaNotification =
                                                                              true;
                                                                          FFAppState().isInApp =
                                                                              false;
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().fcmToken =
                                                                              'fcm_token';
                                                                          FFAppState().isPassLoginSection =
                                                                              false;
                                                                        });
                                                                        Navigator.pop(
                                                                            context);
                                                                        await actions
                                                                            .a22();

                                                                        context.goNamed(
                                                                            'LoginPage');

                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }

                                                                      _model.checkLatLngBeforeEnterApp =
                                                                          await actions
                                                                              .a8(
                                                                        currentUserLocationValue,
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      if (!_model
                                                                          .checkLatLngBeforeEnterApp!) {
                                                                        Navigator.pop(
                                                                            context);
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              content: Text('กรุณาเปิดGPS เพื่อเข้าใช้งานอรุณสวัสดิ์'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }

                                                                      final userLogCreateData =
                                                                          createUserLogRecordData(
                                                                        employeeId:
                                                                            FFAppState().employeeID,
                                                                        action:
                                                                            'Login_With_Pin',
                                                                        actionTime:
                                                                            getCurrentTimestamp,
                                                                        userLocation:
                                                                            currentUserLocationValue,
                                                                      );
                                                                      var userLogRecordReference = UserLogRecord
                                                                          .collection
                                                                          .doc();
                                                                      await userLogRecordReference
                                                                          .set(
                                                                              userLogCreateData);
                                                                      _model.createdUserLogLoginPin = UserLogRecord.getDocumentFromData(
                                                                          userLogCreateData,
                                                                          userLogRecordReference);
                                                                      _shouldSetState =
                                                                          true;
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().isFromAuthenPage =
                                                                            true;
                                                                        FFAppState().dailyText = functions.helloDailyRandomText(pinCodePageSplashPageImgRecord!
                                                                            .text!
                                                                            .toList());
                                                                      });
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().DateHoliday =
                                                                            columnSplashPageHolidayImgRecord!.date;
                                                                        FFAppState().DateExpHoliday =
                                                                            columnSplashPageHolidayImgRecord!.dateExp;
                                                                      });
                                                                      Navigator.pop(
                                                                          context);

                                                                      context.goNamed(
                                                                          'SuperAppPage');

                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                    },
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    validator: _model
                                                                        .pinCodeControllerValidator
                                                                        .asValidator(
                                                                            context),
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
                                                                        50.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'หรือใช้การยืนยันตัวตนของมือถือ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF001187),
                                                                    fontSize:
                                                                        16.0,
                                                                  ),
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
                                                            child: Text(
                                                              '(แตะเพื่อใช้การยืนยันตัวตนของมือถือ)',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Color(
                                                                        0xFF001187),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
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
