import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/loading_scene_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class GenQRPageWidget extends StatefulWidget {
  const GenQRPageWidget({Key? key}) : super(key: key);

  @override
  _GenQRPageWidgetState createState() => _GenQRPageWidgetState();
}

class _GenQRPageWidgetState extends State<GenQRPageWidget>
    with TickerProviderStateMixin {
  ApiCallResponse? checkLoginBeforeBack;
  String? qRCodeLink;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 300,
      delay: 250,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 50),
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
      duration: 300,
      delay: 500,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 50),
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
      duration: 300,
      delay: 750,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 50),
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
      duration: 300,
      delay: 1000,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 50),
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
      qRCodeLink = await actions.getQRCodeLink(
        FFAppState().employeeID,
      );
      setState(() => FFAppState().QRCodeLink = qRCodeLink!);
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
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6500),
        automaticallyImplyLeading: false,
        leading: Align(
          alignment: AlignmentDirectional(0, 0),
          child: InkWell(
            onTap: () async {
              var _shouldSetState = false;
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
              checkLoginBeforeBack = await GetUserProfileAPICall.call(
                token: FFAppState().accessToken,
                apiUrl: FFAppState().apiURLLocalState,
              );
              _shouldSetState = true;
              if (!(checkLoginBeforeBack?.succeeded ?? true)) {
                Navigator.pop(context);
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text('ระบบ'),
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
                setState(() =>
                    FFAppState().apiURLLocalState = 'api_url_local_state');
                GoRouter.of(context).prepareAuthEvent();
                await signOut();

                context.goNamedAuth('LoginPage', mounted);

                if (_shouldSetState) setState(() {});
                return;
              }
              setState(() => FFAppState().QRCodeLink = 'qrcode_link');

              context.goNamedAuth('Dashboard', mounted);

              if (_shouldSetState) setState(() {});
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        title: Text(
          'สร้างQR พนักงาน',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 10,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                    child: Container(
                      width: 250,
                      height: 250,
                      child: custom_widgets.QRCcodeWidget(
                        width: 250,
                        height: 250,
                        qrData: FFAppState().QRCodeLink,
                        gapLess: true,
                        qrVersion: 5,
                        qrPadding: 0.2,
                        qrBackgroundColor: Colors.white,
                        qrForegroundColor: Colors.black,
                      ),
                    ).animated(
                        [animationsMap['containerOnPageLoadAnimation']!]),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'QR พนักงาน',
                      style: FlutterFlowTheme.of(context).subtitle1,
                    ).animated([animationsMap['textOnPageLoadAnimation1']!]),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                    child: Image.asset(
                      'assets/images/1661925867403.jpg',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ).animated([animationsMap['imageOnPageLoadAnimation']!]),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: Text(
                        'Line Official ศรีสวัสดิ์',
                        style: FlutterFlowTheme.of(context).subtitle1,
                      ).animated([animationsMap['textOnPageLoadAnimation2']!]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
