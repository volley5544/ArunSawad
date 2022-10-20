import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/loading_scene_widget.dart';
import '../components/p_d_f_viewer_copy_widget.dart';
import '../components/p_d_f_viewer_widget.dart';
import '../components/splash_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SuperAppPageWidget extends StatefulWidget {
  const SuperAppPageWidget({
    Key? key,
    this.dailyText,
  }) : super(key: key);

  final String? dailyText;

  @override
  _SuperAppPageWidgetState createState() => _SuperAppPageWidgetState();
}

class _SuperAppPageWidgetState extends State<SuperAppPageWidget> {
  ApiCallResponse? checkLoginCheckLead;
  ApiCallResponse? checkLoginFormLead;
  ApiCallResponse? checkLoginQR;
  ApiCallResponse? checkLoginCoach;
  UserLogRecord? createdUserLogCoach;
  ApiCallResponse? checkLoginSaleskit;
  ApiCallResponse? checkLoginClassroom;
  PageController? pageViewController2;
  ApiCallResponse? checkLoginITSupport;
  ApiCallResponse? checkLoginFormService;
  UserLogRecord? createdUserLogFormService;
  PageController? pageViewController1;
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? firebaseUserUID;
  bool? leadNotiOutput;
  String? userUID;
  UserCustomRecord? createdUserCustom;
  UserLogRecord? userLogCreated;
  UserLogRecord? createdUserLogLogin;
  bool? checkDoNotShowIsEmpty;
  bool? checkDoNotShow;
  int? diffDate;
  ApiCallResponse? logoutAction;
  bool? checkDeviceLocPerLogout;
  bool? checkDeviceLocSerLogout;
  bool? checkLatLngLogout;
  UserLogRecord? createdUserLogLogout;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
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

      setState(() => FFAppState().leadChannelAmountList =
          functions.resetLeadChannelAmount().toList());
      setState(() => FFAppState().leadChannelSelected = 'All');
      leadNotiOutput = await actions.a14();
      setState(() => FFAppState().isGotNoti = leadNotiOutput!);
      firebaseUserUID = await actions.a21();
      setState(() => FFAppState().locationTemp = firebaseUserUID!);
      await actions.lockOrientation();
      if (FFAppState().isFromLoginPage) {
        if (FFAppState().isFromSetPinPage) {
          if (!FFAppState().isPassLoginSection) {
            if (FFAppState().loginStateFirebase == 'Create') {
              userUID = await actions.a21();

              final userCustomCreateData = createUserCustomRecordData(
                createdTime: getCurrentTimestamp,
                email: functions
                    .generateStuffFirebaseEmail(FFAppState().employeeID),
                uid: userUID,
                employeeId: FFAppState().employeeID,
                imgProfile:
                    'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
              );
              var userCustomRecordReference = UserCustomRecord.collection.doc();
              await userCustomRecordReference.set(userCustomCreateData);
              createdUserCustom = UserCustomRecord.getDocumentFromData(
                  userCustomCreateData, userCustomRecordReference);
              setState(
                  () => FFAppState().userRef = createdUserCustom!.reference);

              final userLogCreateData = createUserLogRecordData(
                employeeId: FFAppState().employeeID,
                action: 'First_Login',
                actionTime: getCurrentTimestamp,
                userLocation: currentUserLocationValue,
              );
              var userLogRecordReference = UserLogRecord.collection.doc();
              await userLogRecordReference.set(userLogCreateData);
              userLogCreated = UserLogRecord.getDocumentFromData(
                  userLogCreateData, userLogRecordReference);
            } else {
              final userLogCreateData = createUserLogRecordData(
                employeeId: FFAppState().employeeID,
                action: 'Login',
                actionTime: getCurrentTimestamp,
                userLocation: currentUserLocationValue,
              );
              var userLogRecordReference = UserLogRecord.collection.doc();
              await userLogRecordReference.set(userLogCreateData);
              createdUserLogLogin = UserLogRecord.getDocumentFromData(
                  userLogCreateData, userLogRecordReference);
            }

            setState(() => FFAppState().isPassLoginSection = true);
          }
        } else {
          Navigator.pop(context);

          context.goNamed('SetPinCodePage');

          return;
        }
      } else {
        if (!FFAppState().isFromAuthenPage) {
          Navigator.pop(context);

          context.goNamed('PinCodePage');

          return;
        }
      }

