import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'login_page_model.dart';
export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    super.key,
    this.apiURL,
    String? token,
  }) : this.token = token ?? '[token]';

  final DocumentReference? apiURL;
  final String token;

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget>
    with TickerProviderStateMixin {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LoginPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(await getPermissionStatus(notificationsPermission))) {
        await requestPermission(notificationsPermission);
      }
      _model.deviceBuildNumber = await actions.getBuildNumber();
      _model.deviceVersion = await actions.getBuildVersion();
      setState(() {
        FFAppState().firstLogin = false;
      });
      setState(() {
        FFAppState().profileRoleName = '';
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
      setState(() {
        FFAppState().insuranceLicenseStatusCode =
            FFAppState().InsuranceLicenseStatusCodeDefault.toList().cast<int>();
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

    _model.usernameInputTextController ??= TextEditingController();
    _model.usernameInputFocusNode ??= FocusNode();

    _model.passwordInputTextController ??= TextEditingController();
    _model.passwordInputFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 400.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 500.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 600.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 700.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 700.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 800.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 800.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
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

    return FutureBuilder<List<KeyStorageRecord>>(
      future: queryKeyStorageRecordOnce(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFEEEEEE),
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
        List<KeyStorageRecord> loginPageKeyStorageRecordList = snapshot.data!;
        final loginPageKeyStorageRecord =
            loginPageKeyStorageRecordList.isNotEmpty
                ? loginPageKeyStorageRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0xFFEEEEEE),
              body: SafeArea(
                top: true,
                child: FutureBuilder<List<UrlLinkStorageRecord>>(
                  future: queryUrlLinkStorageRecordOnce(
                    queryBuilder: (urlLinkStorageRecord) =>
                        urlLinkStorageRecord.where(
                      'url_name',
                      isEqualTo: 'lead_url_link',
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
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.25, -3.05),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.5,
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
                                  width: MediaQuery.sizeOf(context).width * 0.7,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.7,
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
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.8,
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
                                alignment: AlignmentDirectional(-0.74, -1.07),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    HapticFeedback.mediumImpact();
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'คุณต้องการจะล้างข้อมูลแอพหรือไม่?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('ยกเลิก'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
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
                                    await actions.clearAllAppDataCopy();
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'เคลียร์แคชเรียบร้อยกรุณาปิดแอปเปิดใหม่'),
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
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    TextFormField(
                                      controller:
                                          _model.usernameInputTextController,
                                      focusNode: _model.usernameInputFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.usernameInputTextController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      autofocus: false,
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
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Username',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
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
                                                .usernameInputTextController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model
                                                      .usernameInputTextController
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
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model
                                          .usernameInputTextControllerValidator
                                          .asValidator(context),
                                    ).animateOnPageLoad(animationsMap[
                                        'textFieldOnPageLoadAnimation1']!),
                                    TextFormField(
                                      controller:
                                          _model.passwordInputTextController,
                                      focusNode: _model.passwordInputFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.passwordInputTextController',
                                        Duration(milliseconds: 100),
                                        () => setState(() {}),
                                      ),
                                      autofocus: false,
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
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Password',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
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
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model
                                          .passwordInputTextControllerValidator
                                          .asValidator(context),
                                    ).animateOnPageLoad(animationsMap[
                                        'textFieldOnPageLoadAnimation2']!),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.7, 0.0),
                                  child: FutureBuilder<
                                      List<HideInAppContentRecord>>(
                                    future: queryHideInAppContentRecordOnce(
                                      queryBuilder: (hideInAppContentRecord) =>
                                          hideInAppContentRecord.where(
                                        'content_name',
                                        isEqualTo: 'register',
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<HideInAppContentRecord>
                                          containerHideInAppContentRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerHideInAppContentRecord =
                                          containerHideInAppContentRecordList
                                                  .isNotEmpty
                                              ? containerHideInAppContentRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Visibility(
                                          visible:
                                              containerHideInAppContentRecord
                                                      ?.isShowContent ??
                                                  true,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed('register');
                                              },
                                              child: Text(
                                                'sign up account',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation4']!),
                        ),
                        FutureBuilder<List<AuthorizationRecord>>(
                          future: queryAuthorizationRecordOnce(
                            queryBuilder: (authorizationRecord) =>
                                authorizationRecord.where(
                              'content_name',
                              isEqualTo: 'skip_version_id',
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
                            List<AuthorizationRecord>
                                columnAuthorizationRecordList = snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final columnAuthorizationRecord =
                                columnAuthorizationRecordList.isNotEmpty
                                    ? columnAuthorizationRecordList.first
                                    : null;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<InsuranceNotiDataRecord>>(
                                  stream: queryInsuranceNotiDataRecord(
                                    queryBuilder: (insuranceNotiDataRecord) =>
                                        insuranceNotiDataRecord.where(
                                      'emp_id',
                                      isEqualTo: _model
                                                  .usernameInputTextController
                                                  .text !=
                                              ''
                                          ? _model
                                              .usernameInputTextController.text
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<InsuranceNotiDataRecord>
                                        columnInsuranceNotiDataRecordList =
                                        snapshot.data!;
                                    final columnInsuranceNotiDataRecord =
                                        columnInsuranceNotiDataRecordList
                                                .isNotEmpty
                                            ? columnInsuranceNotiDataRecordList
                                                .first
                                            : null;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 40.0, 0.0, 0.0),
                                            child: FutureBuilder<
                                                List<BuildVersionRecord>>(
                                              future:
                                                  queryBuildVersionRecordOnce(
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
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FutureBuilder<
                                                      List<
                                                          InsuranceLicenseDataRecord>>(
                                                    future:
                                                        queryInsuranceLicenseDataRecordOnce(
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
                                                      List<InsuranceLicenseDataRecord>
                                                          columnInsuranceLicenseDataRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final columnInsuranceLicenseDataRecord =
                                                          columnInsuranceLicenseDataRecordList
                                                                  .isNotEmpty
                                                              ? columnInsuranceLicenseDataRecordList
                                                                  .first
                                                              : null;
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      SplashPageImgRecord>>(
                                                                future:
                                                                    querySplashPageImgRecordOnce(
                                                                  queryBuilder:
                                                                      (splashPageImgRecord) =>
                                                                          splashPageImgRecord
                                                                              .where(
                                                                    'day',
                                                                    isEqualTo: functions.checkDateWeekDay(getCurrentTimestamp) !=
                                                                            ''
                                                                        ? functions
                                                                            .checkDateWeekDay(getCurrentTimestamp)
                                                                        : null,
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
                                                                  List<SplashPageImgRecord>
                                                                      buttonSplashPageImgRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final buttonSplashPageImgRecord = buttonSplashPageImgRecordList
                                                                          .isNotEmpty
                                                                      ? buttonSplashPageImgRecordList
                                                                          .first
                                                                      : null;
                                                                  return FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      currentUserLocationValue = await getCurrentUserLocation(
                                                                          defaultLocation: LatLng(
                                                                              0.0,
                                                                              0.0));
                                                                      var _shouldSetState =
                                                                          false;
                                                                      if (FFAppState()
                                                                          .isProduction) {
                                                                        if (!functions.checkIsHaveThisValueInList(
                                                                            columnAuthorizationRecord?.employeeIdList?.toList(),
                                                                            _model.usernameInputTextController.text)!) {
                                                                          if (isiOS) {
                                                                            if (signinButtonBuildVersionRecord!.buildNumberIos >
                                                                                _model.deviceBuildNumber!) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      content: Text('แอพอรุณสวัสดิ์ได้มีการอัพเดทเวอร์ชั่นใหม่ในสโตร์แล้ว กรุณาอัพเดทอรุณสวัสดิ์ก่อนใช้งาน เวอร์ชั่นในTestFlight: ${signinButtonBuildVersionRecord?.appVersionIos}เวอร์ชั่นปัจจุบันของคุณ: ${_model.deviceVersion}'),
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
                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                          } else {
                                                                            if (signinButtonBuildVersionRecord!.buildNumberAndroid >
                                                                                _model.deviceBuildNumber!) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      content: Text('แอพอรุณสวัสดิ์ได้มีการอัพเดทเวอร์ชั่นใหม่ในสโตร์แล้ว กรุณาอัพเดทอรุณสวัสดิ์ก่อนใช้งาน เวอร์ชั่นในสโตร์: ${signinButtonBuildVersionRecord?.appVersion}เวอร์ชั่นปัจจุบันของคุณ: ${_model.deviceVersion}'),
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
                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().apiURLLocalState =
                                                                            loginPageKeyStorageRecord!.apiURL;
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        FFAppState().firstLogin =
                                                                            false;
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        FFAppState()
                                                                            .deleteBrachGroupNew();
                                                                        FFAppState().brachGroupNew =
                                                                            '';

                                                                        FFAppState()
                                                                            .deleteBrachRadNew();
                                                                        FFAppState().BrachRadNew =
                                                                            [];

                                                                        FFAppState()
                                                                            .deleteBrachLngNew();
                                                                        FFAppState().brachLngNew =
                                                                            [];

                                                                        FFAppState()
                                                                            .deleteBrachLatNew();
                                                                        FFAppState().brachLatNew =
                                                                            [];

                                                                        FFAppState()
                                                                            .deleteBrachListNew();
                                                                        FFAppState().brachListNew =
                                                                            [];
                                                                      });
                                                                      if (functions.containWordinStringUrl(
                                                                          '@',
                                                                          _model
                                                                              .usernameInputTextController
                                                                              .text)!) {
                                                                        GoRouter.of(context)
                                                                            .prepareAuthEvent();

                                                                        final user =
                                                                            await authManager.signInWithEmail(
                                                                          context,
                                                                          _model
                                                                              .usernameInputTextController
                                                                              .text,
                                                                          _model
                                                                              .passwordInputTextController
                                                                              .text,
                                                                        );
                                                                        if (user ==
                                                                            null) {
                                                                          return;
                                                                        }

                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().isFromLoginPage =
                                                                              true;
                                                                        });
                                                                        _model.userUIDguest =
                                                                            await actions.a21();
                                                                        _shouldSetState =
                                                                            true;

                                                                        var userCustomRecordReference1 = UserCustomRecord
                                                                            .collection
                                                                            .doc();
                                                                        await userCustomRecordReference1
                                                                            .set(createUserCustomRecordData(
                                                                          createdTime:
                                                                              getCurrentTimestamp,
                                                                          email: _model
                                                                              .usernameInputTextController
                                                                              .text,
                                                                          uid: _model
                                                                              .userUIDguest,
                                                                          employeeId:
                                                                              valueOrDefault(currentUserDocument?.employeeId, 0).toString(),
                                                                          imgProfile:
                                                                              'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                                        ));
                                                                        _model.createdUserCustomguest = UserCustomRecord.getDocumentFromData(
                                                                            createUserCustomRecordData(
                                                                              createdTime: getCurrentTimestamp,
                                                                              email: _model.usernameInputTextController.text,
                                                                              uid: _model.userUIDguest,
                                                                              employeeId: valueOrDefault(currentUserDocument?.employeeId, 0).toString(),
                                                                              imgProfile: 'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                                            ),
                                                                            userCustomRecordReference1);
                                                                        _shouldSetState =
                                                                            true;

                                                                        context.goNamedAuth(
                                                                            'SetPinCodePage',
                                                                            context.mounted);

                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }
                                                                      if (_model.usernameInputTextController.text !=
                                                                              null &&
                                                                          _model.usernameInputTextController.text !=
                                                                              '') {
                                                                        if (_model.passwordInputTextController.text !=
                                                                                null &&
                                                                            _model.passwordInputTextController.text !=
                                                                                '') {
                                                                          _model.authenAPIOutputBtn =
                                                                              await AuthenAPICall.call(
                                                                            username:
                                                                                _model.usernameInputTextController.text,
                                                                            password:
                                                                                _model.passwordInputTextController.text,
                                                                            apiUrl:
                                                                                FFAppState().apiURLLocalState,
                                                                            fcmToken:
                                                                                FFAppState().fcmToken,
                                                                            uid:
                                                                                FFAppState().imei,
                                                                            check:
                                                                                'N',
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                        } else {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'กรุณาใส่ Password',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 3000),
                                                                              backgroundColor: Color(0xB3090F13),
                                                                            ),
                                                                          );
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }

                                                                        if ((_model.authenAPIOutputBtn?.statusCode ??
                                                                                200) ==
                                                                            200) {
                                                                          if (AuthenAPICall.status(
                                                                                (_model.authenAPIOutputBtn?.jsonBody ?? ''),
                                                                              ) ==
                                                                              1010) {
                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        content: Text(AuthenAPICall.message(
                                                                                          (_model.authenAPIOutputBtn?.jsonBody ?? ''),
                                                                                        )!),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                            child: Text('ยกเลิก'),
                                                                                          ),
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                            child: Text('ยืนยัน'),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ) ??
                                                                                false;
                                                                            if (confirmDialogResponse) {
                                                                              _model.confirmAuthen = await AuthenAPICall.call(
                                                                                username: _model.usernameInputTextController.text,
                                                                                password: _model.passwordInputTextController.text,
                                                                                apiUrl: FFAppState().apiURLLocalState,
                                                                                fcmToken: FFAppState().fcmToken,
                                                                                uid: FFAppState().imei,
                                                                                check: 'Y',
                                                                              );
                                                                              _shouldSetState = true;
                                                                              if ((_model.confirmAuthen?.succeeded ?? true)) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().accessToken = AuthenAPICall.token(
                                                                                    (_model.confirmAuthen?.jsonBody ?? ''),
                                                                                  )!;
                                                                                  FFAppState().employeeID = AuthenAPICall.employeeID(
                                                                                    (_model.confirmAuthen?.jsonBody ?? ''),
                                                                                  )!;
                                                                                });
                                                                                FFAppState().update(() {
                                                                                  FFAppState().branchCode = AuthenAPICall.branchCode(
                                                                                    (_model.confirmAuthen?.jsonBody ?? ''),
                                                                                  )!;
                                                                                  FFAppState().employeeID = _model.usernameInputTextController.text;
                                                                                });
                                                                              } else {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return WebViewAware(
                                                                                      child: AlertDialog(
                                                                                        content: Text(AuthenAPICall.message(
                                                                                          (_model.confirmAuthen?.jsonBody ?? ''),
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
                                                                            } else {
                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                          } else {
                                                                            FFAppState().update(() {
                                                                              FFAppState().accessToken = AuthenAPICall.token(
                                                                                (_model.authenAPIOutputBtn?.jsonBody ?? ''),
                                                                              )!;
                                                                              FFAppState().employeeID = valueOrDefault<String>(
                                                                                AuthenAPICall.employeeID(
                                                                                  (_model.authenAPIOutputBtn?.jsonBody ?? ''),
                                                                                ),
                                                                                'employee_id',
                                                                              );
                                                                            });
                                                                            FFAppState().update(() {
                                                                              FFAppState().branchCode = AuthenAPICall.branchCode(
                                                                                (_model.authenAPIOutputBtn?.jsonBody ?? ''),
                                                                              )!;
                                                                              FFAppState().employeeID = _model.usernameInputTextController.text;
                                                                            });
                                                                          }

                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().isFromLoginPage =
                                                                                true;
                                                                          });
                                                                        } else {
                                                                          if ((_model.authenAPIOutputBtn?.statusCode ?? 200) ==
                                                                              401) {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  valueOrDefault<String>(
                                                                                    AuthenAPICall.message(
                                                                                      (_model.authenAPIOutputBtn?.jsonBody ?? ''),
                                                                                    ),
                                                                                    'fail',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: Colors.white,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 4000),
                                                                                backgroundColor: Color(0xB3090F13),
                                                                              ),
                                                                            );
                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                            return;
                                                                          } else {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    content: Text('พบข้อผิดพลาด (${(_model.authenAPIOutputBtn?.statusCode ?? 200).toString()})'),
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

                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }

                                                                        _model.getUserProfile =
                                                                            await GetUserProfileAPICall.call(
                                                                          token:
                                                                              FFAppState().accessToken,
                                                                          apiUrl:
                                                                              FFAppState().apiURLLocalState,
                                                                          projectName:
                                                                              'SSW_ARUNSAWAD_API',
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().userNickname =
                                                                              '${GetUserProfileAPICall.profileNickName(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                          FFAppState().profileFullName =
                                                                              '${GetUserProfileAPICall.profileFullName(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().profileBirthDate =
                                                                              '${GetUserProfileAPICall.profileBirthDate(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                          FFAppState().profileUnitCodeName =
                                                                              '${GetUserProfileAPICall.profileBranchName(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().profileParentUnit =
                                                                              '${GetUserProfileAPICall.profileArea(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                          FFAppState().profileRegion =
                                                                              '${GetUserProfileAPICall.profileRegion(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().profileHiredDate =
                                                                              '${GetUserProfileAPICall.profileHiredDate(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                          FFAppState().profileServiceDuration = '${functions.profileServiceDuration('${GetUserProfileAPICall.profileServiceDurationYY(
                                                                                (_model.getUserProfile?.jsonBody ?? ''),
                                                                              )}', '${GetUserProfileAPICall.profileServiceDurationMM(
                                                                                (_model.getUserProfile?.jsonBody ?? ''),
                                                                              )}', '${GetUserProfileAPICall.profileServiceDurationDD(
                                                                                (_model.getUserProfile?.jsonBody ?? ''),
                                                                              )}')}';
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().profilePositionAge = '${functions.positionAgeText('${GetUserProfileAPICall.profilePositionAgeYY(
                                                                                (_model.getUserProfile?.jsonBody ?? ''),
                                                                              )}', '${GetUserProfileAPICall.profilePositionAgeMM(
                                                                                (_model.getUserProfile?.jsonBody ?? ''),
                                                                              )}', '${GetUserProfileAPICall.profilePositionAgeDD(
                                                                                (_model.getUserProfile?.jsonBody ?? ''),
                                                                              )}')}';
                                                                          FFAppState().profilePositionAgeCheck =
                                                                              '${GetUserProfileAPICall.profilePositionAgeCheck(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().profilePositionName =
                                                                              '${GetUserProfileAPICall.profliePositionName(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                          FFAppState().QRCodeLink =
                                                                              '${containerUrlLinkStorageRecord?.urlLink}${FFAppState().employeeID}';
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().ProfilePhoneNumber =
                                                                              '${GetUserProfileAPICall.profilePhoneNumber(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                          FFAppState().profileFirstBossEmpID =
                                                                              '${GetUserProfileAPICall.profileFirstBossEmpID(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                          FFAppState().profileSecondBossEmpID =
                                                                              '${GetUserProfileAPICall.profileSecondBossEmpID(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                          FFAppState().insurancePlanNumber =
                                                                              '${GetUserProfileAPICall.insurancePlan(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                          FFAppState().profileLevel =
                                                                              '${GetUserProfileAPICall.profileLevel(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                          FFAppState().profileBranch =
                                                                              '${GetUserProfileAPICall.profileBranch(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          FFAppState().profileFirstName =
                                                                              '${functions.getFirstLastNameFromFullName('${FFAppState().profileFullName}', 'first_name')}';
                                                                          FFAppState().profileLastName =
                                                                              '${functions.getFirstLastNameFromFullName('${FFAppState().profileFullName}', 'last_name')}';
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          FFAppState().departmentProfile =
                                                                              '${GetUserProfileAPICall.department(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                          FFAppState().profileRoleName =
                                                                              '${GetUserProfileAPICall.profileRoleName(
                                                                            (_model.getUserProfile?.jsonBody ??
                                                                                ''),
                                                                          )}';
                                                                        });
                                                                        _model.getUserInsuranceLicense =
                                                                            await GetUserInsuranceLicenseCall.call(
                                                                          token:
                                                                              FFAppState().accessToken,
                                                                          apiUrl:
                                                                              FFAppState().apiURLLocalState,
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        if ((_model.getUserInsuranceLicense?.statusCode ??
                                                                                200) ==
                                                                            200) {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().insuranceLicenseStatusCode = functions
                                                                                .convertDynamicListToIntList(getJsonField(
                                                                                  (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                                  r'''$.dataInfo[*].status''',
                                                                                  true,
                                                                                ))!
                                                                                .toList()
                                                                                .cast<int>();
                                                                          });
                                                                          setState(
                                                                              () {
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
                                                                                : FFAppState().profileInsuLicenseIdCard.toList().cast<String>();
                                                                            FFAppState().profileInsuLicenseStartDate = FFAppState().insuranceLicenseStatusCode.contains(FFAppState().statusCodeSuccess)
                                                                                ? functions.createSomethingListWithNullValue(
                                                                                    FFAppState().insuranceLicenseStatusCode.toList(),
                                                                                    GetUserInsuranceLicenseCall.startDate(
                                                                                      (_model.getUserInsuranceLicense?.jsonBody ?? ''),
                                                                                    )?.toList())!
                                                                                : FFAppState().profileInsuLicenseIdCard.toList().cast<String>();
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
                                                                          setState(
                                                                              () {
                                                                            FFAppState().profileInsuExpdateAD =
                                                                                functions.stringlistToDateAD(FFAppState().profileInsuLicenseExpireDate.toList())!.toList().cast<DateTime>();
                                                                          });
                                                                          setState(
                                                                              () {
                                                                            FFAppState().expInsuLessthen30 =
                                                                                functions.compareDate30(FFAppState().profileInsuExpdateAD.toList(), getCurrentTimestamp.toString())!.toList().cast<bool>();
                                                                          });
                                                                        }
                                                                        if (!(columnInsuranceNotiDataRecord !=
                                                                            null)) {
                                                                          var insuranceNotiDataRecordReference = InsuranceNotiDataRecord
                                                                              .collection
                                                                              .doc();
                                                                          await insuranceNotiDataRecordReference
                                                                              .set({
                                                                            ...createInsuranceNotiDataRecordData(
                                                                              empId: FFAppState().employeeID,
                                                                            ),
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'license_type': columnInsuranceLicenseDataRecord?.licenseName,
                                                                                'noti_is_sent': FFAppState().defaultlistFalse,
                                                                                'exp_insu_date': FFAppState().profileInsuExpdateAD,
                                                                              },
                                                                            ),
                                                                          });
                                                                          _model.createInsuNotidadta =
                                                                              InsuranceNotiDataRecord.getDocumentFromData({
                                                                            ...createInsuranceNotiDataRecordData(
                                                                              empId: FFAppState().employeeID,
                                                                            ),
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'license_type': columnInsuranceLicenseDataRecord?.licenseName,
                                                                                'noti_is_sent': FFAppState().defaultlistFalse,
                                                                                'exp_insu_date': FFAppState().profileInsuExpdateAD,
                                                                              },
                                                                            ),
                                                                          }, insuranceNotiDataRecordReference);
                                                                          _shouldSetState =
                                                                              true;
                                                                        }
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'กรุณาใส่ Username',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Colors.white,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 3000),
                                                                            backgroundColor:
                                                                                Color(0xB3090F13),
                                                                          ),
                                                                        );
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }

                                                                      _model.customFirebaseAuthen =
                                                                          await actions
                                                                              .a13(
                                                                        functions.generateStuffFirebaseEmail(_model
                                                                            .usernameInputTextController
                                                                            .text),
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      if (_model
                                                                              .customFirebaseAuthen ==
                                                                          'Create') {
                                                                        _model.userUID =
                                                                            await actions.a21();
                                                                        _shouldSetState =
                                                                            true;

                                                                        var userCustomRecordReference2 = UserCustomRecord
                                                                            .collection
                                                                            .doc();
                                                                        await userCustomRecordReference2
                                                                            .set(createUserCustomRecordData(
                                                                          createdTime:
                                                                              getCurrentTimestamp,
                                                                          email:
                                                                              functions.generateStuffFirebaseEmail(FFAppState().employeeID),
                                                                          uid: _model
                                                                              .userUID,
                                                                          employeeId:
                                                                              FFAppState().employeeID,
                                                                          imgProfile:
                                                                              'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                                        ));
                                                                        _model.createdUserCustom = UserCustomRecord.getDocumentFromData(
                                                                            createUserCustomRecordData(
                                                                              createdTime: getCurrentTimestamp,
                                                                              email: functions.generateStuffFirebaseEmail(FFAppState().employeeID),
                                                                              uid: _model.userUID,
                                                                              employeeId: FFAppState().employeeID,
                                                                              imgProfile: 'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                                            ),
                                                                            userCustomRecordReference2);
                                                                        _shouldSetState =
                                                                            true;

                                                                        var userLogRecordReference1 = UserLogRecord
                                                                            .collection
                                                                            .doc();
                                                                        await userLogRecordReference1
                                                                            .set(createUserLogRecordData(
                                                                          employeeId:
                                                                              FFAppState().employeeID,
                                                                          action:
                                                                              'First_Login',
                                                                          actionTime:
                                                                              getCurrentTimestamp,
                                                                          userLocation:
                                                                              currentUserLocationValue,
                                                                        ));
                                                                        _model.userLogCreated = UserLogRecord.getDocumentFromData(
                                                                            createUserLogRecordData(
                                                                              employeeId: FFAppState().employeeID,
                                                                              action: 'First_Login',
                                                                              actionTime: getCurrentTimestamp,
                                                                              userLocation: currentUserLocationValue,
                                                                            ),
                                                                            userLogRecordReference1);
                                                                        _shouldSetState =
                                                                            true;
                                                                      } else {
                                                                        var userLogRecordReference2 = UserLogRecord
                                                                            .collection
                                                                            .doc();
                                                                        await userLogRecordReference2
                                                                            .set(createUserLogRecordData(
                                                                          employeeId:
                                                                              FFAppState().employeeID,
                                                                          action:
                                                                              'Login',
                                                                          actionTime:
                                                                              getCurrentTimestamp,
                                                                          userLocation:
                                                                              currentUserLocationValue,
                                                                        ));
                                                                        _model.createdUserLogLogin = UserLogRecord.getDocumentFromData(
                                                                            createUserLogRecordData(
                                                                              employeeId: FFAppState().employeeID,
                                                                              action: 'Login',
                                                                              actionTime: getCurrentTimestamp,
                                                                              userLocation: currentUserLocationValue,
                                                                            ),
                                                                            userLogRecordReference2);
                                                                        _shouldSetState =
                                                                            true;
                                                                      }

                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().loginStateFirebase =
                                                                            _model.customFirebaseAuthen!;
                                                                        FFAppState().dailyText = functions.helloDailyRandomText(buttonSplashPageImgRecord
                                                                            ?.text
                                                                            ?.toList());
                                                                      });

                                                                      context.goNamedAuth(
                                                                          'SetPinCodePage',
                                                                          context
                                                                              .mounted);

                                                                      if (isAndroid) {
                                                                        var fCMTokenRecordReference1 = FCMTokenRecord
                                                                            .collection
                                                                            .doc();
                                                                        await fCMTokenRecordReference1
                                                                            .set(createFCMTokenRecordData(
                                                                          createdAt:
                                                                              getCurrentTimestamp,
                                                                          deviceType:
                                                                              'Android',
                                                                          fcmToken:
                                                                              FFAppState().fcmToken,
                                                                          employeeId: _model
                                                                              .usernameInputTextController
                                                                              .text,
                                                                        ));
                                                                        _model.androidCreateFMCTokenDoc = FCMTokenRecord.getDocumentFromData(
                                                                            createFCMTokenRecordData(
                                                                              createdAt: getCurrentTimestamp,
                                                                              deviceType: 'Android',
                                                                              fcmToken: FFAppState().fcmToken,
                                                                              employeeId: _model.usernameInputTextController.text,
                                                                            ),
                                                                            fCMTokenRecordReference1);
                                                                        _shouldSetState =
                                                                            true;
                                                                      } else {
                                                                        if (!isiOS) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  content: Text('แอพพลิเคชั่นนี้ ให้ใช้ได้แค่ใน Android หรือ Ios เท่านั้น'),
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
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }

                                                                        var fCMTokenRecordReference2 = FCMTokenRecord
                                                                            .collection
                                                                            .doc();
                                                                        await fCMTokenRecordReference2
                                                                            .set(createFCMTokenRecordData(
                                                                          createdAt:
                                                                              getCurrentTimestamp,
                                                                          deviceType:
                                                                              'Ios',
                                                                          fcmToken:
                                                                              FFAppState().fcmToken,
                                                                          employeeId: _model
                                                                              .usernameInputTextController
                                                                              .text,
                                                                        ));
                                                                        _model.iosCreateFMCTokenDoc = FCMTokenRecord.getDocumentFromData(
                                                                            createFCMTokenRecordData(
                                                                              createdAt: getCurrentTimestamp,
                                                                              deviceType: 'Ios',
                                                                              fcmToken: FFAppState().fcmToken,
                                                                              employeeId: _model.usernameInputTextController.text,
                                                                            ),
                                                                            fCMTokenRecordReference2);
                                                                        _shouldSetState =
                                                                            true;
                                                                      }

                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                    },
                                                                    text:
                                                                        'LOGIN',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: Color(
                                                                          0x00FFFFFF),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      elevation:
                                                                          2.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation5']!);
                                              },
                                            ),
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
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
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

                                _model.saveCallApi =
                                    await SaveCallCollectionCall.call(
                                  saveCallJson: FFAppState().saveCalled.toMap(),
                                );
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        content: Text(
                                            (_model.saveCallApi?.jsonBody ?? '')
                                                .toString()),
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
                                Navigator.pop(context);

                                setState(() {});
                              },
                              child: Text(
                                'Copyright ©2022.  Srisawad Corporation Plc.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF607D8B),
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
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
