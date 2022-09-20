import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/loading_scene_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';

class BioAuthenPageWidget extends StatefulWidget {
  const BioAuthenPageWidget({Key? key}) : super(key: key);

  @override
  _BioAuthenPageWidgetState createState() => _BioAuthenPageWidgetState();
}

class _BioAuthenPageWidgetState extends State<BioAuthenPageWidget>
    with TickerProviderStateMixin {
  ApiCallResponse? checkLogin;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ApiCallResponse? logoutAPI;
  bool authenOnTap = false;
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      delay: 1000,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(),
      finalState: AnimationState(),
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 100,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(),
      finalState: AnimationState(),
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(),
      finalState: AnimationState(),
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(),
      finalState: AnimationState(),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(),
      finalState: AnimationState(),
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(),
      finalState: AnimationState(),
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 2000,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(),
      finalState: AnimationState(),
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 2300,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(),
      finalState: AnimationState(),
    ),
  };

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isFromLoginPage) {
        return;
      }
      await actions.lockOrientation();
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
      checkLogin = await GetUserProfileAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
      );
      if (!(checkLogin?.succeeded ?? true)) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('ผิดพลาด'),
              content: Text('Session Login หมดอายุ\nกรุณาLoginใหม่'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        setState(() => FFAppState().imei = '123456789012345');
        setState(() => FFAppState().accessToken = 'access_token');
        setState(() => FFAppState().employeeID = 'employee_id');
        setState(() => FFAppState().QRCodeLink = 'qrcode_link');
        setState(() => FFAppState().apiURLLocalState = 'api_url_local_state');
        setState(() => FFAppState().branchCode = 'branch_code');
        GoRouter.of(context).prepareAuthEvent();
        await signOut();

        context.goNamedAuth('LoginPage', mounted);

        return;
      }
      Navigator.pop(context);
    });

    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1E2429),
      body: InkWell(
        onTap: () async {
          var _shouldSetState = false;
          final local_auth = LocalAuthentication();
          bool _isBiometricSupported = await local_auth.isDeviceSupported();

          if (_isBiometricSupported) {
            authenOnTap = await local_auth.authenticate(
                localizedReason: 'โปรดยืนยันตัวตนเพื่อเข้าใช้งาน');
            setState(() {});
          }

          _shouldSetState = true;
          if (!authenOnTap!) {
            if (_shouldSetState) setState(() {});
            return;
          }

          context.goNamed('Dashboard');

          if (_shouldSetState) setState(() {});
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4B39EF), Color(0xFFEE8B60)],
              stops: [0, 1],
              begin: AlignmentDirectional(1, -1),
              end: AlignmentDirectional(-1, 1),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/xxxhdpi.png',
                width: 140,
                height: 140,
                fit: BoxFit.fitHeight,
              ).animated([animationsMap['imageOnPageLoadAnimation']!]),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Text(
                  'ยินดีต้อนรับกลับสู่ ก้าว!',
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                ).animated([animationsMap['textOnPageLoadAnimation1']!]),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  'โปรดยืนยันตัวตนเพื่อเข้าใช้งาน',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                ).animated([animationsMap['textOnPageLoadAnimation2']!]),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 150),
                child: Text(
                  '(แตะเพื่อยืนยันตัวตน)',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                ).animated([animationsMap['textOnPageLoadAnimation3']!]),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                child: Text(
                  'หรือ',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                ).animated([animationsMap['textOnPageLoadAnimation4']!]),
              ),
              FFButtonWidget(
                onPressed: () async {
                  var _shouldSetState = false;
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('ระบบ'),
                            content: Text('คุณต้องการออกจากระบบหรือไม่?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('ยกเลิก'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('ตกลง'),
                              ),
                            ],
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
                  logoutAPI = await LogoutAPICall.call(
                    token: FFAppState().accessToken,
                    apiUrl: FFAppState().apiURLLocalState,
                  );
                  _shouldSetState = true;
                  setState(() => FFAppState().imei = '123456789012345');
                  setState(() => FFAppState().accessToken = 'access_token');
                  setState(() => FFAppState().employeeID = 'employee_id');
                  setState(() =>
                      FFAppState().apiURLLocalState = 'api_url_local_state');
                  setState(() => FFAppState().branchCode = 'branch_code');
                  Navigator.pop(context);
                  GoRouter.of(context).prepareAuthEvent();
                  await signOut();

                  context.goNamedAuth('LoginPage', mounted);

                  if (_shouldSetState) setState(() {});
                },
                text: 'ออกจากระบบ',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: Color(0xFFFF0000),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ).animated([animationsMap['buttonOnPageLoadAnimation']!]),
            ],
          ).animated([animationsMap['columnOnPageLoadAnimation']!]),
        ),
      ).animated([animationsMap['containerOnPageLoadAnimation']!]),
    );
  }
}
