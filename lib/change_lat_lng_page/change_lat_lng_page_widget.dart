import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_lat_lng_page_model.dart';
export 'change_lat_lng_page_model.dart';

class ChangeLatLngPageWidget extends StatefulWidget {
  const ChangeLatLngPageWidget({
    Key? key,
    this.location1,
    this.recordId,
    this.coordinate,
    this.remark,
    this.clockIn,
  }) : super(key: key);

  final CityRecord? location1;
  final String? recordId;
  final String? coordinate;
  final String? remark;
  final DateTime? clockIn;

  @override
  _ChangeLatLngPageWidgetState createState() => _ChangeLatLngPageWidgetState();
}

class _ChangeLatLngPageWidgetState extends State<ChangeLatLngPageWidget>
    with TickerProviderStateMixin {
  late ChangeLatLngPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'wrapOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 750.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 750.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 750.ms,
          duration: 300.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1000.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 300.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1000.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 300.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1250.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1250.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1250.ms,
          duration: 300.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeLatLngPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChangeLatLngPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      if (isAndroid) {
        await actions.allowScreenRecordAndroid();
      } else {
        await actions.allowScreenRecordIOS();
      }

      _model.checkLatLngBVCheckIn = await actions.a8(
        currentUserLocationValue,
      );
      if (!_model.checkLatLngBVCheckIn!) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('ระบบ'),
              content: Text('กรุณาเปิดGPS ก่อนทำรายการ'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );

        context.goNamed('Dashboard');

        return;
      }
      if (!FFAppState().isFromTimesheetPage) {
        final userLogCreateData = createUserLogRecordData(
          employeeId: FFAppState().employeeID,
          action: 'Branch_View_CheckIn',
          actionTime: getCurrentTimestamp,
          userLocation: currentUserLocationValue,
        );
        var userLogRecordReference = UserLogRecord.collection.doc();
        await userLogRecordReference.set(userLogCreateData);
        _model.createdUserLogBVCheckIn = UserLogRecord.getDocumentFromData(
            userLogCreateData, userLogRecordReference);
      }
    });

    _model.branchCodeInputController ??= TextEditingController();
    _model.latInputController ??= TextEditingController();
    _model.lngInputController ??= TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFFF6500),
          automaticallyImplyLeading: false,
          leading: Visibility(
            visible: !FFAppState().isFromTimesheetPage,
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.goNamed('DashboardCheckin');
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
          ),
          title: Text(
            'Change Lat,Lng',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 10.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.32,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (FFAppState().isFromTimesheetPage == false)
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
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        'Branch Code:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        controller:
                                            _model.branchCodeInputController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.branchCodeInputController',
                                          Duration(milliseconds: 100),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Branch Code',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
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
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .branchCodeInputControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        'Latitude ใหม่:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        controller: _model.latInputController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.latInputController',
                                          Duration(milliseconds: 100),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Latitude',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
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
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        validator: _model
                                            .latInputControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        'Longitude ใหม่:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        controller: _model.lngInputController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.lngInputController',
                                          Duration(milliseconds: 100),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          hintText: 'Longitude',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
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
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        textAlign: TextAlign.start,
                                        validator: _model
                                            .lngInputControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (!(_model.branchCodeInputController.text !=
                                          null &&
                                      _model.branchCodeInputController.text !=
                                          '')) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text('กรุณาใส่ BranchCode'),
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
                                  if (!(_model.latInputController.text !=
                                          null &&
                                      _model.latInputController.text != '')) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text('กรุณาใส่ Latitude'),
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
                                  if (!(_model.lngInputController.text !=
                                          null &&
                                      _model.lngInputController.text != '')) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text('กรุณาใส่ Longitude'),
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
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x00000000),
                                    enableDrag: false,
                                    context: context,
                                    builder: (bottomSheetContext) {
                                      return GestureDetector(
                                        onTap: () => FocusScope.of(context)
                                            .requestFocus(_unfocusNode),
                                        child: Padding(
                                          padding:
                                              MediaQuery.of(bottomSheetContext)
                                                  .viewInsets,
                                          child: LoadingSceneWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));

                                  setState(() {
                                    FFAppState().changeBranchCode =
                                        _model.branchCodeInputController.text;
                                    FFAppState().changeLat =
                                        _model.latInputController.text;
                                    FFAppState().changeLng =
                                        _model.lngInputController.text;
                                  });
                                  _model.changeLocationAPIOutput =
                                      await ChangeLocationAPICall.call(
                                    branchCode: FFAppState().changeBranchCode,
                                    latitude: FFAppState().changeLat,
                                    longitude: FFAppState().changeLng,
                                    flag: 'N',
                                    apiUrl: FFAppState().apiURLLocalState,
                                    token: FFAppState().accessToken,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.changeLocationAPIOutput
                                              ?.statusCode ??
                                          200) ==
                                      200) {
                                    if (ChangeLocationAPICall.statusLayer1(
                                          (_model.changeLocationAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        ) !=
                                        200) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด statuslayer1(${ChangeLocationAPICall.statusLayer1(
                                              (_model.changeLocationAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ).toString()})'),
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
                                      Navigator.pop(context);
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    if (ChangeLocationAPICall.statusLayer2(
                                          (_model.changeLocationAPIOutput
                                                  ?.jsonBody ??
                                              ''),
                                        ) ==
                                        200) {
                                      Navigator.pop(context);
                                      await _model.googleMapsController1.future
                                          .then(
                                        (c) => c.animateCamera(
                                          CameraUpdate.newLatLng(functions
                                              .stringToLatLng(
                                                  ChangeLocationAPICall.oldLat(
                                                    (_model.changeLocationAPIOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString(),
                                                  ChangeLocationAPICall.oldLng(
                                                    (_model.changeLocationAPIOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString())!
                                              .toGoogleMaps()),
                                        ),
                                      );
                                      _model.distanceBetween =
                                          await actions.distanceBetween(
                                        functions.stringToLatLng(
                                            ChangeLocationAPICall.oldLat(
                                              (_model.changeLocationAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ).toString(),
                                            ChangeLocationAPICall.oldLng(
                                              (_model.changeLocationAPIOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            ).toString()),
                                        functions.stringToLatLng(
                                            _model.latInputController.text,
                                            _model.lngInputController.text),
                                      );
                                      _shouldSetState = true;
                                      await _model.googleMapsController2.future
                                          .then(
                                        (c) => c.animateCamera(
                                          CameraUpdate.newLatLng(functions
                                              .stringToLatLng(
                                                  FFAppState().changeLat,
                                                  FFAppState().changeLng)!
                                              .toGoogleMaps()),
                                        ),
                                      );
                                    } else {
                                      if (ChangeLocationAPICall.statusLayer2(
                                            (_model.changeLocationAPIOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          404) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  '${ChangeLocationAPICall.messageView(
                                                (_model.changeLocationAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString()}(ติดต่อก้อง)'),
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
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'พบข้อผิดพลาด(${ChangeLocationAPICall.statusLayer2(
                                                (_model.changeLocationAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString()})'),
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
                                      }

                                      Navigator.pop(context);
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text(
                                              'พบข้อผิดพลาด(${(_model.changeLocationAPIOutput?.statusCode ?? 200).toString()})'),
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
                                    Navigator.pop(context);
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                                text: 'ค้นหา',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
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
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Text(
                                        'Distance:',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.distanceBetween,
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF4C525A),
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['wrapOnPageLoadAnimation']!),
                    ],
                  ),
                ),
                if (ChangeLocationAPICall.statusLayer2(
                      (_model.changeLocationAPIOutput?.jsonBody ?? ''),
                    ) ==
                    200)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).gray600,
                      ),
                      Text(
                        'พิกัดเก่า',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                            ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).gray600,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(builder: (context) {
                            final _googleMapMarker = functions.stringToLatLng(
                                ChangeLocationAPICall.oldLat(
                                  (_model.changeLocationAPIOutput?.jsonBody ??
                                      ''),
                                ).toString(),
                                ChangeLocationAPICall.oldLng(
                                  (_model.changeLocationAPIOutput?.jsonBody ??
                                      ''),
                                ).toString());
                            return FlutterFlowGoogleMap(
                              controller: _model.googleMapsController1,
                              onCameraIdle: (latLng) => setState(
                                  () => _model.googleMapsCenter1 = latLng),
                              initialLocation: _model.googleMapsCenter1 ??=
                                  functions.stringToLatLng(
                                      ChangeLocationAPICall.oldLat(
                                        (_model.changeLocationAPIOutput
                                                ?.jsonBody ??
                                            ''),
                                      ).toString(),
                                      ChangeLocationAPICall.oldLng(
                                        (_model.changeLocationAPIOutput
                                                ?.jsonBody ??
                                            ''),
                                      ).toString())!,
                              markers: [
                                if (_googleMapMarker != null)
                                  FlutterFlowMarker(
                                    _googleMapMarker.serialize(),
                                    _googleMapMarker,
                                  ),
                              ],
                              markerColor: GoogleMarkerColor.blue,
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 16.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: true,
                              showLocation: true,
                              showCompass: false,
                              showMapToolbar: false,
                              showTraffic: false,
                              centerMapOnMarkerTap: true,
                            );
                          }),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).gray600,
                      ),
                      Text(
                        'พิกัดใหม่',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                            ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).gray600,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(builder: (context) {
                            final _googleMapMarker = functions.stringToLatLng(
                                FFAppState().changeLat, FFAppState().changeLng);
                            return FlutterFlowGoogleMap(
                              controller: _model.googleMapsController2,
                              onCameraIdle: (latLng) => setState(
                                  () => _model.googleMapsCenter2 = latLng),
                              initialLocation: _model.googleMapsCenter2 ??=
                                  functions.stringToLatLng(
                                      FFAppState().changeLat,
                                      FFAppState().changeLng)!,
                              markers: [
                                if (_googleMapMarker != null)
                                  FlutterFlowMarker(
                                    _googleMapMarker.serialize(),
                                    _googleMapMarker,
                                  ),
                              ],
                              markerColor: GoogleMarkerColor.red,
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 16.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: true,
                              showLocation: true,
                              showCompass: false,
                              showMapToolbar: false,
                              showTraffic: false,
                              centerMapOnMarkerTap: true,
                            );
                          }),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!),
                      ),
                    ],
                  ),
                if (ChangeLocationAPICall.statusLayer2(
                      (_model.changeLocationAPIOutput?.jsonBody ?? ''),
                    ) ==
                    200)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    HapticFeedback.mediumImpact();
                                    if (!(_model.branchCodeInputController
                                                .text !=
                                            null &&
                                        _model.branchCodeInputController.text !=
                                            '')) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content:
                                                Text('กรุณาใส่ BranchCode'),
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
                                    if (!(_model.latInputController.text !=
                                            null &&
                                        _model.latInputController.text != '')) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text('กรุณาใส่ Latitude'),
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
                                    if (!(_model.lngInputController.text !=
                                            null &&
                                        _model.lngInputController.text != '')) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text('กรุณาใส่ Longitude'),
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
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'ยืนยันเปลี่ยนพิกัด'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('ยกเลิก'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('ยืนยัน'),
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
                                    _model.changeLocationAPIOutputEdit =
                                        await ChangeLocationAPICall.call(
                                      latitude: _model.latInputController.text,
                                      longitude: _model.lngInputController.text,
                                      branchCode:
                                          _model.branchCodeInputController.text,
                                      apiUrl: FFAppState().apiURLLocalState,
                                      flag: 'Y',
                                      token: FFAppState().accessToken,
                                    );
                                    _shouldSetState = true;
                                    if ((_model.changeLocationAPIOutputEdit
                                                ?.statusCode ??
                                            200) ==
                                        200) {
                                      if (ChangeLocationAPICall.statusConfirm(
                                            (_model.changeLocationAPIOutputEdit
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          202) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content:
                                                  Text('เปลี่ยนพิกัดเรียบร้อย'),
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
                                      } else {
                                        if (ChangeLocationAPICall.statusConfirm(
                                              (_model.changeLocationAPIOutputEdit
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            404) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    '${ChangeLocationAPICall.messageEdit(
                                                  (_model.changeLocationAPIOutputEdit
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString()}(ติดต่อก้อง)'),
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
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                content: Text(
                                                    'พบข้อผิดพลาด(${ChangeLocationAPICall.statusConfirm(
                                                  (_model.changeLocationAPIOutputEdit
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString()})'),
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
                                        }

                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด(${(_model.changeLocationAPIOutputEdit?.statusCode ?? 200).toString()})'),
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

                                    if (_shouldSetState) setState(() {});
                                  },
                                  text: 'บันทึก',
                                  options: FFButtonOptions(
                                    width: 140.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF24D200),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
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
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation3']!),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}