      if (FFAppState().isGotNoti) {
        if (!FFAppState().inAppViaNotification) {
          Navigator.pop(context);
          return;
        }
        setState(() => FFAppState().inAppViaNotification = false);
        Navigator.pop(context);

        context.goNamed('LeadNotiPage');

        return;
      }
      if (FFAppState().isInApp) {
        Navigator.pop(context);
        return;
      }
      checkDoNotShowIsEmpty = await actions.a17(
        FFAppState().dateDoNotShowAgain,
      );
      if (checkDoNotShowIsEmpty!) {
        setState(() => FFAppState().dateDoNotShowAgain = getCurrentTimestamp);
      }
      checkDoNotShow = await actions.a18(
        FFAppState().dateDoNotShowAgain,
        getCurrentTimestamp,
      );
      if (checkDoNotShow!) {
        Navigator.pop(context);
        return;
      }
      Navigator.pop(context);
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x9A000000),
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: double.infinity,
              child: SplashPageWidget(),
            ),
          );
        },
      ).then((value) => setState(() {}));

      setState(() => FFAppState().isInApp = true);
      diffDate = await actions.a20(
        FFAppState().dateDoNotShowAgain,
        getCurrentTimestamp,
      );
      setState(() => FFAppState().diffDate = diffDate!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Container(
        width: 240,
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
                    height: 210,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Image.asset(
                              'assets/images/ArunSawad.png',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          'ArunSawad Version 1.0',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Color(0x80FFFFFF),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(),
                  child: Text(
                    'คุณ${FFAppState().userNickname}',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  child: custom_widgets.ShowDateTimeDash(
                    width: double.infinity,
                    height: 60,
                    currentTime: getCurrentTimestamp,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 80,
                  child: custom_widgets.ShowTimeDash(
                    width: double.infinity,
                    height: 80,
                  ),
                ),
                Spacer(flex: 2),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: InkWell(
                            onTap: () async {
                              currentUserLocationValue =
                                  await getCurrentUserLocation(
                                      defaultLocation: LatLng(0.0, 0.0));
                              var _shouldSetState = false;
                              HapticFeedback.mediumImpact();
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

                              checkDeviceLocSerLogout = await actions.a1();
                              _shouldSetState = true;
                              if (!checkDeviceLocSerLogout!) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ระบบ'),
                                      content:
                                          Text('กรุณาเปิดGPSเพื่อทำรายการ'),
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
                              checkDeviceLocPerLogout = await actions.a2();
                              _shouldSetState = true;
                              if (!checkDeviceLocPerLogout!) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ระบบ'),
                                      content: Text(
                                          'กรุณาให้อรุณสวัสดิ์เข้าถึงGPSของคุณ'),
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
                              checkLatLngLogout = await actions.a8(
                                currentUserLocationValue,
                              );
                              _shouldSetState = true;
                              if (!checkLatLngLogout!) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('ระบบ'),
                                      content:
                                          Text('กรุณาเปิดGPSเพื่อทำรายการ'),
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

                              final userLogCreateData = createUserLogRecordData(
                                employeeId: FFAppState().employeeID,
                                action: 'Logout',
                                actionTime: getCurrentTimestamp,
                                userLocation: currentUserLocationValue,
                              );
                              var userLogRecordReference =
                                  UserLogRecord.collection.doc();
                              await userLogRecordReference
                                  .set(userLogCreateData);
                              createdUserLogLogout =
                                  UserLogRecord.getDocumentFromData(
                                      userLogCreateData,
                                      userLogRecordReference);
                              _shouldSetState = true;
                              setState(() => FFAppState().loginStateFirebase =
                                  '[loginStateFirebase]');
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
                              setState(
                                  () => FFAppState().isFromSetPinPage = false);
                              setState(
                                  () => FFAppState().leadChannelColor = []);
                              setState(() => FFAppState().leadChannelList = []);
                              setState(
                                  () => FFAppState().isFromLoginPage = false);
                              setState(() {
                                FFAppState().deletePinCodeAuthen();
                                FFAppState().pinCodeAuthen = '013972';
                              });
                              setState(
                                  () => FFAppState().isFromAuthenPage = false);
                              setState(() {
                                FFAppState().deleteDateDoNotShowAgain();
                                FFAppState().dateDoNotShowAgain = null;
                              });
                              setState(() {
                                FFAppState().deleteDoNotShowAgain();
                                FFAppState().doNotShowAgain = false;
                              });
                              setState(() =>
                                  FFAppState().inAppViaNotification = true);
                              setState(() => FFAppState().isInApp = false);
                              setState(
                                  () => FFAppState().fcmToken = 'fcm_token');
                              setState(() =>
                                  FFAppState().isPassLoginSection = false);
                              setState(() => FFAppState().leadID = []);
                              setState(
                                  () => FFAppState().leadCreatedTimeList = []);
                              setState(
                                  () => FFAppState().leadCustomerNameList = []);
                              setState(() => FFAppState().leadChannelList = []);
                              setState(
                                  () => FFAppState().leadChannelColor = []);
                              setState(() => FFAppState().leadCallStatus = []);
                              setState(
                                  () => FFAppState().leadPhoneNumberList = []);
                              setState(() => FFAppState().leadEmployeeID = []);
                              setState(() =>
                                  FFAppState().leadChannelLabelColor = []);
                              setState(() {
                                FFAppState().deleteLeadIdCalledInApp();
                                FFAppState().leadIdCalledInApp = [];
                              });
                              setState(() => FFAppState().leadBranchCode = []);
                              setState(() => FFAppState().leadUserLevel =
                                  'lead_user_level');
                              setState(() =>
                                  FFAppState().leadChannelAmountList = []);
                              Navigator.pop(context);
                              await actions.a22();

                              context.goNamed('LoginPage');

                              if (_shouldSetState) setState(() {});
                            },
                            child: ListTile(
                              title: Text(
                                'ออกจากระบบ',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
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
                      ],
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FutureBuilder<List<UserCustomRecord>>(
                  future: queryUserCustomRecordOnce(
                    queryBuilder: (userCustomRecord) => userCustomRecord.where(
                        'employee_id',
                        isEqualTo: FFAppState().employeeID != ''
                            ? FFAppState().employeeID
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
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<UserCustomRecord> containerUserCustomRecordList =
                        snapshot.data!;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerUserCustomRecord =
                        containerUserCustomRecordList.isNotEmpty
                            ? containerUserCustomRecordList.first
                            : null;
                    return Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, -0.2),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.asset(
                                    'assets/images/8czKzxdqi-2.png',
                                  ).image,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  valueOrDefault<String>(
                                    functions.greetingTextSuperApp(
                                        FFAppState().userNickname),
                                    '[greeting_text]',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.95, 0.8),
                            child: Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    containerUserCustomRecord!.imgProfile!,
                                  ),
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Icon(
                                    Icons.dehaze,
                                    color: Color(0xFFFF8700),
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Container(
                  width: double.infinity,
                  height: 255,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FutureBuilder<List<ArunSawadImgBannerRecord>>(
                    future: queryArunSawadImgBannerRecordOnce(
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
                      List<ArunSawadImgBannerRecord>
                          pageViewArunSawadImgBannerRecordList = snapshot.data!;
                      // Return an empty Container when the document does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final pageViewArunSawadImgBannerRecord =
                          pageViewArunSawadImgBannerRecordList.isNotEmpty
                              ? pageViewArunSawadImgBannerRecordList.first
                              : null;
                      return Builder(
                        builder: (context) {
                          final bannerImgList =
                              pageViewArunSawadImgBannerRecord!.imgUrl!
                                  .toList();
                          return Container(
                            width: double.infinity,
                            height: 300,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 40),
                                  child: PageView.builder(
                                    controller: pageViewController1 ??=
                                        PageController(
                                            initialPage: min(
                                                0, bannerImgList.length - 1)),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: bannerImgList.length,
                                    itemBuilder: (context, bannerImgListIndex) {
                                      final bannerImgListItem =
                                          bannerImgList[bannerImgListIndex];
                                      return CachedNetworkImage(
                                        imageUrl: bannerImgListItem,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: pageViewController1 ??=
                                          PageController(
                                              initialPage: min(
                                                  0, bannerImgList.length - 1)),
                                      count: bannerImgList.length,
                                      axisDirection: Axis.horizontal,
                                      onDotClicked: (i) {
                                        pageViewController1!.animateToPage(
                                          i,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      effect: smooth_page_indicator
                                          .ExpandingDotsEffect(
                                        expansionFactor: 2,
                                        spacing: 8,
                                        radius: 16,
                                        dotWidth: 16,
                                        dotHeight: 16,
                                        dotColor: Color(0xFF9E9E9E),
                                        activeDotColor: Color(0xFF3F51B5),
                                        paintStyle: PaintingStyle.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 800,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF8100), Color(0xFFFFC38A)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0.14, -1),
                        end: AlignmentDirectional(-0.14, 1),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 30, 10, 0),
                              child: Container(
                                width: double.infinity,
                                height: 300,
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 20, 0, 0),
                                      child: Text(
                                        'บริการ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                            ),
                                      ),
                                    ),
                                    Divider(
                                      color:
                                          FlutterFlowTheme.of(context).grayIcon,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        height: 500,
                                        child: Stack(
                                          children: [
                                            PageView(
                                              controller:
                                                  pageViewController2 ??=
                                                      PageController(
                                                          initialPage: 0),
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 18, 12, 10),
                                                  child: GridView(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      crossAxisSpacing: 10,
                                                      mainAxisSpacing: 10,
                                                      childAspectRatio: 1.2,
                                                    ),
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: double
                                                                      .infinity,
                                                                  child:
                                                                      LoadingSceneWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          checkLoginFormLead =
                                                              await GetUserProfileAPICall
                                                                  .call(
                                                            token: FFAppState()
                                                                .accessToken,
                                                            apiUrl: FFAppState()
                                                                .apiURLLocalState,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (!(checkLoginFormLead
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'ระบบ'),
                                                                  content: Text(
                                                                      'Session Loginหมดอายุ'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            setState(() => FFAppState()
                                                                    .loginStateFirebase =
                                                                '[loginStateFirebase]');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteAccessToken();
                                                              FFAppState()
                                                                      .accessToken =
                                                                  'access_token';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteEmployeeID();
                                                              FFAppState()
                                                                      .employeeID =
                                                                  'employee_id';
                                                            });
                                                            setState(() => FFAppState()
                                                                    .QRCodeLink =
                                                                'qrcode_link');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteApiURLLocalState();
                                                              FFAppState()
                                                                      .apiURLLocalState =
                                                                  'api_url_local_state';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteBranchCode();
                                                              FFAppState()
                                                                      .branchCode =
                                                                  'branch_code';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromSetPinPage =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelColor =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelList =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromLoginPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deletePinCodeAuthen();
                                                              FFAppState()
                                                                      .pinCodeAuthen =
                                                                  '013972';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromAuthenPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDateDoNotShowAgain();
                                                              FFAppState()
                                                                      .dateDoNotShowAgain =
                                                                  null;
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDoNotShowAgain();
                                                              FFAppState()
                                                                      .doNotShowAgain =
                                                                  false;
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .inAppViaNotification =
                                                                    true);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isInApp =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .fcmToken =
                                                                    'fcm_token');
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isPassLoginSection =
                                                                    false);
                                                            Navigator.pop(
                                                                context);
                                                            await actions.a22();

                                                            context.goNamed(
                                                                'LoginPage');

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                          Navigator.pop(
                                                              context);

                                                          context.goNamed(
                                                              'LeadSurveyRegisPage');

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                child:
                                                                    Container(
                                                                  width: 50,
                                                                  height: 50,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/istock_blossomstar_survey.jpg',
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'ฟอร์มลีด',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: double
                                                                      .infinity,
                                                                  child:
                                                                      LoadingSceneWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          checkLoginQR =
                                                              await GetUserProfileAPICall
                                                                  .call(
                                                            token: FFAppState()
                                                                .accessToken,
                                                            apiUrl: FFAppState()
                                                                .apiURLLocalState,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (!(checkLoginQR
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'ระบบ'),
                                                                  content: Text(
                                                                      'Session Loginหมดอายุ'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            setState(() => FFAppState()
                                                                    .loginStateFirebase =
                                                                '[loginStateFirebase]');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteAccessToken();
                                                              FFAppState()
                                                                      .accessToken =
                                                                  'access_token';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteEmployeeID();
                                                              FFAppState()
                                                                      .employeeID =
                                                                  'employee_id';
                                                            });
                                                            setState(() => FFAppState()
                                                                    .QRCodeLink =
                                                                'qrcode_link');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteApiURLLocalState();
                                                              FFAppState()
                                                                      .apiURLLocalState =
                                                                  'api_url_local_state';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteBranchCode();
                                                              FFAppState()
                                                                      .branchCode =
                                                                  'branch_code';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromSetPinPage =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelColor =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelList =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromLoginPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deletePinCodeAuthen();
                                                              FFAppState()
                                                                      .pinCodeAuthen =
                                                                  '013972';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromAuthenPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDateDoNotShowAgain();
                                                              FFAppState()
                                                                      .dateDoNotShowAgain =
                                                                  null;
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDoNotShowAgain();
                                                              FFAppState()
                                                                      .doNotShowAgain =
                                                                  false;
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .inAppViaNotification =
                                                                    true);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isInApp =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .fcmToken =
                                                                    'fcm_token');
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isPassLoginSection =
                                                                    false);
                                                            Navigator.pop(
                                                                context);
                                                            await actions.a22();

                                                            context.goNamed(
                                                                'LoginPage');

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                          Navigator.pop(
                                                              context);

                                                          context.goNamed(
                                                              'GenQRPage');

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                child:
                                                                    Container(
                                                                  width: 50,
                                                                  height: 50,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    'https://th.qr-code-generator.com/wp-content/themes/qr/new_structure/markets/basic_market/generator/dist/generator/assets/images/websiteQRCode_noFrame.png',
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'QR พนักงาน',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: double
                                                                      .infinity,
                                                                  child:
                                                                      LoadingSceneWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          checkLoginCheckLead =
                                                              await GetUserProfileAPICall
                                                                  .call(
                                                            token: FFAppState()
                                                                .accessToken,
                                                            apiUrl: FFAppState()
                                                                .apiURLLocalState,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (!(checkLoginCheckLead
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'ระบบ'),
                                                                  content: Text(
                                                                      'Session Loginหมดอายุ'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            setState(() => FFAppState()
                                                                    .loginStateFirebase =
                                                                '[loginStateFirebase]');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteAccessToken();
                                                              FFAppState()
                                                                      .accessToken =
                                                                  'access_token';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteEmployeeID();
                                                              FFAppState()
                                                                      .employeeID =
                                                                  'employee_id';
                                                            });
                                                            setState(() => FFAppState()
                                                                    .QRCodeLink =
                                                                'qrcode_link');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteApiURLLocalState();
                                                              FFAppState()
                                                                      .apiURLLocalState =
                                                                  'api_url_local_state';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteBranchCode();
                                                              FFAppState()
                                                                      .branchCode =
                                                                  'branch_code';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromSetPinPage =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelColor =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelList =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromLoginPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deletePinCodeAuthen();
                                                              FFAppState()
                                                                      .pinCodeAuthen =
                                                                  '013972';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromAuthenPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDateDoNotShowAgain();
                                                              FFAppState()
                                                                      .dateDoNotShowAgain =
                                                                  null;
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDoNotShowAgain();
                                                              FFAppState()
                                                                      .doNotShowAgain =
                                                                  false;
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .inAppViaNotification =
                                                                    true);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isInApp =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .fcmToken =
                                                                    'fcm_token');
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isPassLoginSection =
                                                                    false);
                                                            Navigator.pop(
                                                                context);
                                                            await actions.a22();

                                                            context.goNamed(
                                                                'LoginPage');

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                          Navigator.pop(
                                                              context);

                                                          context.goNamed(
                                                              'LeadNotiPage');

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Badge(
                                                                badgeContent:
                                                                    Text(
                                                                  '!',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                ),
                                                                showBadge:
                                                                    false,
                                                                shape:
                                                                    BadgeShape
                                                                        .circle,
                                                                badgeColor: Color(
                                                                    0xFFFF0000),
                                                                elevation: 4,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            8,
                                                                            8,
                                                                            8),
                                                                position:
                                                                    BadgePosition
                                                                        .topEnd(),
                                                                animationType:
                                                                    BadgeAnimationType
                                                                        .scale,
                                                                toAnimate: true,
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          5),
                                                                  child:
                                                                      Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/webpc-passthru.webp',
                                                                      fit: BoxFit
                                                                          .fitHeight,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'รายชื่อลีด',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          currentUserLocationValue =
                                                              await getCurrentUserLocation(
                                                                  defaultLocation:
                                                                      LatLng(
                                                                          0.0,
                                                                          0.0));
                                                          var _shouldSetState =
                                                              false;
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: double
                                                                      .infinity,
                                                                  child:
                                                                      LoadingSceneWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          checkLoginCoach =
                                                              await GetUserProfileAPICall
                                                                  .call(
                                                            token: FFAppState()
                                                                .accessToken,
                                                            apiUrl: FFAppState()
                                                                .apiURLLocalState,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (!(checkLoginCoach
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'ระบบ'),
                                                                  content: Text(
                                                                      'Session Loginหมดอายุ'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            setState(() => FFAppState()
                                                                    .loginStateFirebase =
                                                                '[loginStateFirebase]');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteAccessToken();
                                                              FFAppState()
                                                                      .accessToken =
                                                                  'access_token';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteEmployeeID();
                                                              FFAppState()
                                                                      .employeeID =
                                                                  'employee_id';
                                                            });
                                                            setState(() => FFAppState()
                                                                    .QRCodeLink =
                                                                'qrcode_link');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteApiURLLocalState();
                                                              FFAppState()
                                                                      .apiURLLocalState =
                                                                  'api_url_local_state';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteBranchCode();
                                                              FFAppState()
                                                                      .branchCode =
                                                                  'branch_code';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromSetPinPage =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelColor =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelList =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromLoginPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deletePinCodeAuthen();
                                                              FFAppState()
                                                                      .pinCodeAuthen =
                                                                  '013972';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromAuthenPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDateDoNotShowAgain();
                                                              FFAppState()
                                                                      .dateDoNotShowAgain =
                                                                  null;
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDoNotShowAgain();
                                                              FFAppState()
                                                                      .doNotShowAgain =
                                                                  false;
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .inAppViaNotification =
                                                                    true);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isInApp =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .fcmToken =
                                                                    'fcm_token');
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isPassLoginSection =
                                                                    false);
                                                            Navigator.pop(
                                                                context);
                                                            await actions.a22();

                                                            context.goNamed(
                                                                'LoginPage');

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }

                                                          final userLogCreateData =
                                                              createUserLogRecordData(
                                                            employeeId:
                                                                FFAppState()
                                                                    .employeeID,
                                                            action: 'COACH',
                                                            actionTime:
                                                                getCurrentTimestamp,
                                                            userLocation:
                                                                currentUserLocationValue,
                                                          );
                                                          var userLogRecordReference =
                                                              UserLogRecord
                                                                  .collection
                                                                  .doc();
                                                          await userLogRecordReference
                                                              .set(
                                                                  userLogCreateData);
                                                          createdUserLogCoach =
                                                              UserLogRecord
                                                                  .getDocumentFromData(
                                                                      userLogCreateData,
                                                                      userLogRecordReference);
                                                          _shouldSetState =
                                                              true;
                                                          Navigator.pop(
                                                              context);
                                                          await launchURL(
                                                              'https://hris.srisawadpower.com/COACH');
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                child:
                                                                    Container(
                                                                  width: 50,
                                                                  height: 50,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/Screenshot_2022-10-17_095012.png',
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'COACH',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: double
                                                                      .infinity,
                                                                  child:
                                                                      LoadingSceneWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          checkLoginSaleskit =
                                                              await GetUserProfileAPICall
                                                                  .call(
                                                            token: FFAppState()
                                                                .accessToken,
                                                            apiUrl: FFAppState()
                                                                .apiURLLocalState,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (!(checkLoginSaleskit
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'ระบบ'),
                                                                  content: Text(
                                                                      'Session Loginหมดอายุ'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            setState(() => FFAppState()
                                                                    .loginStateFirebase =
                                                                '[loginStateFirebase]');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteAccessToken();
                                                              FFAppState()
                                                                      .accessToken =
                                                                  'access_token';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteEmployeeID();
                                                              FFAppState()
                                                                      .employeeID =
                                                                  'employee_id';
                                                            });
                                                            setState(() => FFAppState()
                                                                    .QRCodeLink =
                                                                'qrcode_link');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteApiURLLocalState();
                                                              FFAppState()
                                                                      .apiURLLocalState =
                                                                  'api_url_local_state';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteBranchCode();
                                                              FFAppState()
                                                                      .branchCode =
                                                                  'branch_code';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromSetPinPage =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelColor =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelList =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromLoginPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deletePinCodeAuthen();
                                                              FFAppState()
                                                                      .pinCodeAuthen =
                                                                  '013972';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromAuthenPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDateDoNotShowAgain();
                                                              FFAppState()
                                                                      .dateDoNotShowAgain =
                                                                  null;
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDoNotShowAgain();
                                                              FFAppState()
                                                                      .doNotShowAgain =
                                                                  false;
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .inAppViaNotification =
                                                                    true);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isInApp =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .fcmToken =
                                                                    'fcm_token');
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isPassLoginSection =
                                                                    false);
                                                            Navigator.pop(
                                                                context);
                                                            await actions.a22();

                                                            context.goNamed(
                                                                'LoginPage');

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                          Navigator.pop(
                                                              context);

                                                          context.goNamed(
                                                              'SaleskitPage');

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                child:
                                                                    Container(
                                                                  width: 50,
                                                                  height: 50,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/278-2784993_transparent-people-reading-png-sale-man-logo-png.png',
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'Saleskit',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: double
                                                                      .infinity,
                                                                  child:
                                                                      LoadingSceneWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          checkLoginClassroom =
                                                              await GetUserProfileAPICall
                                                                  .call(
                                                            token: FFAppState()
                                                                .accessToken,
                                                            apiUrl: FFAppState()
                                                                .apiURLLocalState,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (!(checkLoginClassroom
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'ระบบ'),
                                                                  content: Text(
                                                                      'Session Loginหมดอายุ'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            setState(() => FFAppState()
                                                                    .loginStateFirebase =
                                                                '[loginStateFirebase]');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteAccessToken();
                                                              FFAppState()
                                                                      .accessToken =
                                                                  'access_token';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteEmployeeID();
                                                              FFAppState()
                                                                      .employeeID =
                                                                  'employee_id';
                                                            });
                                                            setState(() => FFAppState()
                                                                    .QRCodeLink =
                                                                'qrcode_link');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteApiURLLocalState();
                                                              FFAppState()
                                                                      .apiURLLocalState =
                                                                  'api_url_local_state';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteBranchCode();
                                                              FFAppState()
                                                                      .branchCode =
                                                                  'branch_code';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromSetPinPage =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelColor =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelList =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromLoginPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deletePinCodeAuthen();
                                                              FFAppState()
                                                                      .pinCodeAuthen =
                                                                  '013972';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromAuthenPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDateDoNotShowAgain();
                                                              FFAppState()
                                                                      .dateDoNotShowAgain =
                                                                  null;
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDoNotShowAgain();
                                                              FFAppState()
                                                                      .doNotShowAgain =
                                                                  false;
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .inAppViaNotification =
                                                                    true);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isInApp =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .fcmToken =
                                                                    'fcm_token');
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isPassLoginSection =
                                                                    false);
                                                            Navigator.pop(
                                                                context);
                                                            await actions.a22();

                                                            context.goNamed(
                                                                'LoginPage');

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                          Navigator.pop(
                                                              context);

                                                          context.goNamed(
                                                              'ClassroomPage');

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                child:
                                                                    Container(
                                                                  width: 50,
                                                                  height: 50,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/ingenuity_wit_book_idea_light_bulb_learn_learning_icon_149691.png',
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'ห้องเรียนทันใจ',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 18, 12, 10),
                                                  child: GridView(
                                                    padding: EdgeInsets.zero,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      crossAxisSpacing: 10,
                                                      mainAxisSpacing: 10,
                                                      childAspectRatio: 1.2,
                                                    ),
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      InkWell(
                                                        onTap: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: double
                                                                      .infinity,
                                                                  child:
                                                                      LoadingSceneWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          checkLoginITSupport =
                                                              await GetUserProfileAPICall
                                                                  .call(
                                                            token: FFAppState()
                                                                .accessToken,
                                                            apiUrl: FFAppState()
                                                                .apiURLLocalState,
                                                          );
                                                          _shouldSetState =
                                                              true;
                                                          if (!(checkLoginITSupport
                                                                  ?.succeeded ??
                                                              true)) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'ระบบ'),
                                                                  content: Text(
                                                                      'Session Loginหมดอายุ'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            setState(() => FFAppState()
                                                                    .loginStateFirebase =
                                                                '[loginStateFirebase]');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteAccessToken();
                                                              FFAppState()
                                                                      .accessToken =
                                                                  'access_token';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteEmployeeID();
                                                              FFAppState()
                                                                      .employeeID =
                                                                  'employee_id';
                                                            });
                                                            setState(() => FFAppState()
                                                                    .QRCodeLink =
                                                                'qrcode_link');
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteApiURLLocalState();
                                                              FFAppState()
                                                                      .apiURLLocalState =
                                                                  'api_url_local_state';
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteBranchCode();
                                                              FFAppState()
                                                                      .branchCode =
                                                                  'branch_code';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromSetPinPage =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelColor =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .leadChannelList =
                                                                    []);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromLoginPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deletePinCodeAuthen();
                                                              FFAppState()
                                                                      .pinCodeAuthen =
                                                                  '013972';
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isFromAuthenPage =
                                                                    false);
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDateDoNotShowAgain();
                                                              FFAppState()
                                                                      .dateDoNotShowAgain =
                                                                  null;
                                                            });
                                                            setState(() {
                                                              FFAppState()
                                                                  .deleteDoNotShowAgain();
                                                              FFAppState()
                                                                      .doNotShowAgain =
                                                                  false;
                                                            });
                                                            setState(() =>
                                                                FFAppState()
                                                                        .inAppViaNotification =
                                                                    true);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isInApp =
                                                                    false);
                                                            setState(() =>
                                                                FFAppState()
                                                                        .fcmToken =
                                                                    'fcm_token');
                                                            setState(() =>
                                                                FFAppState()
                                                                        .isPassLoginSection =
                                                                    false);
                                                            Navigator.pop(
                                                                context);
                                                            await actions.a22();

                                                            context.goNamed(
                                                                'LoginPage');

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                          Navigator.pop(
                                                              context);

                                                          context.goNamed(
                                                              'ITSupportPage');

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            5),
                                                                child:
                                                                    Container(
                                                                  width: 50,
                                                                  height: 50,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/9288ca8e4f66c009d35e4cd5b409710a.png',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'ข้อมูลไอที',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 1),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 10),
                                                child: smooth_page_indicator
                                                    .SmoothPageIndicator(
                                                  controller:
                                                      pageViewController2 ??=
                                                          PageController(
                                                              initialPage: 0),
                                                  count: 2,
                                                  axisDirection:
                                                      Axis.horizontal,
                                                  onDotClicked: (i) {
                                                    pageViewController2!
                                                        .animateToPage(
                                                      i,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                                  effect: smooth_page_indicator
                                                      .SlideEffect(
                                                    spacing: 8,
                                                    radius: 16,
                                                    dotWidth: 10,
                                                    dotHeight: 10,
                                                    dotColor: Color(0xFF9E9E9E),
                                                    activeDotColor:
                                                        Color(0xFF3F51B5),
                                                    paintStyle:
                                                        PaintingStyle.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 30, 10, 0),
                              child: Container(
                                width: double.infinity,
                                height: 175,
                                decoration: BoxDecoration(),
                                child: FutureBuilder<
                                    List<SawadFormServicesRecord>>(
                                  future: querySawadFormServicesRecordOnce(
                                    queryBuilder: (sawadFormServicesRecord) =>
                                        sawadFormServicesRecord
                                            .orderBy('form_service_order'),
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
                                    List<SawadFormServicesRecord>
                                        listViewSawadFormServicesRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          listViewSawadFormServicesRecordList
                                              .length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewSawadFormServicesRecord =
                                            listViewSawadFormServicesRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 5, 0, 5),
                                          child: InkWell(
                                            onTap: () async {
                                              currentUserLocationValue =
                                                  await getCurrentUserLocation(
                                                      defaultLocation:
                                                          LatLng(0.0, 0.0));
                                              var _shouldSetState = false;
                                              HapticFeedback.mediumImpact();
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child: Container(
                                                      height: double.infinity,
                                                      child:
                                                          LoadingSceneWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));

                                              checkLoginFormService =
                                                  await GetUserProfileAPICall
                                                      .call(
                                                token: FFAppState().accessToken,
                                                apiUrl: FFAppState()
                                                    .apiURLLocalState,
                                              );
                                              _shouldSetState = true;
                                              if (!(checkLoginFormService
                                                      ?.succeeded ??
                                                  true)) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('ระบบ'),
                                                      content: Text(
                                                          'Session Loginหมดอายุ'),
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
                                                setState(() => FFAppState()
                                                        .loginStateFirebase =
                                                    '[loginStateFirebase]');
                                                setState(() {
                                                  FFAppState()
                                                      .deleteAccessToken();
                                                  FFAppState().accessToken =
                                                      'access_token';
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .deleteEmployeeID();
                                                  FFAppState().employeeID =
                                                      'employee_id';
                                                });
                                                setState(() =>
                                                    FFAppState().QRCodeLink =
                                                        'qrcode_link');
                                                setState(() {
                                                  FFAppState()
                                                      .deleteApiURLLocalState();
                                                  FFAppState()
                                                          .apiURLLocalState =
                                                      'api_url_local_state';
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .deleteBranchCode();
                                                  FFAppState().branchCode =
                                                      'branch_code';
                                                });
                                                setState(() => FFAppState()
                                                    .isFromSetPinPage = false);
                                                setState(() => FFAppState()
                                                    .leadChannelColor = []);
                                                setState(() => FFAppState()
                                                    .leadChannelList = []);
                                                setState(() => FFAppState()
                                                    .isFromLoginPage = false);
                                                setState(() {
                                                  FFAppState()
                                                      .deletePinCodeAuthen();
                                                  FFAppState().pinCodeAuthen =
                                                      '013972';
                                                });
                                                setState(() => FFAppState()
                                                    .isFromAuthenPage = false);
                                                setState(() {
                                                  FFAppState()
                                                      .deleteDateDoNotShowAgain();
                                                  FFAppState()
                                                          .dateDoNotShowAgain =
                                                      null;
                                                });
                                                setState(() {
                                                  FFAppState()
                                                      .deleteDoNotShowAgain();
                                                  FFAppState().doNotShowAgain =
                                                      false;
                                                });
                                                setState(() => FFAppState()
                                                        .inAppViaNotification =
                                                    true);
                                                setState(() => FFAppState()
                                                    .isInApp = false);
                                                setState(() => FFAppState()
                                                    .fcmToken = 'fcm_token');
                                                setState(() => FFAppState()
                                                        .isPassLoginSection =
                                                    false);
                                                Navigator.pop(context);
                                                await actions.a22();

                                                context.goNamed('LoginPage');

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                              if (functions.checkFormServiceUrl(
                                                  listViewSawadFormServicesRecord
                                                      .formServiceUrl)) {
                                                final userLogCreateData =
                                                    createUserLogRecordData(
                                                  employeeId:
                                                      FFAppState().employeeID,
                                                  action:
                                                      valueOrDefault<String>(
                                                    'Form_Service_${listViewSawadFormServicesRecord.formServiceName}',
                                                    '[form_service_action]',
                                                  ),
                                                  actionTime:
                                                      getCurrentTimestamp,
                                                  userLocation:
                                                      currentUserLocationValue,
                                                );
                                                var userLogRecordReference =
                                                    UserLogRecord.collection
                                                        .doc();
                                                await userLogRecordReference
                                                    .set(userLogCreateData);
                                                createdUserLogFormService =
                                                    UserLogRecord
                                                        .getDocumentFromData(
                                                            userLogCreateData,
                                                            userLogRecordReference);
                                                _shouldSetState = true;
                                                Navigator.pop(context);
                                                await launchURL(
                                                    listViewSawadFormServicesRecord
                                                        .formServiceUrl!);
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                              Navigator.pop(context);

                                              context.goNamed(
                                                'FormServicePage',
                                                queryParams: {
                                                  'formServiceName':
                                                      serializeParam(
                                                    listViewSawadFormServicesRecord
                                                        .formServiceName,
                                                    ParamType.String,
                                                  ),
                                                  'formServiceUrl':
                                                      serializeParam(
                                                    listViewSawadFormServicesRecord
                                                        .formServiceUrl,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              if (_shouldSetState)
                                                setState(() {});
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Container(
                                                width: 300,
                                                height: 165,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image:
                                                        CachedNetworkImageProvider(
                                                      listViewSawadFormServicesRecord
                                                          .formServiceImg!,
                                                    ),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Container(
                                        width: 300,
                                        height: 165,
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 5, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Incentive สาขา',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18,
                                                              ),
                                                    ),
                                                    Divider(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayIcon,
                                                    ),
                                                    Text(
                                                      '06-10-2022',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                    Text(
                                                      'โปรโมชั่น การขายพิเศษ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                    Text(
                                                      'ฉบับที่ 1-2022',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 5, 0),
                                              child: Container(
                                                width: 130,
                                                height: 130,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFFE4D2),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 8, 8, 8),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors.black,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: 600,
                                                                child:
                                                                    PDFViewerWidget(),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      child: Image.asset(
                                                        'assets/images/pngegg.png',
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Container(
                                        width: 300,
                                        height: 165,
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 5, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'คำสั่ง CRD',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 18,
                                                              ),
                                                    ),
                                                    Divider(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayIcon,
                                                    ),
                                                    Text(
                                                      '008-2565 ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                    Text(
                                                      'เรื่อง รีไฟแนนซ์ รถM',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 5, 0),
                                              child: Container(
                                                width: 130,
                                                height: 130,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFFE4D2),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 8, 8, 8),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors.black,
                                                          context: context,
                                                          builder: (context) {
                                                            return Padding(
                                                              padding: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets,
                                                              child: Container(
                                                                height: 600,
                                                                child:
                                                                    PDFViewerCopyWidget(),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                      child: Image.asset(
                                                        'assets/images/pngegg.png',
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
