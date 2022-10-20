import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/loading_scene_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';

class PinCodePageWidget extends StatefulWidget {
  const PinCodePageWidget({Key? key}) : super(key: key);

  @override
  _PinCodePageWidgetState createState() => _PinCodePageWidgetState();
}

class _PinCodePageWidgetState extends State<PinCodePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1100.ms,
          duration: 600.ms,
          begin: 1,
          end: 1,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 1100.ms,
          duration: 600.ms,
          begin: 1,
          end: 1,
        ),
      ],
    ),
  };
  ApiCallResponse? getUserProfileBioAuthen;
  bool bioMetricAuthen = false;
  bool? deviceLocationServicePinPage1;
  bool? deviceLocationPermissionPinPage1;
  bool? checkLatLngBeforeEnterApp1;
  UserLogRecord? createdUserLogLoginPin1;
  ApiCallResponse? getUserProfilePin;
  bool? deviceLocationServicePinPage;
  bool? deviceLocationPermissionPinPage;
  bool? checkLatLngBeforeEnterApp;
  UserLogRecord? createdUserLogLoginPin;
  TextEditingController? pinCodeController;
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    pinCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
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
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<SplashPageImgRecord> pinCodePageSplashPageImgRecordList =
            snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final pinCodePageSplashPageImgRecord =
            pinCodePageSplashPageImgRecordList.isNotEmpty
                ? pinCodePageSplashPageImgRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: InkWell(
              onTap: () async {
                currentUserLocationValue = await getCurrentUserLocation(
                    defaultLocation: LatLng(0.0, 0.0));
                var _shouldSetState = false;
                HapticFeedback.mediumImpact();
                final local_auth = LocalAuthentication();
                bool _isBiometricSupported =
                    await local_auth.isDeviceSupported();

                if (_isBiometricSupported) {
                  bioMetricAuthen = await local_auth.authenticate(
                      localizedReason:
                          'โปรดยืนยันตัวตนโดยใช้การยืนยันตัวตนของมือถือ');
                  setState(() {});
                }

                _shouldSetState = true;
                if (!bioMetricAuthen!) {
                  if (_shouldSetState) setState(() {});
                  return;
                }
                HapticFeedback.mediumImpact();
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        height: double.infinity,
                        child: LoadingSceneWidget(),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));

                getUserProfileBioAuthen = await GetUserProfileAPICall.call(
                  token: FFAppState().accessToken,
                  apiUrl: FFAppState().apiURLLocalState,
                );
                _shouldSetState = true;
                if ((getUserProfileBioAuthen?.succeeded ?? true)) {
                  setState(() => FFAppState().userNickname =
                          GetUserProfileAPICall.profileNickName(
                        (getUserProfileBioAuthen?.jsonBody ?? ''),
                      ).toString());
                  setState(() => FFAppState().profileFullName =
                          GetUserProfileAPICall.profileFullName(
                        (getUserProfileBioAuthen?.jsonBody ?? ''),
                      ).toString());
                  setState(() => FFAppState().profileBirthDate =
                          GetUserProfileAPICall.profileBirthDate(
                        (getUserProfileBioAuthen?.jsonBody ?? ''),
                      ).toString());
                  setState(() => FFAppState().profileUnitCodeName =
                          GetUserProfileAPICall.profileBranchName(
                        (getUserProfileBioAuthen?.jsonBody ?? ''),
                      ).toString());
                  setState(() => FFAppState().profileParentUnit =
                          GetUserProfileAPICall.profileArea(
                        (getUserProfileBioAuthen?.jsonBody ?? ''),
                      ).toString());
                  setState(() => FFAppState().profileRegion =
                          GetUserProfileAPICall.profileRegion(
                        (getUserProfileBioAuthen?.jsonBody ?? ''),
                      ).toString());
                  setState(() => FFAppState().profileHiredDate =
                          GetUserProfileAPICall.profileHiredDate(
                        (getUserProfileBioAuthen?.jsonBody ?? ''),
                      ).toString());
                  setState(() => FFAppState().profileServiceDuration =
                      functions.profileServiceDuration(
                          GetUserProfileAPICall.profileServiceDurationYY(
                            (getUserProfileBioAuthen?.jsonBody ?? ''),
                          ).toString(),
                          GetUserProfileAPICall.profileServiceDurationMM(
                            (getUserProfileBioAuthen?.jsonBody ?? ''),
                          ).toString(),
                          GetUserProfileAPICall.profileServiceDurationDD(
                            (getUserProfileBioAuthen?.jsonBody ?? ''),
                          ).toString()));
                  setState(() => FFAppState().profilePositionAge =
                          GetUserProfileAPICall.profilePositionAge(
                        (getUserProfileBioAuthen?.jsonBody ?? ''),
                      ).toString());
                  setState(() => FFAppState().profilePositionName =
                          GetUserProfileAPICall.profliePositionName(
                        (getUserProfileBioAuthen?.jsonBody ?? ''),
                      ).toString());
                  setState(() => FFAppState().QRCodeLink =
                      'https://lead.srisawadpower.com/survey/regis/${FFAppState().employeeID}');
                } else {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('ระบบ'),
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
                  setState(() =>
                      FFAppState().loginStateFirebase = '[loginStateFirebase]');
                  setState(() {
                    FFAppState().deleteAccessToken();
                    FFAppState().accessToken = 'access_token';
                  });
                  setState(() {
                    FFAppState().deleteEmployeeID();
                    FFAppState().employeeID = 'employee_id';
                  });
                  setState(() => FFAppState().QRCodeLink = 'qrcode_link');
                  setState(() {
                    FFAppState().deleteApiURLLocalState();
                    FFAppState().apiURLLocalState = 'api_url_local_state';
                  });
                  setState(() {
                    FFAppState().deleteBranchCode();
                    FFAppState().branchCode = 'branch_code';
                  });
                  setState(() => FFAppState().isFromSetPinPage = false);
                  setState(() => FFAppState().leadChannelColor = []);
                  setState(() => FFAppState().leadChannelList = []);
                  setState(() => FFAppState().isFromLoginPage = false);
                  setState(() {
                    FFAppState().deletePinCodeAuthen();
                    FFAppState().pinCodeAuthen = '013972';
                  });
                  setState(() => FFAppState().isFromAuthenPage = false);
                  setState(() {
                    FFAppState().deleteDateDoNotShowAgain();
                    FFAppState().dateDoNotShowAgain = null;
                  });
                  setState(() {
                    FFAppState().deleteDoNotShowAgain();
                    FFAppState().doNotShowAgain = false;
                  });
                  setState(() => FFAppState().inAppViaNotification = true);
                  setState(() => FFAppState().isInApp = false);
                  setState(() => FFAppState().fcmToken = 'fcm_token');
                  setState(() => FFAppState().isPassLoginSection = false);
                  Navigator.pop(context);
                  await actions.a22();

                  context.goNamed('LoginPage');

                  if (_shouldSetState) setState(() {});
                  return;
                }

                deviceLocationServicePinPage1 = await actions.a1();
                _shouldSetState = true;
                if (!deviceLocationServicePinPage1!) {
                  Navigator.pop(context);
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('ระบบ'),
                        content: Text('กรุณาเปิดGPS เพื่อใช้งานอรุณสวัสดิ์'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                  if (_shouldSetState) setState(() {});
                  return;
                }
                deviceLocationPermissionPinPage1 = await actions.a2();
                _shouldSetState = true;
                if (!deviceLocationPermissionPinPage1!) {
                  Navigator.pop(context);
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('ระบบ'),
                        content:
                            Text('กรุณาอณุญาตให้อรุณสวัสดิ์เข้าถึงGPSของคุณ'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                  if (_shouldSetState) setState(() {});
                  return;
                }
                checkLatLngBeforeEnterApp1 = await actions.a8(
                  currentUserLocationValue,
                );
                _shouldSetState = true;
                if (!checkLatLngBeforeEnterApp1!) {
                  Navigator.pop(context);
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('ระบบ'),
                        content:
                            Text('กรุณาเปิดGPS เพื่อเข้าใช้งานอรุณสวัสดิ์'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                  if (_shouldSetState) setState(() {});
                  return;
                }

                final userLogCreateData = createUserLogRecordData(
                  employeeId: FFAppState().employeeID,
                  action: 'Login_With_Pin',
                  actionTime: getCurrentTimestamp,
                  userLocation: currentUserLocationValue,
                );
                var userLogRecordReference = UserLogRecord.collection.doc();
                await userLogRecordReference.set(userLogCreateData);
                createdUserLogLoginPin1 = UserLogRecord.getDocumentFromData(
                    userLogCreateData, userLogRecordReference);
                _shouldSetState = true;
                setState(() => FFAppState().isFromAuthenPage = true);
                setState(() => FFAppState().dailyText =
                    functions.helloDailyRandomText(
                        pinCodePageSplashPageImgRecord!.text!.toList()));
                Navigator.pop(context);

                context.goNamed('SuperAppPage');

                if (_shouldSetState) setState(() {});
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Color(0xFFFF9E35)],
                    stops: [0, 1],
                    begin: AlignmentDirectional(0, -1),
                    end: AlignmentDirectional(0, 1),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Image.asset(
                        'assets/images/ArunSawadQR.png',
                        width: 140,
                        height: 140,
                        fit: BoxFit.fitHeight,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation']!),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Text(
                            'ยินดีต้อนรับสู่อรุณสวัสดิ์',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 28,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'โปรดใส่พินเพื่อเข้าใช้งาน',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 32, 12, 0),
                            child: PinCodeTextField(
                              appContext: context,
                              length: 6,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              enableActiveFill: true,
                              autoFocus: true,
                              showCursor: false,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              obscureText: true,
                              obscuringCharacter: '●',
                              hintCharacter: '*',
                              pinTheme: PinTheme(
                                fieldHeight: 55,
                                fieldWidth: 50,
                                borderWidth: 2,
                                borderRadius: BorderRadius.circular(12),
                                shape: PinCodeFieldShape.box,
                                activeColor: Colors.white,
                                inactiveColor: Colors.white,
                                selectedColor: Color(0x66FFFFFF),
                                activeFillColor: Colors.white,
                                inactiveFillColor: Colors.white,
                                selectedFillColor: Color(0x66FFFFFF),
                              ),
                              controller: pinCodeController,
                              onChanged: (_) => {},
                              onCompleted: (_) async {
                                currentUserLocationValue =
                                    await getCurrentUserLocation(
                                        defaultLocation: LatLng(0.0, 0.0));
                                var _shouldSetState = false;
                                HapticFeedback.mediumImpact();
                                if (pinCodeController!.text !=
                                    FFAppState().pinCodeAuthen) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('ระบบ'),
                                        content: Text(
                                            'พินไม่ถูกต้อง โปรดลองอีกครั้งหรือใช้การยืนยันตัวตนของมือถือแทน'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        height: double.infinity,
                                        child: LoadingSceneWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));

                                getUserProfilePin =
                                    await GetUserProfileAPICall.call(
                                  token: FFAppState().accessToken,
                                  apiUrl: FFAppState().apiURLLocalState,
                                );
                                _shouldSetState = true;
                                if ((getUserProfilePin?.succeeded ?? true)) {
                                  setState(() => FFAppState().userNickname =
                                          GetUserProfileAPICall.profileNickName(
                                        (getUserProfilePin?.jsonBody ?? ''),
                                      ).toString());
                                  setState(() => FFAppState().profileFullName =
                                          GetUserProfileAPICall.profileFullName(
                                        (getUserProfilePin?.jsonBody ?? ''),
                                      ).toString());
                                  setState(() => FFAppState().profileBirthDate =
                                          GetUserProfileAPICall
                                              .profileBirthDate(
                                        (getUserProfilePin?.jsonBody ?? ''),
                                      ).toString());
                                  setState(() =>
                                      FFAppState().profileUnitCodeName =
                                          GetUserProfileAPICall
                                              .profileBranchName(
                                        (getUserProfilePin?.jsonBody ?? ''),
                                      ).toString());
                                  setState(() =>
                                      FFAppState().profileParentUnit =
                                          GetUserProfileAPICall.profileArea(
                                        (getUserProfilePin?.jsonBody ?? ''),
                                      ).toString());
                                  setState(() => FFAppState().profileRegion =
                                          GetUserProfileAPICall.profileRegion(
                                        (getUserProfilePin?.jsonBody ?? ''),
                                      ).toString());
                                  setState(() => FFAppState().profileHiredDate =
                                          GetUserProfileAPICall
                                              .profileHiredDate(
                                        (getUserProfilePin?.jsonBody ?? ''),
                                      ).toString());
                                  setState(() => FFAppState()
                                          .profileServiceDuration =
                                      functions.profileServiceDuration(
                                          GetUserProfileAPICall
                                              .profileServiceDurationYY(
                                            (getUserProfilePin?.jsonBody ?? ''),
                                          ).toString(),
                                          GetUserProfileAPICall
                                              .profileServiceDurationMM(
                                            (getUserProfilePin?.jsonBody ?? ''),
                                          ).toString(),
                                          GetUserProfileAPICall
                                              .profileServiceDurationDD(
                                            (getUserProfilePin?.jsonBody ?? ''),
                                          ).toString()));
                                  setState(() =>
                                      FFAppState().profilePositionAge =
                                          GetUserProfileAPICall
                                              .profilePositionAge(
                                        (getUserProfilePin?.jsonBody ?? ''),
                                      ).toString());
                                  setState(() =>
                                      FFAppState().profilePositionName =
                                          GetUserProfileAPICall
                                              .profliePositionName(
                                        (getUserProfilePin?.jsonBody ?? ''),
                                      ).toString());
                                  setState(() => FFAppState().QRCodeLink =
                                      'https://lead.srisawadpower.com/survey/regis/${FFAppState().employeeID}');
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('ระบบ'),
                                        content: Text('Session Loginหมดอายุ'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  setState(() =>
                                      FFAppState().loginStateFirebase =
                                          '[loginStateFirebase]');
                                  setState(() {
                                    FFAppState().deleteAccessToken();
                                    FFAppState().accessToken = 'access_token';
                                  });
                                  setState(() {
                                    FFAppState().deleteEmployeeID();
                                    FFAppState().employeeID = 'employee_id';
                                  });
                                  setState(() =>
                                      FFAppState().QRCodeLink = 'qrcode_link');
                                  setState(() {
                                    FFAppState().deleteApiURLLocalState();
                                    FFAppState().apiURLLocalState =
                                        'api_url_local_state';
                                  });
                                  setState(() {
                                    FFAppState().deleteBranchCode();
                                    FFAppState().branchCode = 'branch_code';
                                  });
                                  setState(() =>
                                      FFAppState().isFromSetPinPage = false);
                                  setState(
                                      () => FFAppState().leadChannelColor = []);
                                  setState(
                                      () => FFAppState().leadChannelList = []);
                                  setState(() =>
                                      FFAppState().isFromLoginPage = false);
                                  setState(() {
                                    FFAppState().deletePinCodeAuthen();
                                    FFAppState().pinCodeAuthen = '013972';
                                  });
                                  setState(() =>
                                      FFAppState().isFromAuthenPage = false);
                                  setState(() {
                                    FFAppState().deleteDateDoNotShowAgain();
                                    FFAppState().dateDoNotShowAgain = null;
                                  });
                                  setState(() {
                                    FFAppState().deleteDoNotShowAgain();
                                    FFAppState().doNotShowAgain = false;
                                  });
                                  setState(() =>
                                      FFAppState().inAppViaNotification = true);
                                  setState(() => FFAppState().isInApp = false);
                                  setState(() =>
                                      FFAppState().fcmToken = 'fcm_token');
                                  setState(() =>
                                      FFAppState().isPassLoginSection = false);
                                  Navigator.pop(context);
                                  await actions.a22();

                                  context.goNamed('LoginPage');

                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                deviceLocationServicePinPage =
                                    await actions.a1();
                                _shouldSetState = true;
                                if (!deviceLocationServicePinPage!) {
                                  Navigator.pop(context);
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('ระบบ'),
                                        content: Text(
                                            'กรุณาเปิดGPS เพื่อใช้งานอรุณสวัสดิ์'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                                deviceLocationPermissionPinPage =
                                    await actions.a2();
                                _shouldSetState = true;
                                if (!deviceLocationPermissionPinPage!) {
                                  Navigator.pop(context);
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('ระบบ'),
                                        content: Text(
                                            'กรุณาอณุญาตให้อรุณสวัสดิ์เข้าถึงGPSของคุณ'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                                checkLatLngBeforeEnterApp = await actions.a8(
                                  currentUserLocationValue,
                                );
                                _shouldSetState = true;
                                if (!checkLatLngBeforeEnterApp!) {
                                  Navigator.pop(context);
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('ระบบ'),
                                        content: Text(
                                            'กรุณาเปิดGPS เพื่อเข้าใช้งานอรุณสวัสดิ์'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                final userLogCreateData =
                                    createUserLogRecordData(
                                  employeeId: FFAppState().employeeID,
                                  action: 'Login_With_Pin',
                                  actionTime: getCurrentTimestamp,
                                  userLocation: currentUserLocationValue,
                                );
                                var userLogRecordReference =
                                    UserLogRecord.collection.doc();
                                await userLogRecordReference
                                    .set(userLogCreateData);
                                createdUserLogLoginPin =
                                    UserLogRecord.getDocumentFromData(
                                        userLogCreateData,
                                        userLogRecordReference);
                                _shouldSetState = true;
                                setState(
                                    () => FFAppState().isFromAuthenPage = true);
                                setState(() => FFAppState().dailyText =
                                    functions.helloDailyRandomText(
                                        pinCodePageSplashPageImgRecord!.text!
                                            .toList()));
                                Navigator.pop(context);

                                context.goNamed('SuperAppPage');

                                if (_shouldSetState) setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Text(
                        'หรือใช้การยืนยันตัวตนของมือถือ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF001187),
                              fontSize: 16,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        '(แตะเพื่อใช้การยืนยันตัวตนของมือถือ)',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF001187),
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
