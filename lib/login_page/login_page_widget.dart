import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    Key? key,
    this.apiURL,
  }) : super(key: key);

  final DocumentReference? apiURL;

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget>
    with TickerProviderStateMixin {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

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
        VisibilityEffect(duration: 100.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 400.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 500.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 600.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 700.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 700.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 800.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 800.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LoginPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.deviceBuildVersion = await actions.getBuildVersion();
      setState(() {
        FFAppState().firstLogin = false;
      });
      setState(() {
        FFAppState().deleteBrachGroupNew();
        FFAppState().brachGroupNew = '';

        FFAppState().deleteBrachRadNew();
        FFAppState().BrachRadNew = [];

        FFAppState().deleteBrachLngNew();
        FFAppState().brachLngNew = [];

        FFAppState().deleteBrachLatNew();
        FFAppState().brachLatNew = [];

        FFAppState().deleteBrachListNew();
        FFAppState().brachListNew = [];
      });
      if (!FFAppState().firstUseApp) {
        context.goNamed('IntrodutionPage');

        return;
      }
      FFAppState().update(() {
        FFAppState().counterNum = 0;
        FFAppState().imgURL = [];
      });
      FFAppState().update(() {
        FFAppState().imgURLTemp =
            'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
        FFAppState().materialRecordId = [];
      });
      FFAppState().update(() {
        FFAppState().materialsAmount = [];
      });
      _model.getFCMToken = await actions.a11();
      FFAppState().update(() {
        FFAppState().fcmToken = _model.getFCMToken!;
      });
      if (FFAppState().apiURLLocalState == 'api_url_local_state') {
        await actions.lockOrientation();
        setDarkModeSetting(context, ThemeMode.light);
        if (isAndroid) {
          _model.androidIMEI1st = await actions.a3();
          FFAppState().update(() {
            FFAppState().imei = valueOrDefault<String>(
              _model.androidIMEI1st,
              'didn\'t get android imei',
            );
          });
        } else {
          _model.iOSidentifierForVendor1st = await actions.a4();
          FFAppState().update(() {
            FFAppState().imei = valueOrDefault<String>(
              _model.iOSidentifierForVendor1st,
              'didn\'t get ios imei',
            );
          });
        }

        return;
      }
      await actions.lockOrientation();
      setDarkModeSetting(context, ThemeMode.light);
      if (isAndroid) {
        _model.androidIMEI = await actions.a3();
        FFAppState().update(() {
          FFAppState().imei = valueOrDefault<String>(
            _model.androidIMEI,
            'android imei didn\'t get',
          );
        });
      } else {
        _model.iOSidentifierForVendor = await actions.a4();
        FFAppState().update(() {
          FFAppState().imei = _model.iOSidentifierForVendor!;
        });
      }
    });

    _model.usernameInputController ??= TextEditingController();
    _model.passwordInputController ??= TextEditingController();
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

    return FutureBuilder<List<KeyStorageRecord>>(
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
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        List<KeyStorageRecord> loginPageKeyStorageRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final loginPageKeyStorageRecord =
            loginPageKeyStorageRecordList.isNotEmpty
                ? loginPageKeyStorageRecordList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0xFFEEEEEE),
              body: SafeArea(
                child: FutureBuilder<List<UrlLinkStorageRecord>>(
                  future: queryUrlLinkStorageRecordOnce(
                    queryBuilder: (urlLinkStorageRecord) => urlLinkStorageRecord
                        .where('url_name', isEqualTo: 'lead_url_link'),
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
                    List<UrlLinkStorageRecord>
                        containerUrlLinkStorageRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerUrlLinkStorageRecord =
                        containerUrlLinkStorageRecordList.isNotEmpty
                            ? containerUrlLinkStorageRecordList.first
                            : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.25, -3.05),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF1E0098),
                                        Color(0xFFFFA071)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(0.0, -1.0),
                                      end: AlignmentDirectional(0, 1.0),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation1']!),
                              ),
                              Align(
                                alignment: AlignmentDirectional(2.43, -2.73),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF0006B4),
                                        Color(0xFF7479FF)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(0.0, -1.0),
                                      end: AlignmentDirectional(0, 1.0),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation2']!),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-2.91, -6.61),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFD63C00),
                                        Color(0xFFFFA071)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(0.0, -1.0),
                                      end: AlignmentDirectional(0, 1.0),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation3']!),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.75, -1.07),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.goNamed('E-learning');
                                  },
                                  child: Image.asset(
                                    'assets/images/ArunSawad.png',
                                    width: 170.0,
                                    height: 210.0,
                                    fit: BoxFit.contain,
                                  ),
                                ).animateOnPageLoad(
                                    animationsMap['imageOnPageLoadAnimation']!),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 10.0),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.17,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    TextFormField(
                                      controller:
                                          _model.usernameInputController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.usernameInputController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Username',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayIcon,
                                            ),
                                        hintText: 'Username',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFEEEEEE),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Color(0xFF0006D6),
                                        ),
                                        suffixIcon: _model
                                                .usernameInputController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.usernameInputController
                                                      ?.clear();
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Color(0xFF757575),
                                                  size: 22.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                          ),
                                      validator: _model
                                          .usernameInputControllerValidator
                                          .asValidator(context),
                                    ).animateOnPageLoad(animationsMap[
                                        'textFieldOnPageLoadAnimation1']!),
                                    TextFormField(
                                      controller:
                                          _model.passwordInputController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.passwordInputController',
                                        Duration(milliseconds: 100),
                                        () => setState(() {}),
                                      ),
                                      obscureText:
                                          !_model.passwordInputVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayIcon,
                                            ),
                                        hintText: 'Password',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFEEEEEE),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.vpn_key,
                                          color: Color(0xFF0006D6),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => _model
                                                    .passwordInputVisibility =
                                                !_model.passwordInputVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.passwordInputVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 22.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                          ),
                                      validator: _model
                                          .passwordInputControllerValidator
                                          .asValidator(context),
                                    ).animateOnPageLoad(animationsMap[
                                        'textFieldOnPageLoadAnimation2']!),
                                  ],
                                ),
                              ],
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation4']!),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: FutureBuilder<List<BuildVersionRecord>>(
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                List<BuildVersionRecord>
                                    signinButtonBuildVersionRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final signinButtonBuildVersionRecord =
                                    signinButtonBuildVersionRecordList
                                            .isNotEmpty
                                        ? signinButtonBuildVersionRecordList
                                            .first
                                        : null;
                                return Container(
                                  width: 190.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFD63C00),
                                        Color(0xFFFFA071)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(0.0, -1.0),
                                      end: AlignmentDirectional(0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FutureBuilder<
                                        List<SplashPageImgRecord>>(
                                      future: querySplashPageImgRecordOnce(
                                        queryBuilder: (splashPageImgRecord) =>
                                            splashPageImgRecord.where('day',
                                                isEqualTo: functions
                                                            .checkDateWeekDay(
                                                                getCurrentTimestamp) !=
                                                        ''
                                                    ? functions
                                                        .checkDateWeekDay(
                                                            getCurrentTimestamp)
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          );
                                        }
                                        List<SplashPageImgRecord>
                                            buttonSplashPageImgRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final buttonSplashPageImgRecord =
                                            buttonSplashPageImgRecordList
                                                    .isNotEmpty
                                                ? buttonSplashPageImgRecordList
                                                    .first
                                                : null;
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            currentUserLocationValue =
                                                await getCurrentUserLocation(
                                                    defaultLocation:
                                                        LatLng(0.0, 0.0));
                                            var _shouldSetState = false;
                                            if (FFAppState().isProduction) {
                                              if (!((_model
                                                          .usernameInputController
                                                          .text ==
                                                      '31622') ||
                                                  (_model.usernameInputController
                                                          .text ==
                                                      '33511'))) {
                                                if (isiOS) {
                                                  if (signinButtonBuildVersionRecord!
                                                          .appVersionIos !=
                                                      _model
                                                          .deviceBuildVersion) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              'แอพอรุณสวัสดิ์ได้มีการอัพเดทเวอร์ชั่นใหม่ในสโตร์แล้ว กรุณาอัพเดทอรุณสวัสดิ์ก่อนใช้งาน เวอร์ชั่นในTestFlight: ${signinButtonBuildVersionRecord!.appVersionIos}เวอร์ชั่นปัจจุบันของคุณ: ${_model.deviceBuildVersion}'),
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
                                                    await launchURL(
                                                        'https://testflight.apple.com/join/8sA3XObM');
                                                    await actions
                                                        .terminateAppAction();
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                } else {
                                                  if (signinButtonBuildVersionRecord!
                                                          .appVersion !=
                                                      _model
                                                          .deviceBuildVersion) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              'แอพอรุณสวัสดิ์ได้มีการอัพเดทเวอร์ชั่นใหม่ในสโตร์แล้ว กรุณาอัพเดทอรุณสวัสดิ์ก่อนใช้งาน เวอร์ชั่นในสโตร์: ${signinButtonBuildVersionRecord!.appVersion}เวอร์ชั่นปัจจุบันของคุณ: ${_model.deviceBuildVersion}'),
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
                                              FFAppState().apiURLLocalState =
                                                  loginPageKeyStorageRecord!
                                                      .apiURL!;
                                            });
                                            setState(() {
                                              FFAppState().firstLogin = false;
                                            });
                                            setState(() {
                                              FFAppState()
                                                  .deleteBrachGroupNew();
                                              FFAppState().brachGroupNew = '';

                                              FFAppState().deleteBrachRadNew();
                                              FFAppState().BrachRadNew = [];

                                              FFAppState().deleteBrachLngNew();
                                              FFAppState().brachLngNew = [];

                                              FFAppState().deleteBrachLatNew();
                                              FFAppState().brachLatNew = [];

                                              FFAppState().deleteBrachListNew();
                                              FFAppState().brachListNew = [];
                                            });
                                            if (_model.usernameInputController
                                                        .text !=
                                                    null &&
                                                _model.usernameInputController
                                                        .text !=
                                                    '') {
                                              if (_model.passwordInputController
                                                          .text !=
                                                      null &&
                                                  _model.passwordInputController
                                                          .text !=
                                                      '') {
                                                _model.authenAPIOutputBtn =
                                                    await AuthenAPICall.call(
                                                  username: _model
                                                      .usernameInputController
                                                      .text,
                                                  password: _model
                                                      .passwordInputController
                                                      .text,
                                                  apiUrl: FFAppState()
                                                      .apiURLLocalState,
                                                  fcmToken:
                                                      FFAppState().fcmToken,
                                                  uid: FFAppState().imei,
                                                  check: 'N',
                                                );
                                                _shouldSetState = true;
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'กรุณาใส่ Password',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Colors.white,
                                                          ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 3000),
                                                    backgroundColor:
                                                        Color(0xB3090F13),
                                                  ),
                                                );
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }

                                              if ((_model.authenAPIOutputBtn
                                                          ?.statusCode ??
                                                      200) ==
                                                  200) {
                                                if (AuthenAPICall.status(
                                                      (_model.authenAPIOutputBtn
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) ==
                                                    1010) {
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                content: Text(
                                                                    AuthenAPICall
                                                                        .message(
                                                                  (_model.authenAPIOutputBtn
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ).toString()),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'ยกเลิก'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'ยืนยัน'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    _model.confirmAuthen =
                                                        await AuthenAPICall
                                                            .call(
                                                      username: _model
                                                          .usernameInputController
                                                          .text,
                                                      password: _model
                                                          .passwordInputController
                                                          .text,
                                                      apiUrl: FFAppState()
                                                          .apiURLLocalState,
                                                      fcmToken:
                                                          FFAppState().fcmToken,
                                                      uid: FFAppState().imei,
                                                      check: 'Y',
                                                    );
                                                    _shouldSetState = true;
                                                    if ((_model.confirmAuthen
                                                            ?.succeeded ??
                                                        true)) {
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .accessToken =
                                                            AuthenAPICall.token(
                                                          (_model.confirmAuthen
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString();
                                                        FFAppState()
                                                                .employeeID =
                                                            AuthenAPICall
                                                                .employeeID(
                                                          (_model.confirmAuthen
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString();
                                                      });
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .branchCode =
                                                            AuthenAPICall
                                                                .branchCode(
                                                          (_model.confirmAuthen
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString();
                                                        FFAppState()
                                                                .employeeID =
                                                            _model
                                                                .usernameInputController
                                                                .text;
                                                      });
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                AuthenAPICall
                                                                    .message(
                                                              (_model.confirmAuthen
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ).toString()),
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
                                                  } else {
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                } else {
                                                  FFAppState().update(() {
                                                    FFAppState().accessToken =
                                                        AuthenAPICall.token(
                                                      (_model.authenAPIOutputBtn
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString();
                                                    FFAppState().employeeID =
                                                        valueOrDefault<String>(
                                                      AuthenAPICall.employeeID(
                                                        (_model.authenAPIOutputBtn
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString(),
                                                      'employee_id',
                                                    );
                                                  });
                                                  FFAppState().update(() {
                                                    FFAppState().branchCode =
                                                        AuthenAPICall
                                                            .branchCode(
                                                      (_model.authenAPIOutputBtn
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString();
                                                    FFAppState().employeeID = _model
                                                        .usernameInputController
                                                        .text;
                                                  });
                                                }

                                                FFAppState().update(() {
                                                  FFAppState().isFromLoginPage =
                                                      true;
                                                });
                                              } else {
                                                if ((_model.authenAPIOutputBtn
                                                            ?.statusCode ??
                                                        200) ==
                                                    401) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        valueOrDefault<String>(
                                                          AuthenAPICall.message(
                                                            (_model.authenAPIOutputBtn
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ).toString(),
                                                          'fail',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          Color(0xB3090F13),
                                                    ),
                                                  );
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'พบข้อผิดพลาด (${(_model.authenAPIOutputBtn?.statusCode ?? 200).toString()})'),
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
                                                }

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }

                                              _model.getUserProfile =
                                                  await GetUserProfileAPICall
                                                      .call(
                                                token: FFAppState().accessToken,
                                                apiUrl: FFAppState()
                                                    .apiURLLocalState,
                                              );
                                              _shouldSetState = true;
                                              FFAppState().update(() {
                                                FFAppState().userNickname =
                                                    GetUserProfileAPICall
                                                        .profileNickName(
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                                FFAppState().profileFullName =
                                                    GetUserProfileAPICall
                                                        .profileFullName(
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                              });
                                              FFAppState().update(() {
                                                FFAppState().profileBirthDate =
                                                    GetUserProfileAPICall
                                                        .profileBirthDate(
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                                FFAppState()
                                                        .profileUnitCodeName =
                                                    GetUserProfileAPICall
                                                        .profileBranchName(
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                              });
                                              FFAppState().update(() {
                                                FFAppState().profileParentUnit =
                                                    GetUserProfileAPICall
                                                        .profileArea(
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                                FFAppState().profileRegion =
                                                    GetUserProfileAPICall
                                                        .profileRegion(
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                              });
                                              FFAppState().update(() {
                                                FFAppState().profileHiredDate =
                                                    GetUserProfileAPICall
                                                        .profileHiredDate(
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                                FFAppState().profileServiceDuration = functions
                                                    .profileServiceDuration(
                                                        GetUserProfileAPICall
                                                            .profileServiceDurationYY(
                                                          (_model.getUserProfile
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString(),
                                                        GetUserProfileAPICall
                                                            .profileServiceDurationMM(
                                                          (_model.getUserProfile
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString(),
                                                        GetUserProfileAPICall
                                                            .profileServiceDurationDD(
                                                          (_model.getUserProfile
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString());
                                              });
                                              FFAppState().update(() {
                                                FFAppState()
                                                        .profilePositionAge =
                                                    functions.positionAgeText(
                                                        GetUserProfileAPICall
                                                            .profilePositionAgeYY(
                                                          (_model.getUserProfile
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString(),
                                                        GetUserProfileAPICall
                                                            .profilePositionAgeMM(
                                                          (_model.getUserProfile
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString(),
                                                        GetUserProfileAPICall
                                                            .profilePositionAgeDD(
                                                          (_model.getUserProfile
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ).toString());
                                                FFAppState()
                                                        .profilePositionAgeCheck =
                                                    GetUserProfileAPICall
                                                        .profilePositionAgeCheck(
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                              });
                                              FFAppState().update(() {
                                                FFAppState()
                                                        .profilePositionName =
                                                    GetUserProfileAPICall
                                                        .profliePositionName(
                                                  (_model.getUserProfile
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
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                                FFAppState()
                                                        .profileFirstBossEmpID =
                                                    GetUserProfileAPICall
                                                        .profileFirstBossEmpID(
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                                FFAppState()
                                                        .profileSecondBossEmpID =
                                                    GetUserProfileAPICall
                                                        .profileSecondBossEmpID(
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                                FFAppState()
                                                        .insurancePlanNumber =
                                                    GetUserProfileAPICall
                                                        .insurancePlan(
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                                FFAppState().profileLevel =
                                                    GetUserProfileAPICall
                                                        .profileLevel(
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                                FFAppState().profileBranch =
                                                    GetUserProfileAPICall
                                                        .profileBranch(
                                                  (_model.getUserProfile
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString();
                                              });
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'กรุณาใส่ Username',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                        ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 3000),
                                                  backgroundColor:
                                                      Color(0xB3090F13),
                                                ),
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            _model.customFirebaseAuthen =
                                                await actions.a13(
                                              functions
                                                  .generateStuffFirebaseEmail(
                                                      _model
                                                          .usernameInputController
                                                          .text),
                                            );
                                            _shouldSetState = true;
                                            if (_model.customFirebaseAuthen ==
                                                'Create') {
                                              _model.userUID =
                                                  await actions.a21();
                                              _shouldSetState = true;

                                              final userCustomCreateData =
                                                  createUserCustomRecordData(
                                                createdTime:
                                                    getCurrentTimestamp,
                                                email: functions
                                                    .generateStuffFirebaseEmail(
                                                        FFAppState()
                                                            .employeeID),
                                                uid: _model.userUID,
                                                employeeId:
                                                    FFAppState().employeeID,
                                                imgProfile:
                                                    'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                              );
                                              var userCustomRecordReference =
                                                  UserCustomRecord.collection
                                                      .doc();
                                              await userCustomRecordReference
                                                  .set(userCustomCreateData);
                                              _model.createdUserCustom =
                                                  UserCustomRecord
                                                      .getDocumentFromData(
                                                          userCustomCreateData,
                                                          userCustomRecordReference);
                                              _shouldSetState = true;

                                              final userLogCreateData1 =
                                                  createUserLogRecordData(
                                                employeeId:
                                                    FFAppState().employeeID,
                                                action: 'First_Login',
                                                actionTime: getCurrentTimestamp,
                                                userLocation:
                                                    currentUserLocationValue,
                                              );
                                              var userLogRecordReference1 =
                                                  UserLogRecord.collection
                                                      .doc();
                                              await userLogRecordReference1
                                                  .set(userLogCreateData1);
                                              _model.userLogCreated = UserLogRecord
                                                  .getDocumentFromData(
                                                      userLogCreateData1,
                                                      userLogRecordReference1);
                                              _shouldSetState = true;
                                            } else {
                                              final userLogCreateData2 =
                                                  createUserLogRecordData(
                                                employeeId:
                                                    FFAppState().employeeID,
                                                action: 'Login',
                                                actionTime: getCurrentTimestamp,
                                                userLocation:
                                                    currentUserLocationValue,
                                              );
                                              var userLogRecordReference2 =
                                                  UserLogRecord.collection
                                                      .doc();
                                              await userLogRecordReference2
                                                  .set(userLogCreateData2);
                                              _model.createdUserLogLogin =
                                                  UserLogRecord
                                                      .getDocumentFromData(
                                                          userLogCreateData2,
                                                          userLogRecordReference2);
                                              _shouldSetState = true;
                                            }

                                            FFAppState().update(() {
                                              FFAppState().loginStateFirebase =
                                                  _model.customFirebaseAuthen!;
                                              FFAppState().dailyText = functions
                                                  .helloDailyRandomText(
                                                      buttonSplashPageImgRecord!
                                                          .text!
                                                          .toList());
                                            });

                                            context.goNamed('SetPinCodePage');

                                            if (isAndroid) {
                                              final fCMTokenCreateData1 =
                                                  createFCMTokenRecordData(
                                                createdAt: getCurrentTimestamp,
                                                deviceType: 'Android',
                                                fcmToken: FFAppState().fcmToken,
                                                employeeId: _model
                                                    .usernameInputController
                                                    .text,
                                              );
                                              var fCMTokenRecordReference1 =
                                                  FCMTokenRecord.collection
                                                      .doc();
                                              await fCMTokenRecordReference1
                                                  .set(fCMTokenCreateData1);
                                              _model.androidCreateFMCTokenDoc =
                                                  FCMTokenRecord
                                                      .getDocumentFromData(
                                                          fCMTokenCreateData1,
                                                          fCMTokenRecordReference1);
                                              _shouldSetState = true;
                                            } else {
                                              if (!isiOS) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'แอพพลิเคชั่นนี้ ให้ใช้ได้แค่ใน Android หรือ Ios เท่านั้น'),
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

                                              final fCMTokenCreateData2 =
                                                  createFCMTokenRecordData(
                                                createdAt: getCurrentTimestamp,
                                                deviceType: 'Ios',
                                                fcmToken: FFAppState().fcmToken,
                                                employeeId: _model
                                                    .usernameInputController
                                                    .text,
                                              );
                                              var fCMTokenRecordReference2 =
                                                  FCMTokenRecord.collection
                                                      .doc();
                                              await fCMTokenRecordReference2
                                                  .set(fCMTokenCreateData2);
                                              _model.iosCreateFMCTokenDoc =
                                                  FCMTokenRecord
                                                      .getDocumentFromData(
                                                          fCMTokenCreateData2,
                                                          fCMTokenRecordReference2);
                                              _shouldSetState = true;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          text: 'LOGIN',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: double.infinity,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0x00FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation5']!);
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Text(
                              'Copyright ©2022.  Srisawad Corporation Plc.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF607D8B),
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation']!),
                          ),
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
