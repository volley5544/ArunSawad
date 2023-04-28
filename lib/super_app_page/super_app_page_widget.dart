import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/components/p_d_f_viewer_widget.dart';
import '/components/search_employee_component_widget.dart';
import '/components/splash_page_holiday_widget.dart';
import '/components/splash_page_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:badges/badges.dart' as badges;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'super_app_page_model.dart';
export 'super_app_page_model.dart';

class SuperAppPageWidget extends StatefulWidget {
  const SuperAppPageWidget({
    Key? key,
    this.dailyText,
  }) : super(key: key);

  final String? dailyText;

  @override
  _SuperAppPageWidgetState createState() => _SuperAppPageWidgetState();
}

class _SuperAppPageWidgetState extends State<SuperAppPageWidget>
    with TickerProviderStateMixin {
  late SuperAppPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;
  int get pageViewBannerCurrentIndex =>
      _model.pageViewBannerController != null &&
              _model.pageViewBannerController!.hasClients &&
              _model.pageViewBannerController!.page != null
          ? _model.pageViewBannerController!.page!.round()
          : 0;
  int get pageViewCurrentIndex1 => _model.pageViewController1 != null &&
          _model.pageViewController1!.hasClients &&
          _model.pageViewController1!.page != null
      ? _model.pageViewController1!.page!.round()
      : 0;
  int get pageViewCurrentIndex2 => _model.pageViewController2 != null &&
          _model.pageViewController2!.hasClients &&
          _model.pageViewController2!.page != null
      ? _model.pageViewController2!.page!.round()
      : 0;
  int get pageViewCurrentIndex3 => _model.pageViewController3 != null &&
          _model.pageViewController3!.hasClients &&
          _model.pageViewController3!.page != null
      ? _model.pageViewController3!.page!.round()
      : 0;

  final animationsMap = {
    'iconOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 900.ms,
          begin: Offset(0.0, -57.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 900.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 900.ms,
          begin: Offset(0.0, -57.0),
          end: Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 900.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuperAppPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SuperAppPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!((FFAppState().employeeID == '31622') ||
          (FFAppState().employeeID == '33511') ||
          (FFAppState().employeeID == '32758') ||
          (FFAppState().employeeID == '31247') ||
          (FFAppState().employeeID == '30427') ||
          (FFAppState().employeeID == '23328') ||
          (FFAppState().employeeID == '1002'))) {
        if (isAndroid) {
          await actions.preventScreenRecordAndroid();
        } else {
          await actions.preventScreenRecordIOS();
        }
      }
      if (FFAppState().apiURLLocalState == 'api_url_local_state') {
        await actions.a22();

        context.goNamed('LoginPage');

        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('logout'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        return;
      }
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x00000000),
        enableDrag: false,
        context: context,
        builder: (bottomSheetContext) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Padding(
              padding: MediaQuery.of(bottomSheetContext).viewInsets,
              child: Container(
                height: double.infinity,
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => setState(() {}));

      _model.getDeviceVersion = await actions.getBuildVersion();
      FFAppState().update(() {
        FFAppState().isSelectedBranch = false;
        FFAppState().isSearchedBranch = false;
        FFAppState().isEmployeeSearched = false;
        FFAppState().isEmployeeSelected = false;
      });
      FFAppState().update(() {
        FFAppState().isFromTimesheetPage = false;
        FFAppState().leadChannelAmountList =
            functions.resetLeadChannelAmount().toList();
      });
      FFAppState().update(() {
        FFAppState().leadChannelSelected = 'All';
      });
      _model.leadNotiOutput = await actions.a14();
      FFAppState().update(() {
        FFAppState().isGotNoti = false;
      });
      await actions.lockOrientation();
      if (FFAppState().isFromLoginPage) {
        if (FFAppState().isFromSetPinPage) {
          if (!FFAppState().isPassLoginSection) {
            FFAppState().update(() {
              FFAppState().isPassLoginSection = true;
            });
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

      if (_model.leadNotiOutput != 'notification_message_type') {
        if (FFAppState().inAppViaNotification) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text(_model.leadNotiOutput!),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          if (_model.leadNotiOutput == 'Leave_Request') {
            FFAppState().update(() {
              FFAppState().inAppViaNotification = false;
            });
            Navigator.pop(context);

            context.goNamed('DashboardLeavePage');

            return;
          }
          FFAppState().update(() {
            FFAppState().inAppViaNotification = false;
          });
          Navigator.pop(context);

          context.goNamed('LeadNotiPage');
        } else {
          Navigator.pop(context);
        }

        return;
      }
      if (FFAppState().isInApp) {
        Navigator.pop(context);
        return;
      }
      _model.checkDoNotShowIsEmpty = await actions.a17(
        FFAppState().dateDoNotShowAgain,
      );
      if (_model.checkDoNotShowIsEmpty!) {
        FFAppState().update(() {
          FFAppState().dateDoNotShowAgain = getCurrentTimestamp;
          FFAppState().DateHolidayNotShow = getCurrentTimestamp;
        });
      }
      _model.checkDoNotShowHoliday = await actions.a18(
        FFAppState().DateHolidayNotShow,
        getCurrentTimestamp,
      );
      if (_model.checkDoNotShowHoliday!) {
        Navigator.pop(context);
      } else {
        if ((FFAppState().DateHoliday! <= getCurrentTimestamp) &&
            (FFAppState().DateExpHoliday! >= getCurrentTimestamp)) {
          Navigator.pop(context);
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            barrierColor: Color(0x9A000000),
            enableDrag: false,
            context: context,
            builder: (bottomSheetContext) {
              return GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                child: Padding(
                  padding: MediaQuery.of(bottomSheetContext).viewInsets,
                  child: Container(
                    height: double.infinity,
                    child: SplashPageHolidayWidget(),
                  ),
                ),
              );
            },
          ).then((value) => setState(() {}));
        } else {
          Navigator.pop(context);
        }
      }

      _model.checkDoNotShow = await actions.a18(
        FFAppState().dateDoNotShowAgain,
        getCurrentTimestamp,
      );
      if (_model.checkDoNotShow!) {
        Navigator.pop(context);
        FFAppState().update(() {
          FFAppState().isInApp = true;
        });
        return;
      }
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x9A000000),
        enableDrag: false,
        context: context,
        builder: (bottomSheetContext) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Padding(
              padding: MediaQuery.of(bottomSheetContext).viewInsets,
              child: Container(
                height: double.infinity,
                child: SplashPageWidget(),
              ),
            ),
          );
        },
      ).then((value) => setState(() {}));

      FFAppState().update(() {
        FFAppState().isInApp = true;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          drawer: Container(
            width: 240.0,
            child: Drawer(
              elevation: 16.0,
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Color(0xFF261E1E),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 210.0,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Image.asset(
                                  'assets/images/ArunSawad.png',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                'อรุณสวัสดิ์ Version ${_model.getDeviceVersion}',
                                'อรุณสวัสดิ์ Version [build_version]',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                isAndroid ? 'Android' : 'iOS',
                                'Android',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 12.0,
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
                      height: 50.0,
                      decoration: BoxDecoration(),
                      child: Text(
                        'คุณ${FFAppState().userNickname}',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      child: custom_widgets.ShowDateTimeDash(
                        width: double.infinity,
                        height: 60.0,
                        currentTime: getCurrentTimestamp,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 80.0,
                      child: custom_widgets.ShowTimeDash(
                        width: double.infinity,
                        height: 80.0,
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
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: LatLng(0.0, 0.0));
                                  var _shouldSetState = false;
                                  HapticFeedback.mediumImpact();
                                  if (!(FFAppState().isFromAuthenPage ||
                                      FFAppState().isFromSetPinPage)) {
                                    Navigator.pop(context);

                                    context.goNamed('PinCodePage');

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x00000000),
                                    context: context,
                                    builder: (bottomSheetContext) {
                                      return GestureDetector(
                                        onTap: () => FocusScope.of(context)
                                            .requestFocus(_unfocusNode),
                                        child: Padding(
                                          padding:
                                              MediaQuery.of(bottomSheetContext)
                                                  .viewInsets,
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingSceneWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));

                                  _model.checkDeviceLocSerLogout =
                                      await actions.a1();
                                  _shouldSetState = true;
                                  if (!_model.checkDeviceLocSerLogout!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content:
                                              Text('กรุณาเปิดGPSเพื่อทำรายการ'),
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
                                  _model.checkDeviceLocPerLogout =
                                      await actions.a2();
                                  _shouldSetState = true;
                                  if (!_model.checkDeviceLocPerLogout!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text(
                                              'กรุณาให้อรุณสวัสดิ์เข้าถึงGPSของคุณ'),
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
                                  _model.checkLatLngLogout = await actions.a8(
                                    currentUserLocationValue,
                                  );
                                  _shouldSetState = true;
                                  if (!_model.checkLatLngLogout!) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content:
                                              Text('กรุณาเปิดGPSเพื่อทำรายการ'),
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
                                  _model.logoutAction =
                                      await LogoutAPICall.call(
                                    token: FFAppState().accessToken,
                                    apiUrl: FFAppState().apiURLLocalState,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.logoutAction?.statusCode ??
                                          200) !=
                                      200) {
                                    if (!((LogoutAPICall.message(
                                              (_model.logoutAction?.jsonBody ??
                                                  ''),
                                            ).toString() ==
                                            'The token has been blacklisted') ||
                                        (LogoutAPICall.message(
                                              (_model.logoutAction?.jsonBody ??
                                                  ''),
                                            ).toString() ==
                                            'Token Signature could not be verified.'))) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด (${(_model.logoutAction?.statusCode ?? 200).toString()})'),
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
                                    FFAppState().update(() {
                                      FFAppState().loginStateFirebase =
                                          '[loginStateFirebase]';
                                      FFAppState().deleteAccessToken();
                                      FFAppState().accessToken = 'access_token';
                                    });
                                    FFAppState().update(() {
                                      FFAppState().deleteEmployeeID();
                                      FFAppState().employeeID = 'employee_id';

                                      FFAppState().QRCodeLink = 'qrcode_link';
                                    });
                                    FFAppState().update(() {
                                      FFAppState().deleteApiURLLocalState();
                                      FFAppState().apiURLLocalState =
                                          'api_url_local_state';

                                      FFAppState().deleteBranchCode();
                                      FFAppState().branchCode = 'branch_code';
                                    });
                                    FFAppState().update(() {
                                      FFAppState().isFromSetPinPage = false;
                                      FFAppState().leadChannelColor = [];
                                    });
                                    FFAppState().update(() {
                                      FFAppState().leadChannelList = [];
                                      FFAppState().isFromLoginPage = false;
                                    });
                                    FFAppState().update(() {
                                      FFAppState().deletePinCodeAuthen();
                                      FFAppState().pinCodeAuthen = '013972';

                                      FFAppState().isFromAuthenPage = false;
                                    });
                                    FFAppState().update(() {
                                      FFAppState().deleteDateDoNotShowAgain();
                                      FFAppState().dateDoNotShowAgain = null;

                                      FFAppState().deleteDoNotShowAgain();
                                      FFAppState().doNotShowAgain = false;
                                    });
                                    FFAppState().update(() {
                                      FFAppState().inAppViaNotification = true;
                                      FFAppState().isInApp = false;
                                    });
                                    FFAppState().update(() {
                                      FFAppState().fcmToken = 'fcm_token';
                                      FFAppState().isPassLoginSection = false;
                                    });
                                    Navigator.pop(context);
                                    await actions.a22();

                                    context.goNamed('LoginPage');

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  final userLogCreateData =
                                      createUserLogRecordData(
                                    employeeId: FFAppState().employeeID,
                                    action: 'Logout',
                                    actionTime: getCurrentTimestamp,
                                    userLocation: currentUserLocationValue,
                                  );
                                  var userLogRecordReference =
                                      UserLogRecord.collection.doc();
                                  await userLogRecordReference
                                      .set(userLogCreateData);
                                  _model.createdUserLogLogout =
                                      UserLogRecord.getDocumentFromData(
                                          userLogCreateData,
                                          userLogRecordReference);
                                  _shouldSetState = true;
                                  FFAppState().update(() {
                                    FFAppState().loginStateFirebase =
                                        '[loginStateFirebase]';
                                    FFAppState().deleteAccessToken();
                                    FFAppState().accessToken = 'access_token';
                                  });
                                  FFAppState().update(() {
                                    FFAppState().deleteEmployeeID();
                                    FFAppState().employeeID = 'employee_id';

                                    FFAppState().QRCodeLink = 'qrcode_link';
                                  });
                                  FFAppState().update(() {
                                    FFAppState().deleteApiURLLocalState();
                                    FFAppState().apiURLLocalState =
                                        'api_url_local_state';

                                    FFAppState().deleteBranchCode();
                                    FFAppState().branchCode = 'branch_code';
                                  });
                                  FFAppState().update(() {
                                    FFAppState().isFromSetPinPage = false;
                                    FFAppState().leadChannelColor = [];
                                  });
                                  FFAppState().update(() {
                                    FFAppState().leadChannelList = [];
                                    FFAppState().isFromLoginPage = false;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().deletePinCodeAuthen();
                                    FFAppState().pinCodeAuthen = '013972';

                                    FFAppState().isFromAuthenPage = false;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().deleteDateDoNotShowAgain();
                                    FFAppState().dateDoNotShowAgain = null;

                                    FFAppState().deleteDoNotShowAgain();
                                    FFAppState().doNotShowAgain = false;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().inAppViaNotification = true;
                                    FFAppState().isInApp = false;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().fcmToken = 'fcm_token';
                                    FFAppState().isPassLoginSection = false;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().leadID = [];
                                    FFAppState().leadCreatedTimeList = [];
                                  });
                                  FFAppState().update(() {
                                    FFAppState().leadCustomerNameList = [];
                                    FFAppState().leadChannelList = [];
                                  });
                                  FFAppState().update(() {
                                    FFAppState().leadChannelColor = [];
                                    FFAppState().leadCallStatus = [];
                                  });
                                  FFAppState().update(() {
                                    FFAppState().leadPhoneNumberList = [];
                                    FFAppState().leadEmployeeID = [];
                                  });
                                  FFAppState().update(() {
                                    FFAppState().leadChannelLabelColor = [];
                                    FFAppState().deleteLeadIdCalledInApp();
                                    FFAppState().leadIdCalledInApp = [];
                                  });
                                  FFAppState().update(() {
                                    FFAppState().leadBranchCode = [];
                                    FFAppState().leadUserLevel =
                                        'lead_user_level';
                                  });
                                  FFAppState().update(() {
                                    FFAppState().leadChannelAmountList = [];
                                  });
                                  Navigator.pop(context);
                                  await actions.a22();

                                  context.goNamed('LoginPage');

                                  if (_shouldSetState) setState(() {});
                                },
                                child: ListTile(
                                  title: Text(
                                    'ออกจากระบบ',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                  ),
                                  trailing: FaIcon(
                                    FontAwesomeIcons.signOutAlt,
                                    color: Colors.white,
                                    size: 20.0,
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
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      );
                    }
                    List<UserCustomRecord> containerUserCustomRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerUserCustomRecord =
                        containerUserCustomRecordList.isNotEmpty
                            ? containerUserCustomRecordList.first
                            : null;
                    return Container(
                      width: double.infinity,
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -0.2),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 80.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.asset(
                                    'assets/images/8czKzxdqi-2.png',
                                  ).image,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    functions.greetingTextSuperApp(
                                        FFAppState().userNickname),
                                    '[greeting_text]',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
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
                              width: 64.0,
                              height: 64.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    valueOrDefault<String>(
                                      containerUserCustomRecord!.imgProfile,
                                      'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                    ),
                                  ),
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                  child: Icon(
                                    Icons.dehaze,
                                    color: Color(0xFFFF8700),
                                    size: 30.0,
                                  ),
                                ).animateOnPageLoad(
                                    animationsMap['iconOnPageLoadAnimation']!),
                                StreamBuilder<List<NotificationRecord>>(
                                  stream: queryNotificationRecord(
                                    parent:
                                        containerUserCustomRecord!.reference,
                                    queryBuilder: (notificationRecord) =>
                                        notificationRecord.where('noti_is_read',
                                            isEqualTo: false),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      );
                                    }
                                    List<NotificationRecord>
                                        badgeNotificationRecordList =
                                        snapshot.data!;
                                    return badges.Badge(
                                      badgeContent: Text(
                                        badgeNotificationRecordList.length
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                      ),
                                      showBadge:
                                          badgeNotificationRecordList.length >
                                              0,
                                      shape: badges.BadgeShape.circle,
                                      badgeColor: Color(0xFFFF0005),
                                      elevation: 4.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      position: badges.BadgePosition.topEnd(),
                                      animationType:
                                          badges.BadgeAnimationType.scale,
                                      toAnimate: true,
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 50.0,
                                        icon: Icon(
                                          Icons.notifications,
                                          color: Color(0xFFFF8700),
                                          size: 40.0,
                                        ),
                                        onPressed: () async {
                                          HapticFeedback.mediumImpact();
                                          if (!(FFAppState().isFromAuthenPage ||
                                              FFAppState().isFromSetPinPage)) {
                                            Navigator.pop(context);

                                            context.goNamed('PinCodePage');

                                            return;
                                          }
                                          if (badgeNotificationRecordList
                                                  .length >
                                              0) {
                                            await actions.batchUpdate(
                                              containerUserCustomRecord!
                                                  .reference,
                                            );
                                          }

                                          context.goNamed(
                                              'NotificationDetailPage');
                                        },
                                      ).animateOnPageLoad(animationsMap[
                                          'iconButtonOnPageLoadAnimation']!),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                if (responsiveVisibility(
                  context: context,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Container(
                    width: double.infinity,
                    height: 255.0,
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
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          );
                        }
                        List<ArunSawadImgBannerRecord>
                            pageViewBannerArunSawadImgBannerRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final pageViewBannerArunSawadImgBannerRecord =
                            pageViewBannerArunSawadImgBannerRecordList
                                    .isNotEmpty
                                ? pageViewBannerArunSawadImgBannerRecordList
                                    .first
                                : null;
                        return Builder(
                          builder: (context) {
                            final bannerImgList =
                                pageViewBannerArunSawadImgBannerRecord!.imgUrl!
                                    .toList();
                            return Container(
                              width: double.infinity,
                              height: 300.0,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 40.0),
                                    child: PageView.builder(
                                      controller: _model
                                              .pageViewBannerController ??=
                                          PageController(
                                              initialPage: min(
                                                  0, bannerImgList.length - 1)),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: bannerImgList.length,
                                      itemBuilder:
                                          (context, bannerImgListIndex) {
                                        final bannerImgListItem =
                                            bannerImgList[bannerImgListIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (pageViewBannerArunSawadImgBannerRecord!
                                                        .linkUrl!
                                                        .toList()[
                                                    bannerImgListIndex] !=
                                                'Hello World') {
                                              if (pageViewBannerArunSawadImgBannerRecord!
                                                          .isHaveLink!
                                                          .toList()[
                                                      bannerImgListIndex] !=
                                                  true) {
                                                await launchURL(
                                                    pageViewBannerArunSawadImgBannerRecord!
                                                            .linkUrl!
                                                            .toList()[
                                                        bannerImgListIndex]);
                                              } else {
                                                await actions
                                                    .openTableauBrowser(
                                                  FFAppState().accessToken,
                                                  pageViewBannerArunSawadImgBannerRecord!
                                                          .linkUrl!
                                                          .toList()[
                                                      bannerImgListIndex],
                                                );
                                              }
                                            }
                                          },
                                          child: CachedNetworkImage(
                                            imageUrl: bannerImgListItem,
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller: _model
                                                .pageViewBannerController ??=
                                            PageController(
                                                initialPage: min(0,
                                                    bannerImgList.length - 1)),
                                        count: bannerImgList.length,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) async {
                                          await _model.pageViewBannerController!
                                              .animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        effect: smooth_page_indicator
                                            .ExpandingDotsEffect(
                                          expansionFactor: 2.0,
                                          spacing: 8.0,
                                          radius: 16.0,
                                          dotWidth: 16.0,
                                          dotHeight: 16.0,
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
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                ))
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.36,
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
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          );
                        }
                        List<ArunSawadImgBannerRecord>
                            pageViewArunSawadImgBannerRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
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
                              height: 300.0,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 40.0),
                                    child: PageView.builder(
                                      controller: _model.pageViewController1 ??=
                                          PageController(
                                              initialPage: min(
                                                  0, bannerImgList.length - 1)),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: bannerImgList.length,
                                      itemBuilder:
                                          (context, bannerImgListIndex) {
                                        final bannerImgListItem =
                                            bannerImgList[bannerImgListIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (pageViewArunSawadImgBannerRecord!
                                                        .linkUrl!
                                                        .toList()[
                                                    bannerImgListIndex] !=
                                                'Hello World') {
                                              if (pageViewArunSawadImgBannerRecord!
                                                          .isHaveLink!
                                                          .toList()[
                                                      bannerImgListIndex] !=
                                                  true) {
                                                await launchURL(
                                                    pageViewArunSawadImgBannerRecord!
                                                            .linkUrl!
                                                            .toList()[
                                                        bannerImgListIndex]);
                                              } else {
                                                await actions
                                                    .openTableauBrowser(
                                                  FFAppState().accessToken,
                                                  pageViewArunSawadImgBannerRecord!
                                                          .linkUrl!
                                                          .toList()[
                                                      bannerImgListIndex],
                                                );
                                              }
                                            }
                                          },
                                          child: CachedNetworkImage(
                                            imageUrl: bannerImgListItem,
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: smooth_page_indicator
                                          .SmoothPageIndicator(
                                        controller: _model
                                                .pageViewController1 ??=
                                            PageController(
                                                initialPage: min(0,
                                                    bannerImgList.length - 1)),
                                        count: bannerImgList.length,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) async {
                                          await _model.pageViewController1!
                                              .animateToPage(
                                            i,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        effect: smooth_page_indicator
                                            .ExpandingDotsEffect(
                                          expansionFactor: 2.0,
                                          spacing: 8.0,
                                          radius: 16.0,
                                          dotWidth: 16.0,
                                          dotHeight: 16.0,
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
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: FutureBuilder<List<AuthorizationRecord>>(
                      future: queryAuthorizationRecordOnce(
                        queryBuilder: (authorizationRecord) =>
                            authorizationRecord.where('content_name',
                                isEqualTo: 'kpi_ceo'),
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
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          );
                        }
                        List<AuthorizationRecord>
                            containerAuthorizationRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final containerAuthorizationRecord =
                            containerAuthorizationRecordList.isNotEmpty
                                ? containerAuthorizationRecordList.first
                                : null;
                        return Container(
                          width: double.infinity,
                          height: 800.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFFF8100), Color(0xFFFFC38A)],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.14, -1.0),
                              end: AlignmentDirectional(-0.14, 1.0),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                          ),
                          child: FutureBuilder<List<AuthorizationRecord>>(
                            future: queryAuthorizationRecordOnce(
                              queryBuilder: (authorizationRecord) =>
                                  authorizationRecord.where('content_name',
                                      isEqualTo: 'kpi_menu'),
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              List<AuthorizationRecord>
                                  stackAuthorizationRecordList = snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final stackAuthorizationRecord =
                                  stackAuthorizationRecordList.isNotEmpty
                                      ? stackAuthorizationRecordList.first
                                      : null;
                              return Stack(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 30.0, 10.0, 0.0),
                                            child: FutureBuilder<
                                                List<UserCustomRecord>>(
                                              future: queryUserCustomRecordOnce(
                                                queryBuilder: (userCustomRecord) =>
                                                    userCustomRecord.where(
                                                        'employee_id',
                                                        isEqualTo: FFAppState()
                                                                    .employeeID !=
                                                                ''
                                                            ? FFAppState()
                                                                .employeeID
                                                            : null),
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UserCustomRecord>
                                                    containerUserCustomRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final containerUserCustomRecord =
                                                    containerUserCustomRecordList
                                                            .isNotEmpty
                                                        ? containerUserCustomRecordList
                                                            .first
                                                        : null;
                                                return Container(
                                                  width: double.infinity,
                                                  height: 300.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    20.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'บริการ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 20.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 500.0,
                                                          child: Stack(
                                                            children: [
                                                              PageView(
                                                                controller: _model
                                                                        .pageViewController2 ??=
                                                                    PageController(
                                                                        initialPage:
                                                                            0),
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            18.0,
                                                                            12.0,
                                                                            10.0),
                                                                    child:
                                                                        GridView(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            3,
                                                                        crossAxisSpacing:
                                                                            10.0,
                                                                        mainAxisSpacing:
                                                                            0.0,
                                                                        childAspectRatio:
                                                                            1.2,
                                                                      ),
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginCheckin =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginCheckin?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginCheckin?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginCheckin?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginCheckin?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('DashboardCheckin');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/google-maps-new-interface1.jpg',
                                                                                      fit: BoxFit.fitHeight,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'เช็คอิน',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginLeavePage =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginLeavePage?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginLeavePage?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginLeavePage?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginLeavePage?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('DashboardLeavePage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                StreamBuilder<List<NotificationRecord>>(
                                                                                  stream: queryNotificationRecord(
                                                                                    parent: containerUserCustomRecord!.reference,
                                                                                    queryBuilder: (notificationRecord) => notificationRecord.where('noti_type', isEqualTo: 'Leave_Request').where('this_noti_is_read', isEqualTo: false),
                                                                                  ),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          child: CircularProgressIndicator(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<NotificationRecord> badgeNotificationRecordList = snapshot.data!;
                                                                                    return badges.Badge(
                                                                                      badgeContent: Text(
                                                                                        badgeNotificationRecordList.length.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                      ),
                                                                                      showBadge: badgeNotificationRecordList.length > 0,
                                                                                      shape: badges.BadgeShape.circle,
                                                                                      badgeColor: Color(0xFFFF0005),
                                                                                      elevation: 4.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                      position: badges.BadgePosition.topEnd(),
                                                                                      animationType: badges.BadgeAnimationType.scale,
                                                                                      toAnimate: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: Container(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: Image.asset(
                                                                                            'assets/images/calender_1.png',
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                Text(
                                                                                  'ขออนุมัติลา',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if ((FFAppState().branchCode !=
                                                                                'HO') ||
                                                                            functions.checkIsHaveThisValueInList(stackAuthorizationRecord!.employeeIdList!.toList(),
                                                                                FFAppState().employeeID)!)
                                                                          FutureBuilder<List<UrlLinkStorageRecord>>(
                                                                            future:
                                                                                queryUrlLinkStorageRecordOnce(
                                                                              queryBuilder: (urlLinkStorageRecord) => urlLinkStorageRecord.where('url_name',
                                                                                  isEqualTo: FFAppState().profileLevel == 'ภาค'
                                                                                      ? 'tableau_url_link'
                                                                                      : 'tableau_area_url_link' != ''
                                                                                          ? FFAppState().profileLevel == 'ภาค'
                                                                                              ? 'tableau_url_link'
                                                                                              : 'tableau_area_url_link'
                                                                                          : null),
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
                                                                                    child: CircularProgressIndicator(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<UrlLinkStorageRecord> containerUrlLinkStorageRecordList = snapshot.data!;
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final containerUrlLinkStorageRecord = containerUrlLinkStorageRecordList.isNotEmpty ? containerUrlLinkStorageRecordList.first : null;
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  var _shouldSetState = false;
                                                                                  HapticFeedback.mediumImpact();
                                                                                  if (!(FFAppState().isFromAuthenPage || FFAppState().isFromSetPinPage)) {
                                                                                    Navigator.pop(context);

                                                                                    context.goNamed('PinCodePage');

                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }
                                                                                  showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    context: context,
                                                                                    builder: (bottomSheetContext) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                          child: Container(
                                                                                            height: double.infinity,
                                                                                            child: LoadingSceneWidget(),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));

                                                                                  _model.checkLoginKPI = await ActionUserAPICall.call(
                                                                                    token: FFAppState().accessToken,
                                                                                    apiUrl: FFAppState().apiURLLocalState,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  if ((_model.checkLoginKPI?.statusCode ?? 200) != 200) {
                                                                                    if (!((ActionUserAPICall.message(
                                                                                              (_model.checkLoginKPI?.jsonBody ?? ''),
                                                                                            ).toString() ==
                                                                                            'The token has been blacklisted') ||
                                                                                        (ActionUserAPICall.message(
                                                                                              (_model.checkLoginKPI?.jsonBody ?? ''),
                                                                                            ).toString() ==
                                                                                            'Token Signature could not be verified.'))) {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            content: Text('พบข้อผิดพลาด (${(_model.checkLoginKPI?.statusCode ?? 200).toString()})'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: Text('Ok'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          content: Text('Session Loginหมดอายุ'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                      FFAppState().deleteAccessToken();
                                                                                      FFAppState().accessToken = 'access_token';
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deleteEmployeeID();
                                                                                      FFAppState().employeeID = 'employee_id';

                                                                                      FFAppState().QRCodeLink = 'qrcode_link';
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deleteApiURLLocalState();
                                                                                      FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                      FFAppState().deleteBranchCode();
                                                                                      FFAppState().branchCode = 'branch_code';
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().isFromSetPinPage = false;
                                                                                      FFAppState().leadChannelColor = [];
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().leadChannelList = [];
                                                                                      FFAppState().isFromLoginPage = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deletePinCodeAuthen();
                                                                                      FFAppState().pinCodeAuthen = '013972';

                                                                                      FFAppState().isFromAuthenPage = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deleteDateDoNotShowAgain();
                                                                                      FFAppState().dateDoNotShowAgain = null;

                                                                                      FFAppState().deleteDoNotShowAgain();
                                                                                      FFAppState().doNotShowAgain = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().inAppViaNotification = true;
                                                                                      FFAppState().isInApp = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().fcmToken = 'fcm_token';
                                                                                      FFAppState().isPassLoginSection = false;
                                                                                    });
                                                                                    Navigator.pop(context);
                                                                                    await actions.a22();

                                                                                    context.goNamed('LoginPage');

                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }
                                                                                  if (functions.checkIsHaveThisValueInList(containerAuthorizationRecord!.employeeIdList!.toList(), FFAppState().employeeID)!) {
                                                                                    Navigator.pop(context);

                                                                                    context.goNamed('EmployeeKpiCEOPage');
                                                                                  } else {
                                                                                    Navigator.pop(context);
                                                                                    if (FFAppState().profileLevel == 'ภาค') {
                                                                                      await actions.openTableauBrowser(
                                                                                        FFAppState().accessToken,
                                                                                        containerUrlLinkStorageRecord!.urlLink,
                                                                                      );
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }
                                                                                    if (FFAppState().profileLevel == 'เขต') {
                                                                                      await actions.openTableauBrowser(
                                                                                        FFAppState().accessToken,
                                                                                        containerUrlLinkStorageRecord!.urlLink,
                                                                                      );
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }

                                                                                    context.goNamed('EmployeeKPIPage');
                                                                                  }

                                                                                  if (_shouldSetState) setState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  width: 100.0,
                                                                                  height: 100.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: Container(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: Image.asset(
                                                                                            'assets/images/icon_kpi.jpg',
                                                                                            fit: BoxFit.contain,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'KPI',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              fontSize: 12.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        if ((FFAppState().branchCode !=
                                                                                'HO') ||
                                                                            functions.checkIsHaveThisValueInList(stackAuthorizationRecord!.employeeIdList!.toList(),
                                                                                FFAppState().employeeID)!)
                                                                          FutureBuilder<List<AuthorizationRecord>>(
                                                                            future:
                                                                                queryAuthorizationRecordOnce(
                                                                              queryBuilder: (authorizationRecord) => authorizationRecord.where('content_name', isEqualTo: 'welfare_kpi_ceo'),
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
                                                                                    child: CircularProgressIndicator(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<AuthorizationRecord> containerWelfareAuthorizationRecordList = snapshot.data!;
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final containerWelfareAuthorizationRecord = containerWelfareAuthorizationRecordList.isNotEmpty ? containerWelfareAuthorizationRecordList.first : null;
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  var _shouldSetState = false;
                                                                                  HapticFeedback.mediumImpact();
                                                                                  if (!(FFAppState().isFromAuthenPage || FFAppState().isFromSetPinPage)) {
                                                                                    Navigator.pop(context);

                                                                                    context.goNamed('PinCodePage');

                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }
                                                                                  showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    context: context,
                                                                                    builder: (bottomSheetContext) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                          child: Container(
                                                                                            height: double.infinity,
                                                                                            child: LoadingSceneWidget(),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));

                                                                                  _model.checkLoginKPIWelfare = await ActionUserAPICall.call(
                                                                                    token: FFAppState().accessToken,
                                                                                    apiUrl: FFAppState().apiURLLocalState,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  if ((_model.checkLoginKPIWelfare?.statusCode ?? 200) != 200) {
                                                                                    if (!((ActionUserAPICall.message(
                                                                                              (_model.checkLoginKPIWelfare?.jsonBody ?? ''),
                                                                                            ).toString() ==
                                                                                            'The token has been blacklisted') ||
                                                                                        (ActionUserAPICall.message(
                                                                                              (_model.checkLoginKPIWelfare?.jsonBody ?? ''),
                                                                                            ).toString() ==
                                                                                            'Token Signature could not be verified.'))) {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            content: Text('พบข้อผิดพลาด (${(_model.checkLoginKPIWelfare?.statusCode ?? 200).toString()})'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: Text('Ok'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          content: Text('Session Loginหมดอายุ'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                      FFAppState().deleteAccessToken();
                                                                                      FFAppState().accessToken = 'access_token';
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deleteEmployeeID();
                                                                                      FFAppState().employeeID = 'employee_id';

                                                                                      FFAppState().QRCodeLink = 'qrcode_link';
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deleteApiURLLocalState();
                                                                                      FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                      FFAppState().deleteBranchCode();
                                                                                      FFAppState().branchCode = 'branch_code';
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().isFromSetPinPage = false;
                                                                                      FFAppState().leadChannelColor = [];
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().leadChannelList = [];
                                                                                      FFAppState().isFromLoginPage = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deletePinCodeAuthen();
                                                                                      FFAppState().pinCodeAuthen = '013972';

                                                                                      FFAppState().isFromAuthenPage = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deleteDateDoNotShowAgain();
                                                                                      FFAppState().dateDoNotShowAgain = null;

                                                                                      FFAppState().deleteDoNotShowAgain();
                                                                                      FFAppState().doNotShowAgain = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().inAppViaNotification = true;
                                                                                      FFAppState().isInApp = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().fcmToken = 'fcm_token';
                                                                                      FFAppState().isPassLoginSection = false;
                                                                                    });
                                                                                    Navigator.pop(context);
                                                                                    await actions.a22();

                                                                                    context.goNamed('LoginPage');

                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }
                                                                                  if (functions.checkIsHaveThisValueInList(containerWelfareAuthorizationRecord!.employeeIdList!.toList(), FFAppState().employeeID)!) {
                                                                                    Navigator.pop(context);

                                                                                    context.goNamed('WelfareKPICEOPage');
                                                                                  } else {
                                                                                    Navigator.pop(context);

                                                                                    context.goNamed('WelfareKPIPage');
                                                                                  }

                                                                                  if (_shouldSetState) setState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  width: 100.0,
                                                                                  height: 100.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: Container(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: Image.asset(
                                                                                            'assets/images/KPI.jpg',
                                                                                            fit: BoxFit.contain,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'ยอดจัดสาขา',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              fontSize: 12.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        FutureBuilder<
                                                                            List<UrlLinkStorageRecord>>(
                                                                          future:
                                                                              queryUrlLinkStorageRecordOnce(
                                                                            queryBuilder: (urlLinkStorageRecord) => urlLinkStorageRecord.where('url_name',
                                                                                isEqualTo: functions.checkIsHaveThisValueInList(containerAuthorizationRecord!.employeeIdList!.toList(), FFAppState().employeeID)!
                                                                                    ? 'tableau_thaipaiboon_ceo'
                                                                                    : 'tableau_thaipaiboon' != ''
                                                                                        ? functions.checkIsHaveThisValueInList(containerAuthorizationRecord!.employeeIdList!.toList(), FFAppState().employeeID)!
                                                                                            ? 'tableau_thaipaiboon_ceo'
                                                                                            : 'tableau_thaipaiboon'
                                                                                        : null),
                                                                            singleRecord:
                                                                                true,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<UrlLinkStorageRecord>
                                                                                containerUrlLinkStorageRecordList =
                                                                                snapshot.data!;
                                                                            // Return an empty Container when the item does not exist.
                                                                            if (snapshot.data!.isEmpty) {
                                                                              return Container();
                                                                            }
                                                                            final containerUrlLinkStorageRecord = containerUrlLinkStorageRecordList.isNotEmpty
                                                                                ? containerUrlLinkStorageRecordList.first
                                                                                : null;
                                                                            return InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                var _shouldSetState = false;
                                                                                HapticFeedback.mediumImpact();
                                                                                if (!(FFAppState().isFromAuthenPage || FFAppState().isFromSetPinPage)) {
                                                                                  Navigator.pop(context);

                                                                                  context.goNamed('PinCodePage');

                                                                                  if (_shouldSetState) setState(() {});
                                                                                  return;
                                                                                }
                                                                                showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: Color(0x00000000),
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (bottomSheetContext) {
                                                                                    return GestureDetector(
                                                                                      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                        child: Container(
                                                                                          height: double.infinity,
                                                                                          child: LoadingSceneWidget(),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));

                                                                                _model.checkLoginThaiPaiboon = await ActionUserAPICall.call(
                                                                                  token: FFAppState().accessToken,
                                                                                  apiUrl: FFAppState().apiURLLocalState,
                                                                                );
                                                                                _shouldSetState = true;
                                                                                if ((_model.checkLoginThaiPaiboon?.statusCode ?? 200) != 200) {
                                                                                  if (!((ActionUserAPICall.message(
                                                                                            (_model.checkLoginThaiPaiboon?.jsonBody ?? ''),
                                                                                          ).toString() ==
                                                                                          'The token has been blacklisted') ||
                                                                                      (ActionUserAPICall.message(
                                                                                            (_model.checkLoginThaiPaiboon?.jsonBody ?? ''),
                                                                                          ).toString() ==
                                                                                          'Token Signature could not be verified.'))) {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          content: Text('พบข้อผิดพลาด (${(_model.checkLoginThaiPaiboon?.statusCode ?? 200).toString()})'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        content: Text('Session Loginหมดอายุ'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                    FFAppState().deleteAccessToken();
                                                                                    FFAppState().accessToken = 'access_token';
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().deleteEmployeeID();
                                                                                    FFAppState().employeeID = 'employee_id';

                                                                                    FFAppState().QRCodeLink = 'qrcode_link';
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().deleteApiURLLocalState();
                                                                                    FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                    FFAppState().deleteBranchCode();
                                                                                    FFAppState().branchCode = 'branch_code';
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().isFromSetPinPage = false;
                                                                                    FFAppState().leadChannelColor = [];
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().leadChannelList = [];
                                                                                    FFAppState().isFromLoginPage = false;
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().deletePinCodeAuthen();
                                                                                    FFAppState().pinCodeAuthen = '013972';

                                                                                    FFAppState().isFromAuthenPage = false;
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().deleteDateDoNotShowAgain();
                                                                                    FFAppState().dateDoNotShowAgain = null;

                                                                                    FFAppState().deleteDoNotShowAgain();
                                                                                    FFAppState().doNotShowAgain = false;
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().inAppViaNotification = true;
                                                                                    FFAppState().isInApp = false;
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().fcmToken = 'fcm_token';
                                                                                    FFAppState().isPassLoginSection = false;
                                                                                  });
                                                                                  Navigator.pop(context);
                                                                                  await actions.a22();

                                                                                  context.goNamed('LoginPage');

                                                                                  if (_shouldSetState) setState(() {});
                                                                                  return;
                                                                                }
                                                                                Navigator.pop(context);
                                                                                if (functions.checkIsHaveThisValueInList(containerAuthorizationRecord!.employeeIdList!.toList(), FFAppState().employeeID)!) {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    isDismissible: false,
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (bottomSheetContext) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                          child: Container(
                                                                                            height: MediaQuery.of(context).size.height * 0.6,
                                                                                            child: SearchEmployeeComponentWidget(
                                                                                              tableauUrlLink: containerUrlLinkStorageRecord!.urlLink,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                } else {
                                                                                  await actions.openTableauBrowser(
                                                                                    FFAppState().accessToken,
                                                                                    containerUrlLinkStorageRecord!.urlLink,
                                                                                  );
                                                                                }

                                                                                if (_shouldSetState) setState(() {});
                                                                              },
                                                                              child: Container(
                                                                                width: 100.0,
                                                                                height: 100.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                      child: Container(
                                                                                        width: 50.0,
                                                                                        height: 50.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/tpb.jpeg',
                                                                                          fit: BoxFit.contain,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      'ยอดประกัน',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            fontSize: 12.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginCheckLead =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginCheckLead?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginCheckLead?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginCheckLead?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginCheckLead?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            await actions.batchUpdate2(
                                                                              containerUserCustomRecord!.reference,
                                                                              'Lead',
                                                                            );
                                                                            Navigator.pop(context);

                                                                            context.goNamed('LeadNotiPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                StreamBuilder<List<NotificationRecord>>(
                                                                                  stream: queryNotificationRecord(
                                                                                    parent: containerUserCustomRecord!.reference,
                                                                                    queryBuilder: (notificationRecord) => notificationRecord.where('noti_type', isEqualTo: 'Lead').where('this_noti_is_read', isEqualTo: false),
                                                                                  ),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          child: CircularProgressIndicator(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<NotificationRecord> badgeNotificationRecordList = snapshot.data!;
                                                                                    return badges.Badge(
                                                                                      badgeContent: Text(
                                                                                        badgeNotificationRecordList.length.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                      ),
                                                                                      showBadge: badgeNotificationRecordList.length > 0,
                                                                                      shape: badges.BadgeShape.circle,
                                                                                      badgeColor: Color(0xFFFF0000),
                                                                                      elevation: 4.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                      position: badges.BadgePosition.topEnd(),
                                                                                      animationType: badges.BadgeAnimationType.scale,
                                                                                      toAnimate: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: Container(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: Image.asset(
                                                                                            'assets/images/webpc-passthru.webp',
                                                                                            fit: BoxFit.fitHeight,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                Text(
                                                                                  'รายชื่อลีด',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
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
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            18.0,
                                                                            12.0,
                                                                            10.0),
                                                                    child:
                                                                        GridView(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            3,
                                                                        crossAxisSpacing:
                                                                            10.0,
                                                                        mainAxisSpacing:
                                                                            0.0,
                                                                        childAspectRatio:
                                                                            1.2,
                                                                      ),
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            currentUserLocationValue =
                                                                                await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginBranchView =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginBranchView?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginBranchView?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginBranchView?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginBranchView?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }

                                                                            final userLogCreateData =
                                                                                createUserLogRecordData(
                                                                              employeeId: FFAppState().employeeID,
                                                                              action: 'Branch_View',
                                                                              actionTime: getCurrentTimestamp,
                                                                              userLocation: currentUserLocationValue,
                                                                            );
                                                                            var userLogRecordReference =
                                                                                UserLogRecord.collection.doc();
                                                                            await userLogRecordReference.set(userLogCreateData);
                                                                            _model.createUserLogBranchView =
                                                                                UserLogRecord.getDocumentFromData(userLogCreateData, userLogRecordReference);
                                                                            _shouldSetState =
                                                                                true;
                                                                            Navigator.pop(context);

                                                                            context.goNamed('Dashboard');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/favicon-196.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Branch View',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginInsurance =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginInsurance?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginInsurance?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginInsurance?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginInsurance?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('CheckInsurancePage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/2022-11-03_10-22-14.jpg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'เช็คเบี้ยประกัน',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginQR =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginQR?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginQR?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginQR?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginQR?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('GenQRPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      'https://th.qr-code-generator.com/wp-content/themes/qr/new_structure/markets/basic_market/generator/dist/generator/assets/images/websiteQRCode_noFrame.png',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'QR พนักงาน',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginSaleskit =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginSaleskit?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginSaleskit?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginSaleskit?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginSaleskit?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('SaleskitPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/278-2784993_transparent-people-reading-png-sale-man-logo-png.png',
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Saleskit',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginFormLead =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginFormLead?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginFormLead?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginFormLead?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginFormLead?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('LeadSurveyRegisPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/istock_blossomstar_survey.jpg',
                                                                                      fit: BoxFit.fitHeight,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'ฟอร์มลีด',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginPromotion =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginPromotion?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginPromotion?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginPromotion?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginPromotion?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('PromotionPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/promo.png',
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'โปรโมชั่น',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
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
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            18.0,
                                                                            12.0,
                                                                            10.0),
                                                                    child:
                                                                        GridView(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            3,
                                                                        crossAxisSpacing:
                                                                            10.0,
                                                                        mainAxisSpacing:
                                                                            0.0,
                                                                        childAspectRatio:
                                                                            1.2,
                                                                      ),
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            currentUserLocationValue =
                                                                                await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginCoach =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginCoach?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginCoach?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginCoach?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginCoach?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }

                                                                            final userLogCreateData =
                                                                                createUserLogRecordData(
                                                                              employeeId: FFAppState().employeeID,
                                                                              action: 'COACH',
                                                                              actionTime: getCurrentTimestamp,
                                                                              userLocation: currentUserLocationValue,
                                                                            );
                                                                            var userLogRecordReference =
                                                                                UserLogRecord.collection.doc();
                                                                            await userLogRecordReference.set(userLogCreateData);
                                                                            _model.createdUserLogCoach =
                                                                                UserLogRecord.getDocumentFromData(userLogCreateData, userLogRecordReference);
                                                                            _shouldSetState =
                                                                                true;
                                                                            Navigator.pop(context);
                                                                            await launchURL('https://hris.srisawadpower.com/COACH');
                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/Screenshot_2022-10-17_095012.png',
                                                                                      fit: BoxFit.fitHeight,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'COACH',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginClassroom =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginClassroom?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginClassroom?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginClassroom?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginClassroom?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('ClassroomPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/ingenuity_wit_book_idea_light_bulb_learn_learning_icon_149691.png',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'ห้องเรียนทันใจ',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginITSupport =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginITSupport?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginITSupport?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginITSupport?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginITSupport?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('ITSupportPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/9288ca8e4f66c009d35e4cd5b409710a.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'ข้อมูลไอที',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
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
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: smooth_page_indicator
                                                                      .SmoothPageIndicator(
                                                                    controller: _model
                                                                            .pageViewController2 ??=
                                                                        PageController(
                                                                            initialPage:
                                                                                0),
                                                                    count: 3,
                                                                    axisDirection:
                                                                        Axis.horizontal,
                                                                    onDotClicked:
                                                                        (i) async {
                                                                      await _model
                                                                          .pageViewController2!
                                                                          .animateToPage(
                                                                        i,
                                                                        duration:
                                                                            Duration(milliseconds: 500),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );
                                                                    },
                                                                    effect: smooth_page_indicator
                                                                        .SlideEffect(
                                                                      spacing:
                                                                          8.0,
                                                                      radius:
                                                                          16.0,
                                                                      dotWidth:
                                                                          10.0,
                                                                      dotHeight:
                                                                          10.0,
                                                                      dotColor:
                                                                          Color(
                                                                              0xFF9E9E9E),
                                                                      activeDotColor:
                                                                          Color(
                                                                              0xFF3F51B5),
                                                                      paintStyle:
                                                                          PaintingStyle
                                                                              .fill,
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
                                                );
                                              },
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 30.0, 10.0, 0.0),
                                            child: FutureBuilder<
                                                List<UserCustomRecord>>(
                                              future: queryUserCustomRecordOnce(
                                                queryBuilder: (userCustomRecord) =>
                                                    userCustomRecord.where(
                                                        'employee_id',
                                                        isEqualTo: FFAppState()
                                                                    .employeeID !=
                                                                ''
                                                            ? FFAppState()
                                                                .employeeID
                                                            : null),
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UserCustomRecord>
                                                    containerUserCustomRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final containerUserCustomRecord =
                                                    containerUserCustomRecordList
                                                            .isNotEmpty
                                                        ? containerUserCustomRecordList
                                                            .first
                                                        : null;
                                                return Container(
                                                  width: double.infinity,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.4,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    20.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'บริการ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 32.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 500.0,
                                                          child: Stack(
                                                            children: [
                                                              PageView(
                                                                controller: _model
                                                                        .pageViewController3 ??=
                                                                    PageController(
                                                                        initialPage:
                                                                            0),
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            18.0,
                                                                            12.0,
                                                                            10.0),
                                                                    child:
                                                                        GridView(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            3,
                                                                        crossAxisSpacing:
                                                                            10.0,
                                                                        mainAxisSpacing:
                                                                            0.0,
                                                                        childAspectRatio:
                                                                            1.5,
                                                                      ),
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginCheckinTab =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginCheckinTab?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginCheckinTab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginCheckinTab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginCheckinTab?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('DashboardCheckin');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.1,
                                                                                    height: MediaQuery.of(context).size.width * 0.1,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/google-maps-new-interface1.jpg',
                                                                                      fit: BoxFit.fitHeight,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'เช็คอิน',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 20.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginLeavePagetab =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginLeavePagetab?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginLeavePagetab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginLeavePagetab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginLeavePagetab?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('DashboardLeavePage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                StreamBuilder<List<NotificationRecord>>(
                                                                                  stream: queryNotificationRecord(
                                                                                    parent: containerUserCustomRecord!.reference,
                                                                                    queryBuilder: (notificationRecord) => notificationRecord.where('noti_type', isEqualTo: 'Leave_Request').where('this_noti_is_read', isEqualTo: false),
                                                                                  ),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          child: CircularProgressIndicator(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<NotificationRecord> badgeNotificationRecordList = snapshot.data!;
                                                                                    return badges.Badge(
                                                                                      badgeContent: Text(
                                                                                        badgeNotificationRecordList.length.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                      ),
                                                                                      showBadge: badgeNotificationRecordList.length > 0,
                                                                                      shape: badges.BadgeShape.circle,
                                                                                      badgeColor: Color(0xFFFF0005),
                                                                                      elevation: 4.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                      position: badges.BadgePosition.topEnd(),
                                                                                      animationType: badges.BadgeAnimationType.scale,
                                                                                      toAnimate: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.of(context).size.width * 0.1,
                                                                                          height: MediaQuery.of(context).size.width * 0.1,
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: Image.asset(
                                                                                            'assets/images/calender_1.png',
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                Text(
                                                                                  'ขออนุมัติลา',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 20.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        if ((FFAppState().branchCode !=
                                                                                'HO') ||
                                                                            functions.checkIsHaveThisValueInList(stackAuthorizationRecord!.employeeIdList!.toList(),
                                                                                FFAppState().employeeID)!)
                                                                          FutureBuilder<List<UrlLinkStorageRecord>>(
                                                                            future:
                                                                                queryUrlLinkStorageRecordOnce(
                                                                              queryBuilder: (urlLinkStorageRecord) => urlLinkStorageRecord.where('url_name',
                                                                                  isEqualTo: FFAppState().profileLevel == 'ภาค'
                                                                                      ? 'tableau_url_link'
                                                                                      : 'tableau_area_url_link' != ''
                                                                                          ? FFAppState().profileLevel == 'ภาค'
                                                                                              ? 'tableau_url_link'
                                                                                              : 'tableau_area_url_link'
                                                                                          : null),
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
                                                                                    child: CircularProgressIndicator(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<UrlLinkStorageRecord> containerUrlLinkStorageRecordList = snapshot.data!;
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final containerUrlLinkStorageRecord = containerUrlLinkStorageRecordList.isNotEmpty ? containerUrlLinkStorageRecordList.first : null;
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  var _shouldSetState = false;
                                                                                  HapticFeedback.mediumImpact();
                                                                                  if (!(FFAppState().isFromAuthenPage || FFAppState().isFromSetPinPage)) {
                                                                                    Navigator.pop(context);

                                                                                    context.goNamed('PinCodePage');

                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }
                                                                                  showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    context: context,
                                                                                    builder: (bottomSheetContext) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                          child: Container(
                                                                                            height: double.infinity,
                                                                                            child: LoadingSceneWidget(),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));

                                                                                  _model.checkLoginKPItab = await ActionUserAPICall.call(
                                                                                    token: FFAppState().accessToken,
                                                                                    apiUrl: FFAppState().apiURLLocalState,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  if ((_model.checkLoginKPItab?.statusCode ?? 200) != 200) {
                                                                                    if (!((ActionUserAPICall.message(
                                                                                              (_model.checkLoginKPItab?.jsonBody ?? ''),
                                                                                            ).toString() ==
                                                                                            'The token has been blacklisted') ||
                                                                                        (ActionUserAPICall.message(
                                                                                              (_model.checkLoginKPItab?.jsonBody ?? ''),
                                                                                            ).toString() ==
                                                                                            'Token Signature could not be verified.'))) {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            content: Text('พบข้อผิดพลาด (${(_model.checkLoginKPItab?.statusCode ?? 200).toString()})'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: Text('Ok'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          content: Text('Session Loginหมดอายุ'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                      FFAppState().deleteAccessToken();
                                                                                      FFAppState().accessToken = 'access_token';
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deleteEmployeeID();
                                                                                      FFAppState().employeeID = 'employee_id';

                                                                                      FFAppState().QRCodeLink = 'qrcode_link';
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deleteApiURLLocalState();
                                                                                      FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                      FFAppState().deleteBranchCode();
                                                                                      FFAppState().branchCode = 'branch_code';
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().isFromSetPinPage = false;
                                                                                      FFAppState().leadChannelColor = [];
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().leadChannelList = [];
                                                                                      FFAppState().isFromLoginPage = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deletePinCodeAuthen();
                                                                                      FFAppState().pinCodeAuthen = '013972';

                                                                                      FFAppState().isFromAuthenPage = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deleteDateDoNotShowAgain();
                                                                                      FFAppState().dateDoNotShowAgain = null;

                                                                                      FFAppState().deleteDoNotShowAgain();
                                                                                      FFAppState().doNotShowAgain = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().inAppViaNotification = true;
                                                                                      FFAppState().isInApp = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().fcmToken = 'fcm_token';
                                                                                      FFAppState().isPassLoginSection = false;
                                                                                    });
                                                                                    Navigator.pop(context);
                                                                                    await actions.a22();

                                                                                    context.goNamed('LoginPage');

                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }
                                                                                  if (functions.checkIsHaveThisValueInList(containerAuthorizationRecord!.employeeIdList!.toList(), FFAppState().employeeID)!) {
                                                                                    Navigator.pop(context);

                                                                                    context.goNamed('EmployeeKpiCEOPage');
                                                                                  } else {
                                                                                    Navigator.pop(context);
                                                                                    if (FFAppState().profileLevel == 'ภาค') {
                                                                                      await actions.openTableauBrowser(
                                                                                        FFAppState().accessToken,
                                                                                        containerUrlLinkStorageRecord!.urlLink,
                                                                                      );
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }
                                                                                    if (FFAppState().profileLevel == 'เขต') {
                                                                                      await actions.openTableauBrowser(
                                                                                        FFAppState().accessToken,
                                                                                        containerUrlLinkStorageRecord!.urlLink,
                                                                                      );
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }

                                                                                    context.goNamed('EmployeeKPIPage');
                                                                                  }

                                                                                  if (_shouldSetState) setState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  width: 100.0,
                                                                                  height: 100.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.of(context).size.width * 0.1,
                                                                                          height: MediaQuery.of(context).size.width * 0.1,
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: Image.asset(
                                                                                            'assets/images/icon_kpi.jpg',
                                                                                            fit: BoxFit.contain,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'KPI',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              fontSize: 20.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        if ((FFAppState().branchCode !=
                                                                                'HO') ||
                                                                            functions.checkIsHaveThisValueInList(stackAuthorizationRecord!.employeeIdList!.toList(),
                                                                                FFAppState().employeeID)!)
                                                                          FutureBuilder<List<AuthorizationRecord>>(
                                                                            future:
                                                                                queryAuthorizationRecordOnce(
                                                                              queryBuilder: (authorizationRecord) => authorizationRecord.where('content_name', isEqualTo: 'welfare_kpi_ceo'),
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
                                                                                    child: CircularProgressIndicator(
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<AuthorizationRecord> containerWelfareTabAuthorizationRecordList = snapshot.data!;
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final containerWelfareTabAuthorizationRecord = containerWelfareTabAuthorizationRecordList.isNotEmpty ? containerWelfareTabAuthorizationRecordList.first : null;
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  var _shouldSetState = false;
                                                                                  HapticFeedback.mediumImpact();
                                                                                  if (!(FFAppState().isFromAuthenPage || FFAppState().isFromSetPinPage)) {
                                                                                    Navigator.pop(context);

                                                                                    context.goNamed('PinCodePage');

                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }
                                                                                  showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    context: context,
                                                                                    builder: (bottomSheetContext) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                          child: Container(
                                                                                            height: double.infinity,
                                                                                            child: LoadingSceneWidget(),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));

                                                                                  _model.checkLoginKPIWelfaretab = await ActionUserAPICall.call(
                                                                                    token: FFAppState().accessToken,
                                                                                    apiUrl: FFAppState().apiURLLocalState,
                                                                                  );
                                                                                  _shouldSetState = true;
                                                                                  if ((_model.checkLoginKPIWelfaretab?.statusCode ?? 200) != 200) {
                                                                                    if (!((ActionUserAPICall.message(
                                                                                              (_model.checkLoginKPIWelfaretab?.jsonBody ?? ''),
                                                                                            ).toString() ==
                                                                                            'The token has been blacklisted') ||
                                                                                        (ActionUserAPICall.message(
                                                                                              (_model.checkLoginKPIWelfaretab?.jsonBody ?? ''),
                                                                                            ).toString() ==
                                                                                            'Token Signature could not be verified.'))) {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            content: Text('พบข้อผิดพลาด (${(_model.checkLoginKPIWelfaretab?.statusCode ?? 200).toString()})'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: Text('Ok'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                      if (_shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          content: Text('Session Loginหมดอายุ'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                      FFAppState().deleteAccessToken();
                                                                                      FFAppState().accessToken = 'access_token';
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deleteEmployeeID();
                                                                                      FFAppState().employeeID = 'employee_id';

                                                                                      FFAppState().QRCodeLink = 'qrcode_link';
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deleteApiURLLocalState();
                                                                                      FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                      FFAppState().deleteBranchCode();
                                                                                      FFAppState().branchCode = 'branch_code';
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().isFromSetPinPage = false;
                                                                                      FFAppState().leadChannelColor = [];
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().leadChannelList = [];
                                                                                      FFAppState().isFromLoginPage = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deletePinCodeAuthen();
                                                                                      FFAppState().pinCodeAuthen = '013972';

                                                                                      FFAppState().isFromAuthenPage = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().deleteDateDoNotShowAgain();
                                                                                      FFAppState().dateDoNotShowAgain = null;

                                                                                      FFAppState().deleteDoNotShowAgain();
                                                                                      FFAppState().doNotShowAgain = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().inAppViaNotification = true;
                                                                                      FFAppState().isInApp = false;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().fcmToken = 'fcm_token';
                                                                                      FFAppState().isPassLoginSection = false;
                                                                                    });
                                                                                    Navigator.pop(context);
                                                                                    await actions.a22();

                                                                                    context.goNamed('LoginPage');

                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }
                                                                                  if (functions.checkIsHaveThisValueInList(containerWelfareTabAuthorizationRecord!.employeeIdList!.toList(), FFAppState().employeeID)!) {
                                                                                    Navigator.pop(context);

                                                                                    context.pushNamed('WelfareKPICEOPage');
                                                                                  } else {
                                                                                    Navigator.pop(context);

                                                                                    context.goNamed('WelfareKPIPage');
                                                                                  }

                                                                                  if (_shouldSetState) setState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  width: 100.0,
                                                                                  height: 100.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.of(context).size.width * 0.1,
                                                                                          height: MediaQuery.of(context).size.width * 0.1,
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: Image.asset(
                                                                                            'assets/images/KPI.jpg',
                                                                                            fit: BoxFit.contain,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'ยอดจัดสาขา',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              fontSize: 20.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        FutureBuilder<
                                                                            List<UrlLinkStorageRecord>>(
                                                                          future:
                                                                              queryUrlLinkStorageRecordOnce(
                                                                            queryBuilder: (urlLinkStorageRecord) => urlLinkStorageRecord.where('url_name',
                                                                                isEqualTo: functions.checkIsHaveThisValueInList(containerAuthorizationRecord!.employeeIdList!.toList(), FFAppState().employeeID)!
                                                                                    ? 'tableau_thaipaiboon_ceo'
                                                                                    : 'tableau_thaipaiboon' != ''
                                                                                        ? functions.checkIsHaveThisValueInList(containerAuthorizationRecord!.employeeIdList!.toList(), FFAppState().employeeID)!
                                                                                            ? 'tableau_thaipaiboon_ceo'
                                                                                            : 'tableau_thaipaiboon'
                                                                                        : null),
                                                                            singleRecord:
                                                                                true,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 50.0,
                                                                                  height: 50.0,
                                                                                  child: CircularProgressIndicator(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<UrlLinkStorageRecord>
                                                                                thaipaiboonPadUrlLinkStorageRecordList =
                                                                                snapshot.data!;
                                                                            // Return an empty Container when the item does not exist.
                                                                            if (snapshot.data!.isEmpty) {
                                                                              return Container();
                                                                            }
                                                                            final thaipaiboonPadUrlLinkStorageRecord = thaipaiboonPadUrlLinkStorageRecordList.isNotEmpty
                                                                                ? thaipaiboonPadUrlLinkStorageRecordList.first
                                                                                : null;
                                                                            return InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                var _shouldSetState = false;
                                                                                HapticFeedback.mediumImpact();
                                                                                if (!(FFAppState().isFromAuthenPage || FFAppState().isFromSetPinPage)) {
                                                                                  Navigator.pop(context);

                                                                                  context.goNamed('PinCodePage');

                                                                                  if (_shouldSetState) setState(() {});
                                                                                  return;
                                                                                }
                                                                                showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: Color(0x00000000),
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (bottomSheetContext) {
                                                                                    return GestureDetector(
                                                                                      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                        child: Container(
                                                                                          height: double.infinity,
                                                                                          child: LoadingSceneWidget(),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));

                                                                                _model.checkLoginThaiPaiboonPad = await ActionUserAPICall.call(
                                                                                  token: FFAppState().accessToken,
                                                                                  apiUrl: FFAppState().apiURLLocalState,
                                                                                );
                                                                                _shouldSetState = true;
                                                                                if ((_model.checkLoginThaiPaiboonPad?.statusCode ?? 200) != 200) {
                                                                                  if (!((ActionUserAPICall.message(
                                                                                            (_model.checkLoginThaiPaiboonPad?.jsonBody ?? ''),
                                                                                          ).toString() ==
                                                                                          'The token has been blacklisted') ||
                                                                                      (ActionUserAPICall.message(
                                                                                            (_model.checkLoginThaiPaiboonPad?.jsonBody ?? ''),
                                                                                          ).toString() ==
                                                                                          'Token Signature could not be verified.'))) {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          content: Text('พบข้อผิดพลาด (${(_model.checkLoginThaiPaiboonPad?.statusCode ?? 200).toString()})'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                    if (_shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        content: Text('Session Loginหมดอายุ'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                    FFAppState().deleteAccessToken();
                                                                                    FFAppState().accessToken = 'access_token';
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().deleteEmployeeID();
                                                                                    FFAppState().employeeID = 'employee_id';

                                                                                    FFAppState().QRCodeLink = 'qrcode_link';
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().deleteApiURLLocalState();
                                                                                    FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                    FFAppState().deleteBranchCode();
                                                                                    FFAppState().branchCode = 'branch_code';
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().isFromSetPinPage = false;
                                                                                    FFAppState().leadChannelColor = [];
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().leadChannelList = [];
                                                                                    FFAppState().isFromLoginPage = false;
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().deletePinCodeAuthen();
                                                                                    FFAppState().pinCodeAuthen = '013972';

                                                                                    FFAppState().isFromAuthenPage = false;
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().deleteDateDoNotShowAgain();
                                                                                    FFAppState().dateDoNotShowAgain = null;

                                                                                    FFAppState().deleteDoNotShowAgain();
                                                                                    FFAppState().doNotShowAgain = false;
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().inAppViaNotification = true;
                                                                                    FFAppState().isInApp = false;
                                                                                  });
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().fcmToken = 'fcm_token';
                                                                                    FFAppState().isPassLoginSection = false;
                                                                                  });
                                                                                  Navigator.pop(context);
                                                                                  await actions.a22();

                                                                                  context.goNamed('LoginPage');

                                                                                  if (_shouldSetState) setState(() {});
                                                                                  return;
                                                                                }
                                                                                Navigator.pop(context);
                                                                                if (functions.checkIsHaveThisValueInList(containerAuthorizationRecord!.employeeIdList!.toList(), FFAppState().employeeID)!) {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    barrierColor: Color(0x00000000),
                                                                                    isDismissible: false,
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (bottomSheetContext) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                          child: Container(
                                                                                            height: MediaQuery.of(context).size.height * 0.6,
                                                                                            child: SearchEmployeeComponentWidget(
                                                                                              tableauUrlLink: thaipaiboonPadUrlLinkStorageRecord!.urlLink,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                } else {
                                                                                  await actions.openTableauBrowser(
                                                                                    FFAppState().accessToken,
                                                                                    thaipaiboonPadUrlLinkStorageRecord!.urlLink,
                                                                                  );
                                                                                }

                                                                                if (_shouldSetState) setState(() {});
                                                                              },
                                                                              child: Container(
                                                                                width: 100.0,
                                                                                height: 100.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                      child: Container(
                                                                                        width: MediaQuery.of(context).size.width * 0.1,
                                                                                        height: MediaQuery.of(context).size.width * 0.1,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/tpb.jpeg',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      'ยอดประกัน',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            fontSize: 20.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginCheckLeadtab =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginCheckLeadtab?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginCheckLeadtab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginCheckLeadtab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginCheckLeadtab?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            await actions.batchUpdate2(
                                                                              containerUserCustomRecord!.reference,
                                                                              'Lead',
                                                                            );
                                                                            Navigator.pop(context);

                                                                            context.goNamed('LeadNotiPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                StreamBuilder<List<NotificationRecord>>(
                                                                                  stream: queryNotificationRecord(
                                                                                    parent: containerUserCustomRecord!.reference,
                                                                                    queryBuilder: (notificationRecord) => notificationRecord.where('noti_type', isEqualTo: 'Lead').where('this_noti_is_read', isEqualTo: false),
                                                                                  ),
                                                                                  builder: (context, snapshot) {
                                                                                    // Customize what your widget looks like when it's loading.
                                                                                    if (!snapshot.hasData) {
                                                                                      return Center(
                                                                                        child: SizedBox(
                                                                                          width: 50.0,
                                                                                          height: 50.0,
                                                                                          child: CircularProgressIndicator(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<NotificationRecord> badgeNotificationRecordList = snapshot.data!;
                                                                                    return badges.Badge(
                                                                                      badgeContent: Text(
                                                                                        badgeNotificationRecordList.length.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                      ),
                                                                                      showBadge: badgeNotificationRecordList.length > 0,
                                                                                      shape: badges.BadgeShape.circle,
                                                                                      badgeColor: Color(0xFFFF0000),
                                                                                      elevation: 4.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                      position: badges.BadgePosition.topEnd(),
                                                                                      animationType: badges.BadgeAnimationType.scale,
                                                                                      toAnimate: true,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.of(context).size.width * 0.1,
                                                                                          height: MediaQuery.of(context).size.width * 0.1,
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: Image.asset(
                                                                                            'assets/images/webpc-passthru.webp',
                                                                                            fit: BoxFit.fitHeight,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                                Text(
                                                                                  'รายชื่อลีด',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 20.0,
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
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            18.0,
                                                                            12.0,
                                                                            10.0),
                                                                    child:
                                                                        GridView(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            3,
                                                                        crossAxisSpacing:
                                                                            10.0,
                                                                        mainAxisSpacing:
                                                                            0.0,
                                                                        childAspectRatio:
                                                                            1.2,
                                                                      ),
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            currentUserLocationValue =
                                                                                await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginBranchViewtab =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginBranchViewtab?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginBranchViewtab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginBranchViewtab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginBranchViewtab?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }

                                                                            final userLogCreateData =
                                                                                createUserLogRecordData(
                                                                              employeeId: FFAppState().employeeID,
                                                                              action: 'Branch_View',
                                                                              actionTime: getCurrentTimestamp,
                                                                              userLocation: currentUserLocationValue,
                                                                            );
                                                                            var userLogRecordReference =
                                                                                UserLogRecord.collection.doc();
                                                                            await userLogRecordReference.set(userLogCreateData);
                                                                            _model.createUserLogBranchViewtab =
                                                                                UserLogRecord.getDocumentFromData(userLogCreateData, userLogRecordReference);
                                                                            _shouldSetState =
                                                                                true;
                                                                            Navigator.pop(context);

                                                                            context.goNamed('Dashboard');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.1,
                                                                                    height: MediaQuery.of(context).size.width * 0.1,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/favicon-196.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Branch View',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 20.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginInsurancetab =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginInsurancetab?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginInsurancetab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginInsurancetab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginInsurancetab?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('CheckInsurancePage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.1,
                                                                                    height: MediaQuery.of(context).size.width * 0.1,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/2022-11-03_10-22-14.jpg',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'เช็คเบี้ยประกัน',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 20.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginQRtab =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginQRtab?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginQRtab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginQRtab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginQRtab?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('GenQRPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.1,
                                                                                    height: MediaQuery.of(context).size.width * 0.1,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      'https://th.qr-code-generator.com/wp-content/themes/qr/new_structure/markets/basic_market/generator/dist/generator/assets/images/websiteQRCode_noFrame.png',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'QR พนักงาน',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 20.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginSaleskittab =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginSaleskittab?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginSaleskittab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginSaleskittab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginSaleskittab?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('SaleskitPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.1,
                                                                                    height: MediaQuery.of(context).size.width * 0.1,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/278-2784993_transparent-people-reading-png-sale-man-logo-png.png',
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Saleskit',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 20.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginFormLeadtab =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginFormLeadtab?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginFormLeadtab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginFormLeadtab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginFormLeadtab?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('LeadSurveyRegisPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.1,
                                                                                    height: MediaQuery.of(context).size.width * 0.1,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/istock_blossomstar_survey.jpg',
                                                                                      fit: BoxFit.fitHeight,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'ฟอร์มลีด',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 20.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginPromotiontab =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginPromotiontab?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginPromotiontab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginPromotiontab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginPromotiontab?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('PromotionPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.1,
                                                                                    height: MediaQuery.of(context).size.width * 0.1,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/promo.png',
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'โปรโมชั่น',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 20.0,
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
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            18.0,
                                                                            12.0,
                                                                            10.0),
                                                                    child:
                                                                        GridView(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            3,
                                                                        crossAxisSpacing:
                                                                            10.0,
                                                                        mainAxisSpacing:
                                                                            0.0,
                                                                        childAspectRatio:
                                                                            1.2,
                                                                      ),
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      children: [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            currentUserLocationValue =
                                                                                await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginCoachtab =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginCoachtab?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginCoachtab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginCoachtab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginCoachtab?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }

                                                                            final userLogCreateData =
                                                                                createUserLogRecordData(
                                                                              employeeId: FFAppState().employeeID,
                                                                              action: 'COACH',
                                                                              actionTime: getCurrentTimestamp,
                                                                              userLocation: currentUserLocationValue,
                                                                            );
                                                                            var userLogRecordReference =
                                                                                UserLogRecord.collection.doc();
                                                                            await userLogRecordReference.set(userLogCreateData);
                                                                            _model.createdUserLogCoachtab =
                                                                                UserLogRecord.getDocumentFromData(userLogCreateData, userLogRecordReference);
                                                                            _shouldSetState =
                                                                                true;
                                                                            Navigator.pop(context);
                                                                            await launchURL('https://hris.srisawadpower.com/COACH');
                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.1,
                                                                                    height: MediaQuery.of(context).size.width * 0.1,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/Screenshot_2022-10-17_095012.png',
                                                                                      fit: BoxFit.fitHeight,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'COACH',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 20.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginClassroomtab =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginClassroomtab?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginClassroomtab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginClassroomtab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginClassroomtab?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('ClassroomPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.1,
                                                                                    height: MediaQuery.of(context).size.width * 0.1,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/ingenuity_wit_book_idea_light_bulb_learn_learning_icon_149691.png',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'ห้องเรียนทันใจ',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 20.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            HapticFeedback.mediumImpact();
                                                                            if (!(FFAppState().isFromAuthenPage ||
                                                                                FFAppState().isFromSetPinPage)) {
                                                                              Navigator.pop(context);

                                                                              context.goNamed('PinCodePage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (bottomSheetContext) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: LoadingSceneWidget(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));

                                                                            _model.checkLoginITSupporttab =
                                                                                await ActionUserAPICall.call(
                                                                              token: FFAppState().accessToken,
                                                                              apiUrl: FFAppState().apiURLLocalState,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if ((_model.checkLoginITSupporttab?.statusCode ?? 200) !=
                                                                                200) {
                                                                              if (!((ActionUserAPICall.message(
                                                                                        (_model.checkLoginITSupporttab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'The token has been blacklisted') ||
                                                                                  (ActionUserAPICall.message(
                                                                                        (_model.checkLoginITSupporttab?.jsonBody ?? ''),
                                                                                      ).toString() ==
                                                                                      'Token Signature could not be verified.'))) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('พบข้อผิดพลาด (${(_model.checkLoginITSupporttab?.statusCode ?? 200).toString()})'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                                if (_shouldSetState) setState(() {});
                                                                                return;
                                                                              }
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Session Loginหมดอายุ'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              FFAppState().update(() {
                                                                                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                                                                                FFAppState().deleteAccessToken();
                                                                                FFAppState().accessToken = 'access_token';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteEmployeeID();
                                                                                FFAppState().employeeID = 'employee_id';

                                                                                FFAppState().QRCodeLink = 'qrcode_link';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteApiURLLocalState();
                                                                                FFAppState().apiURLLocalState = 'api_url_local_state';

                                                                                FFAppState().deleteBranchCode();
                                                                                FFAppState().branchCode = 'branch_code';
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().isFromSetPinPage = false;
                                                                                FFAppState().leadChannelColor = [];
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().leadChannelList = [];
                                                                                FFAppState().isFromLoginPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deletePinCodeAuthen();
                                                                                FFAppState().pinCodeAuthen = '013972';

                                                                                FFAppState().isFromAuthenPage = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().deleteDateDoNotShowAgain();
                                                                                FFAppState().dateDoNotShowAgain = null;

                                                                                FFAppState().deleteDoNotShowAgain();
                                                                                FFAppState().doNotShowAgain = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().inAppViaNotification = true;
                                                                                FFAppState().isInApp = false;
                                                                              });
                                                                              FFAppState().update(() {
                                                                                FFAppState().fcmToken = 'fcm_token';
                                                                                FFAppState().isPassLoginSection = false;
                                                                              });
                                                                              Navigator.pop(context);
                                                                              await actions.a22();

                                                                              context.goNamed('LoginPage');

                                                                              if (_shouldSetState)
                                                                                setState(() {});
                                                                              return;
                                                                            }
                                                                            Navigator.pop(context);

                                                                            context.goNamed('ITSupportPage');

                                                                            if (_shouldSetState)
                                                                              setState(() {});
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.1,
                                                                                    height: MediaQuery.of(context).size.width * 0.1,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/9288ca8e4f66c009d35e4cd5b409710a.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'ข้อมูลไอที',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 20.0,
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
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child: smooth_page_indicator
                                                                      .SmoothPageIndicator(
                                                                    controller: _model
                                                                            .pageViewController3 ??=
                                                                        PageController(
                                                                            initialPage:
                                                                                0),
                                                                    count: 3,
                                                                    axisDirection:
                                                                        Axis.horizontal,
                                                                    onDotClicked:
                                                                        (i) async {
                                                                      await _model
                                                                          .pageViewController3!
                                                                          .animateToPage(
                                                                        i,
                                                                        duration:
                                                                            Duration(milliseconds: 500),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );
                                                                    },
                                                                    effect: smooth_page_indicator
                                                                        .SlideEffect(
                                                                      spacing:
                                                                          8.0,
                                                                      radius:
                                                                          16.0,
                                                                      dotWidth:
                                                                          10.0,
                                                                      dotHeight:
                                                                          10.0,
                                                                      dotColor:
                                                                          Color(
                                                                              0xFF9E9E9E),
                                                                      activeDotColor:
                                                                          Color(
                                                                              0xFF3F51B5),
                                                                      paintStyle:
                                                                          PaintingStyle
                                                                              .fill,
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
                                                );
                                              },
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 10.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 175.0,
                                              decoration: BoxDecoration(),
                                              child: FutureBuilder<
                                                  List<
                                                      SawadFormServicesRecord>>(
                                                future:
                                                    querySawadFormServicesRecordOnce(
                                                  queryBuilder:
                                                      (sawadFormServicesRecord) =>
                                                          sawadFormServicesRecord
                                                              .orderBy(
                                                                  'form_service_order'),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        listViewSawadFormServicesRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewSawadFormServicesRecord =
                                                          listViewSawadFormServicesRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    5.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
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
                                                            if (!(FFAppState()
                                                                    .isFromAuthenPage ||
                                                                FFAppState()
                                                                    .isFromSetPinPage)) {
                                                              Navigator.pop(
                                                                  context);

                                                              context.goNamed(
                                                                  'PinCodePage');

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                            showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              barrierColor: Color(
                                                                  0x00000000),
                                                              context: context,
                                                              builder:
                                                                  (bottomSheetContext) {
                                                                return GestureDetector(
                                                                  onTap: () => FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _unfocusNode),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery.of(
                                                                            bottomSheetContext)
                                                                        .viewInsets,
                                                                    child:
                                                                        Container(
                                                                      height: double
                                                                          .infinity,
                                                                      child:
                                                                          LoadingSceneWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            _model.checkLoginFormService =
                                                                await ActionUserAPICall
                                                                    .call(
                                                              token: FFAppState()
                                                                  .accessToken,
                                                              apiUrl: FFAppState()
                                                                  .apiURLLocalState,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model.checkLoginFormService
                                                                        ?.statusCode ??
                                                                    200) !=
                                                                200) {
                                                              if (!((ActionUserAPICall
                                                                          .message(
                                                                        (_model.checkLoginFormService?.jsonBody ??
                                                                            ''),
                                                                      ).toString() ==
                                                                      'The token has been blacklisted') ||
                                                                  (ActionUserAPICall.message(
                                                                        (_model.checkLoginFormService?.jsonBody ??
                                                                            ''),
                                                                      ).toString() ==
                                                                      'Token Signature could not be verified.'))) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      content: Text(
                                                                          'พบข้อผิดพลาด (${(_model.checkLoginFormService?.statusCode ?? 200).toString()})'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
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
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .loginStateFirebase =
                                                                    '[loginStateFirebase]';
                                                                FFAppState()
                                                                    .deleteAccessToken();
                                                                FFAppState()
                                                                        .accessToken =
                                                                    'access_token';
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .deleteEmployeeID();
                                                                FFAppState()
                                                                        .employeeID =
                                                                    'employee_id';

                                                                FFAppState()
                                                                        .QRCodeLink =
                                                                    'qrcode_link';
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .deleteApiURLLocalState();
                                                                FFAppState()
                                                                        .apiURLLocalState =
                                                                    'api_url_local_state';

                                                                FFAppState()
                                                                    .deleteBranchCode();
                                                                FFAppState()
                                                                        .branchCode =
                                                                    'branch_code';
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .isFromSetPinPage =
                                                                    false;
                                                                FFAppState()
                                                                    .leadChannelColor = [];
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .leadChannelList = [];
                                                                FFAppState()
                                                                        .isFromLoginPage =
                                                                    false;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .deletePinCodeAuthen();
                                                                FFAppState()
                                                                        .pinCodeAuthen =
                                                                    '013972';

                                                                FFAppState()
                                                                        .isFromAuthenPage =
                                                                    false;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .deleteDateDoNotShowAgain();
                                                                FFAppState()
                                                                        .dateDoNotShowAgain =
                                                                    null;

                                                                FFAppState()
                                                                    .deleteDoNotShowAgain();
                                                                FFAppState()
                                                                        .doNotShowAgain =
                                                                    false;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .inAppViaNotification =
                                                                    true;
                                                                FFAppState()
                                                                        .isInApp =
                                                                    false;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .fcmToken =
                                                                    'fcm_token';
                                                                FFAppState()
                                                                        .isPassLoginSection =
                                                                    false;
                                                              });
                                                              Navigator.pop(
                                                                  context);
                                                              await actions
                                                                  .a22();

                                                              context.goNamed(
                                                                  'LoginPage');

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                            if (functions
                                                                .checkFormServiceUrl(
                                                                    listViewSawadFormServicesRecord
                                                                        .formServiceUrl)) {
                                                              final userLogCreateData =
                                                                  createUserLogRecordData(
                                                                employeeId:
                                                                    FFAppState()
                                                                        .employeeID,
                                                                action:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  'Form_Service_${listViewSawadFormServicesRecord.formServiceName}',
                                                                  '[form_service_action]',
                                                                ),
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
                                                              _model.createdUserLogFormService =
                                                                  UserLogRecord
                                                                      .getDocumentFromData(
                                                                          userLogCreateData,
                                                                          userLogRecordReference);
                                                              _shouldSetState =
                                                                  true;
                                                              Navigator.pop(
                                                                  context);
                                                              await launchURL(
                                                                  listViewSawadFormServicesRecord
                                                                      .formServiceUrl!);
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                            Navigator.pop(
                                                                context);

                                                            context.goNamed(
                                                              'FormServicePage',
                                                              queryParams: {
                                                                'formServiceName':
                                                                    serializeParam(
                                                                  listViewSawadFormServicesRecord
                                                                      .formServiceName,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'formServiceUrl':
                                                                    serializeParam(
                                                                  listViewSawadFormServicesRecord
                                                                      .formServiceUrl,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                          },
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Container(
                                                              width: 300.0,
                                                              height: 165.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image:
                                                                      CachedNetworkImageProvider(
                                                                    listViewSawadFormServicesRecord
                                                                        .formServiceImg!,
                                                                  ),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
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
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 10.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(),
                                              child: FutureBuilder<
                                                  List<
                                                      SawadFormServicesRecord>>(
                                                future:
                                                    querySawadFormServicesRecordOnce(
                                                  queryBuilder:
                                                      (sawadFormServicesRecord) =>
                                                          sawadFormServicesRecord
                                                              .orderBy(
                                                                  'form_service_order'),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        listViewSawadFormServicesRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewSawadFormServicesRecord =
                                                          listViewSawadFormServicesRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    5.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
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
                                                              barrierColor: Color(
                                                                  0x00000000),
                                                              context: context,
                                                              builder:
                                                                  (bottomSheetContext) {
                                                                return GestureDetector(
                                                                  onTap: () => FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _unfocusNode),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery.of(
                                                                            bottomSheetContext)
                                                                        .viewInsets,
                                                                    child:
                                                                        Container(
                                                                      height: double
                                                                          .infinity,
                                                                      child:
                                                                          LoadingSceneWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            _model.checkLoginFormServicetab =
                                                                await ActionUserAPICall
                                                                    .call(
                                                              token: FFAppState()
                                                                  .accessToken,
                                                              apiUrl: FFAppState()
                                                                  .apiURLLocalState,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model.checkLoginFormServicetab
                                                                        ?.statusCode ??
                                                                    200) !=
                                                                200) {
                                                              if (!((ActionUserAPICall
                                                                          .message(
                                                                        (_model.checkLoginFormServicetab?.jsonBody ??
                                                                            ''),
                                                                      ).toString() ==
                                                                      'The token has been blacklisted') ||
                                                                  (ActionUserAPICall.message(
                                                                        (_model.checkLoginFormServicetab?.jsonBody ??
                                                                            ''),
                                                                      ).toString() ==
                                                                      'Token Signature could not be verified.'))) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      content: Text(
                                                                          'พบข้อผิดพลาด (${(_model.checkLoginFormServicetab?.statusCode ?? 200).toString()})'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                          child:
                                                                              Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
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
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .loginStateFirebase =
                                                                    '[loginStateFirebase]';
                                                                FFAppState()
                                                                    .deleteAccessToken();
                                                                FFAppState()
                                                                        .accessToken =
                                                                    'access_token';
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .deleteEmployeeID();
                                                                FFAppState()
                                                                        .employeeID =
                                                                    'employee_id';

                                                                FFAppState()
                                                                        .QRCodeLink =
                                                                    'qrcode_link';
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .deleteApiURLLocalState();
                                                                FFAppState()
                                                                        .apiURLLocalState =
                                                                    'api_url_local_state';

                                                                FFAppState()
                                                                    .deleteBranchCode();
                                                                FFAppState()
                                                                        .branchCode =
                                                                    'branch_code';
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .isFromSetPinPage =
                                                                    false;
                                                                FFAppState()
                                                                    .leadChannelColor = [];
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .leadChannelList = [];
                                                                FFAppState()
                                                                        .isFromLoginPage =
                                                                    false;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .deletePinCodeAuthen();
                                                                FFAppState()
                                                                        .pinCodeAuthen =
                                                                    '013972';

                                                                FFAppState()
                                                                        .isFromAuthenPage =
                                                                    false;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .deleteDateDoNotShowAgain();
                                                                FFAppState()
                                                                        .dateDoNotShowAgain =
                                                                    null;

                                                                FFAppState()
                                                                    .deleteDoNotShowAgain();
                                                                FFAppState()
                                                                        .doNotShowAgain =
                                                                    false;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .inAppViaNotification =
                                                                    true;
                                                                FFAppState()
                                                                        .isInApp =
                                                                    false;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .fcmToken =
                                                                    'fcm_token';
                                                                FFAppState()
                                                                        .isPassLoginSection =
                                                                    false;
                                                              });
                                                              Navigator.pop(
                                                                  context);
                                                              await actions
                                                                  .a22();

                                                              context.goNamed(
                                                                  'LoginPage');

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                            if (functions
                                                                .checkFormServiceUrl(
                                                                    listViewSawadFormServicesRecord
                                                                        .formServiceUrl)) {
                                                              final userLogCreateData =
                                                                  createUserLogRecordData(
                                                                employeeId:
                                                                    FFAppState()
                                                                        .employeeID,
                                                                action:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  'Form_Service_${listViewSawadFormServicesRecord.formServiceName}',
                                                                  '[form_service_action]',
                                                                ),
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
                                                              _model.createdUserLogFormServicetab =
                                                                  UserLogRecord
                                                                      .getDocumentFromData(
                                                                          userLogCreateData,
                                                                          userLogRecordReference);
                                                              _shouldSetState =
                                                                  true;
                                                              Navigator.pop(
                                                                  context);
                                                              await launchURL(
                                                                  listViewSawadFormServicesRecord
                                                                      .formServiceUrl!);
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                            Navigator.pop(
                                                                context);

                                                            context.goNamed(
                                                              'FormServicePage',
                                                              queryParams: {
                                                                'formServiceName':
                                                                    serializeParam(
                                                                  listViewSawadFormServicesRecord
                                                                      .formServiceName,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'formServiceUrl':
                                                                    serializeParam(
                                                                  listViewSawadFormServicesRecord
                                                                      .formServiceUrl,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                          },
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 2.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Container(
                                                              width: 300.0,
                                                              height: 165.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image:
                                                                      CachedNetworkImageProvider(
                                                                    listViewSawadFormServicesRecord
                                                                        .formServiceImg!,
                                                                  ),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
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
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 10.0, 30.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 175.0,
                                              decoration: BoxDecoration(),
                                              child: FutureBuilder<
                                                  List<
                                                      SawadAnnouncementRecord>>(
                                                future:
                                                    querySawadAnnouncementRecordOnce(
                                                  queryBuilder:
                                                      (sawadAnnouncementRecord) =>
                                                          sawadAnnouncementRecord
                                                              .orderBy('order'),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<SawadAnnouncementRecord>
                                                      listViewSawadAnnouncementRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        listViewSawadAnnouncementRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewSawadAnnouncementRecord =
                                                          listViewSawadAnnouncementRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 300.0,
                                                          height: 165.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x230E151B),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        listViewSawadAnnouncementRecord
                                                                            .title!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 18.0,
                                                                            ),
                                                                      ),
                                                                      Divider(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .grayIcon,
                                                                      ),
                                                                      Text(
                                                                        listViewSawadAnnouncementRecord
                                                                            .announceDate!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      Text(
                                                                        listViewSawadAnnouncementRecord
                                                                            .body!,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 130.0,
                                                                  height: 130.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFFFE4D2),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          if (!(FFAppState().isFromAuthenPage ||
                                                                              FFAppState().isFromSetPinPage)) {
                                                                            Navigator.pop(context);

                                                                            context.goNamed('PinCodePage');

                                                                            return;
                                                                          }
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.black,
                                                                            barrierColor:
                                                                                Color(0x00000000),
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (bottomSheetContext) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                  child: Container(
                                                                                    height: 600.0,
                                                                                    child: PDFViewerWidget(
                                                                                      pdfUrl: listViewSawadAnnouncementRecord.pdfUrl,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        },
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/pngegg.png',
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 10.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.15,
                                              decoration: BoxDecoration(),
                                              child: FutureBuilder<
                                                  List<
                                                      SawadAnnouncementRecord>>(
                                                future:
                                                    querySawadAnnouncementRecordOnce(
                                                  queryBuilder:
                                                      (sawadAnnouncementRecord) =>
                                                          sawadAnnouncementRecord
                                                              .orderBy('order'),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<SawadAnnouncementRecord>
                                                      listViewSawadAnnouncementRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        listViewSawadAnnouncementRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewSawadAnnouncementRecord =
                                                          listViewSawadAnnouncementRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 300.0,
                                                          height: 165.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x230E151B),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        listViewSawadAnnouncementRecord
                                                                            .title!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 18.0,
                                                                            ),
                                                                      ),
                                                                      Divider(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .grayIcon,
                                                                      ),
                                                                      Text(
                                                                        listViewSawadAnnouncementRecord
                                                                            .announceDate!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                      Text(
                                                                        listViewSawadAnnouncementRecord
                                                                            .body!,
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 130.0,
                                                                  height: 130.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFFFE4D2),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.black,
                                                                            barrierColor:
                                                                                Color(0x00000000),
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (bottomSheetContext) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                  child: Container(
                                                                                    height: 600.0,
                                                                                    child: PDFViewerWidget(
                                                                                      pdfUrl: listViewSawadAnnouncementRecord.pdfUrl,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        },
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/pngegg.png',
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
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
