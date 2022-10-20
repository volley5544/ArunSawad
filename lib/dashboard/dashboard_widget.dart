import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/loading_scene_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({
    Key? key,
    this.jwtToken,
  }) : super(key: key);

  final String? jwtToken;

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
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
        VisibilityEffect(duration: 150.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 500.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 500.ms,
          begin: Offset(0, -100),
          end: Offset(0, 0),
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
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 250.ms,
          duration: 500.ms,
          begin: Offset(0, -100),
          end: Offset(0, 0),
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
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 500.ms,
          begin: Offset(-100, 0),
          end: Offset(0, 0),
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
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 450.ms,
          duration: 500.ms,
          begin: Offset(100, 0),
          end: Offset(0, 0),
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
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 550.ms,
          duration: 500.ms,
          begin: Offset(-100, 0),
          end: Offset(0, 0),
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
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 650.ms,
          duration: 500.ms,
          begin: Offset(100, 0),
          end: Offset(0, 0),
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
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 750.ms,
          duration: 500.ms,
          begin: Offset(0, 100),
          end: Offset(0, 0),
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
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 850.ms,
          duration: 500.ms,
          begin: Offset(0, 100),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  ApiCallResponse? checkLoginCheckInPage;
  bool? checkInLocationService;
  bool? checkInLocationPermission;
  ApiCallResponse? checkLoginSurveyPage;
  bool? surveyLocationService;
  bool? surveyLocationPermission;
  ApiCallResponse? checkLoginCollectionPage;
  bool? collectionLocationService;
  bool? collectionLocationPermission;
  ApiCallResponse? checkLoginMarketingPage;
  bool? marketingLocationService;
  bool? marketingLocationPermission;
  ApiCallResponse? checkLoginNPAPage;
  bool? nPALocationService;
  bool? nPALocationPermission;
  ApiCallResponse? checkLoginOPSPage;
  bool? oPSLocationService;
  bool? oPSLocationPermission;
  ApiCallResponse? checkLoginCheckerPage;
  bool? checkerLocationService;
  bool? checkerLocationPermission;
  ApiCallResponse? checkLoginTimesheetPage;
  String? androidIMEI;
  String? iOSidentifierForVendor;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      setState(() => FFAppState().isGetVloanContract = false);
      setState(() => FFAppState().vloanCustomerNameListTemp = []);
      setState(() => FFAppState().vloanContNoListTemp = []);
      setState(() => FFAppState().vloanServerListTemp = []);
      setState(() => FFAppState().materialImgList = []);
      setState(() => FFAppState().materialNameList = []);
      if (FFAppState().accessToken == 'access_token') {
        GoRouter.of(context).prepareAuthEvent();
        await signOut();

        context.goNamedAuth('LoginPage', mounted);

        return;
      }
      await actions.lockOrientation();
      setDarkModeSetting(context, ThemeMode.light);
      if (isAndroid) {
        androidIMEI = await actions.a3();
        setState(() => FFAppState().imei = androidIMEI!);
      } else {
        iOSidentifierForVendor = await actions.a4();
        setState(() => FFAppState().imei = iOSidentifierForVendor!);
      }
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6500),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            context.goNamed('SuperAppPage');
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          'Branch View',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 32,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 10,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF893A),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x27000000),
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'Menu',
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation1']!),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 44),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          InkWell(
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
                              ).then((value) => setState(() {}));

                              checkLoginCheckInPage =
                                  await GetUserProfileAPICall.call(
                                token: FFAppState().accessToken,
                                apiUrl: FFAppState().apiURLLocalState,
                              );
                              _shouldSetState = true;
                              if ((checkLoginCheckInPage?.succeeded ?? true)) {
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ผิดพลาด'),
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
                                setState(() =>
                                    FFAppState().imei = '123456789012345');
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
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              checkInLocationService = await actions.a1();
                              _shouldSetState = true;
                              if (checkInLocationService!) {
                                checkInLocationPermission = await actions.a2();
                                _shouldSetState = true;
                                if (!checkInLocationPermission!) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('ผิดพลาด'),
                                        content: Text(
                                            'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                setState(() =>
                                    FFAppState().isFromTimesheetPage = false);
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ผิดพลาด'),
                                      content: Text(
                                          'ต้องทำการเปิดGPS เพื่อทำรายการต่อ'),
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
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              context.goNamedAuth('CheckInPage', mounted);

                              if (_shouldSetState) setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 190,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/google-maps-new-interface1.jpg',
                                        width: double.infinity,
                                        height: 115,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 12, 0, 0),
                                        child: Text(
                                          'เช็คอิน',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation2']!),
                          InkWell(
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
                              ).then((value) => setState(() {}));

                              checkLoginSurveyPage =
                                  await GetUserProfileAPICall.call(
                                token: FFAppState().accessToken,
                                apiUrl: FFAppState().apiURLLocalState,
                              );
                              _shouldSetState = true;
                              if ((checkLoginSurveyPage?.succeeded ?? true)) {
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ผิดพลาด'),
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
                                setState(() =>
                                    FFAppState().imei = '123456789012345');
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
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              surveyLocationService = await actions.a1();
                              _shouldSetState = true;
                              if (surveyLocationService!) {
                                surveyLocationPermission = await actions.a2();
                                _shouldSetState = true;
                                if (!surveyLocationPermission!) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('ผิดพลาด'),
                                        content: Text(
                                            'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                setState(() =>
                                    FFAppState().isFromTimesheetPage = false);
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ผิดพลาด'),
                                      content: Text(
                                          'ต้องทำการเปิดGPS เพื่อทำรายการต่อ'),
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
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              context.goNamedAuth('SurveyPage', mounted);

                              if (_shouldSetState) setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 190,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x230E151B),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/istock_blossomstar_survey.jpg',
                                        width: double.infinity,
                                        height: 115,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 12, 0, 0),
                                        child: Text(
                                          'ตรวจสอบลูกค้า',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation3']!),
                          InkWell(
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
                              ).then((value) => setState(() {}));

                              checkLoginCollectionPage =
                                  await GetUserProfileAPICall.call(
                                token: FFAppState().accessToken,
                                apiUrl: FFAppState().apiURLLocalState,
                              );
                              _shouldSetState = true;
                              if (!(checkLoginCollectionPage?.succeeded ??
                                  true)) {
                                Navigator.pop(context);
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ผิดพลาด'),
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
                                setState(() =>
                                    FFAppState().imei = '123456789012345');
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
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }
                              Navigator.pop(context);
                              collectionLocationService = await actions.a1();
                              _shouldSetState = true;
                              if (collectionLocationService!) {
                                collectionLocationPermission =
                                    await actions.a2();
                                _shouldSetState = true;
                                if (!collectionLocationPermission!) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('ผิดพลาด'),
                                        content: Text(
                                            'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                setState(() =>
                                    FFAppState().isFromTimesheetPage = false);
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ผิดพลาด'),
                                      content: Text(
                                          'ต้องทำการเปิดGPS เพื่อทำรายการต่อ'),
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
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              context.goNamedAuth('CollectionPage', mounted);

                              if (_shouldSetState) setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 190,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x230E151B),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/handing-over-money-image-dp-300x250.jpg',
                                        width: double.infinity,
                                        height: 115,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 12, 0, 0),
                                        child: Text(
                                          'ติดตามหนี้',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation4']!),
                          InkWell(
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
                              ).then((value) => setState(() {}));

                              checkLoginMarketingPage =
                                  await GetUserProfileAPICall.call(
                                token: FFAppState().accessToken,
                                apiUrl: FFAppState().apiURLLocalState,
                              );
                              _shouldSetState = true;
                              if ((checkLoginMarketingPage?.succeeded ??
                                  true)) {
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ผิดพลาด'),
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
                                setState(() =>
                                    FFAppState().imei = '123456789012345');
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
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              marketingLocationService = await actions.a1();
                              _shouldSetState = true;
                              if (marketingLocationService!) {
                                marketingLocationPermission =
                                    await actions.a2();
                                _shouldSetState = true;
                                if (!marketingLocationPermission!) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('ผิดพลาด'),
                                        content: Text(
                                            'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                setState(() =>
                                    FFAppState().isFromTimesheetPage = false);
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ผิดพลาด'),
                                      content: Text(
                                          'ต้องทำการเปิดGPS เพื่อทำรายการต่อ'),
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
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              context.goNamedAuth('MarketingPage', mounted);

                              if (_shouldSetState) setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 190,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x230E151B),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/noisy_big_megaphone_74855_7630_fed38ffd42.jpg',
                                        width: double.infinity,
                                        height: 115,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 12, 0, 0),
                                        child: Text(
                                          'ทำการตลาด',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation5']!),
                          InkWell(
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
                              ).then((value) => setState(() {}));

                              checkLoginNPAPage =
                                  await GetUserProfileAPICall.call(
                                token: FFAppState().accessToken,
                                apiUrl: FFAppState().apiURLLocalState,
                              );
                              _shouldSetState = true;
                              if ((checkLoginNPAPage?.succeeded ?? true)) {
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ผิดพลาด'),
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
                                setState(() =>
                                    FFAppState().imei = '123456789012345');
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
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              nPALocationService = await actions.a1();
                              _shouldSetState = true;
                              if (nPALocationService!) {
                                nPALocationPermission = await actions.a2();
                                _shouldSetState = true;
                                if (!nPALocationPermission!) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('ผิดพลาด'),
                                        content: Text(
                                            'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                setState(() =>
                                    FFAppState().isFromTimesheetPage = false);
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ผิดพลาด'),
                                      content: Text(
                                          'ต้องทำการเปิดGPS เพื่อทำรายการต่อ'),
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
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              context.goNamedAuth('NPApage', mounted);

                              if (_shouldSetState) setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 190,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x230E151B),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/74a40a4b-2704-4e25-9c48-05e2be5741b5.jpg',
                                        width: double.infinity,
                                        height: 115,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 12, 0, 0),
                                        child: Text(
                                          'สำรวจ NPA',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation6']!),
                          Visibility(
                            visible: FFAppState().opsMenuVisible,
                            child: InkWell(
                              onTap: () async {
                                var _shouldSetState = false;
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

                                checkLoginOPSPage =
                                    await GetUserProfileAPICall.call(
                                  token: FFAppState().accessToken,
                                  apiUrl: FFAppState().apiURLLocalState,
                                );
                                _shouldSetState = true;
                                if ((checkLoginOPSPage?.succeeded ?? true)) {
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pop(context);
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
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
                                      );
                                    },
                                  );
                                  setState(() =>
                                      FFAppState().imei = '123456789012345');
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
                                  GoRouter.of(context).prepareAuthEvent();
                                  await signOut();

                                  context.goNamedAuth('LoginPage', mounted);

                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                oPSLocationService = await actions.a1();
                                _shouldSetState = true;
                                if (oPSLocationService!) {
                                  oPSLocationPermission = await actions.a2();
                                  _shouldSetState = true;
                                  if (!oPSLocationPermission!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('ผิดพลาด'),
                                          content: Text(
                                              'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                  setState(() =>
                                      FFAppState().isFromTimesheetPage = false);
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
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
                                      );
                                    },
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                context.goNamedAuth('OPSpage', mounted);

                                if (_shouldSetState) setState(() {});
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: 190,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x230E151B),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 4, 4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 115,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFD2D2D2),
                                        ),
                                        child: Image.asset(
                                          'assets/images/kindpng_5675046.png',
                                          width: double.infinity,
                                          height: 115,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 12, 0, 0),
                                          child: Text(
                                            'ทรัพย์สิน OPS',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation7']!),
                          ),
                          InkWell(
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
                              ).then((value) => setState(() {}));

                              checkLoginCheckerPage =
                                  await GetUserProfileAPICall.call(
                                token: FFAppState().accessToken,
                                apiUrl: FFAppState().apiURLLocalState,
                              );
                              _shouldSetState = true;
                              if ((checkLoginCheckerPage?.succeeded ?? true)) {
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ผิดพลาด'),
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
                                setState(() =>
                                    FFAppState().imei = '123456789012345');
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
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              checkerLocationService = await actions.a1();
                              _shouldSetState = true;
                              if (checkerLocationService!) {
                                checkerLocationPermission = await actions.a2();
                                _shouldSetState = true;
                                if (!checkerLocationPermission!) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: Text('ผิดพลาด'),
                                        content: Text(
                                            'ต้องอนุญาตให้Branch View เข้าถึงตำแหน่งของคุณ เพื่อทำรายการต่อ'),
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
                                setState(() =>
                                    FFAppState().isFromTimesheetPage = false);
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ผิดพลาด'),
                                      content: Text(
                                          'ต้องทำการเปิดGPS เพื่อทำรายการต่อ'),
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
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              context.goNamedAuth('CheckerPage', mounted);

                              if (_shouldSetState) setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 190,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x230E151B),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/webpc-passthru.webp',
                                        width: double.infinity,
                                        height: 115,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 12, 0, 0),
                                        child: Text(
                                          'ฝ่ายตรวจสอบ',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation8']!),
                          InkWell(
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
                              ).then((value) => setState(() {}));

                              checkLoginTimesheetPage =
                                  await GetUserProfileAPICall.call(
                                token: FFAppState().accessToken,
                                apiUrl: FFAppState().apiURLLocalState,
                              );
                              _shouldSetState = true;
                              if ((checkLoginTimesheetPage?.succeeded ??
                                  true)) {
                                Navigator.pop(context);
                                setState(() =>
                                    FFAppState().isFromTimesheetPage = true);
                              } else {
                                Navigator.pop(context);
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ผิดพลาด'),
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
                                setState(() =>
                                    FFAppState().imei = '123456789012345');
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
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              context.goNamedAuth('TimeSheetPage', mounted);

                              if (_shouldSetState) setState(() {});
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: 190,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x230E151B),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/Time-tracking-system.jpg',
                                        width: double.infinity,
                                        height: 115,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 12, 0, 0),
                                        child: Text(
                                          'ไทม์ชีท',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation9']!),
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
    );
  }
}
