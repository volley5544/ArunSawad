import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/loading_scene_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SuccessPageWidget extends StatefulWidget {
  const SuccessPageWidget({Key? key}) : super(key: key);

  @override
  _SuccessPageWidgetState createState() => _SuccessPageWidgetState();
}

class _SuccessPageWidgetState extends State<SuccessPageWidget> {
  ApiCallResponse? checkLoginBeforeBack;
  ApiCallResponse? checkLoginBeforeToTimesheet;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF39D2C0),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_xlkxtmul.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                      frameRate: FrameRate(60),
                      repeat: false,
                      animate: true,
                    ),
                  ],
                ),
              ),
              Text(
                'สำเร็จ!',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  'บันทึกข้อมูลเสร็จสิ้น',
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
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
                          ).then((value) => setState(() {}));

                          checkLoginBeforeBack =
                              await GetUserProfileAPICall.call(
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
                                  content: Text(
                                      'Session Login หมดอายุ\nกรุณาLoginใหม่'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            setState(
                                () => FFAppState().imei = '123456789012345');
                            setState(() {
                              FFAppState().deleteAccessToken();
                              FFAppState().accessToken = 'access_token';
                            });
                            setState(() {
                              FFAppState().deleteEmployeeID();
                              FFAppState().employeeID = 'employee_id';
                            });
                            setState(
                                () => FFAppState().QRCodeLink = 'qrcode_link');
                            setState(() {
                              FFAppState().deleteApiURLLocalState();
                              FFAppState().apiURLLocalState =
                                  'api_url_local_state';
                            });
                            GoRouter.of(context).prepareAuthEvent();
                            await signOut();

                            context.goNamedAuth('LoginPage', mounted);

                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          context.goNamedAuth('Dashboard', mounted);

                          if (_shouldSetState) setState(() {});
                        },
                        text: 'เมนู',
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF39D2C0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
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
                          ).then((value) => setState(() {}));

                          checkLoginBeforeToTimesheet =
                              await GetUserProfileAPICall.call(
                            token: FFAppState().accessToken,
                            apiUrl: FFAppState().apiURLLocalState,
                          );
                          _shouldSetState = true;
                          if ((checkLoginBeforeToTimesheet?.succeeded ??
                              true)) {
                            setState(
                                () => FFAppState().isFromTimesheetPage = true);
                          } else {
                            Navigator.pop(context);
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('ระบบ'),
                                  content: Text(
                                      'Session Login หมดอายุ\nกรุณาLoginใหม่'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            setState(
                                () => FFAppState().imei = '123456789012345');
                            setState(() {
                              FFAppState().deleteAccessToken();
                              FFAppState().accessToken = 'access_token';
                            });
                            setState(() {
                              FFAppState().deleteEmployeeID();
                              FFAppState().employeeID = 'employee_id';
                            });
                            setState(
                                () => FFAppState().QRCodeLink = 'qrcode_link');
                            setState(() {
                              FFAppState().deleteApiURLLocalState();
                              FFAppState().apiURLLocalState =
                                  'api_url_local_state';
                            });
                            setState(() {
                              FFAppState().deleteBranchCode();
                              FFAppState().branchCode = 'branch_code';
                            });
                            GoRouter.of(context).prepareAuthEvent();
                            await signOut();

                            context.goNamedAuth('LoginPage', mounted);

                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          context.goNamedAuth('TimeSheetPage', mounted);

                          if (_shouldSetState) setState(() {});
                        },
                        text: 'ไทม์ชีท',
                        options: FFButtonOptions(
                          width: 130,
                          height: 50,
                          color: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFF0CE00),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
