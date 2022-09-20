import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/loading_scene_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  TextEditingController? passwordInputController;

  late bool passwordInputVisibility;

  TextEditingController? usernameInputController;

  ApiCallResponse? authenAPIOutputBtn;
  ApiCallResponse? checkLoginL;
  String? androidIMEI1st;
  String? iOSidentifierForVendor1st;
  String? androidIMEI;
  String? iOSidentifierForVendor;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 100,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 200,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 300,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 300,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 400,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 500,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 700,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 700,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 800,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().counterNum = 0);
      setState(() => FFAppState().imgURL = []);
      setState(() => FFAppState().imgURLTemp = '');
      setState(() => FFAppState().materialRecordId = []);
      setState(() => FFAppState().materialsAmount = []);
      if (FFAppState().apiURLLocalState == 'api_url_local_state') {
        await actions.lockOrientation();
        setDarkModeSetting(context, ThemeMode.light);
        if (isAndroid) {
          androidIMEI1st = await actions.getIMEI();
          setState(() => FFAppState().imei = valueOrDefault<String>(
                androidIMEI1st,
                'didn\'t get android imei',
              ));
        } else {
          iOSidentifierForVendor1st = await actions.getIMEIios();
          setState(() => FFAppState().imei = valueOrDefault<String>(
                iOSidentifierForVendor1st,
                'didn\'t get ios imei',
              ));
        }

        return;
      }
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
      );
      checkLoginL = await GetUserProfileAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
      );
      if ((checkLoginL?.succeeded ?? true)) {
        Navigator.pop(context);

        context.goNamed('Dashboard');

        return;
      }
      await actions.lockOrientation();
      setDarkModeSetting(context, ThemeMode.light);
      if (isAndroid) {
        androidIMEI = await actions.getIMEI();
        setState(() => FFAppState().imei = valueOrDefault<String>(
              androidIMEI,
              'android imei didn\'t get',
            ));
      } else {
        iOSidentifierForVendor = await actions.getIMEIios();
        setState(() => FFAppState().imei = iOSidentifierForVendor!);
      }

      Navigator.pop(context);
    });

    passwordInputController = TextEditingController();
    passwordInputVisibility = false;
    usernameInputController = TextEditingController();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<KeyStorageRecord>>(
      future: queryKeyStorageRecordOnce(
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
        List<KeyStorageRecord> loginPageKeyStorageRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final loginPageKeyStorageRecord =
            loginPageKeyStorageRecordList.isNotEmpty
                ? loginPageKeyStorageRecordList.first
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
                          ).animated([
                            animationsMap['containerOnPageLoadAnimation1']!
                          ]),
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
                          ).animated([
                            animationsMap['containerOnPageLoadAnimation2']!
                          ]),
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
                          ).animated([
                            animationsMap['containerOnPageLoadAnimation3']!
                          ]),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.71, -1.02),
                          child: Image.asset(
                            'assets/images/logo.png',
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.2,
                            fit: BoxFit.contain,
                          ).animated(
                              [animationsMap['imageOnPageLoadAnimation']!]),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.94, -0.09),
                          child: Text(
                            'Branch View',
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  fontSize: 32,
                                ),
                          ).animated(
                              [animationsMap['textOnPageLoadAnimation1']!]),
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
                              ).animated([
                                animationsMap['textFieldOnPageLoadAnimation1']!
                              ]),
                              TextFormField(
                                controller: passwordInputController,
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
                              ).animated([
                                animationsMap['textFieldOnPageLoadAnimation2']!
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ).animated(
                        [animationsMap['containerOnPageLoadAnimation4']!]),
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
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              setState(() => FFAppState().apiURLLocalState =
                                      valueOrDefault<String>(
                                    loginPageKeyStorageRecord!.apiURL,
                                    'www.123.com',
                                  ));
                              if (usernameInputController!.text != null &&
                                  usernameInputController!.text != '') {
                                if (passwordInputController!.text != null &&
                                    passwordInputController!.text != '') {
                                  authenAPIOutputBtn = await AuthenAPICall.call(
                                    username: usernameInputController!.text,
                                    password: passwordInputController!.text,
                                    apiUrl: FFAppState().apiURLLocalState,
                                  );
                                  _shouldSetState = true;
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
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
                                      duration: Duration(milliseconds: 3000),
                                      backgroundColor: Color(0xB3090F13),
                                    ),
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if ((authenAPIOutputBtn?.succeeded ?? true)) {
                                  setState(() => FFAppState().employeeID =
                                          valueOrDefault<String>(
                                        AuthenAPICall.employeeID(
                                          (authenAPIOutputBtn?.jsonBody ?? ''),
                                        ).toString(),
                                        'employee_id',
                                      ));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        valueOrDefault<String>(
                                          AuthenAPICall.message(
                                            (authenAPIOutputBtn?.jsonBody ??
                                                ''),
                                          ).toString(),
                                          'fail',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xB3090F13),
                                    ),
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                setState(() => FFAppState().accessToken =
                                        valueOrDefault<String>(
                                      AuthenAPICall.token(
                                        (authenAPIOutputBtn?.jsonBody ?? ''),
                                      ).toString(),
                                      'access_token',
                                    ));
                                setState(() => FFAppState().branchCode =
                                        AuthenAPICall.branchCode(
                                      (authenAPIOutputBtn?.jsonBody ?? ''),
                                    ).toString());
                                setState(
                                    () => FFAppState().isFromLoginPage = true);
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

                              GoRouter.of(context).prepareAuthEvent();
                              final user = await signInAnonymously(context);
                              if (user == null) {
                                return;
                              }

                              context.goNamedAuth('Dashboard', mounted);

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
                          ),
                        ),
                      ).animated(
                          [animationsMap['containerOnPageLoadAnimation5']!]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        context.goNamed(
                          'ForgotPasswordPage',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 3000),
                            ),
                          },
                        );
                      },
                      child: Text(
                        'ลืมรหัสผ่าน?',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF5156FF),
                            ),
                      ),
                    ).animated([animationsMap['textOnPageLoadAnimation2']!]),
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Text(
                        'Copyright © 2017.  Srisawad Corporation Plc.',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF607D8B),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                      ).animated([animationsMap['textOnPageLoadAnimation3']!]),
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
