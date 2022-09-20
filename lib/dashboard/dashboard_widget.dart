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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  ApiCallResponse? checkLoginLeadSurveyPage;
  ApiCallResponse? checkLoginGenQRPage;
  ApiCallResponse? logoutAction;
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
      delay: 150,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, -100),
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
      delay: 250,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, -100),
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
      delay: 350,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
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
      delay: 450,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 550,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 650,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(100, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation8': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 750,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation9': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 850,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation10': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 850,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation11': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 500,
      delay: 850,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
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
        androidIMEI = await actions.getIMEI();
        setState(() => FFAppState().imei = androidIMEI!);
      } else {
        iOSidentifierForVendor = await actions.getIMEIios();
        setState(() => FFAppState().imei = iOSidentifierForVendor!);
      }
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
        automaticallyImplyLeading: true,
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          elevation: 16,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFF261E1E),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Image.asset(
                        'assets/images/true-logo2.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Image.asset(
                        'assets/images/banner.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'User : ',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                      ),
                    ),
                    Text(
                      FFAppState().employeeID,
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: custom_widgets.ShowDateTimeDash(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.08,
                    currentTime: getCurrentTimestamp,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: custom_widgets.DigitalClockWidgetDash(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(),
                    child: Align(
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
                          logoutAction = await LogoutAPICall.call(
                            token: FFAppState().accessToken,
                            apiUrl: FFAppState().apiURLLocalState,
                          );
                          _shouldSetState = true;
                          if (!(logoutAction?.succeeded ?? true)) {
                            Navigator.pop(context);
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('ล้มเหลว'),
                                  content: Text(
                                      'ไม่สามารถออกจากระบบได้ กรุณาลองใหม่'),
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
                          setState(() => FFAppState().imei = '123456789012345');
                          setState(
                              () => FFAppState().accessToken = 'access_token');
                          setState(
                              () => FFAppState().employeeID = 'employee_id');
                          setState(
                              () => FFAppState().QRCodeLink = 'qrcode_link');
                          setState(() => FFAppState().apiURLLocalState =
                              'api_url_local_state');
                          setState(
                              () => FFAppState().branchCode = 'branch_code');
                          Navigator.pop(context);
                          GoRouter.of(context).prepareAuthEvent();
                          await signOut();

                          context.goNamedAuth('LoginPage', mounted);

                          if (_shouldSetState) setState(() {});
                        },
                        child: ListTile(
                          title: Text(
                            'ออกจากระบบ',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                          ),
                          trailing: FaIcon(
                            FontAwesomeIcons.signOutAlt,
                            color: Colors.white,
                            size: 20,
                          ),
                          tileColor: Colors.white,
                          dense: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
                  ).animated([animationsMap['containerOnPageLoadAnimation1']!]),
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
                              );
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
                                setState(() =>
                                    FFAppState().accessToken = 'access_token');
                                setState(() =>
                                    FFAppState().employeeID = 'employee_id');
                                setState(() =>
                                    FFAppState().QRCodeLink = 'qrcode_link');
                                setState(() => FFAppState().apiURLLocalState =
                                    'api_url_local_state');
                                setState(() =>
                                    FFAppState().branchCode = 'branch_code');
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              checkInLocationService =
                                  await actions.checkDeviceLocationService();
                              _shouldSetState = true;
                              if (checkInLocationService!) {
                                checkInLocationPermission = await actions
                                    .checkDeviceLocationPermission();
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
                          ).animated([
                            animationsMap['containerOnPageLoadAnimation2']!
                          ]),
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
                              );
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
                                setState(() =>
                                    FFAppState().accessToken = 'access_token');
                                setState(() =>
                                    FFAppState().employeeID = 'employee_id');
                                setState(() =>
                                    FFAppState().QRCodeLink = 'qrcode_link');
                                setState(() => FFAppState().apiURLLocalState =
                                    'api_url_local_state');
                                setState(() =>
                                    FFAppState().branchCode = 'branch_code');
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              surveyLocationService =
                                  await actions.checkDeviceLocationService();
                              _shouldSetState = true;
                              if (surveyLocationService!) {
                                surveyLocationPermission = await actions
                                    .checkDeviceLocationPermission();
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
                          ).animated([
                            animationsMap['containerOnPageLoadAnimation3']!
                          ]),
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
                              );
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
                                setState(() =>
                                    FFAppState().accessToken = 'access_token');
                                setState(() =>
                                    FFAppState().employeeID = 'employee_id');
                                setState(() =>
                                    FFAppState().QRCodeLink = 'qrcode_link');
                                setState(() => FFAppState().apiURLLocalState =
                                    'api_url_local_state');
                                setState(() =>
                                    FFAppState().branchCode = 'branch_code');
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }
                              Navigator.pop(context);
                              collectionLocationService =
                                  await actions.checkDeviceLocationService();
                              _shouldSetState = true;
                              if (collectionLocationService!) {
                                collectionLocationPermission = await actions
                                    .checkDeviceLocationPermission();
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
                          ).animated([
                            animationsMap['containerOnPageLoadAnimation4']!
                          ]),
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
                              );
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
                                setState(() =>
                                    FFAppState().accessToken = 'access_token');
                                setState(() =>
                                    FFAppState().employeeID = 'employee_id');
                                setState(() =>
                                    FFAppState().QRCodeLink = 'qrcode_link');
                                setState(() => FFAppState().apiURLLocalState =
                                    'api_url_local_state');
                                setState(() =>
                                    FFAppState().branchCode = 'branch_code');
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              marketingLocationService =
                                  await actions.checkDeviceLocationService();
                              _shouldSetState = true;
                              if (marketingLocationService!) {
                                marketingLocationPermission = await actions
                                    .checkDeviceLocationPermission();
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
                          ).animated([
                            animationsMap['containerOnPageLoadAnimation5']!
                          ]),
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
                              );
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
                                setState(() =>
                                    FFAppState().accessToken = 'access_token');
                                setState(() =>
                                    FFAppState().employeeID = 'employee_id');
                                setState(() =>
                                    FFAppState().QRCodeLink = 'qrcode_link');
                                setState(() => FFAppState().apiURLLocalState =
                                    'api_url_local_state');
                                setState(() =>
                                    FFAppState().branchCode = 'branch_code');
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              nPALocationService =
                                  await actions.checkDeviceLocationService();
                              _shouldSetState = true;
                              if (nPALocationService!) {
                                nPALocationPermission = await actions
                                    .checkDeviceLocationPermission();
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
                          ).animated([
                            animationsMap['containerOnPageLoadAnimation6']!
                          ]),
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
                              );
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
                                setState(() =>
                                    FFAppState().accessToken = 'access_token');
                                setState(() =>
                                    FFAppState().employeeID = 'employee_id');
                                setState(() =>
                                    FFAppState().QRCodeLink = 'qrcode_link');
                                setState(() => FFAppState().apiURLLocalState =
                                    'api_url_local_state');
                                setState(() =>
                                    FFAppState().branchCode = 'branch_code');
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              oPSLocationService =
                                  await actions.checkDeviceLocationService();
                              _shouldSetState = true;
                              if (oPSLocationService!) {
                                oPSLocationPermission = await actions
                                    .checkDeviceLocationPermission();
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                          ).animated([
                            animationsMap['containerOnPageLoadAnimation7']!
                          ]),
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
                              );
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
                                setState(() =>
                                    FFAppState().accessToken = 'access_token');
                                setState(() =>
                                    FFAppState().employeeID = 'employee_id');
                                setState(() =>
                                    FFAppState().QRCodeLink = 'qrcode_link');
                                setState(() => FFAppState().apiURLLocalState =
                                    'api_url_local_state');
                                setState(() =>
                                    FFAppState().branchCode = 'branch_code');
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              checkerLocationService =
                                  await actions.checkDeviceLocationService();
                              _shouldSetState = true;
                              if (checkerLocationService!) {
                                checkerLocationPermission = await actions
                                    .checkDeviceLocationPermission();
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
                          ).animated([
                            animationsMap['containerOnPageLoadAnimation8']!
                          ]),
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
                              );
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
                                setState(() =>
                                    FFAppState().accessToken = 'access_token');
                                setState(() =>
                                    FFAppState().employeeID = 'employee_id');
                                setState(() =>
                                    FFAppState().QRCodeLink = 'qrcode_link');
                                setState(() => FFAppState().apiURLLocalState =
                                    'api_url_local_state');
                                setState(() =>
                                    FFAppState().branchCode = 'branch_code');
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
                          ).animated([
                            animationsMap['containerOnPageLoadAnimation9']!
                          ]),
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
                              );
                              checkLoginLeadSurveyPage =
                                  await GetUserProfileAPICall.call(
                                token: FFAppState().accessToken,
                                apiUrl: FFAppState().apiURLLocalState,
                              );
                              _shouldSetState = true;
                              if (!(checkLoginLeadSurveyPage?.succeeded ??
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
                                setState(() =>
                                    FFAppState().accessToken = 'access_token');
                                setState(() =>
                                    FFAppState().employeeID = 'employee_id');
                                setState(() =>
                                    FFAppState().QRCodeLink = 'qrcode_link');
                                setState(() => FFAppState().apiURLLocalState =
                                    'api_url_local_state');
                                setState(() =>
                                    FFAppState().branchCode = 'branch_code');
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              context.goNamedAuth(
                                  'LeadSurveyRegisPage', mounted);

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
                                          'ลีดเดินตลาด',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).animated([
                            animationsMap['containerOnPageLoadAnimation10']!
                          ]),
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
                              );
                              checkLoginGenQRPage =
                                  await GetUserProfileAPICall.call(
                                token: FFAppState().accessToken,
                                apiUrl: FFAppState().apiURLLocalState,
                              );
                              _shouldSetState = true;
                              if (!(checkLoginGenQRPage?.succeeded ?? true)) {
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
                                setState(() =>
                                    FFAppState().accessToken = 'access_token');
                                setState(() =>
                                    FFAppState().employeeID = 'employee_id');
                                setState(() =>
                                    FFAppState().QRCodeLink = 'qrcode_link');
                                setState(() => FFAppState().apiURLLocalState =
                                    'api_url_local_state');
                                setState(() =>
                                    FFAppState().branchCode = 'branch_code');
                                GoRouter.of(context).prepareAuthEvent();
                                await signOut();

                                context.goNamedAuth('LoginPage', mounted);

                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              context.goNamedAuth('GenQRPage', mounted);

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
                                          'สร้างQR ผนักงาน',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ).animated([
                            animationsMap['containerOnPageLoadAnimation11']!
                          ]),
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
