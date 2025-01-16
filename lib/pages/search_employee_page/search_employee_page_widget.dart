import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_employee_page_model.dart';
export 'search_employee_page_model.dart';

class SearchEmployeePageWidget extends StatefulWidget {
  const SearchEmployeePageWidget({super.key});

  @override
  State<SearchEmployeePageWidget> createState() =>
      _SearchEmployeePageWidgetState();
}

class _SearchEmployeePageWidgetState extends State<SearchEmployeePageWidget>
    with TickerProviderStateMixin {
  late SearchEmployeePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  var hasContainerTriggered3 = false;
  var hasContainerTriggered4 = false;
  var hasContainerTriggered5 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchEmployeePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SearchEmployeePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      if (isAndroid) {
        await actions.allowScreenRecordAndroid();
      } else {
        await actions.allowScreenRecordIOS();
      }

      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x00000000),
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
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

      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'KPI',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      ));
      _model.createdUserLogKPI = UserLogRecord.getDocumentFromData(
          createUserLogRecordData(
            employeeId: FFAppState().employeeID,
            action: 'KPI',
            actionTime: getCurrentTimestamp,
            userLocation: currentUserLocationValue,
          ),
          userLogRecordReference);
      _model.getServerDateTime = await GetDateTimeAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );

      _model.getArea = await GetRegionAreaAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
        branchType: 'เขต',
      );

      _model.getRegion = await GetRegionAreaAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
        branchType: 'ภาค',
      );

      Navigator.pop(context);
    });

    _model.employeeKeywordInputTextController ??= TextEditingController();
    _model.employeeKeywordInputFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0xFFFF6500),
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.goNamed('SuperAppPage');
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFBFFFFFF),
                size: 30.0,
              ),
            ),
            title: Text(
              'Location พนักงาน',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 10.0,
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.person_search_sharp,
                                  color: Colors.black,
                                  size: 29.0,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'ค้นหาพนักงาน:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: TextFormField(
                                  controller:
                                      _model.employeeKeywordInputTextController,
                                  focusNode:
                                      _model.employeeKeywordInputFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'รหัสพนักงาน/ชื่อ/สกุล',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        letterSpacing: 0.0,
                                      ),
                                  textAlign: TextAlign.start,
                                  validator: _model
                                      .employeeKeywordInputTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.black,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 35.0,
                                  fillColor: Color(0xFF213BFF),
                                  icon: Icon(
                                    Icons.search_rounded,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    HapticFeedback.mediumImpact();
                                    if (!(_model.employeeKeywordInputTextController
                                                .text !=
                                            null &&
                                        _model.employeeKeywordInputTextController
                                                .text !=
                                            '')) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'กรุณากรอก ชื่อเล่น/สังกัด/รหัสพนักงาน ของพนักงานที่ต้องการจะค้นหา'),
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
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0x00000000),
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height: double.infinity,
                                                child: LoadingSceneWidget(),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    _model.getEmployeeSearched =
                                        await GetAllEmployeeAPICall.call(
                                      token: FFAppState().accessToken,
                                      searchKeyname: _model
                                          .employeeKeywordInputTextController
                                          .text,
                                      apiUrl: FFAppState().apiURLLocalState,
                                    );

                                    _shouldSetState = true;
                                    if (!(((_model.getEmployeeSearched
                                                    ?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetAllEmployeeAPICall.statusLayer2(
                                              (_model.getEmployeeSearched
                                                      ?.jsonBody ??
                                                  ''),
                                            ) ==
                                            200))) {
                                      if ((_model.getEmployeeSearched
                                                  ?.statusCode ??
                                              200) ==
                                          200) {
                                        if (GetAllEmployeeAPICall.statusLayer2(
                                              (_model.getEmployeeSearched
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
                                                      GetAllEmployeeAPICall
                                                          .messageLayer2(
                                                    (_model.getEmployeeSearched
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
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'พบข้อผิดพลาดLayer2 (${GetAllEmployeeAPICall.statusLayer2(
                                                    (_model.getEmployeeSearched
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
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'พบข้อผิดพลาดConnection (${(_model.getEmployeeSearched?.statusCode ?? 200).toString()})'),
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
                                      }
                                    }
                                    Navigator.pop(context);
                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (((_model.getEmployeeSearched?.statusCode ?? 200) ==
                              200) &&
                          (GetAllEmployeeAPICall.statusLayer2(
                                (_model.getEmployeeSearched?.jsonBody ?? ''),
                              ) ==
                              200))
                        Container(
                          width: double.infinity,
                          height: 40.0,
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
                                  flex: 1,
                                  child: Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.black,
                                    size: 29.0,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'เลือกพนักงาน:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue ??= '',
                                    ),
                                    options: List<String>.from(
                                        GetAllEmployeeAPICall.employeeId(
                                      (_model.getEmployeeSearched?.jsonBody ??
                                          ''),
                                    )!),
                                    optionLabels:
                                        functions.generateEmployeeList(
                                            GetAllEmployeeAPICall.fullname(
                                              (_model.getEmployeeSearched
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(),
                                            GetAllEmployeeAPICall.branchCode(
                                              (_model.getEmployeeSearched
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList())!,
                                    onChanged: (val) => safeSetState(
                                        () => _model.dropDownValue = val),
                                    width: 180.0,
                                    height: 50.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'พนักงาน...',
                                    fillColor: Colors.white,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 0.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnActionTrigger(
                            animationsMap[
                                'containerOnActionTriggerAnimation1']!,
                            hasBeenTriggered: hasContainerTriggered1),
                      Divider(
                        thickness: 1.0,
                      ),
                      if (((_model.getEmployeeSearched?.statusCode ?? 200) ==
                              200) &&
                          (GetAllEmployeeAPICall.statusLayer2(
                                (_model.getEmployeeSearched?.jsonBody ?? ''),
                              ) ==
                              200))
                        Container(
                          width: double.infinity,
                          height: 40.0,
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
                                  flex: 1,
                                  child: Icon(
                                    Icons.grid_3x3,
                                    color: Colors.black,
                                    size: 29.0,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'รหัสพนักงาน :',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    '${_model.dropDownValue}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnActionTrigger(
                            animationsMap[
                                'containerOnActionTriggerAnimation2']!,
                            hasBeenTriggered: hasContainerTriggered2),
                      if (((_model.getEmployeeSearched?.statusCode ?? 200) ==
                              200) &&
                          (GetAllEmployeeAPICall.statusLayer2(
                                (_model.getEmployeeSearched?.jsonBody ?? ''),
                              ) ==
                              200))
                        Container(
                          width: double.infinity,
                          height: 40.0,
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
                                  flex: 1,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                    size: 29.0,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'ชื่อพนักงาน : ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    '${GetAllEmployeeAPICall.fullname(
                                      (_model.getEmployeeSearched?.jsonBody ??
                                          ''),
                                    )?.elementAtOrNull(functions.getIndexOfSomethingList(GetAllEmployeeAPICall.employeeId(
                                          (_model.getEmployeeSearched
                                                  ?.jsonBody ??
                                              ''),
                                        )?.toList(), _model.dropDownValue))}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnActionTrigger(
                            animationsMap[
                                'containerOnActionTriggerAnimation3']!,
                            hasBeenTriggered: hasContainerTriggered3),
                      if (((_model.getEmployeeSearched?.statusCode ?? 200) ==
                              200) &&
                          (GetAllEmployeeAPICall.statusLayer2(
                                (_model.getEmployeeSearched?.jsonBody ?? ''),
                              ) ==
                              200))
                        Container(
                          width: double.infinity,
                          height: 40.0,
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
                                  flex: 1,
                                  child: Icon(
                                    Icons.work,
                                    color: Colors.black,
                                    size: 29.0,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'ตำแหน่ง : ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    '${GetAllEmployeeAPICall.workPosition(
                                      (_model.getEmployeeSearched?.jsonBody ??
                                          ''),
                                    )?.elementAtOrNull(functions.getIndexOfSomethingList(GetAllEmployeeAPICall.employeeId(
                                          (_model.getEmployeeSearched
                                                  ?.jsonBody ??
                                              ''),
                                        )?.toList(), _model.dropDownValue))}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnActionTrigger(
                            animationsMap[
                                'containerOnActionTriggerAnimation4']!,
                            hasBeenTriggered: hasContainerTriggered4),
                      if (((_model.getEmployeeSearched?.statusCode ?? 200) ==
                              200) &&
                          (GetAllEmployeeAPICall.statusLayer2(
                                (_model.getEmployeeSearched?.jsonBody ?? ''),
                              ) ==
                              200))
                        Container(
                          width: double.infinity,
                          height: 40.0,
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
                                  flex: 1,
                                  child: Icon(
                                    Icons.home_rounded,
                                    color: Colors.black,
                                    size: 29.0,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Branch Code : ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    '${GetAllEmployeeAPICall.branchCode(
                                      (_model.getEmployeeSearched?.jsonBody ??
                                          ''),
                                    )?.elementAtOrNull(functions.getIndexOfSomethingList(GetAllEmployeeAPICall.employeeId(
                                          (_model.getEmployeeSearched
                                                  ?.jsonBody ??
                                              ''),
                                        )?.toList(), _model.dropDownValue))}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnActionTrigger(
                            animationsMap[
                                'containerOnActionTriggerAnimation5']!,
                            hasBeenTriggered: hasContainerTriggered5),
                      FlutterFlowCalendar(
                        color: Color(0xFFFF6500),
                        iconColor: FlutterFlowTheme.of(context).secondaryText,
                        weekFormat: false,
                        weekStartsMonday: true,
                        initialDate: getCurrentTimestamp,
                        rowHeight: 40.0,
                        onChange: (DateTimeRange? newSelectedDate) {
                          safeSetState(() =>
                              _model.calendarSelectedDay = newSelectedDate);
                        },
                        titleStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                        dayOfWeekStyle: FlutterFlowTheme.of(context)
                            .bodyLarge
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyLargeFamily,
                              letterSpacing: 0.0,
                            ),
                        dateStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                        selectedDateStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                        inactiveDateStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text('employee id'),
                                        content: Text(_model.dropDownValue!),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text('date select'),
                                        content: Text(functions.getDateFormat(
                                            _model
                                                .calendarSelectedDay?.start)!),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                _model.getUserLocations =
                                    await APIUserLocationTrackerCall.call(
                                  employeeId: _model.dropDownValue,
                                  dateTime: functions.getDateFormat(
                                      _model.calendarSelectedDay?.start),
                                );

                                _shouldSetState = true;
                                if ((_model.getUserLocations?.statusCode ??
                                        200) !=
                                    200) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'พบข้อผิดพลาดConnection (${(_model.getUserLocations?.statusCode ?? 200).toString()})'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                                if ('${APIUserLocationTrackerCall.code(
                                      (_model.getUserLocations?.jsonBody ?? ''),
                                    )?.toString()}' !=
                                    '200') {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              '${APIUserLocationTrackerCall.message(
                                            (_model.getUserLocations
                                                    ?.jsonBody ??
                                                ''),
                                          )}'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }

                                context.pushNamed(
                                  'trackingEmpPage',
                                  queryParameters: {
                                    'listLatLng': serializeParam(
                                      functions.makeLatLngList(
                                          APIUserLocationTrackerCall.latitude(
                                            (_model.getUserLocations
                                                    ?.jsonBody ??
                                                ''),
                                          )?.toList(),
                                          APIUserLocationTrackerCall.longitude(
                                            (_model.getUserLocations
                                                    ?.jsonBody ??
                                                ''),
                                          )?.toList()),
                                      ParamType.LatLng,
                                      isList: true,
                                    ),
                                  }.withoutNulls,
                                );

                                if (_shouldSetState) safeSetState(() {});
                              },
                              text: 'ตรวจสอบ Location',
                              icon: Icon(
                                Icons.not_listed_location_outlined,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF213BFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                ].addToStart(SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
