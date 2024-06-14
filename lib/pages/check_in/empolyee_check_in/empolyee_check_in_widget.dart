import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'empolyee_check_in_model.dart';
export 'empolyee_check_in_model.dart';

class EmpolyeeCheckInWidget extends StatefulWidget {
  const EmpolyeeCheckInWidget({
    super.key,
    this.recordId,
    this.coordinate,
    this.remark,
    this.clockIn,
  });

  final String? recordId;
  final String? coordinate;
  final String? remark;
  final DateTime? clockIn;

  @override
  State<EmpolyeeCheckInWidget> createState() => _EmpolyeeCheckInWidgetState();
}

class _EmpolyeeCheckInWidgetState extends State<EmpolyeeCheckInWidget>
    with TickerProviderStateMixin {
  late EmpolyeeCheckInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmpolyeeCheckInModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EmpolyeeCheckIn'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x00000000),
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      FFAppState().branchLoString = '';
      FFAppState().imgURLTemp =
          'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
      FFAppState().update(() {});
      if (true) {
        FFAppState().branchLo = currentUserLocationValue;
        FFAppState().update(() {});
        if (true) {
          if (!FFAppState().firstLogin) {
            _model.getLocationOutput1 = await GetlocationAPICall.call(
              token: FFAppState().accessToken,
              branch: '',
              apiUrl: FFAppState().apiURLLocalState,
            );
            if ((_model.getLocationOutput1?.statusCode ?? 200) == 200) {
              if (GetlocationAPICall.statusLayer2(
                    (_model.getLocationOutput1?.jsonBody ?? ''),
                  ) ==
                  200) {
                if (GetlocationAPICall.group(
                      (_model.getLocationOutput1?.jsonBody ?? ''),
                    ) ==
                    'ทั่วไป') {
                  FFAppState().branchGroup = 'ทั่วไป';
                  FFAppState().branchList = GetlocationAPICall.branchName(
                    (_model.getLocationOutput1?.jsonBody ?? ''),
                  )!
                      .toList()
                      .cast<String>();
                  FFAppState().brachGroupNew = 'ทั่วไป';
                  FFAppState().brachListNew = GetlocationAPICall.branchName(
                    (_model.getLocationOutput1?.jsonBody ?? ''),
                  )!
                      .toList()
                      .cast<String>();
                  FFAppState().update(() {});
                  FFAppState().branchLat = GetlocationAPICall.branchLat(
                    (_model.getLocationOutput1?.jsonBody ?? ''),
                  )!
                      .toList()
                      .cast<String>();
                  FFAppState().branchLng = GetlocationAPICall.branchLong(
                    (_model.getLocationOutput1?.jsonBody ?? ''),
                  )!
                      .toList()
                      .cast<String>();
                  FFAppState().brachLatNew = GetlocationAPICall.branchLat(
                    (_model.getLocationOutput1?.jsonBody ?? ''),
                  )!
                      .toList()
                      .cast<String>();
                  FFAppState().brachLngNew = GetlocationAPICall.branchLong(
                    (_model.getLocationOutput1?.jsonBody ?? ''),
                  )!
                      .toList()
                      .cast<String>();
                  FFAppState().update(() {});
                  FFAppState().branchRad = GetlocationAPICall.branchRadius(
                    (_model.getLocationOutput1?.jsonBody ?? ''),
                  )!
                      .toList()
                      .cast<String>();
                  FFAppState().BrachRadNew = GetlocationAPICall.branchRadius(
                    (_model.getLocationOutput1?.jsonBody ?? ''),
                  )!
                      .toList()
                      .cast<String>();
                  FFAppState().update(() {});
                  if (FFAppState().brachListNew.length == 1) {
                    FFAppState().branchLo = functions.getLatLngBranch(
                        FFAppState().brachListNew.first,
                        FFAppState().brachLatNew.toList(),
                        FFAppState().brachLngNew.toList(),
                        FFAppState().brachListNew.toList());
                    FFAppState().currentRadius = functions.getCurrentRadius(
                        FFAppState().brachListNew.first,
                        FFAppState().brachListNew.toList(),
                        FFAppState().BrachRadNew.toList());
                    FFAppState().branchLatDouble =
                        functions.getLatLngBranchDouble(
                            FFAppState().brachListNew.first,
                            FFAppState().brachLatNew.toList(),
                            FFAppState().brachListNew.toList());
                    FFAppState().branchLngDouble =
                        functions.getLatLngBranchDouble(
                            FFAppState().brachListNew.first,
                            FFAppState().brachLngNew.toList(),
                            FFAppState().brachListNew.toList());
                    FFAppState().update(() {});
                    FFAppState().branchLoString =
                        FFAppState().brachListNew.first;
                    FFAppState().update(() {});
                  }
                } else {
                  FFAppState().branchGroup = 'กลุ่มภาคเขต';
                  FFAppState().brachGroupNew = 'กลุ่มภาคเขต';
                  FFAppState().update(() {});
                }

                FFAppState().firstLogin = true;
                FFAppState().firstUseApp = true;
                setState(() {});
                Navigator.pop(context);
              } else {
                if (GetlocationAPICall.statusLayer2(
                      (_model.getLocationOutput1?.jsonBody ?? ''),
                    ) ==
                    404) {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return WebViewAware(
                        child: AlertDialog(
                          content: Text(
                              'พบข้อผิดพลาด (${GetlocationAPICall.statusLayer2(
                            (_model.getLocationOutput1?.jsonBody ?? ''),
                          )?.toString()}) ไม่พบข้อมูล กรุณาติดต่อ HR'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  Navigator.pop(context);
                  context.safePop();
                  return;
                }
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content: Text(
                            'พบข้อผิดพลาด (${GetlocationAPICall.statusLayer2(
                          (_model.getLocationOutput1?.jsonBody ?? ''),
                        )?.toString()})'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  },
                );
                Navigator.pop(context);
                context.safePop();
                return;
              }

              return;
            } else {
              if ((GetlocationAPICall.messageLayer1(
                        (_model.getLocationOutput1?.jsonBody ?? ''),
                      ) ==
                      'The token has been blacklisted') ||
                  (GetlocationAPICall.messageLayer1(
                        (_model.getLocationOutput1?.jsonBody ?? ''),
                      ) ==
                      'Token Signature could not be verified.')) {
                var userLogRecordReference1 = UserLogRecord.collection.doc();
                await userLogRecordReference1.set(createUserLogRecordData(
                  employeeId: FFAppState().employeeID,
                  action: 'Logout',
                  actionTime: getCurrentTimestamp,
                  userLocation: currentUserLocationValue,
                ));
                _model.createdUserLogLogout2 =
                    UserLogRecord.getDocumentFromData(
                        createUserLogRecordData(
                          employeeId: FFAppState().employeeID,
                          action: 'Logout',
                          actionTime: getCurrentTimestamp,
                          userLocation: currentUserLocationValue,
                        ),
                        userLogRecordReference1);
                FFAppState().loginStateFirebase = '[loginStateFirebase]';
                FFAppState().deleteAccessToken();
                FFAppState().accessToken = 'access_token';

                FFAppState().update(() {});
                FFAppState().deleteEmployeeID();
                FFAppState().employeeID = 'employee_id';

                FFAppState().QRCodeLink = 'qrcode_link';
                FFAppState().update(() {});
                FFAppState().deleteApiURLLocalState();
                FFAppState().apiURLLocalState = 'api_url_local_state';

                FFAppState().deleteBranchCode();
                FFAppState().branchCode = 'branch_code';

                FFAppState().update(() {});
                FFAppState().isFromSetPinPage = false;
                FFAppState().leadChannelColor = [];
                FFAppState().update(() {});
                FFAppState().leadChannelList = [];
                FFAppState().isFromLoginPage = false;
                FFAppState().update(() {});
                FFAppState().deletePinCodeAuthen();
                FFAppState().pinCodeAuthen = '013972';

                FFAppState().isFromAuthenPage = false;
                FFAppState().update(() {});
                FFAppState().deleteDateDoNotShowAgain();
                FFAppState().dateDoNotShowAgain = null;

                FFAppState().deleteDoNotShowAgain();
                FFAppState().doNotShowAgain = false;

                FFAppState().update(() {});
                FFAppState().inAppViaNotification = true;
                FFAppState().isInApp = false;
                FFAppState().update(() {});
                FFAppState().fcmToken = 'fcm_token';
                FFAppState().isPassLoginSection = false;
                FFAppState().update(() {});
                FFAppState().leadID = [];
                FFAppState().leadCreatedTimeList = [];
                FFAppState().update(() {});
                FFAppState().leadCustomerNameList = [];
                FFAppState().leadChannelList = [];
                FFAppState().update(() {});
                FFAppState().leadChannelColor = [];
                FFAppState().leadCallStatus = [];
                FFAppState().update(() {});
                FFAppState().leadPhoneNumberList = [];
                FFAppState().leadEmployeeID = [];
                FFAppState().update(() {});
                FFAppState().leadChannelLabelColor = [];
                FFAppState().deleteLeadIdCalledInApp();
                FFAppState().leadIdCalledInApp = [];

                FFAppState().update(() {});
                FFAppState().leadBranchCode = [];
                FFAppState().leadUserLevel = 'lead_user_level';
                FFAppState().update(() {});
                FFAppState().leadChannelAmountList = [];
                FFAppState().update(() {});
                Navigator.pop(context);
                await actions.a22();

                context.goNamed('LoginPage');

                return;
              } else {
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        content: Text(GetlocationAPICall.messageLayer1(
                          (_model.getLocationOutput1?.jsonBody ?? ''),
                        )!),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  },
                );
                return;
              }
            }
          } else {
            if (FFAppState().brachGroupNew == 'ทั่วไป') {
              if (FFAppState().brachListNew.length == 1) {
                FFAppState().branchLo = functions.getLatLngBranch(
                    FFAppState().brachListNew.first,
                    FFAppState().brachLatNew.toList(),
                    FFAppState().brachLngNew.toList(),
                    FFAppState().brachListNew.toList());
                FFAppState().currentRadius = functions.getCurrentRadius(
                    FFAppState().brachListNew.first,
                    FFAppState().brachListNew.toList(),
                    FFAppState().BrachRadNew.toList());
                FFAppState().branchLatDouble = functions.getLatLngBranchDouble(
                    FFAppState().brachListNew.first,
                    FFAppState().brachLatNew.toList(),
                    FFAppState().brachListNew.toList());
                FFAppState().branchLngDouble = functions.getLatLngBranchDouble(
                    FFAppState().brachListNew.first,
                    FFAppState().brachLngNew.toList(),
                    FFAppState().brachListNew.toList());
                FFAppState().update(() {});
                FFAppState().branchLoString = FFAppState().brachListNew.first;
                FFAppState().update(() {});
              }
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
            }

            return;
          }
        } else {
          _model.getLocationOutput = await GetlocationAPICall.call(
            token: FFAppState().accessToken,
            branch: '',
            apiUrl: FFAppState().apiURLLocalState,
          );
        }

        if ((_model.getLocationOutput?.statusCode ?? 200) != 200) {
          if ((GetlocationAPICall.messageLayer1(
                    (_model.getLocationOutput?.jsonBody ?? ''),
                  ) ==
                  'The token has been blacklisted') ||
              (GetlocationAPICall.messageLayer1(
                    (_model.getLocationOutput?.jsonBody ?? ''),
                  ) ==
                  'Token Signature could not be verified.')) {
            var userLogRecordReference2 = UserLogRecord.collection.doc();
            await userLogRecordReference2.set(createUserLogRecordData(
              employeeId: FFAppState().employeeID,
              action: 'Logout',
              actionTime: getCurrentTimestamp,
              userLocation: currentUserLocationValue,
            ));
            _model.createdUserLogLogout = UserLogRecord.getDocumentFromData(
                createUserLogRecordData(
                  employeeId: FFAppState().employeeID,
                  action: 'Logout',
                  actionTime: getCurrentTimestamp,
                  userLocation: currentUserLocationValue,
                ),
                userLogRecordReference2);
            FFAppState().loginStateFirebase = '[loginStateFirebase]';
            FFAppState().deleteAccessToken();
            FFAppState().accessToken = 'access_token';

            FFAppState().update(() {});
            FFAppState().deleteEmployeeID();
            FFAppState().employeeID = 'employee_id';

            FFAppState().QRCodeLink = 'qrcode_link';
            FFAppState().update(() {});
            FFAppState().deleteApiURLLocalState();
            FFAppState().apiURLLocalState = 'api_url_local_state';

            FFAppState().deleteBranchCode();
            FFAppState().branchCode = 'branch_code';

            FFAppState().update(() {});
            FFAppState().isFromSetPinPage = false;
            FFAppState().leadChannelColor = [];
            FFAppState().update(() {});
            FFAppState().leadChannelList = [];
            FFAppState().isFromLoginPage = false;
            FFAppState().update(() {});
            FFAppState().deletePinCodeAuthen();
            FFAppState().pinCodeAuthen = '013972';

            FFAppState().isFromAuthenPage = false;
            FFAppState().update(() {});
            FFAppState().deleteDateDoNotShowAgain();
            FFAppState().dateDoNotShowAgain = null;

            FFAppState().deleteDoNotShowAgain();
            FFAppState().doNotShowAgain = false;

            FFAppState().update(() {});
            FFAppState().inAppViaNotification = true;
            FFAppState().isInApp = false;
            FFAppState().update(() {});
            FFAppState().fcmToken = 'fcm_token';
            FFAppState().isPassLoginSection = false;
            FFAppState().update(() {});
            FFAppState().leadID = [];
            FFAppState().leadCreatedTimeList = [];
            FFAppState().update(() {});
            FFAppState().leadCustomerNameList = [];
            FFAppState().leadChannelList = [];
            FFAppState().update(() {});
            FFAppState().leadChannelColor = [];
            FFAppState().leadCallStatus = [];
            FFAppState().update(() {});
            FFAppState().leadPhoneNumberList = [];
            FFAppState().leadEmployeeID = [];
            FFAppState().update(() {});
            FFAppState().leadChannelLabelColor = [];
            FFAppState().deleteLeadIdCalledInApp();
            FFAppState().leadIdCalledInApp = [];

            FFAppState().update(() {});
            FFAppState().leadBranchCode = [];
            FFAppState().leadUserLevel = 'lead_user_level';
            FFAppState().update(() {});
            FFAppState().leadChannelAmountList = [];
            FFAppState().update(() {});
            Navigator.pop(context);
            await actions.a22();

            context.goNamed('LoginPage');

            return;
          } else {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return WebViewAware(
                  child: AlertDialog(
                    content: Text(GetlocationAPICall.messageLayer1(
                      (_model.getLocationOutput?.jsonBody ?? ''),
                    )!),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: Text('Ok'),
                      ),
                    ],
                  ),
                );
              },
            );
            return;
          }
        }
      } else {
        Navigator.pop(context);
        return;
      }

      if (GetlocationAPICall.statusLayer2(
            (_model.getLocationOutput?.jsonBody ?? ''),
          ) ==
          200) {
        if (GetlocationAPICall.group(
              (_model.getLocationOutput?.jsonBody ?? ''),
            ) ==
            'ทั่วไป') {
          FFAppState().branchGroup = 'ทั่วไป';
          FFAppState().branchList = GetlocationAPICall.branchName(
            (_model.getLocationOutput?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
          FFAppState().brachGroupNew = 'ทั่วไป';
          FFAppState().brachListNew = GetlocationAPICall.branchName(
            (_model.getLocationOutput?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
          FFAppState().update(() {});
          FFAppState().branchLat = GetlocationAPICall.branchLat(
            (_model.getLocationOutput?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
          FFAppState().branchLng = GetlocationAPICall.branchLong(
            (_model.getLocationOutput?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
          FFAppState().brachLatNew = GetlocationAPICall.branchLat(
            (_model.getLocationOutput?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
          FFAppState().brachLngNew = GetlocationAPICall.branchLong(
            (_model.getLocationOutput?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
          FFAppState().update(() {});
          FFAppState().branchRad = GetlocationAPICall.branchRadius(
            (_model.getLocationOutput?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
          FFAppState().BrachRadNew = GetlocationAPICall.branchRadius(
            (_model.getLocationOutput?.jsonBody ?? ''),
          )!
              .toList()
              .cast<String>();
          FFAppState().update(() {});
        } else {
          FFAppState().branchGroup = 'กลุ่มภาคเขต';
          FFAppState().brachGroupNew = 'กลุ่มภาคเขต';
          FFAppState().update(() {});
        }

        FFAppState().firstLogin = true;
        setState(() {});
        Navigator.pop(context);
      } else {
        if (GetlocationAPICall.statusLayer2(
              (_model.getLocationOutput?.jsonBody ?? ''),
            ) ==
            404) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                child: AlertDialog(
                  content:
                      Text('พบข้อผิดพลาด (${GetlocationAPICall.statusLayer2(
                    (_model.getLocationOutput?.jsonBody ?? ''),
                  )?.toString()}) ไม่พบข้อมูล กรุณาติดต่อ HR'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              );
            },
          );
          Navigator.pop(context);
          context.safePop();
          return;
        }
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('พบข้อผิดพลาด (${GetlocationAPICall.statusLayer2(
                  (_model.getLocationOutput?.jsonBody ?? ''),
                )?.toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        Navigator.pop(context);
        context.safePop();
        return;
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.branchFieldTextController ??= TextEditingController();

    _model.reasoncheckin1TextController ??= TextEditingController();
    _model.reasoncheckin1FocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 1400.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, -15.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, -15.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, -15.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, -15.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).tertiary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0xFFFF6500),
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (FFAppState().imgURLTemp !=
                    'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74') {
                  await FirebaseStorage.instance
                      .refFromURL(FFAppState().imgURLTemp)
                      .delete();
                }

                context.goNamed('DashboardCheckin');
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 40.0,
              ),
            ),
            title: Text(
              'ลงเวลางาน',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    var _shouldSetState = false;
                    HapticFeedback.mediumImpact();
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: GestureDetector(
                            onTap: () => _model.unfocusNode.canRequestFocus
                                ? FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode)
                                : FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: double.infinity,
                                child: LoadingSceneWidget(),
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));

                    final selectedMedia = await selectMedia(
                      imageQuality: 30,
                      multiImage: false,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isDataUploading1 = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();
                      } finally {
                        _model.isDataUploading1 = false;
                      }
                      if (selectedUploadedFiles.length ==
                          selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile1 =
                              selectedUploadedFiles.first;
                        });
                      } else {
                        setState(() {});
                        return;
                      }
                    }

                    if (!(_model.uploadedLocalFile1 != null &&
                        (_model.uploadedLocalFile1.bytes?.isNotEmpty ??
                            false))) {
                      Navigator.pop(context);
                      if (_shouldSetState) setState(() {});
                      return;
                    }
                    _model.uploadFirebaseStorageAction =
                        await actions.uploadFileFirebaseStorage(
                      'Checkin',
                      _model.uploadedLocalFile1,
                    );
                    _shouldSetState = true;
                    if (!(_model.uploadFirebaseStorageAction != null &&
                        _model.uploadFirebaseStorageAction != '')) {
                      Navigator.pop(context);
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              content: Text(
                                  'ไม่สามารถอัพโหลดรูปได้ กรุณาลองอีกครั้ง'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }
                    FFAppState().imgURLTemp = functions
                        .stringToImgPath(_model.uploadFirebaseStorageAction)!;
                    FFAppState().update(() {});
                    Navigator.pop(context);
                    if (_shouldSetState) setState(() {});
                  },
                  child: FaIcon(
                    FontAwesomeIcons.camera,
                    color: Color(0xFBFFFFFF),
                    size: 40.0,
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 10.0,
          ),
          body: SafeArea(
            top: true,
            child: StreamBuilder<List<AuthorizationRecord>>(
              stream: queryAuthorizationRecord(
                queryBuilder: (authorizationRecord) =>
                    authorizationRecord.where(
                  'content_name',
                  isEqualTo: 'skipRadius',
                ),
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
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).tertiary,
                        ),
                      ),
                    ),
                  );
                }
                List<AuthorizationRecord> columnAuthorizationRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final columnAuthorizationRecord =
                    columnAuthorizationRecordList.isNotEmpty
                        ? columnAuthorizationRecordList.first
                        : null;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 30.0,
                              child: custom_widgets.ShowDateTime(
                                width: double.infinity,
                                height: 30.0,
                                currentTime: getCurrentTimestamp,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 60.0,
                              child: custom_widgets.ShowTime(
                                width: double.infinity,
                                height: 60.0,
                              ),
                            ),
                            Wrap(
                              spacing: 0.0,
                              runSpacing: 0.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        70.0, 10.0, 70.0, 10.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 220.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -9.01, -5.1),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            FFAppState()
                                                                .imgURLTemp,
                                                            'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                          ),
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: false,
                                                        tag: valueOrDefault<
                                                            String>(
                                                          FFAppState()
                                                              .imgURLTemp,
                                                          'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                        ),
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: valueOrDefault<String>(
                                                    FFAppState().imgURLTemp,
                                                    'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                  ),
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        FFAppState().imgURLTemp,
                                                        'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                      ),
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if ((_model.uploadedLocalFile1 !=
                                                      null &&
                                                  (_model.uploadedLocalFile1
                                                          .bytes?.isNotEmpty ??
                                                      false)) ||
                                              (_model.uploadedLocalFile2 !=
                                                      null &&
                                                  (_model.uploadedLocalFile2
                                                          .bytes?.isNotEmpty ??
                                                      false)))
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 20.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'คุณต้องการจะลบรูปหรือไม่?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'ยกเลิก'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'ตกลง'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (!confirmDialogResponse) {
                                                      return;
                                                    }
                                                    FFAppState().imgURLTemp =
                                                        'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
                                                    FFAppState().update(() {});
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons.times,
                                                    color: Color(0xFFDE1013),
                                                    size: 30.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 10.0, 20.0, 10.0),
                                    child: Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -9.01, -5.1),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          FlutterFlowExpandedImageView(
                                                        image: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            FFAppState()
                                                                .imgURLTemp,
                                                            'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                          ),
                                                          fit: BoxFit.contain,
                                                        ),
                                                        allowRotation: false,
                                                        tag: valueOrDefault<
                                                            String>(
                                                          FFAppState()
                                                              .imgURLTemp,
                                                          'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                        ),
                                                        useHeroAnimation: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Hero(
                                                  tag: valueOrDefault<String>(
                                                    FFAppState().imgURLTemp,
                                                    'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                  ),
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        FFAppState().imgURLTemp,
                                                        'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                      ),
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if ((_model.uploadedLocalFile1 !=
                                                      null &&
                                                  (_model.uploadedLocalFile1
                                                          .bytes?.isNotEmpty ??
                                                      false)) ||
                                              (_model.uploadedLocalFile2 !=
                                                      null &&
                                                  (_model.uploadedLocalFile2
                                                          .bytes?.isNotEmpty ??
                                                      false)))
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 20.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'คุณต้องการจะลบรูปหรือไม่?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'ยกเลิก'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'ตกลง'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (!confirmDialogResponse) {
                                                      return;
                                                    }
                                                    FFAppState().imgURLTemp =
                                                        'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
                                                    FFAppState().update(() {});
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons.times,
                                                    color: Color(0xFFDE1013),
                                                    size: 30.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (FFAppState().imgURLTemp ==
                                              'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74')
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Text(
                                                  'กรุณากดถ่ายรูปขวาบน',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (FFAppState().brachGroupNew == 'ทั่วไป')
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: SelectionArea(
                                                child: Text(
                                              'เลือก:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            )),
                                          ),
                                          if (FFAppState().brachGroupNew ==
                                              'ทั่วไป')
                                            Expanded(
                                              flex: 6,
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .branchDropDownValueController ??=
                                                    FormFieldController<String>(
                                                  _model.branchDropDownValue ??=
                                                      FFAppState()
                                                                  .brachListNew
                                                                  .length ==
                                                              1
                                                          ? FFAppState()
                                                              .brachListNew
                                                              .first
                                                          : '',
                                                ),
                                                options:
                                                    FFAppState().brachListNew,
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                          .branchDropDownValue =
                                                      val);
                                                  FFAppState()
                                                          .checkBranchDropdown =
                                                      false;
                                                  setState(() {});
                                                  FFAppState().branchLo =
                                                      functions.getLatLngBranch(
                                                          _model
                                                              .branchDropDownValue,
                                                          FFAppState()
                                                              .brachLatNew
                                                              .toList(),
                                                          FFAppState()
                                                              .brachLngNew
                                                              .toList(),
                                                          FFAppState()
                                                              .brachListNew
                                                              .toList());
                                                  FFAppState().currentRadius =
                                                      functions.getCurrentRadius(
                                                          _model
                                                              .branchDropDownValue,
                                                          FFAppState()
                                                              .brachListNew
                                                              .toList(),
                                                          FFAppState()
                                                              .BrachRadNew
                                                              .toList());
                                                  FFAppState().branchLatDouble =
                                                      functions
                                                          .getLatLngBranchDouble(
                                                              _model
                                                                  .branchDropDownValue,
                                                              FFAppState()
                                                                  .brachLatNew
                                                                  .toList(),
                                                              FFAppState()
                                                                  .brachListNew
                                                                  .toList());
                                                  FFAppState().branchLngDouble =
                                                      functions
                                                          .getLatLngBranchDouble(
                                                              _model
                                                                  .branchDropDownValue,
                                                              FFAppState()
                                                                  .brachLngNew
                                                                  .toList(),
                                                              FFAppState()
                                                                  .brachListNew
                                                                  .toList());
                                                  FFAppState().update(() {});
                                                  FFAppState().branchLoString =
                                                      _model
                                                          .branchDropDownValue!;
                                                  FFAppState().update(() {});
                                                  FFAppState()
                                                          .checkBranchDropdown =
                                                      true;
                                                  setState(() {});
                                                },
                                                width: 180.0,
                                                height: 50.0,
                                                searchHintTextStyle:
                                                    TextStyle(),
                                                searchTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    'กรุณาเลือกสาขาที่อยู่',
                                                searchHintText:
                                                    'สาขาที่จะเช็คอิน ...',
                                                fillColor: Colors.white,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 0.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                hidesUnderline: true,
                                                disabled: FFAppState()
                                                        .brachListNew
                                                        .length ==
                                                    1,
                                                isSearchable: true,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation1']!),
                                if (FFAppState().brachGroupNew == 'กลุ่มภาคเขต')
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              'ค้นหา:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 0.0, 0.0),
                                              child: Autocomplete<String>(
                                                initialValue:
                                                    TextEditingValue(),
                                                optionsBuilder:
                                                    (textEditingValue) {
                                                  if (textEditingValue.text ==
                                                      '') {
                                                    return const Iterable<
                                                        String>.empty();
                                                  }
                                                  return <String>[]
                                                      .where((option) {
                                                    final lowercaseOption =
                                                        option.toLowerCase();
                                                    return lowercaseOption
                                                        .contains(
                                                            textEditingValue
                                                                .text
                                                                .toLowerCase());
                                                  });
                                                },
                                                optionsViewBuilder: (context,
                                                    onSelected, options) {
                                                  return AutocompleteOptionsList(
                                                    textFieldKey:
                                                        _model.branchFieldKey,
                                                    textController: _model
                                                        .branchFieldTextController!,
                                                    options: options.toList(),
                                                    onSelected: onSelected,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    textHighlightStyle:
                                                        TextStyle(),
                                                    elevation: 4.0,
                                                    optionBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    optionHighlightColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    maxHeight: 200.0,
                                                  );
                                                },
                                                onSelected: (String selection) {
                                                  setState(() => _model
                                                          .branchFieldSelectedOption =
                                                      selection);
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                },
                                                fieldViewBuilder: (
                                                  context,
                                                  textEditingController,
                                                  focusNode,
                                                  onEditingComplete,
                                                ) {
                                                  _model.branchFieldFocusNode =
                                                      focusNode;

                                                  _model.branchFieldTextController =
                                                      textEditingController;
                                                  return TextFormField(
                                                    key: _model.branchFieldKey,
                                                    controller:
                                                        textEditingController,
                                                    focusNode: focusNode,
                                                    onEditingComplete:
                                                        onEditingComplete,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'กรุณากรอกสาขาที่อยู่',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedErrorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    textAlign: TextAlign.start,
                                                    validator: _model
                                                        .branchFieldTextControllerValidator
                                                        .asValidator(context),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              borderWidth: 1.0,
                                              buttonSize: 50.0,
                                              icon: Icon(
                                                Icons.search,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                var _shouldSetState = false;
                                                showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  barrierColor:
                                                      Color(0x00000000),
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              LoadingSceneWidget(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));

                                                if (_model.branchFieldTextController
                                                            .text ==
                                                        null ||
                                                    _model.branchFieldTextController
                                                            .text ==
                                                        '') {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'กรุณากรอกสาขาที่อยู่'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                                _model.findLocationOutput =
                                                    await GetlocationAPICall
                                                        .call(
                                                  token:
                                                      FFAppState().accessToken,
                                                  branch: _model
                                                      .branchFieldTextController
                                                      .text,
                                                  apiUrl: FFAppState()
                                                      .apiURLLocalState,
                                                );
                                                _shouldSetState = true;
                                                if (GetlocationAPICall
                                                        .statusLayer3(
                                                      (_model.findLocationOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) ==
                                                    404) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              'กรุณาใส่สาขาที่อยู่'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  if (GetlocationAPICall
                                                          .statusLayer2(
                                                        (_model.findLocationOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      404) {
                                                    Navigator.pop(context);
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'ไม่พบสาขาที่ท่านกรอก'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  } else {
                                                    FFAppState().branchList =
                                                        GetlocationAPICall
                                                                .branchName(
                                                      (_model.findLocationOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().branchLat =
                                                        GetlocationAPICall
                                                                .branchLat(
                                                      (_model.findLocationOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().brachListNew =
                                                        GetlocationAPICall
                                                                .branchName(
                                                      (_model.findLocationOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().brachLatNew =
                                                        GetlocationAPICall
                                                                .branchLat(
                                                      (_model.findLocationOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().update(() {});
                                                    FFAppState().branchLng =
                                                        GetlocationAPICall
                                                                .branchLong(
                                                      (_model.findLocationOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().branchRad =
                                                        GetlocationAPICall
                                                                .branchRadius(
                                                      (_model.findLocationOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().brachLngNew =
                                                        GetlocationAPICall
                                                                .branchLong(
                                                      (_model.findLocationOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().BrachRadNew =
                                                        GetlocationAPICall
                                                                .branchRadius(
                                                      (_model.findLocationOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().update(() {});
                                                  }
                                                }

                                                Navigator.pop(context);
                                                if (_shouldSetState)
                                                  setState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation2']!),
                                if ((FFAppState().brachGroupNew ==
                                        'กลุ่มภาคเขต') &&
                                    (((_model.findLocationOutput?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetlocationAPICall.statusLayer3(
                                              (_model.findLocationOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            404) &&
                                        (GetlocationAPICall.statusLayer2(
                                              (_model.findLocationOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200)))
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: SelectionArea(
                                                child: Text(
                                              'เลือก:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            )),
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options:
                                                  FFAppState().brachListNew,
                                              onChanged: (val) async {
                                                setState(() =>
                                                    _model.dropDownValue = val);
                                                FFAppState().branchLo =
                                                    functions.getLatLngBranch(
                                                        _model.dropDownValue,
                                                        FFAppState()
                                                            .branchLat
                                                            .toList(),
                                                        FFAppState()
                                                            .branchLng
                                                            .toList(),
                                                        FFAppState()
                                                            .branchList
                                                            .toList());
                                                FFAppState().currentRadius =
                                                    functions.getCurrentRadius(
                                                        _model.dropDownValue,
                                                        FFAppState()
                                                            .branchList
                                                            .toList(),
                                                        FFAppState()
                                                            .branchRad
                                                            .toList());
                                                FFAppState().branchLatDouble =
                                                    functions
                                                        .getLatLngBranchDouble(
                                                            _model
                                                                .dropDownValue,
                                                            FFAppState()
                                                                .branchLat
                                                                .toList(),
                                                            FFAppState()
                                                                .branchList
                                                                .toList());
                                                FFAppState().branchLngDouble =
                                                    functions
                                                        .getLatLngBranchDouble(
                                                            _model
                                                                .dropDownValue,
                                                            FFAppState()
                                                                .branchLng
                                                                .toList(),
                                                            FFAppState()
                                                                .branchList
                                                                .toList());
                                                FFAppState().update(() {});
                                                FFAppState().branchLoString =
                                                    _model.dropDownValue!;
                                                FFAppState().update(() {});
                                              },
                                              width: 180.0,
                                              height: 50.0,
                                              searchHintTextStyle: TextStyle(),
                                              searchTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'กรุณาเลือกสาขาที่อยู่',
                                              searchHintText:
                                                  'สาขาที่จะเช็คอิน ...',
                                              fillColor: Colors.white,
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 0.0,
                                              borderRadius: 0.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 4.0, 12.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: true,
                                              isMultiSelect: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation3']!),
                                if ((FFAppState().brachGroupNew == 'ทั่วไป') ||
                                    (_model.dropDownValue != null &&
                                        _model.dropDownValue != ''))
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              'เหตุผล:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: TextFormField(
                                              controller: _model
                                                  .reasoncheckin1TextController,
                                              focusNode: _model
                                                  .reasoncheckin1FocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'กรุณากรอกเหตุผล',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              textAlign: TextAlign.start,
                                              validator: _model
                                                  .reasoncheckin1TextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation4']!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (((FFAppState().brachGroupNew != 'ทั่วไป') &&
                            (_model.dropDownValue != null &&
                                _model.dropDownValue != '')) ||
                        (FFAppState().brachGroupNew == 'ทั่วไป'))
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                                  LatLng(0.0, 0.0));
                                      var _shouldSetState = false;
                                      HapticFeedback.mediumImpact();
                                      if (!(FFAppState().branchLoString !=
                                              null &&
                                          FFAppState().branchLoString != '')) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(FFAppState()
                                                        .checkBranchDropdown
                                                    ? 'กรุณาเลือกสาขาก่อนบันทึก'
                                                    : 'ข้อมูลพิกัด,รัศมี สาขาไม่ถูกต้องกรุณาติดต่อ HR'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                      if ((FFAppState().imgURLTemp !=
                                              'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74') &&
                                          (FFAppState().imgURLTemp != null &&
                                              FFAppState().imgURLTemp != '') &&
                                          (FFAppState().imgURLTemp != '')) {
                                        if ((FFAppState().imgURLTemp !=
                                                'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74') &&
                                            (FFAppState().imgURLTemp != null &&
                                                FFAppState().imgURLTemp !=
                                                    '') &&
                                            (FFAppState().imgURLTemp != '')) {
                                          _model.inCurrentLocation =
                                              await actions.locationCal(
                                            FFAppState().branchLo,
                                            currentUserLocationValue,
                                            FFAppState().currentRadius,
                                          );
                                          _shouldSetState = true;
                                          if (columnAuthorizationRecord
                                                  ?.employeeIdList
                                                  ?.contains(FFAppState()
                                                      .employeeID) ==
                                              false) {
                                            if (_model.inCurrentLocation !=
                                                true) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'คุณไม่อยู่ในพื้นที่เช็คอิน'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณาถ่ายรูปก่อนกดเช็คอิน'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการบันทึกข้อมูลใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        final selectedMedia = await selectMedia(
                                          imageQuality: 30,
                                          multiImage: false,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          setState(() =>
                                              _model.isDataUploading2 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                        ))
                                                    .toList();
                                          } finally {
                                            _model.isDataUploading2 = false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                              selectedMedia.length) {
                                            setState(() {
                                              _model.uploadedLocalFile2 =
                                                  selectedUploadedFiles.first;
                                            });
                                          } else {
                                            setState(() {});
                                            return;
                                          }
                                        }

                                        if (!(_model.uploadedLocalFile2 !=
                                                null &&
                                            (_model.uploadedLocalFile2.bytes
                                                    ?.isNotEmpty ??
                                                false))) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณาถ่ายรูปก่อนกดเช็คอิน'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                        _model.uploadFirebaseStorageCheckinBtn =
                                            await actions
                                                .uploadFileFirebaseStorage(
                                          'Checkin',
                                          _model.uploadedLocalFile2,
                                        );
                                        _shouldSetState = true;
                                        if (!(_model.uploadFirebaseStorageCheckinBtn !=
                                                null &&
                                            _model.uploadFirebaseStorageCheckinBtn !=
                                                '')) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'ไม่สามารถอัพโหลดรูปได้ กรุณาลองอีกครั้ง'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                        FFAppState().imgURLTemp =
                                            functions.stringToImgPath(_model
                                                .uploadFirebaseStorageCheckinBtn)!;
                                        FFAppState().update(() {});
                                        if (!((FFAppState().imgURLTemp !=
                                                    null &&
                                                FFAppState().imgURLTemp !=
                                                    '') &&
                                            (FFAppState().imgURLTemp !=
                                                'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74') &&
                                            (FFAppState().imgURLTemp != ''))) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณาถ่ายรูปก่อนกดเช็คอิน'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                        _model.inCurrentLocation2 =
                                            await actions.locationCal(
                                          FFAppState().branchLo,
                                          currentUserLocationValue,
                                          FFAppState().currentRadius,
                                        );
                                        _shouldSetState = true;
                                        if (columnAuthorizationRecord
                                                ?.employeeIdList
                                                ?.contains(
                                                    FFAppState().employeeID) ==
                                            false) {
                                          if (_model.inCurrentLocation2 !=
                                              true) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'คุณไม่อยู่ในพื้นที่เช็คอิน'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                        }
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'คุณต้องการบันทึกข้อมูลใช่หรือไม่'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('ไม่'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('ใช่'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                      }

                                      _model.checkGPSBeforeSave =
                                          await actions.a8(
                                        currentUserLocationValue,
                                      );
                                      _shouldSetState = true;
                                      if (_model.checkGPSBeforeSave!) {
                                        _model.checkinAPIOutput =
                                            await CheckinAPICall.call(
                                          apiUrl: FFAppState().apiURLLocalState,
                                          latitude: columnAuthorizationRecord!
                                                  .employeeIdList
                                                  .contains(
                                                      FFAppState().employeeID)
                                              ? functions.userLatitude(
                                                  functions.randomLatLng(
                                                      13.8861023, 100.5621823))
                                              : functions.userLatitude(
                                                  currentUserLocationValue),
                                          longitude: columnAuthorizationRecord!
                                                  .employeeIdList
                                                  .contains(
                                                      FFAppState().employeeID)
                                              ? functions.userLongitude(
                                                  functions.randomLatLng(
                                                      13.8861023, 100.5621823))
                                              : functions.userLongitude(
                                                  currentUserLocationValue),
                                          branch: FFAppState().branchLoString,
                                          token: FFAppState().accessToken,
                                          urlImg: functions.imgPathtoString(
                                              FFAppState().imgURLTemp),
                                          remark: _model
                                              .reasoncheckin1TextController
                                              .text,
                                        );
                                        _shouldSetState = true;
                                        if ((_model.checkinAPIOutput
                                                    ?.statusCode ??
                                                200) !=
                                            200) {
                                          if ((CheckinAPICall.massageLayer1(
                                                    (_model.checkinAPIOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  'The token has been blacklisted') ||
                                              (CheckinAPICall.massageLayer1(
                                                    (_model.checkinAPIOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  'Token Signature could not be verified.')) {
                                            var userLogRecordReference =
                                                UserLogRecord.collection.doc();
                                            await userLogRecordReference
                                                .set(createUserLogRecordData(
                                              employeeId:
                                                  FFAppState().employeeID,
                                              action: 'Logout',
                                              actionTime: getCurrentTimestamp,
                                              userLocation:
                                                  currentUserLocationValue,
                                            ));
                                            _model.createdUserLogLogout1 =
                                                UserLogRecord
                                                    .getDocumentFromData(
                                                        createUserLogRecordData(
                                                          employeeId:
                                                              FFAppState()
                                                                  .employeeID,
                                                          action: 'Logout',
                                                          actionTime:
                                                              getCurrentTimestamp,
                                                          userLocation:
                                                              currentUserLocationValue,
                                                        ),
                                                        userLogRecordReference);
                                            _shouldSetState = true;
                                            FFAppState().loginStateFirebase =
                                                '[loginStateFirebase]';
                                            FFAppState().deleteAccessToken();
                                            FFAppState().accessToken =
                                                'access_token';

                                            FFAppState().update(() {});
                                            FFAppState().deleteEmployeeID();
                                            FFAppState().employeeID =
                                                'employee_id';

                                            FFAppState().QRCodeLink =
                                                'qrcode_link';
                                            FFAppState().update(() {});
                                            FFAppState()
                                                .deleteApiURLLocalState();
                                            FFAppState().apiURLLocalState =
                                                'api_url_local_state';

                                            FFAppState().deleteBranchCode();
                                            FFAppState().branchCode =
                                                'branch_code';

                                            FFAppState().update(() {});
                                            FFAppState().isFromSetPinPage =
                                                false;
                                            FFAppState().leadChannelColor = [];
                                            FFAppState().update(() {});
                                            FFAppState().leadChannelList = [];
                                            FFAppState().isFromLoginPage =
                                                false;
                                            FFAppState().update(() {});
                                            FFAppState().deletePinCodeAuthen();
                                            FFAppState().pinCodeAuthen =
                                                '013972';

                                            FFAppState().isFromAuthenPage =
                                                false;
                                            FFAppState().update(() {});
                                            FFAppState()
                                                .deleteDateDoNotShowAgain();
                                            FFAppState().dateDoNotShowAgain =
                                                null;

                                            FFAppState().deleteDoNotShowAgain();
                                            FFAppState().doNotShowAgain = false;

                                            FFAppState().update(() {});
                                            FFAppState().inAppViaNotification =
                                                true;
                                            FFAppState().isInApp = false;
                                            FFAppState().update(() {});
                                            FFAppState().fcmToken = 'fcm_token';
                                            FFAppState().isPassLoginSection =
                                                false;
                                            FFAppState().update(() {});
                                            FFAppState().leadID = [];
                                            FFAppState().leadCreatedTimeList =
                                                [];
                                            FFAppState().update(() {});
                                            FFAppState().leadCustomerNameList =
                                                [];
                                            FFAppState().leadChannelList = [];
                                            FFAppState().update(() {});
                                            FFAppState().leadChannelColor = [];
                                            FFAppState().leadCallStatus = [];
                                            FFAppState().update(() {});
                                            FFAppState().leadPhoneNumberList =
                                                [];
                                            FFAppState().leadEmployeeID = [];
                                            FFAppState().update(() {});
                                            FFAppState().leadChannelLabelColor =
                                                [];
                                            FFAppState()
                                                .deleteLeadIdCalledInApp();
                                            FFAppState().leadIdCalledInApp = [];

                                            FFAppState().update(() {});
                                            FFAppState().leadBranchCode = [];
                                            FFAppState().leadUserLevel =
                                                'lead_user_level';
                                            FFAppState().update(() {});
                                            FFAppState().leadChannelAmountList =
                                                [];
                                            FFAppState().update(() {});
                                            Navigator.pop(context);
                                            await actions.a22();

                                            context.goNamed('LoginPage');

                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        GetlocationAPICall
                                                            .messageLayer1(
                                                      (_model.getLocationOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                        }
                                        if (CheckinAPICall.statusLayer2(
                                              (_model.checkinAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            201) {
                                          if (CheckinAPICall.statusLayer2(
                                                (_model.checkinAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              200) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'พบข้อผิดพลาด (${CheckinAPICall.statusLayer2(
                                                      (_model.checkinAPIOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )?.toString()})message (${CheckinAPICall.checkinMessage(
                                                      (_model.checkinAPIOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    )})'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'กรุณาเปิด GPS แล้วทำรายการอีกครั้ง'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }

                                      FFAppState().imgURLTemp =
                                          'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
                                      FFAppState().update(() {});

                                      context.goNamed(
                                        'SuccessCheckinPage',
                                        queryParameters: {
                                          'checkinPhoto': serializeParam(
                                            FFAppState().imgURLTemp,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );

                                      if (_shouldSetState) setState(() {});
                                    },
                                    text: 'ลงเวลางาน',
                                    options: FFButtonOptions(
                                      width: 130.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF24D200),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Color(0x00000000),
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: LoadingSceneWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      FFAppState().firstLogin = false;
                                      setState(() {});
                                      if (!FFAppState().firstLogin) {
                                        _model.getLocationOutput2Copy =
                                            await GetlocationAPICall.call(
                                          token: FFAppState().accessToken,
                                          branch: '',
                                          apiUrl: FFAppState().apiURLLocalState,
                                        );
                                        _shouldSetState = true;
                                      } else {
                                        Navigator.pop(context);
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }

                                      if ((_model.getLocationOutput2Copy
                                                  ?.statusCode ??
                                              200) !=
                                          200) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'พบข้อผิดพลาด (${(_model.getLocationOutput2Copy?.statusCode ?? 200).toString()})'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        Navigator.pop(context);
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                      if (GetlocationAPICall.statusLayer2(
                                            (_model.getLocationOutput2Copy
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          200) {
                                        if (GetlocationAPICall.group(
                                              (_model.getLocationOutput2Copy
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            'ทั่วไป') {
                                          FFAppState().brachGroupNew = 'ทั่วไป';
                                          FFAppState().brachListNew =
                                              GetlocationAPICall.branchName(
                                            (_model.getLocationOutput2Copy
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          FFAppState().update(() {});
                                          FFAppState().brachLatNew =
                                              GetlocationAPICall.branchLat(
                                            (_model.getLocationOutput2Copy
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          FFAppState().brachLngNew =
                                              GetlocationAPICall.branchLong(
                                            (_model.getLocationOutput2Copy
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          FFAppState().update(() {});
                                          FFAppState().branchRad =
                                              GetlocationAPICall.branchRadius(
                                            (_model.getLocationOutput2Copy
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          FFAppState().BrachRadNew =
                                              GetlocationAPICall.branchRadius(
                                            (_model.getLocationOutput2Copy
                                                    ?.jsonBody ??
                                                ''),
                                          )!
                                                  .toList()
                                                  .cast<String>();
                                          FFAppState().update(() {});
                                        } else {
                                          FFAppState().brachGroupNew =
                                              'กลุ่มภาคเขต';
                                          FFAppState().update(() {});
                                        }

                                        FFAppState().firstLogin = true;
                                        setState(() {});
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'โหลดข้อมูลตำแหน่งเรียบร้อย'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        Navigator.pop(context);
                                      } else {
                                        if (GetlocationAPICall.statusLayer2(
                                              (_model.getLocationOutput2Copy
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            404) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'พบข้อผิดพลาด (${GetlocationAPICall.statusLayer2(
                                                    (_model.getLocationOutput2Copy
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.toString()}) ไม่พบข้อมูล กรุณาติดต่อ HR'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                          Navigator.pop(context);
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'พบข้อผิดพลาด (${GetlocationAPICall.statusLayer2(
                                                  (_model.getLocationOutput2Copy
                                                          ?.jsonBody ??
                                                      ''),
                                                )?.toString()})'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        Navigator.pop(context);
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) setState(() {});
                                    },
                                    text: 'โหลดตำแหน่ง',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFFFB72E),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation5']!),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      child: custom_widgets.DrawCircleMap(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.25,
                        latitude: FFAppState().branchLatDouble,
                        longitude: FFAppState().branchLngDouble,
                        radiusLo: FFAppState().currentRadius,
                        currentLoLat: valueOrDefault<double>(
                          functions.currentLatLngDouble(
                              currentUserLocationValue, true),
                          0.0,
                        ),
                        currentLoLng: valueOrDefault<double>(
                          functions.currentLatLngDouble(
                              currentUserLocationValue, false),
                          0.0,
                        ),
                      ),
                    ),
                  ],
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation']!);
              },
            ),
          ),
        ),
      ),
    );
  }
}
