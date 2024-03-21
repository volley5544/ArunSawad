import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    super.key,
    this.jwtToken,
  });

  final String? jwtToken;

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 150.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 500.ms,
          begin: Offset(0.0, -100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 250.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 500.ms,
          begin: Offset(0.0, -100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 350.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 500.ms,
          begin: Offset(-100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 450.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 450.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 450.ms,
          duration: 500.ms,
          begin: Offset(100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 550.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 550.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 550.ms,
          duration: 500.ms,
          begin: Offset(-100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 650.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 650.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 650.ms,
          duration: 500.ms,
          begin: Offset(100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 750.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 750.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 750.ms,
          duration: 500.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation9': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 850.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 850.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 850.ms,
          duration: 500.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Dashboard'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!((FFAppState().employeeID == '31622') ||
          (FFAppState().employeeID == '33511') ||
          (FFAppState().employeeID == '32758') ||
          (FFAppState().employeeID == '31247') ||
          (FFAppState().employeeID == '30427') ||
          (FFAppState().employeeID == '23328'))) {
        if (isAndroid) {
          await actions.preventScreenRecordAndroid();
        } else {
          await actions.preventScreenRecordIOS();
        }
      }
      if (FFAppState().adminEMP.contains(FFAppState().employeeID)) {
        if (isAndroid) {
          await actions.allowScreenRecordAndroid();
        } else {
          await actions.allowScreenRecordIOS();
        }
      } else {
        if (isAndroid) {
          await actions.preventScreenRecordAndroid();
        } else {
          await actions.preventScreenRecordIOS();
        }
      }

      FFAppState().update(() {
        FFAppState().counterNum = 0;
        FFAppState().isFromTimesheetPage = false;
      });
      FFAppState().update(() {
        FFAppState().imgURL = [];
        FFAppState().imgURLTemp =
            'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
      });
      FFAppState().update(() {
        FFAppState().materialRecordId = [];
        FFAppState().materialsAmount = [];
      });
      FFAppState().update(() {
        FFAppState().isGetVloanContract = false;
        FFAppState().vloanCustomerNameListTemp = [];
      });
      FFAppState().update(() {
        FFAppState().vloanContNoListTemp = [];
        FFAppState().vloanServerListTemp = [];
      });
      FFAppState().update(() {
        FFAppState().materialImgList = [];
        FFAppState().materialNameList = [];
      });
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
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            title: Text(
              'Branch View',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 32.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 10.0,
          ),
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF893A),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x27000000),
                            offset: Offset(0.0, 3.0),
                          )
                        ],
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Menu',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 44.0),
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
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
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingSceneWidget(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                _model.checkLoginCheckInPage =
                                    await ActionUserAPICall.call(
                                  token: FFAppState().accessToken,
                                  apiUrl: FFAppState().apiURLLocalState,
                                );
                                _shouldSetState = true;
                                if ((_model.checkLoginCheckInPage?.statusCode ??
                                        200) !=
                                    200) {
                                  if (!((ActionUserAPICall.message(
                                            (_model.checkLoginCheckInPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'The token has been blacklisted') ||
                                      (ActionUserAPICall.message(
                                            (_model.checkLoginCheckInPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'Token Signature could not be verified.'))) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด (${(_model.checkLoginCheckInPage?.statusCode ?? 200).toString()})'),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  FFAppState().update(() {
                                    FFAppState().loginStateFirebase =
                                        '[loginStateFirebase]';
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
                                    FFAppState().apiURLLocalState =
                                        'api_url_local_state';

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
                                _model.checkInLocationService =
                                    await actions.a1();
                                _shouldSetState = true;
                                if (_model.checkInLocationService!) {
                                  _model.checkInLocationPermission =
                                      await actions.a2();
                                  _shouldSetState = true;
                                  if (!_model.checkInLocationPermission!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  FFAppState().update(() {
                                    FFAppState().isFromTimesheetPage = false;
                                  });
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'ต้องทำการเปิดGPS เพื่อทำรายการต่อ'),
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
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                context.goNamed('CheckInPage');

                                if (_shouldSetState) setState(() {});
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.45,
                                height: 190.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          'assets/images/google-maps-new-interface1.jpg',
                                          width: double.infinity,
                                          height: 115.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            'เช็คอิน',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation2']!),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
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
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingSceneWidget(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                _model.checkLoginSurveyPage =
                                    await ActionUserAPICall.call(
                                  token: FFAppState().accessToken,
                                  apiUrl: FFAppState().apiURLLocalState,
                                );
                                _shouldSetState = true;
                                if ((_model.checkLoginSurveyPage?.statusCode ??
                                        200) !=
                                    200) {
                                  if (!((ActionUserAPICall.message(
                                            (_model.checkLoginSurveyPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'The token has been blacklisted') ||
                                      (ActionUserAPICall.message(
                                            (_model.checkLoginSurveyPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'Token Signature could not be verified.'))) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด (${(_model.checkLoginSurveyPage?.statusCode ?? 200).toString()})'),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  FFAppState().update(() {
                                    FFAppState().loginStateFirebase =
                                        '[loginStateFirebase]';
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
                                    FFAppState().apiURLLocalState =
                                        'api_url_local_state';

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
                                _model.surveyLocationService =
                                    await actions.a1();
                                _shouldSetState = true;
                                if (_model.surveyLocationService!) {
                                  _model.surveyLocationPermission =
                                      await actions.a2();
                                  _shouldSetState = true;
                                  if (!_model.surveyLocationPermission!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  FFAppState().update(() {
                                    FFAppState().isFromTimesheetPage = false;
                                  });
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'ต้องทำการเปิดGPS เพื่อทำรายการต่อ'),
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
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                context.goNamed('SurveyPage');

                                if (_shouldSetState) setState(() {});
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.45,
                                height: 190.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x230E151B),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          'assets/images/istock_blossomstar_survey.jpg',
                                          width: double.infinity,
                                          height: 115.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            'ตรวจสอบลูกค้า',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation3']!),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
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
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingSceneWidget(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                _model.checkLoginCollectionPage =
                                    await ActionUserAPICall.call(
                                  token: FFAppState().accessToken,
                                  apiUrl: FFAppState().apiURLLocalState,
                                );
                                _shouldSetState = true;
                                if ((_model.checkLoginCollectionPage
                                            ?.statusCode ??
                                        200) !=
                                    200) {
                                  if (!((ActionUserAPICall.message(
                                            (_model.checkLoginCollectionPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'The token has been blacklisted') ||
                                      (ActionUserAPICall.message(
                                            (_model.checkLoginCollectionPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'Token Signature could not be verified.'))) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด (${(_model.checkLoginCollectionPage?.statusCode ?? 200).toString()})'),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  FFAppState().update(() {
                                    FFAppState().loginStateFirebase =
                                        '[loginStateFirebase]';
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
                                    FFAppState().apiURLLocalState =
                                        'api_url_local_state';

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
                                Navigator.pop(context);
                                _model.collectionLocationService =
                                    await actions.a1();
                                _shouldSetState = true;
                                if (_model.collectionLocationService!) {
                                  _model.collectionLocationPermission =
                                      await actions.a2();
                                  _shouldSetState = true;
                                  if (!_model.collectionLocationPermission!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  _model.getCollectionApiUrl =
                                      await queryUrlLinkStorageRecordOnce(
                                    queryBuilder: (urlLinkStorageRecord) =>
                                        urlLinkStorageRecord.where(
                                      'url_name',
                                      isEqualTo: 'branch_view_collection',
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  _shouldSetState = true;
                                  FFAppState().update(() {
                                    FFAppState().isFromTimesheetPage = false;
                                  });
                                  setState(() {
                                    FFAppState().collectionSortBy = '';
                                    FFAppState().collectionSearch = '';
                                    FFAppState().collectionSearchBy = '';
                                    FFAppState().selectCardList = [];
                                    FFAppState().collectionListBoolean = [];
                                    FFAppState().saveCalled = SaveCallStruct
                                        .fromSerializableMap(jsonDecode(
                                            '{\"CONTNO_ID\":\"[]\",\"CONTNO\":\"[]\",\"HISTORY_LEAD_STATUS\":\"[]\",\"HISTORY_REASON_NAME\":\"[]\",\"CREATED_USERID\":\"[]\",\"UPDATED_USERID\":\"[]\",\"ARAPPDATE\":\"[]\",\"ARDESC\":\"[]\",\"USERID\":\"[]\",\"REMGCODE\":\"[]\",\"REMDETCODE\":\"[]\",\"AMOUNT\":\"[]\"}'));
                                  });
                                  setState(() {
                                    FFAppState().apiUrlBranchViewCollection =
                                        _model.getCollectionApiUrl!.urlLink;
                                  });
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'ต้องทำการเปิดGPS เพื่อทำรายการต่อ'),
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
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                context.pushNamed('tabCollection');

                                if (_shouldSetState) setState(() {});
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.45,
                                height: 190.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x230E151B),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          'assets/images/handing-over-money-image-dp-300x250.jpg',
                                          width: double.infinity,
                                          height: 115.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            'ติดตามหนี้',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation4']!),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
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
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingSceneWidget(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                _model.checkLoginMarketingPage =
                                    await ActionUserAPICall.call(
                                  token: FFAppState().accessToken,
                                  apiUrl: FFAppState().apiURLLocalState,
                                );
                                _shouldSetState = true;
                                if ((_model.checkLoginMarketingPage
                                            ?.statusCode ??
                                        200) !=
                                    200) {
                                  if (!((ActionUserAPICall.message(
                                            (_model.checkLoginMarketingPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'The token has been blacklisted') ||
                                      (ActionUserAPICall.message(
                                            (_model.checkLoginMarketingPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'Token Signature could not be verified.'))) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด (${(_model.checkLoginMarketingPage?.statusCode ?? 200).toString()})'),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  FFAppState().update(() {
                                    FFAppState().loginStateFirebase =
                                        '[loginStateFirebase]';
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
                                    FFAppState().apiURLLocalState =
                                        'api_url_local_state';

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
                                _model.marketingLocationService =
                                    await actions.a1();
                                _shouldSetState = true;
                                if (_model.marketingLocationService!) {
                                  _model.marketingLocationPermission =
                                      await actions.a2();
                                  _shouldSetState = true;
                                  if (!_model.marketingLocationPermission!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  FFAppState().update(() {
                                    FFAppState().isFromTimesheetPage = false;
                                  });
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'ต้องทำการเปิดGPS เพื่อทำรายการต่อ'),
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
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                context.goNamed('MarketingPage');

                                if (_shouldSetState) setState(() {});
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.45,
                                height: 190.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x230E151B),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          'assets/images/noisy_big_megaphone_74855_7630_fed38ffd42.jpg',
                                          width: double.infinity,
                                          height: 115.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            'ทำการตลาด',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation5']!),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
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
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingSceneWidget(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                _model.checkLoginNPAPage =
                                    await ActionUserAPICall.call(
                                  token: FFAppState().accessToken,
                                  apiUrl: FFAppState().apiURLLocalState,
                                );
                                _shouldSetState = true;
                                if ((_model.checkLoginNPAPage?.statusCode ??
                                        200) !=
                                    200) {
                                  if (!((ActionUserAPICall.message(
                                            (_model.checkLoginNPAPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'The token has been blacklisted') ||
                                      (ActionUserAPICall.message(
                                            (_model.checkLoginNPAPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'Token Signature could not be verified.'))) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด (${(_model.checkLoginNPAPage?.statusCode ?? 200).toString()})'),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  FFAppState().update(() {
                                    FFAppState().loginStateFirebase =
                                        '[loginStateFirebase]';
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
                                    FFAppState().apiURLLocalState =
                                        'api_url_local_state';

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
                                _model.nPALocationService = await actions.a1();
                                _shouldSetState = true;
                                if (_model.nPALocationService!) {
                                  _model.nPALocationPermission =
                                      await actions.a2();
                                  _shouldSetState = true;
                                  if (!_model.nPALocationPermission!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  FFAppState().update(() {
                                    FFAppState().isFromTimesheetPage = false;
                                  });
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'ต้องทำการเปิดGPS เพื่อทำรายการต่อ'),
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
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                context.goNamed('NPApage');

                                if (_shouldSetState) setState(() {});
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.45,
                                height: 190.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x230E151B),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          'assets/images/74a40a4b-2704-4e25-9c48-05e2be5741b5.jpg',
                                          width: double.infinity,
                                          height: 115.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            'สำรวจ NPA',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation6']!),
                            if (FFAppState().opsMenuVisible)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var _shouldSetState = false;
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x00000000),
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
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

                                  _model.checkLoginOPSPage =
                                      await GetUserProfileAPICall.call(
                                    token: FFAppState().accessToken,
                                    apiUrl: FFAppState().apiURLLocalState,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.checkLoginOPSPage?.succeeded ??
                                      true)) {
                                    Navigator.pop(context);
                                  } else {
                                    Navigator.pop(context);
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('ผิดพลาด'),
                                            content: Text(
                                                'Session Login หมดอายุ\nกรุณาLoginใหม่'),
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
                                    FFAppState().update(() {
                                      FFAppState().imei = '123456789012345';
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
                                      FFAppState().apiURLLocalState =
                                          'api_url_local_state';

                                      FFAppState().deleteBranchCode();
                                      FFAppState().branchCode = 'branch_code';
                                    });
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    context.goNamedAuth(
                                        'LoginPage', context.mounted);

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  _model.oPSLocationService =
                                      await actions.a1();
                                  _shouldSetState = true;
                                  if (_model.oPSLocationService!) {
                                    _model.oPSLocationPermission =
                                        await actions.a2();
                                    _shouldSetState = true;
                                    if (!_model.oPSLocationPermission!) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text('ผิดพลาด'),
                                              content: Text(
                                                  'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                    FFAppState().update(() {
                                      FFAppState().isFromTimesheetPage = false;
                                    });
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('ผิดพลาด'),
                                            content: Text(
                                                'ต้องทำการเปิดGPS เพื่อทำรายการต่อ'),
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
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  context.goNamedAuth(
                                      'OPSpage', context.mounted);

                                  if (_shouldSetState) setState(() {});
                                },
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.45,
                                  height: 190.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x230E151B),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 115.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFD2D2D2),
                                          ),
                                          child: Image.asset(
                                            'assets/images/kindpng_5675046.png',
                                            width: double.infinity,
                                            height: 115.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 12.0, 0.0, 0.0),
                                            child: Text(
                                              'ทรัพย์สิน OPS',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation7']!),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
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
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingSceneWidget(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                _model.checkLoginCheckerPage =
                                    await ActionUserAPICall.call(
                                  token: FFAppState().accessToken,
                                  apiUrl: FFAppState().apiURLLocalState,
                                );
                                _shouldSetState = true;
                                if ((_model.checkLoginCheckerPage?.statusCode ??
                                        200) !=
                                    200) {
                                  if (!((ActionUserAPICall.message(
                                            (_model.checkLoginCheckerPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'The token has been blacklisted') ||
                                      (ActionUserAPICall.message(
                                            (_model.checkLoginCheckerPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'Token Signature could not be verified.'))) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด (${(_model.checkLoginCheckerPage?.statusCode ?? 200).toString()})'),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  FFAppState().update(() {
                                    FFAppState().loginStateFirebase =
                                        '[loginStateFirebase]';
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
                                    FFAppState().apiURLLocalState =
                                        'api_url_local_state';

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
                                _model.checkerLocationService =
                                    await actions.a1();
                                _shouldSetState = true;
                                if (_model.checkerLocationService!) {
                                  _model.checkerLocationPermission =
                                      await actions.a2();
                                  _shouldSetState = true;
                                  if (!_model.checkerLocationPermission!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  FFAppState().update(() {
                                    FFAppState().isFromTimesheetPage = false;
                                  });
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'ต้องทำการเปิดGPS เพื่อทำรายการต่อ'),
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
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                context.goNamed('CheckerPage');

                                if (_shouldSetState) setState(() {});
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.45,
                                height: 190.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x230E151B),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          'assets/images/webpc-passthru.webp',
                                          width: double.infinity,
                                          height: 115.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            'ฝ่ายตรวจสอบ',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation8']!),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
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
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingSceneWidget(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                _model.checkLoginTimesheetPage =
                                    await ActionUserAPICall.call(
                                  token: FFAppState().accessToken,
                                  apiUrl: FFAppState().apiURLLocalState,
                                );
                                _shouldSetState = true;
                                if ((_model.checkLoginTimesheetPage
                                            ?.statusCode ??
                                        200) !=
                                    200) {
                                  if (!((ActionUserAPICall.message(
                                            (_model.checkLoginTimesheetPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'The token has been blacklisted') ||
                                      (ActionUserAPICall.message(
                                            (_model.checkLoginTimesheetPage
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          'Token Signature could not be verified.'))) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด (${(_model.checkLoginTimesheetPage?.statusCode ?? 200).toString()})'),
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
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  FFAppState().update(() {
                                    FFAppState().loginStateFirebase =
                                        '[loginStateFirebase]';
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
                                    FFAppState().apiURLLocalState =
                                        'api_url_local_state';

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
                                FFAppState().update(() {
                                  FFAppState().isFromTimesheetPage = true;
                                });

                                context.goNamed('TimeSheetPage');

                                if (_shouldSetState) setState(() {});
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.45,
                                height: 190.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x230E151B),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.asset(
                                          'assets/images/Time-tracking-system.jpg',
                                          width: double.infinity,
                                          height: 115.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            'ไทม์ชีท',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation9']!),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
