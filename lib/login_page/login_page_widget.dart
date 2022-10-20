import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0,
          end: 1,
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
          begin: 0,
          end: 1,
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
          begin: 0,
          end: 1,
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
          begin: 0,
          end: 1,
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
          begin: 0,
          end: 1,
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
          begin: 0,
          end: 1,
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
          begin: 0,
          end: 1,
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
          begin: 0,
          end: 1,
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
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  ApiCallResponse? authenAPIOutputBtn;
  ApiCallResponse? confirmAuthen;
  ApiCallResponse? getUserProfile;
  String? customFirebaseAuthen;
  FCMTokenRecord? androidCreateFMCTokenDoc;
  FCMTokenRecord? iosCreateFMCTokenDoc;
  TextEditingController? passwordInputController;

  late bool passwordInputVisibility;
  TextEditingController? usernameInputController;
  String? androidIMEI1st;
  String? getFCMToken;
  bool? checkDeviceLocPerOnLoad;
  bool? checkDeviceLocSerOnload;
  String? iOSidentifierForVendor1st;
  String? androidIMEI;
  String? iOSidentifierForVendor;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!FFAppState().firstUseApp) {
        context.goNamed('IntrodutionPage');

        return;
      }
      checkDeviceLocSerOnload = await actions.a1();
      checkDeviceLocPerOnLoad = await actions.a2();
      setState(() => FFAppState().counterNum = 0);
      setState(() => FFAppState().imgURL = []);
      setState(() => FFAppState().imgURLTemp = '');
      setState(() => FFAppState().materialRecordId = []);
      setState(() => FFAppState().materialsAmount = []);
      getFCMToken = await actions.a11();
      setState(() => FFAppState().fcmToken = getFCMToken!);
      if (FFAppState().apiURLLocalState == 'api_url_local_state') {
        await actions.lockOrientation();
        setDarkModeSetting(context, ThemeMode.light);
        if (isAndroid) {
          androidIMEI1st = await actions.a3();
          setState(() => FFAppState().imei = valueOrDefault<String>(
                androidIMEI1st,
                'didn\'t get android imei',
              ));
        } else {
          iOSidentifierForVendor1st = await actions.a4();
          setState(() => FFAppState().imei = valueOrDefault<String>(
                iOSidentifierForVendor1st,
                'didn\'t get ios imei',
              ));
        }

        return;
      }
      await actions.lockOrientation();
      setDarkModeSetting(context, ThemeMode.light);
      if (isAndroid) {
        androidIMEI = await actions.a3();
        setState(() => FFAppState().imei = valueOrDefault<String>(
              androidIMEI,
              'android imei didn\'t get',
            ));
      } else {
        iOSidentifierForVendor = await actions.a4();
        setState(() => FFAppState().imei = iOSidentifierForVendor!);
      }
    });

    passwordInputController = TextEditingController();
    passwordInputVisibility = false;
    usernameInputController = TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    passwordInputController?.dispose();
    usernameInputController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<KeyStorage2Record>>(
      future: queryKeyStorage2RecordOnce(
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
        List<KeyStorage2Record> loginPageKeyStorage2RecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final loginPageKeyStorage2Record =
            loginPageKeyStorage2RecordList.isNotEmpty
                ? loginPageKeyStorage2RecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFEEEEEE),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
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
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF1E0098), Color(0xFFFFA071)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                              shape: BoxShape.circle,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!),
                        ),
                        Align(
                          alignment: AlignmentDirectional(2.43, -2.73),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF0006B4), Color(0xFF7479FF)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                              shape: BoxShape.circle,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation2']!),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-2.91, -6.61),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFD63C00), Color(0xFFFFA071)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional(0, 0),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation3']!),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.75, -1.07),
                          child: Image.asset(
                            'assets/images/ArunSawad.png',
                            width: 170,
                            height: 210,
                            fit: BoxFit.contain,
                          ).animateOnPageLoad(
                              animationsMap['imageOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.17,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              TextFormField(
                                controller: usernameInputController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'usernameInputController',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                      ),
                                  hintText: 'Username',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFEEEEEE),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFEEEEEE),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
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
                                  suffixIcon: usernameInputController!
                                          .text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            usernameInputController?.clear();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                              ).animateOnPageLoad(animationsMap[
                                  'textFieldOnPageLoadAnimation1']!),
                              TextFormField(
                                controller: passwordInputController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'passwordInputController',
                                  Duration(milliseconds: 100),
                                  () => setState(() {}),
                                ),
                                obscureText: !passwordInputVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                      ),
                                  hintText: 'Password',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFEEEEEE),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFEEEEEE),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
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
                                      () => passwordInputVisibility =
                                          !passwordInputVisibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      passwordInputVisibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
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
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Container(
                        width: 190,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFD63C00), Color(0xFFFFA071)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(0, -1),
                            end: AlignmentDirectional(0, 1),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: FutureBuilder<List<SplashPageImgRecord>>(
                            future: querySplashPageImgRecordOnce(
                              queryBuilder: (splashPageImgRecord) =>
                                  splashPageImgRecord.where('day',
                                      isEqualTo: functions.checkDateWeekDay(
                                                  getCurrentTimestamp) !=
                                              ''
                                          ? functions.checkDateWeekDay(
                                              getCurrentTimestamp)
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<SplashPageImgRecord>
                                  buttonSplashPageImgRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final buttonSplashPageImgRecord =
                                  buttonSplashPageImgRecordList.isNotEmpty
                                      ? buttonSplashPageImgRecordList.first
                                      : null;
                              return FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  setState(() => FFAppState().apiURLLocalState =
                                          valueOrDefault<String>(
                                        loginPageKeyStorage2Record!.uatApiUrl,
                                        'www.google.co.th',
                                      ));
                                  if (usernameInputController!.text != null &&
                                      usernameInputController!.text != '') {
                                    if (passwordInputController!.text != null &&
                                        passwordInputController!.text != '') {
                                      authenAPIOutputBtn =
                                          await AuthenAPICall.call(
                                        username: usernameInputController!.text,
                                        password: passwordInputController!.text,
                                        apiUrl: FFAppState().apiURLLocalState,
                                        fcmToken: FFAppState().fcmToken,
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 3000),
                                          backgroundColor: Color(0xB3090F13),
                                        ),
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if ((authenAPIOutputBtn?.statusCode ??
                                            200) ==
                                        200) {
                                      if (AuthenAPICall.status(
                                            (authenAPIOutputBtn?.jsonBody ??
                                                ''),
                                          ) ==
                                          1010) {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('ระบบ'),
                                                      content: Text(
                                                          AuthenAPICall.message(
                                                        (authenAPIOutputBtn
                                                                ?.jsonBody ??
                                                            ''),
                                                      ).toString()),
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
                                                          child: Text('ยืนยัน'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          confirmAuthen =
                                              await AuthenAPICall.call(
                                            username:
                                                usernameInputController!.text,
                                            password:
                                                passwordInputController!.text,
                                            apiUrl:
                                                FFAppState().apiURLLocalState,
                                            fcmToken: FFAppState().fcmToken,
                                            uid: FFAppState().imei,
                                            check: 'Y',
                                          );
                                          _shouldSetState = true;
                                          if (!(confirmAuthen?.succeeded ??
                                              true)) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('ระบบ'),
                                                  content: Text(
                                                      AuthenAPICall.message(
                                                    (confirmAuthen?.jsonBody ??
                                                        ''),
                                                  ).toString()),
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
                                        } else {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                      }
                                      setState(() => FFAppState().accessToken =
                                              AuthenAPICall.token(
                                            (authenAPIOutputBtn?.jsonBody ??
                                                ''),
                                          ).toString());
                                      setState(() => FFAppState().employeeID =
                                              valueOrDefault<String>(
                                            AuthenAPICall.employeeID(
                                              (authenAPIOutputBtn?.jsonBody ??
                                                  ''),
                                            ).toString(),
                                            'employee_id',
                                          ));
                                      setState(() => FFAppState().branchCode =
                                              AuthenAPICall.branchCode(
                                            (authenAPIOutputBtn?.jsonBody ??
                                                ''),
                                          ).toString());
                                      setState(() =>
                                          FFAppState().isFromLoginPage = true);
                                    } else {
                                      if ((authenAPIOutputBtn?.statusCode ??
                                              200) ==
                                          401) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              valueOrDefault<String>(
                                                AuthenAPICall.message(
                                                  (authenAPIOutputBtn
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString(),
                                                'fail',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor: Color(0xB3090F13),
                                          ),
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('ระบบ'),
                                              content: Text(
                                                  'พบข้อผิดพลาด (${(authenAPIOutputBtn?.statusCode ?? 200).toString()})'),
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

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    getUserProfile =
                                        await GetUserProfileAPICall.call(
                                      token: FFAppState().accessToken,
                                      apiUrl: FFAppState().apiURLLocalState,
                                    );
                                    _shouldSetState = true;
                                    setState(() => FFAppState().userNickname =
                                            GetUserProfileAPICall
                                                .profileNickName(
                                          (getUserProfile?.jsonBody ?? ''),
                                        ).toString());
                                    setState(() =>
                                        FFAppState().profileFullName =
                                            GetUserProfileAPICall
                                                .profileFullName(
                                          (getUserProfile?.jsonBody ?? ''),
                                        ).toString());
                                    setState(() =>
                                        FFAppState().profileBirthDate =
                                            GetUserProfileAPICall
                                                .profileBirthDate(
                                          (getUserProfile?.jsonBody ?? ''),
                                        ).toString());
                                    setState(() =>
                                        FFAppState().profileUnitCodeName =
                                            GetUserProfileAPICall
                                                .profileBranchName(
                                          (getUserProfile?.jsonBody ?? ''),
                                        ).toString());
                                    setState(() =>
                                        FFAppState().profileParentUnit =
                                            GetUserProfileAPICall.profileArea(
                                          (getUserProfile?.jsonBody ?? ''),
                                        ).toString());
                                    setState(() => FFAppState().profileRegion =
                                            GetUserProfileAPICall.profileRegion(
                                          (getUserProfile?.jsonBody ?? ''),
                                        ).toString());
                                    setState(() =>
                                        FFAppState().profileHiredDate =
                                            GetUserProfileAPICall
                                                .profileHiredDate(
                                          (getUserProfile?.jsonBody ?? ''),
                                        ).toString());
                                    setState(() => FFAppState()
                                            .profileServiceDuration =
                                        functions.profileServiceDuration(
                                            GetUserProfileAPICall
                                                .profileServiceDurationYY(
                                              (getUserProfile?.jsonBody ?? ''),
                                            ).toString(),
                                            GetUserProfileAPICall
                                                .profileServiceDurationMM(
                                              (getUserProfile?.jsonBody ?? ''),
                                            ).toString(),
                                            GetUserProfileAPICall
                                                .profileServiceDurationDD(
                                              (getUserProfile?.jsonBody ?? ''),
                                            ).toString()));
                                    setState(() =>
                                        FFAppState().profilePositionAge =
                                            GetUserProfileAPICall
                                                .profilePositionAge(
                                          (getUserProfile?.jsonBody ?? ''),
                                        ).toString());
                                    setState(() =>
                                        FFAppState().profilePositionName =
                                            GetUserProfileAPICall
                                                .profliePositionName(
                                          (getUserProfile?.jsonBody ?? ''),
                                        ).toString());
                                    setState(() => FFAppState().QRCodeLink =
                                        'https://lead.srisawadpower.com/survey/regis/${FFAppState().employeeID}');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'กรุณาใส่ Username',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor: Color(0xB3090F13),
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  customFirebaseAuthen = await actions.a13(
                                    functions.generateStuffFirebaseEmail(
                                        usernameInputController!.text),
                                  );
                                  _shouldSetState = true;
                                  setState(() =>
                                      FFAppState().loginStateFirebase =
                                          customFirebaseAuthen!);
                                  setState(() => FFAppState().dailyText =
                                      functions.helloDailyRandomText(
                                          buttonSplashPageImgRecord!.text!
                                              .toList()));

                                  context.goNamed('SetPinCodePage');

                                  if (isAndroid) {
                                    final fCMTokenCreateData =
                                        createFCMTokenRecordData(
                                      createdAt: getCurrentTimestamp,
                                      deviceType: 'Android',
                                      fcmToken: FFAppState().fcmToken,
                                      employeeId: usernameInputController!.text,
                                    );
                                    var fCMTokenRecordReference =
                                        FCMTokenRecord.collection.doc();
                                    await fCMTokenRecordReference
                                        .set(fCMTokenCreateData);
                                    androidCreateFMCTokenDoc =
                                        FCMTokenRecord.getDocumentFromData(
                                            fCMTokenCreateData,
                                            fCMTokenRecordReference);
                                    _shouldSetState = true;
                                  } else {
                                    if (isiOS) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('ระบบ'),
                                            content: Text('เห้ย IOSจริง'),
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
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('ระบบ'),
                                            content: Text(
                                                'ไม่ใช่ทั้งIOS และ Android งง'),
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

                                    final fCMTokenCreateData =
                                        createFCMTokenRecordData(
                                      createdAt: getCurrentTimestamp,
                                      deviceType: 'Ios',
                                      fcmToken: FFAppState().fcmToken,
                                      employeeId: usernameInputController!.text,
                                    );
                                    var fCMTokenRecordReference =
                                        FCMTokenRecord.collection.doc();
                                    await fCMTokenRecordReference
                                        .set(fCMTokenCreateData);
                                    iosCreateFMCTokenDoc =
                                        FCMTokenRecord.getDocumentFromData(
                                            fCMTokenCreateData,
                                            fCMTokenRecordReference);
                                    _shouldSetState = true;
                                  }

                                  Navigator.pop(context);
                                  if (_shouldSetState) setState(() {});
                                },
                                text: 'LOGIN',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Color(0x00FFFFFF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              );
                            },
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation5']!),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Text(
                        'Copyright ©2022.  Srisawad Corporation Plc.',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF607D8B),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation']!),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
