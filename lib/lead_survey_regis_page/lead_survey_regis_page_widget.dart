import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/loading_scene_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class LeadSurveyRegisPageWidget extends StatefulWidget {
  const LeadSurveyRegisPageWidget({Key? key}) : super(key: key);

  @override
  _LeadSurveyRegisPageWidgetState createState() =>
      _LeadSurveyRegisPageWidgetState();
}

class _LeadSurveyRegisPageWidgetState extends State<LeadSurveyRegisPageWidget> {
  ApiCallResponse? checkLoginBeforeBack;
  String? webViewLink;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      webViewLink = await actions.getQRCodeLink(
        FFAppState().employeeID,
      );
      setState(() => FFAppState().QRCodeLink = webViewLink!);
    });

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
          'Branch View',
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
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
              child: FlutterFlowWebView(
                url: valueOrDefault<String>(
                  webViewLink,
                  'https://genshin.hoyoverse.com/en/',
                ),
                bypass: false,
                height: MediaQuery.of(context).size.height * 0.9,
                verticalScroll: true,
                horizontalScroll: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
