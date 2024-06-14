import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'employee_kpi_c_e_o_page_model.dart';
export 'employee_kpi_c_e_o_page_model.dart';

class EmployeeKpiCEOPageWidget extends StatefulWidget {
  const EmployeeKpiCEOPageWidget({super.key});

  @override
  State<EmployeeKpiCEOPageWidget> createState() =>
      _EmployeeKpiCEOPageWidgetState();
}

class _EmployeeKpiCEOPageWidgetState extends State<EmployeeKpiCEOPageWidget>
    with TickerProviderStateMixin {
  late EmployeeKpiCEOPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmployeeKpiCEOPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EmployeeKpiCEOPage'});
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
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
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

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: true);
    _model.branchInputTextController ??= TextEditingController();
    _model.branchInputFocusNode ??= FocusNode();

    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: true);
    _model.employeeKeywordInputTextController ??= TextEditingController();
    _model.employeeKeywordInputFocusNode ??= FocusNode();

    _model.branchInputAreaTextController ??= TextEditingController();

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
      'rowOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
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
      'rowOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0xFFFF6500),
            automaticallyImplyLeading: false,
            leading: Visibility(
              visible: !FFAppState().isFromTimesheetPage,
              child: InkWell(
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
            ),
            title: Text(
              'KPI พนักงาน',
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
            child: Column(
              children: [
                Align(
                  alignment: Alignment(0.0, 0),
                  child: TabBar(
                    labelColor: FlutterFlowTheme.of(context).primary,
                    labelStyle:
                        FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.0,
                            ),
                    unselectedLabelStyle: TextStyle(),
                    indicatorColor: FlutterFlowTheme.of(context).secondary,
                    tabs: [
                      Tab(
                        text: 'KPI รายสาขา',
                      ),
                      Tab(
                        text: 'KPI รายบุคคล',
                      ),
                      Tab(
                        text: 'KPI เขตภาค',
                      ),
                    ],
                    controller: _model.tabBarController,
                    onTap: (i) async {
                      [() async {}, () async {}, () async {}][i]();
                    },
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _model.tabBarController,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            child: ExpandableNotifier(
                              controller:
                                  _model.expandableExpandableController1,
                              child: ExpandablePanel(
                                header: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Text(
                                    'ตัวเลือกดู KPI สาขา',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                collapsed: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'แตะเพื่อเปิดตัวกรอง',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                expanded: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Icon(
                                                Icons.home_work_outlined,
                                                color: Colors.black,
                                                size: 29.0,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                'ค้นหาสาขา:',
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
                                              flex: 6,
                                              child: TextFormField(
                                                controller: _model
                                                    .branchInputTextController,
                                                focusNode:
                                                    _model.branchInputFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText:
                                                      'กรอกรหัสสาขา/ชื่อสาขา',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14.0,
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
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBtnText,
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
                                                    .branchInputTextControllerValidator
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
                                                  if (!(_model.branchInputTextController
                                                              .text !=
                                                          null &&
                                                      _model.branchInputTextController
                                                              .text !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณากรอกรหัสสาขา/ชื่อสาขา ที่ต้องการจะค้นหา'),
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
                                                  }
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        Color(0x00000000),
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: Container(
                                                              height: double
                                                                  .infinity,
                                                              child:
                                                                  LoadingSceneWidget(),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  _model.getBranchSearched =
                                                      await GetBranchAPICall
                                                          .call(
                                                    token: FFAppState()
                                                        .accessToken,
                                                    branchCode: _model
                                                        .branchInputTextController
                                                        .text,
                                                    apiUrl: FFAppState()
                                                        .apiURLLocalState,
                                                    type: 'actual',
                                                  );
                                                  _shouldSetState = true;
                                                  if (((_model.getBranchSearched
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) &&
                                                      (GetBranchAPICall
                                                              .statusLayer2(
                                                            (_model.getBranchSearched
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          200)) {
                                                    if (!FFAppState()
                                                        .isSearchedBranch) {
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation1'] !=
                                                          null) {
                                                        setState(() =>
                                                            hasContainerTriggered1 =
                                                                true);
                                                        SchedulerBinding
                                                            .instance
                                                            .addPostFrameCallback((_) async =>
                                                                await animationsMap[
                                                                        'containerOnActionTriggerAnimation1']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0));
                                                      }
                                                      FFAppState()
                                                              .isSearchedBranch =
                                                          true;
                                                      FFAppState()
                                                          .update(() {});
                                                    }
                                                  } else {
                                                    if ((_model.getBranchSearched
                                                                ?.statusCode ??
                                                            200) ==
                                                        200) {
                                                      if (GetBranchAPICall
                                                              .statusLayer2(
                                                            (_model.getBranchSearched
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          404) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'ไม่พบข้อมูลสาขา'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'พบข้อผิดพลาดLayer2 (${GetBranchAPICall.statusLayer2(
                                                                  (_model.getBranchSearched
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.toString()})'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
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
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'พบข้อผิดพลาดConnection (${(_model.getBranchSearched?.statusCode ?? 200).toString()})'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
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
                                    ),
                                    if (((_model.getBranchSearched
                                                    ?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetBranchAPICall.statusLayer2(
                                              (_model.getBranchSearched
                                                      ?.jsonBody ??
                                                  ''),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                                  'เลือกสาขา:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .dropDownValueController1 ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.dropDownValue1 ??=
                                                        '',
                                                  ),
                                                  options: List<String>.from(
                                                      GetBranchAPICall
                                                          .branchCode(
                                                    (_model.getBranchSearched
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!),
                                                  optionLabels: GetBranchAPICall
                                                      .branchName(
                                                    (_model.getBranchSearched
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!,
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                        .dropDownValue1 = val);
                                                    HapticFeedback
                                                        .mediumImpact();
                                                    showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          Color(0x00000000),
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: Container(
                                                                height: double
                                                                    .infinity,
                                                                child:
                                                                    LoadingSceneWidget(),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    _model.getBudget =
                                                        await GetTargetBudgetKpiCEOAPICall
                                                            .call(
                                                      apiUrl: FFAppState()
                                                          .apiURLLocalState,
                                                      branchCode:
                                                          _model.dropDownValue1,
                                                      token: FFAppState()
                                                          .accessToken,
                                                    );
                                                    _model.getContract =
                                                        await GetTargetContractKpiCEOAPICall
                                                            .call(
                                                      apiUrl: FFAppState()
                                                          .apiURLLocalState,
                                                      branchCode:
                                                          _model.dropDownValue1,
                                                      token: FFAppState()
                                                          .accessToken,
                                                    );
                                                    if (!FFAppState()
                                                        .isSelectedBranch) {
                                                      if (animationsMap[
                                                              'rowOnActionTriggerAnimation1'] !=
                                                          null) {
                                                        animationsMap[
                                                                'rowOnActionTriggerAnimation1']!
                                                            .controller
                                                            .forward(from: 0.0);
                                                      }
                                                      FFAppState()
                                                              .isSelectedBranch =
                                                          true;
                                                      FFAppState()
                                                          .update(() {});
                                                    }
                                                    Navigator.pop(context);

                                                    setState(() {});
                                                  },
                                                  width: 180.0,
                                                  height: 50.0,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText: 'สาขา...',
                                                  fillColor: Colors.white,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0.0,
                                                  borderRadius: 0.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
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
                                          hasBeenTriggered:
                                              hasContainerTriggered1),
                                    if (_model.dropDownValue1 != null &&
                                        _model.dropDownValue1 != '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData('เป้าจำนวนเงิน',
                                                          Icons.attach_money),
                                                      ChipData('เป้าจำนวนคัน',
                                                          Icons.directions_car)
                                                    ],
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                              .choiceChipsTypeValue1 =
                                                          val?.firstOrNull);
                                                      HapticFeedback
                                                          .mediumImpact();
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          Color(0xFF213BFF),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor: Colors.white,
                                                      iconSize: 18.0,
                                                      elevation: 4.0,
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          Colors.white,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFFE3E7ED),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          Color(0xFFE3E7ED),
                                                      iconSize: 18.0,
                                                      elevation: 4.0,
                                                    ),
                                                    chipSpacing: 20.0,
                                                    rowSpacing: 12.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .choiceChipsTypeValue1 !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .choiceChipsTypeValueController1 ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      ['เป้าจำนวนเงิน'],
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData(
                                                          'เดือนปัจจุบัน  ',
                                                          Icons
                                                              .arrow_downward_rounded),
                                                      ChipData(
                                                          'เดือนที่แล้ว     ',
                                                          Icons
                                                              .skip_previous_rounded)
                                                    ],
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                              .choiceChipsMonthValue1 =
                                                          val?.firstOrNull);
                                                      HapticFeedback
                                                          .mediumImpact();
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          Color(0xFF213BFF),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor: Colors.white,
                                                      iconSize: 18.0,
                                                      elevation: 4.0,
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          Colors.white,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFFE3E7ED),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          Color(0xFFE3E7ED),
                                                      iconSize: 18.0,
                                                      elevation: 4.0,
                                                    ),
                                                    chipSpacing: 20.0,
                                                    rowSpacing: 12.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .choiceChipsMonthValue1 !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .choiceChipsMonthValueController1 ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      ['เดือนปัจจุบัน  '],
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'rowOnActionTriggerAnimation1']!,
                                        ),
                                      ),
                                  ],
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: true,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                          ),
                          if (_model.choiceChipsMonthValue1 ==
                              'เดือนปัจจุบัน  ')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      functions.showMonthYearWelfareKpiPage(
                                          GetDateTimeAPICall.currentDateYMD(
                                        (_model.getServerDateTime?.jsonBody ??
                                            ''),
                                      ).toString()),
                                      '[Month_Year]',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if (((_model.getBudget?.statusCode ?? 200) == 200) &&
                              (GetTargetBudgetKpiCEOAPICall.statusLayer2(
                                    (_model.getBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (GetTargetBudgetKpiCEOAPICall.statusLayer3TM(
                                    (_model.getBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (_model.choiceChipsMonthValue1 ==
                                  'เดือนปัจจุบัน  '))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      'พื้นที่ : ${functions.showMatNameInList(GetTargetBudgetKpiCEOAPICall.areaTypeCM(
                                            (_model.getBudget?.jsonBody ?? ''),
                                          )?.map((e) => e.toString()).toList()?.toList(), 0)}',
                                      'พื้นที่ : ...',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if (((_model.getBudget?.statusCode ?? 200) == 200) &&
                              (GetTargetBudgetKpiCEOAPICall.statusLayer2(
                                    (_model.getBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (GetTargetBudgetKpiCEOAPICall.statusLayer3TM(
                                    (_model.getBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (_model.choiceChipsMonthValue1 ==
                                  'เดือนปัจจุบัน  '))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      'เกรดพื้นที่ (เป้ารายบุคคล) : ${functions.showMatNameInList(GetTargetBudgetKpiCEOAPICall.areaGradeCM(
                                            (_model.getBudget?.jsonBody ?? ''),
                                          )?.map((e) => e.toString()).toList()?.toList(), 0)}',
                                      'เกรดพื้นที่ (เป้ารายบุคคล) : ...',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if ((_model.choiceChipsTypeValue1 ==
                                  'เป้าจำนวนเงิน') &&
                              (_model.choiceChipsMonthValue1 ==
                                  'เดือนปัจจุบัน  ') &&
                              (GetTargetBudgetKpiCEOAPICall.statusLayer3TM(
                                    (_model.getBudget?.jsonBody ?? ''),
                                  ) ==
                                  200))
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final actualBudget =
                                      GetTargetBudgetKpiCEOAPICall.actual(
                                            (_model.getBudget?.jsonBody ?? ''),
                                          )?.toList() ??
                                          [];
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: actualBudget.length,
                                    itemBuilder: (context, actualBudgetIndex) {
                                      final actualBudgetItem =
                                          actualBudget[actualBudgetIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 5.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 5.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFE9FFEA),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 8.0, 24.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          'รหัสพนักงาน: ${functions.showMatNameInList(GetTargetBudgetKpiCEOAPICall.employeeID(
                                                                (_model.getBudget
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toList(), actualBudgetIndex)}',
                                                          'รหัสพนักงาน: -',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .showMatNameInList(
                                                                  GetTargetBudgetKpiCEOAPICall
                                                                          .ageOfPositionCM(
                                                                    (_model.getBudget
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )
                                                                      ?.map((e) =>
                                                                          e.toString())
                                                                      .toList()
                                                                      ?.toList(),
                                                                  actualBudgetIndex),
                                                          'อายุงาน ...',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 300.0,
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: custom_widgets
                                                        .RadialGauge(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      maxValue: functions
                                                          .showMatNameInList(
                                                              GetTargetBudgetKpiCEOAPICall
                                                                  .targetBudget(
                                                                (_model.getBudget
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toList(),
                                                              actualBudgetIndex),
                                                      value: functions
                                                          .showMatNameInList(
                                                              GetTargetBudgetKpiCEOAPICall
                                                                  .actual(
                                                                (_model.getBudget
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toList(),
                                                              actualBudgetIndex),
                                                      labelOffset: 15.0,
                                                      axisLabelSize: 10.0,
                                                      totalValueLabelSize: 18.0,
                                                      valueUnitLabelSize: 14.0,
                                                      valueUnitLabelText:
                                                          'จำนวนเงิน',
                                                      totalValueUnitLabelText:
                                                          'บาท',
                                                      endValue1: 0.5,
                                                      startValue2: 0.5,
                                                      endValue2: 0.8,
                                                      startValue3: 0.8,
                                                      color1: Color(0xFFEE4F22),
                                                      color2: Color(0xFFEEC122),
                                                      color3: Color(0xFF7BC722),
                                                      startWidth1: 0.265,
                                                      endWidth1: 0.265,
                                                      startWidth2: 0.265,
                                                      endWidth2: 0.265,
                                                      startWidth3: 0.265,
                                                      endWidth3: 0.265,
                                                      isShowTick: true,
                                                      startWidth4: 0.265,
                                                      endWidth4: 0.265,
                                                      startWidth5: 0.265,
                                                      endWidth5: 0.265,
                                                      color4: Colors.black,
                                                      color5: Colors.black,
                                                      startValue4: 1.0,
                                                      endValue4: 1.0,
                                                      startValue5: 1.0,
                                                      endValue5: 1.0,
                                                      endValue3: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'ทำได้',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .showMatNameInList(
                                                                      GetTargetBudgetKpiCEOAPICall
                                                                          .actual(
                                                                        (_model.getBudget?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      actualBudgetIndex),
                                                              '-',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'เป้า',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .showMatNameInList(
                                                                      GetTargetBudgetKpiCEOAPICall
                                                                          .targetBudget(
                                                                        (_model.getBudget?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      actualBudgetIndex),
                                                              '-',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'สถานะ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .checkMeanBudgetKPI(
                                                                      functions.removeCommaFromNumText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                        functions.showMatNameInList(
                                                                            GetTargetBudgetKpiCEOAPICall.actual(
                                                                              (_model.getBudget?.jsonBody ?? ''),
                                                                            )?.toList(),
                                                                            actualBudgetIndex),
                                                                        '-',
                                                                      )),
                                                                      functions.removeCommaFromNumText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                        functions.showMatNameInList(
                                                                            GetTargetBudgetKpiCEOAPICall.targetBudget(
                                                                              (_model.getBudget?.jsonBody ?? ''),
                                                                            )?.toList(),
                                                                            actualBudgetIndex),
                                                                        '-',
                                                                      ))),
                                                              '-',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          if ((_model.choiceChipsTypeValue1 ==
                                  'เป้าจำนวนคัน') &&
                              (_model.choiceChipsMonthValue1 ==
                                  'เดือนปัจจุบัน  ') &&
                              (GetTargetContractKpiCEOAPICall.statusLayer3TM(
                                    (_model.getContract?.jsonBody ?? ''),
                                  ) ==
                                  200))
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final employeeIdList = functions
                                          .createContractKpiEmpIdList(
                                              GetTargetContractKpiCEOAPICall
                                                  .employeeID(
                                            (_model.getContract?.jsonBody ??
                                                ''),
                                          )?.toList())
                                          ?.toList() ??
                                      [];
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: employeeIdList.length,
                                    itemBuilder:
                                        (context, employeeIdListIndex) {
                                      final employeeIdListItem =
                                          employeeIdList[employeeIdListIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 5.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 5.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFE9FFEA),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 8.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          'รหัสพนักงาน: ${functions.showMatNameInList(functions.createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeID(
                                                                (_model.getContract
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toList())?.toList(), employeeIdListIndex)}',
                                                          'รหัสพนักงาน: -',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          functions.showMatNameInList(
                                                              GetTargetContractKpiCEOAPICall.ageOfPositionCM(
                                                                (_model.getContract
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.map((e) => e.toString()).toList()?.toList(),
                                                              functions.getIndexOfSomethingList(
                                                                  GetTargetContractKpiCEOAPICall.employeeID(
                                                                    (_model.getContract
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?.toList(),
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeID(
                                                                            (_model.getContract?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          ?.toList(),
                                                                      employeeIdListIndex))),
                                                          'อายุงาน ...',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final productTypeList = functions
                                                            .getContractKpiProductTypeIndex(
                                                                GetTargetContractKpiCEOAPICall.employeeID(
                                                                  (_model.getContract
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.toList(),
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeID(
                                                                          (_model.getContract?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        ?.toList(),
                                                                    employeeIdListIndex))
                                                            ?.toList() ??
                                                        [];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          productTypeList
                                                              .length,
                                                          (productTypeListIndex) {
                                                        final productTypeListItem =
                                                            productTypeList[
                                                                productTypeListIndex];
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          height: 180.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.9,
                                                                height: 80.0,
                                                                child: custom_widgets
                                                                    .LinearGauge(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.9,
                                                                  height: 80.0,
                                                                  maxValue: functions.getDoubleFromStringList(
                                                                      GetTargetContractKpiCEOAPICall.targetQuantity(
                                                                        (_model.getContract?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      functions.showMatAmountInList(
                                                                          functions
                                                                              .getContractKpiProductTypeIndex(
                                                                                  GetTargetContractKpiCEOAPICall.employeeID(
                                                                                    (_model.getContract?.jsonBody ?? ''),
                                                                                  )?.toList(),
                                                                                  functions.showMatNameInList(
                                                                                      functions
                                                                                          .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeID(
                                                                                            (_model.getContract?.jsonBody ?? ''),
                                                                                          )?.toList())
                                                                                          ?.toList(),
                                                                                      employeeIdListIndex))
                                                                              ?.toList(),
                                                                          productTypeListIndex)),
                                                                  value: functions.getDoubleFromStringList(
                                                                      GetTargetContractKpiCEOAPICall.actual(
                                                                        (_model.getContract?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      functions.showMatAmountInList(
                                                                          functions
                                                                              .getContractKpiProductTypeIndex(
                                                                                  GetTargetContractKpiCEOAPICall.employeeID(
                                                                                    (_model.getContract?.jsonBody ?? ''),
                                                                                  )?.toList(),
                                                                                  functions.showMatNameInList(
                                                                                      functions
                                                                                          .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeID(
                                                                                            (_model.getContract?.jsonBody ?? ''),
                                                                                          )?.toList())
                                                                                          ?.toList(),
                                                                                      employeeIdListIndex))
                                                                              ?.toList(),
                                                                          productTypeListIndex)),
                                                                  interval: 1.0,
                                                                  trackThickness:
                                                                      24.0,
                                                                  rangeColor: functions.getLinearGaugeColor(
                                                                      FFAppState()
                                                                          .kpiGaugeColorListMain
                                                                          .toList(),
                                                                      productTypeListIndex),
                                                                  gaugeAnimationMillisec:
                                                                      2000,
                                                                  markerAnimationMillisec:
                                                                      1500,
                                                                  widgetPointerWidth:
                                                                      40.0,
                                                                  widgetPointerHeight:
                                                                      40.0,
                                                                  widgetPointerColor: functions.getLinearGaugeColor(
                                                                      FFAppState()
                                                                          .kpiGaugeColorListMain
                                                                          .toList(),
                                                                      productTypeListIndex),
                                                                  widgetPointerShadowColor:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    functions.getLinearGaugeColor(
                                                                        FFAppState()
                                                                            .kpiGaugeColorList2
                                                                            .toList(),
                                                                        productTypeListIndex),
                                                                    Color(
                                                                        0xFF93FF41),
                                                                  ),
                                                                  widgetPointerTextColor:
                                                                      Colors
                                                                          .white,
                                                                  widgetPointerText: functions.showMatNameInList(
                                                                      GetTargetContractKpiCEOAPICall.productType(
                                                                        (_model.getContract?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      functions.showMatAmountInList(
                                                                          functions
                                                                              .getContractKpiProductTypeIndex(
                                                                                  GetTargetContractKpiCEOAPICall.employeeID(
                                                                                    (_model.getContract?.jsonBody ?? ''),
                                                                                  )?.toList(),
                                                                                  functions.showMatNameInList(
                                                                                      functions
                                                                                          .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeID(
                                                                                            (_model.getContract?.jsonBody ?? ''),
                                                                                          )?.toList())
                                                                                          ?.toList(),
                                                                                      employeeIdListIndex))
                                                                              ?.toList(),
                                                                          productTypeListIndex)),
                                                                  isHorizontal:
                                                                      true,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            12.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            'ทำได้',
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          functions
                                                                              .stringDoubleToStringInt(valueOrDefault<String>(
                                                                            functions.showMatNameInList(
                                                                                GetTargetContractKpiCEOAPICall.actual(
                                                                                  (_model.getContract?.jsonBody ?? ''),
                                                                                )?.toList(),
                                                                                functions.showMatAmountInList(
                                                                                    functions
                                                                                        .getContractKpiProductTypeIndex(
                                                                                            GetTargetContractKpiCEOAPICall.employeeID(
                                                                                              (_model.getContract?.jsonBody ?? ''),
                                                                                            )?.toList(),
                                                                                            functions.showMatNameInList(
                                                                                                functions
                                                                                                    .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeID(
                                                                                                      (_model.getContract?.jsonBody ?? ''),
                                                                                                    )?.toList())
                                                                                                    ?.toList(),
                                                                                                employeeIdListIndex))
                                                                                        ?.toList(),
                                                                                    productTypeListIndex)),
                                                                            '[actual]',
                                                                          )),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            'เป้า',
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          functions
                                                                              .stringDoubleToStringInt(valueOrDefault<String>(
                                                                            functions.showMatNameInList(
                                                                                GetTargetContractKpiCEOAPICall.targetQuantity(
                                                                                  (_model.getContract?.jsonBody ?? ''),
                                                                                )?.toList(),
                                                                                functions.showMatAmountInList(
                                                                                    functions
                                                                                        .getContractKpiProductTypeIndex(
                                                                                            GetTargetContractKpiCEOAPICall.employeeID(
                                                                                              (_model.getContract?.jsonBody ?? ''),
                                                                                            )?.toList(),
                                                                                            functions.showMatNameInList(
                                                                                                functions
                                                                                                    .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeID(
                                                                                                      (_model.getContract?.jsonBody ?? ''),
                                                                                                    )?.toList())
                                                                                                    ?.toList(),
                                                                                                employeeIdListIndex))
                                                                                        ?.toList(),
                                                                                    productTypeListIndex)),
                                                                            '[target_quantity]',
                                                                          )),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            'สถานะ',
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          functions.checkMeanBudgetKPI(
                                                                              functions.showMatNameInList(
                                                                                  GetTargetContractKpiCEOAPICall.actual(
                                                                                    (_model.getContract?.jsonBody ?? ''),
                                                                                  )?.toList(),
                                                                                  functions.showMatAmountInList(
                                                                                      functions
                                                                                          .getContractKpiProductTypeIndex(
                                                                                              GetTargetContractKpiCEOAPICall.employeeID(
                                                                                                (_model.getContract?.jsonBody ?? ''),
                                                                                              )?.toList(),
                                                                                              functions.showMatNameInList(
                                                                                                  functions
                                                                                                      .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeID(
                                                                                                        (_model.getContract?.jsonBody ?? ''),
                                                                                                      )?.toList())
                                                                                                      ?.toList(),
                                                                                                  employeeIdListIndex))
                                                                                          ?.toList(),
                                                                                      productTypeListIndex)),
                                                                              functions.showMatNameInList(
                                                                                  GetTargetContractKpiCEOAPICall.targetQuantity(
                                                                                    (_model.getContract?.jsonBody ?? ''),
                                                                                  )?.toList(),
                                                                                  functions.showMatAmountInList(
                                                                                      functions
                                                                                          .getContractKpiProductTypeIndex(
                                                                                              GetTargetContractKpiCEOAPICall.employeeID(
                                                                                                (_model.getContract?.jsonBody ?? ''),
                                                                                              )?.toList(),
                                                                                              functions.showMatNameInList(
                                                                                                  functions
                                                                                                      .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeID(
                                                                                                        (_model.getContract?.jsonBody ?? ''),
                                                                                                      )?.toList())
                                                                                                      ?.toList(),
                                                                                                  employeeIdListIndex))
                                                                                          ?.toList(),
                                                                                      productTypeListIndex))),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          if (_model.choiceChipsMonthValue1 ==
                              'เดือนที่แล้ว     ')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      functions.getWelfareKpiDateLastMonth(
                                          GetDateTimeAPICall.currentDateYMD(
                                        (_model.getServerDateTime?.jsonBody ??
                                            ''),
                                      ).toString()),
                                      '[MMYY_Last_Month]',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if (((_model.getBudget?.statusCode ?? 200) == 200) &&
                              (GetTargetBudgetKpiCEOAPICall.statusLayer2(
                                    (_model.getBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (GetTargetBudgetKpiCEOAPICall.statusLayer3LM(
                                    (_model.getBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (_model.choiceChipsMonthValue1 ==
                                  'เดือนที่แล้ว     '))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      'พื้นที่ : ${functions.showMatNameInList(GetTargetBudgetKpiCEOAPICall.areaTypeLM(
                                            (_model.getBudget?.jsonBody ?? ''),
                                          )?.map((e) => e.toString()).toList()?.toList(), 0)}',
                                      'พื้นที่ : ...',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if (((_model.getBudget?.statusCode ?? 200) == 200) &&
                              (GetTargetBudgetKpiCEOAPICall.statusLayer2(
                                    (_model.getBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (GetTargetBudgetKpiCEOAPICall.statusLayer3LM(
                                    (_model.getBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (_model.choiceChipsMonthValue1 ==
                                  'เดือนที่แล้ว     '))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      'เกรดพื้นที่ (เป้ารายบุคคล) : ${functions.showMatNameInList(GetTargetBudgetKpiCEOAPICall.areaGradeLM(
                                            (_model.getBudget?.jsonBody ?? ''),
                                          )?.map((e) => e.toString()).toList()?.toList(), 0)}',
                                      'เกรดพื้นที่ (เป้ารายบุคคล) : ...',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if ((_model.choiceChipsTypeValue1 ==
                                  'เป้าจำนวนเงิน') &&
                              (_model.choiceChipsMonthValue1 ==
                                  'เดือนที่แล้ว     ') &&
                              (GetTargetBudgetKpiCEOAPICall.statusLayer3LM(
                                    (_model.getBudget?.jsonBody ?? ''),
                                  ) ==
                                  200))
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final actualBudgetLM =
                                      GetTargetBudgetKpiCEOAPICall
                                              .actualBudgetLM(
                                            (_model.getBudget?.jsonBody ?? ''),
                                          )?.toList() ??
                                          [];
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: actualBudgetLM.length,
                                    itemBuilder:
                                        (context, actualBudgetLMIndex) {
                                      final actualBudgetLMItem =
                                          actualBudgetLM[actualBudgetLMIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 5.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 5.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFE9FFEA),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 8.0, 24.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          'รหัสพนักงาน: ${functions.showMatNameInList(GetTargetBudgetKpiCEOAPICall.employeeIdLM(
                                                                (_model.getBudget
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toList(), actualBudgetLMIndex)}',
                                                          'รหัสพนักงาน: -',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .showMatNameInList(
                                                                  GetTargetBudgetKpiCEOAPICall
                                                                          .ageOfPositionLM(
                                                                    (_model.getBudget
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )
                                                                      ?.map((e) =>
                                                                          e.toString())
                                                                      .toList()
                                                                      ?.toList(),
                                                                  actualBudgetLMIndex),
                                                          'อายุงาน ...',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: 300.0,
                                                  decoration: BoxDecoration(),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: custom_widgets
                                                        .RadialGauge(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      maxValue: functions
                                                          .showMatNameInList(
                                                              GetTargetBudgetKpiCEOAPICall
                                                                  .targetBudgetLM(
                                                                (_model.getBudget
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toList(),
                                                              actualBudgetLMIndex),
                                                      value: functions
                                                          .showMatNameInList(
                                                              GetTargetBudgetKpiCEOAPICall
                                                                  .actualBudgetLM(
                                                                (_model.getBudget
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toList(),
                                                              actualBudgetLMIndex),
                                                      labelOffset: 15.0,
                                                      axisLabelSize: 10.0,
                                                      totalValueLabelSize: 18.0,
                                                      valueUnitLabelSize: 14.0,
                                                      valueUnitLabelText:
                                                          'จำนวนเงิน',
                                                      totalValueUnitLabelText:
                                                          'บาท',
                                                      endValue1: 0.5,
                                                      startValue2: 0.5,
                                                      endValue2: 0.8,
                                                      startValue3: 0.8,
                                                      color1: Color(0xFFEE4F22),
                                                      color2: Color(0xFFEEC122),
                                                      color3: Color(0xFF7BC722),
                                                      startWidth1: 0.265,
                                                      endWidth1: 0.265,
                                                      startWidth2: 0.265,
                                                      endWidth2: 0.265,
                                                      startWidth3: 0.265,
                                                      endWidth3: 0.265,
                                                      isShowTick: true,
                                                      startWidth4: 0.265,
                                                      endWidth4: 0.265,
                                                      startWidth5: 0.265,
                                                      endWidth5: 0.265,
                                                      color4: Colors.black,
                                                      color5: Colors.black,
                                                      startValue4: 1.0,
                                                      endValue4: 1.0,
                                                      startValue5: 1.0,
                                                      endValue5: 1.0,
                                                      endValue3: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'ทำได้',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .showMatNameInList(
                                                                      GetTargetBudgetKpiCEOAPICall
                                                                          .actualBudgetLM(
                                                                        (_model.getBudget?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      actualBudgetLMIndex),
                                                              '-',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'เป้า',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .showMatNameInList(
                                                                      GetTargetBudgetKpiCEOAPICall
                                                                          .targetBudgetLM(
                                                                        (_model.getBudget?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      actualBudgetLMIndex),
                                                              '-',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Text(
                                                              'สถานะ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .checkMeanBudgetKPI(
                                                                      functions.removeCommaFromNumText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                        functions.showMatNameInList(
                                                                            GetTargetBudgetKpiCEOAPICall.actualBudgetLM(
                                                                              (_model.getBudget?.jsonBody ?? ''),
                                                                            )?.toList(),
                                                                            actualBudgetLMIndex),
                                                                        '-',
                                                                      )),
                                                                      functions.removeCommaFromNumText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                        functions.showMatNameInList(
                                                                            GetTargetBudgetKpiCEOAPICall.targetBudgetLM(
                                                                              (_model.getBudget?.jsonBody ?? ''),
                                                                            )?.toList(),
                                                                            actualBudgetLMIndex),
                                                                        '-',
                                                                      ))),
                                                              '-',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          if ((_model.choiceChipsTypeValue1 ==
                                  'เป้าจำนวนคัน') &&
                              (_model.choiceChipsMonthValue1 ==
                                  'เดือนที่แล้ว     ') &&
                              (GetTargetContractKpiCEOAPICall.statusLayer3LM(
                                    (_model.getContract?.jsonBody ?? ''),
                                  ) ==
                                  200))
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final employeeIdListLM = functions
                                          .createContractKpiEmpIdList(
                                              GetTargetContractKpiCEOAPICall
                                                  .employeeIdLM(
                                            (_model.getContract?.jsonBody ??
                                                ''),
                                          )?.toList())
                                          ?.toList() ??
                                      [];
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: employeeIdListLM.length,
                                    itemBuilder:
                                        (context, employeeIdListLMIndex) {
                                      final employeeIdListLMItem =
                                          employeeIdListLM[
                                              employeeIdListLMIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 5.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 5.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFE9FFEA),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 8.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          'รหัสพนักงาน: ${functions.showMatNameInList(functions.createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                (_model.getContract
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toList())?.toList(), employeeIdListLMIndex)}',
                                                          'รหัสพนักงาน: -',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          functions.showMatNameInList(
                                                              GetTargetContractKpiCEOAPICall.ageOfPositionLM(
                                                                (_model.getContract
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toList(),
                                                              functions.getIndexOfSomethingList(
                                                                  GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                    (_model.getContract
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?.toList(),
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                            (_model.getContract?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          ?.toList(),
                                                                      employeeIdListLMIndex))),
                                                          'อายุงาน ...',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final productTypeListLM = functions
                                                            .getContractKpiProductTypeIndex(
                                                                GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                  (_model.getContract
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.toList(),
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                          (_model.getContract?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        ?.toList(),
                                                                    employeeIdListLMIndex))
                                                            ?.toList() ??
                                                        [];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          productTypeListLM
                                                              .length,
                                                          (productTypeListLMIndex) {
                                                        final productTypeListLMItem =
                                                            productTypeListLM[
                                                                productTypeListLMIndex];
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          height: 180.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.9,
                                                                height: 80.0,
                                                                child: custom_widgets
                                                                    .LinearGauge(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.9,
                                                                  height: 80.0,
                                                                  maxValue: functions.getDoubleFromStringList(
                                                                      GetTargetContractKpiCEOAPICall.targetQuantityLM(
                                                                        (_model.getContract?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      functions.showMatAmountInList(
                                                                          functions
                                                                              .getContractKpiProductTypeIndex(
                                                                                  GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                    (_model.getContract?.jsonBody ?? ''),
                                                                                  )?.toList(),
                                                                                  functions.showMatNameInList(
                                                                                      functions
                                                                                          .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                            (_model.getContract?.jsonBody ?? ''),
                                                                                          )?.toList())
                                                                                          ?.toList(),
                                                                                      employeeIdListLMIndex))
                                                                              ?.toList(),
                                                                          productTypeListLMIndex)),
                                                                  value: functions.getDoubleFromStringList(
                                                                      GetTargetContractKpiCEOAPICall.actualBudgetLM(
                                                                        (_model.getContract?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      functions.showMatAmountInList(
                                                                          functions
                                                                              .getContractKpiProductTypeIndex(
                                                                                  GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                    (_model.getContract?.jsonBody ?? ''),
                                                                                  )?.toList(),
                                                                                  functions.showMatNameInList(
                                                                                      functions
                                                                                          .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                            (_model.getContract?.jsonBody ?? ''),
                                                                                          )?.toList())
                                                                                          ?.toList(),
                                                                                      employeeIdListLMIndex))
                                                                              ?.toList(),
                                                                          productTypeListLMIndex)),
                                                                  interval: 1.0,
                                                                  trackThickness:
                                                                      24.0,
                                                                  rangeColor: functions.getLinearGaugeColor(
                                                                      FFAppState()
                                                                          .kpiGaugeColorListMain
                                                                          .toList(),
                                                                      productTypeListLMIndex),
                                                                  gaugeAnimationMillisec:
                                                                      2000,
                                                                  markerAnimationMillisec:
                                                                      1500,
                                                                  widgetPointerWidth:
                                                                      40.0,
                                                                  widgetPointerHeight:
                                                                      40.0,
                                                                  widgetPointerColor: functions.getLinearGaugeColor(
                                                                      FFAppState()
                                                                          .kpiGaugeColorListMain
                                                                          .toList(),
                                                                      productTypeListLMIndex),
                                                                  widgetPointerShadowColor:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    functions.getLinearGaugeColor(
                                                                        FFAppState()
                                                                            .kpiGaugeColorList2
                                                                            .toList(),
                                                                        productTypeListLMIndex),
                                                                    Color(
                                                                        0xFF93FF41),
                                                                  ),
                                                                  widgetPointerTextColor:
                                                                      Colors
                                                                          .white,
                                                                  widgetPointerText: functions.showMatNameInList(
                                                                      GetTargetContractKpiCEOAPICall.productTypeLM(
                                                                        (_model.getContract?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      functions.showMatAmountInList(
                                                                          functions
                                                                              .getContractKpiProductTypeIndex(
                                                                                  GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                    (_model.getContract?.jsonBody ?? ''),
                                                                                  )?.toList(),
                                                                                  functions.showMatNameInList(
                                                                                      functions
                                                                                          .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                            (_model.getContract?.jsonBody ?? ''),
                                                                                          )?.toList())
                                                                                          ?.toList(),
                                                                                      employeeIdListLMIndex))
                                                                              ?.toList(),
                                                                          productTypeListLMIndex)),
                                                                  isHorizontal:
                                                                      true,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            12.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            'ทำได้',
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          functions
                                                                              .stringDoubleToStringInt(valueOrDefault<String>(
                                                                            functions.showMatNameInList(
                                                                                GetTargetContractKpiCEOAPICall.actualBudgetLM(
                                                                                  (_model.getContract?.jsonBody ?? ''),
                                                                                )?.toList(),
                                                                                functions.showMatAmountInList(
                                                                                    functions
                                                                                        .getContractKpiProductTypeIndex(
                                                                                            GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                              (_model.getContract?.jsonBody ?? ''),
                                                                                            )?.toList(),
                                                                                            functions.showMatNameInList(
                                                                                                functions
                                                                                                    .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                                      (_model.getContract?.jsonBody ?? ''),
                                                                                                    )?.toList())
                                                                                                    ?.toList(),
                                                                                                employeeIdListLMIndex))
                                                                                        ?.toList(),
                                                                                    productTypeListLMIndex)),
                                                                            '[actual]',
                                                                          )),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            'เป้า',
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          functions
                                                                              .stringDoubleToStringInt(valueOrDefault<String>(
                                                                            functions.showMatNameInList(
                                                                                GetTargetContractKpiCEOAPICall.targetQuantityLM(
                                                                                  (_model.getContract?.jsonBody ?? ''),
                                                                                )?.toList(),
                                                                                functions.showMatAmountInList(
                                                                                    functions
                                                                                        .getContractKpiProductTypeIndex(
                                                                                            GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                              (_model.getContract?.jsonBody ?? ''),
                                                                                            )?.toList(),
                                                                                            functions.showMatNameInList(
                                                                                                functions
                                                                                                    .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                                      (_model.getContract?.jsonBody ?? ''),
                                                                                                    )?.toList())
                                                                                                    ?.toList(),
                                                                                                employeeIdListLMIndex))
                                                                                        ?.toList(),
                                                                                    productTypeListLMIndex)),
                                                                            '[target_quantity]',
                                                                          )),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            'สถานะ',
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          functions.checkMeanBudgetKPI(
                                                                              functions.showMatNameInList(
                                                                                  GetTargetContractKpiCEOAPICall.actualBudgetLM(
                                                                                    (_model.getContract?.jsonBody ?? ''),
                                                                                  )?.toList(),
                                                                                  functions.showMatAmountInList(
                                                                                      functions
                                                                                          .getContractKpiProductTypeIndex(
                                                                                              GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                                (_model.getContract?.jsonBody ?? ''),
                                                                                              )?.toList(),
                                                                                              functions.showMatNameInList(
                                                                                                  functions
                                                                                                      .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                                        (_model.getContract?.jsonBody ?? ''),
                                                                                                      )?.toList())
                                                                                                      ?.toList(),
                                                                                                  employeeIdListLMIndex))
                                                                                          ?.toList(),
                                                                                      productTypeListLMIndex)),
                                                                              functions.showMatNameInList(
                                                                                  GetTargetContractKpiCEOAPICall.targetQuantityLM(
                                                                                    (_model.getContract?.jsonBody ?? ''),
                                                                                  )?.toList(),
                                                                                  functions.showMatAmountInList(
                                                                                      functions
                                                                                          .getContractKpiProductTypeIndex(
                                                                                              GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                                (_model.getContract?.jsonBody ?? ''),
                                                                                              )?.toList(),
                                                                                              functions.showMatNameInList(
                                                                                                  functions
                                                                                                      .createContractKpiEmpIdList(GetTargetContractKpiCEOAPICall.employeeIdLM(
                                                                                                        (_model.getContract?.jsonBody ?? ''),
                                                                                                      )?.toList())
                                                                                                      ?.toList(),
                                                                                                  employeeIdListLMIndex))
                                                                                          ?.toList(),
                                                                                      productTypeListLMIndex))),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          if (((GetTargetBudgetKpiCEOAPICall.statusLayer3TM(
                                        (_model.getBudget?.jsonBody ?? ''),
                                      ) ==
                                      404) &&
                                  (GetTargetContractKpiCEOAPICall
                                          .statusLayer3TM(
                                        (_model.getContract?.jsonBody ?? ''),
                                      ) ==
                                      404) &&
                                  (_model.choiceChipsMonthValue1 ==
                                      'เดือนปัจจุบัน  ')) ||
                              ((GetTargetContractKpiCEOAPICall.statusLayer3LM(
                                        (_model.getContract?.jsonBody ?? ''),
                                      ) ==
                                      404) &&
                                  (GetTargetBudgetKpiCEOAPICall.statusLayer3LM(
                                        (_model.getBudget?.jsonBody ?? ''),
                                      ) ==
                                      404) &&
                                  (_model.choiceChipsMonthValue1 ==
                                      'เดือนที่แล้ว     ')) ||
                              ((GetTargetContractKpiCEOAPICall.statusLayer3TM(
                                        (_model.getContract?.jsonBody ?? ''),
                                      ) ==
                                      404) &&
                                  (_model.choiceChipsMonthValue1 ==
                                      'เดือนปัจจุบัน  ') &&
                                  (_model.choiceChipsTypeValue1 ==
                                      'เป้าจำนวนคัน')) ||
                              ((GetTargetContractKpiCEOAPICall.statusLayer3LM(
                                        (_model.getContract?.jsonBody ?? ''),
                                      ) ==
                                      404) &&
                                  (_model.choiceChipsMonthValue1 ==
                                      'เดือนที่แล้ว     ') &&
                                  (_model.choiceChipsTypeValue1 ==
                                      'เป้าจำนวนคัน')))
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ไม่พบข้อมูลของเดือนนี้',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            child: ExpandableNotifier(
                              controller:
                                  _model.expandableExpandableController2,
                              child: ExpandablePanel(
                                header: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Text(
                                    'ตัวเลือกดู KPI รายบุคคล',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                collapsed: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'แตะเพื่อเปิดตัวกรอง',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                expanded: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                controller: _model
                                                    .employeeKeywordInputTextController,
                                                focusNode: _model
                                                    .employeeKeywordInputFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText:
                                                      'ชื่อเล่น/สังกัด/รหัสพนักงาน',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
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
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณากรอก ชื่อเล่น/สังกัด/รหัสพนักงาน ของพนักงานที่ต้องการจะค้นหา'),
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
                                                  }
                                                  showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    barrierColor:
                                                        Color(0x00000000),
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: Container(
                                                              height: double
                                                                  .infinity,
                                                              child:
                                                                  LoadingSceneWidget(),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  _model.getEmployeeSearched =
                                                      await GetEmployeeIdFromNicknameAPICall
                                                          .call(
                                                    token: FFAppState()
                                                        .accessToken,
                                                    searchName: _model
                                                        .employeeKeywordInputTextController
                                                        .text,
                                                    apiUrl: FFAppState()
                                                        .apiURLLocalState,
                                                  );
                                                  _shouldSetState = true;
                                                  if (((_model.getEmployeeSearched
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) &&
                                                      (GetEmployeeIdFromNicknameAPICall
                                                              .statusLayer2(
                                                            (_model.getEmployeeSearched
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          200)) {
                                                    if (!FFAppState()
                                                        .isEmployeeSearched) {
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation2'] !=
                                                          null) {
                                                        setState(() =>
                                                            hasContainerTriggered2 =
                                                                true);
                                                        SchedulerBinding
                                                            .instance
                                                            .addPostFrameCallback((_) async =>
                                                                await animationsMap[
                                                                        'containerOnActionTriggerAnimation2']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0));
                                                      }
                                                      FFAppState()
                                                              .isEmployeeSearched =
                                                          true;
                                                      FFAppState()
                                                          .update(() {});
                                                    }
                                                  } else {
                                                    if ((_model.getEmployeeSearched
                                                                ?.statusCode ??
                                                            200) ==
                                                        200) {
                                                      if (GetEmployeeIdFromNicknameAPICall
                                                              .statusLayer2(
                                                            (_model.getEmployeeSearched
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          404) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(functions
                                                                    .showMatNameInList(
                                                                        GetEmployeeIdFromNicknameAPICall
                                                                            .detailMessage(
                                                                          (_model.getEmployeeSearched?.jsonBody ??
                                                                              ''),
                                                                        )?.toList(),
                                                                        0)!),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'พบข้อผิดพลาดLayer2 (${GetEmployeeIdFromNicknameAPICall.statusLayer2(
                                                                  (_model.getEmployeeSearched
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.toString()})'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
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
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'พบข้อผิดพลาดConnection (${(_model.getEmployeeSearched?.statusCode ?? 200).toString()})'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
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
                                    ),
                                    if (((_model.getEmployeeSearched
                                                    ?.statusCode ??
                                                200) ==
                                            200) &&
                                        (GetEmployeeIdFromNicknameAPICall
                                                .statusLayer2(
                                              (_model.getEmployeeSearched
                                                      ?.jsonBody ??
                                                  ''),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .dropDownValueController2 ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.dropDownValue2 ??=
                                                        '',
                                                  ),
                                                  options: List<String>.from(
                                                      GetEmployeeIdFromNicknameAPICall
                                                          .employeeID(
                                                    (_model.getEmployeeSearched
                                                            ?.jsonBody ??
                                                        ''),
                                                  )!),
                                                  optionLabels: functions
                                                      .createEmployeeDropdown(
                                                          GetEmployeeIdFromNicknameAPICall
                                                              .mapNickname(
                                                            (_model.getEmployeeSearched
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList(),
                                                          GetEmployeeIdFromNicknameAPICall
                                                              .branch(
                                                            (_model.getEmployeeSearched
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList()),
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                        .dropDownValue2 = val);
                                                    HapticFeedback
                                                        .mediumImpact();
                                                    showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          Color(0x00000000),
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: Container(
                                                                height: double
                                                                    .infinity,
                                                                child:
                                                                    LoadingSceneWidget(),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    _model.getEmployeeBudget =
                                                        await GetEmpTargetBudgetKPIAPICall
                                                            .call(
                                                      apiUrl: FFAppState()
                                                          .apiURLLocalState,
                                                      token: FFAppState()
                                                          .accessToken,
                                                      empCode:
                                                          _model.dropDownValue2,
                                                    );
                                                    _model.getEmployeeContract =
                                                        await GetEmpTargetContractKPIAPICall
                                                            .call(
                                                      apiUrl: FFAppState()
                                                          .apiURLLocalState,
                                                      token: FFAppState()
                                                          .accessToken,
                                                      empCode:
                                                          _model.dropDownValue2,
                                                    );
                                                    if (!FFAppState()
                                                        .isEmployeeSelected) {
                                                      if (animationsMap[
                                                              'rowOnActionTriggerAnimation2'] !=
                                                          null) {
                                                        animationsMap[
                                                                'rowOnActionTriggerAnimation2']!
                                                            .controller
                                                            .forward(from: 0.0);
                                                      }
                                                      FFAppState()
                                                              .isEmployeeSelected =
                                                          true;
                                                      FFAppState()
                                                          .update(() {});
                                                    }
                                                    Navigator.pop(context);

                                                    setState(() {});
                                                  },
                                                  width: 180.0,
                                                  height: 50.0,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.black,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText: 'พนักงาน...',
                                                  fillColor: Colors.white,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0.0,
                                                  borderRadius: 0.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
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
                                              'containerOnActionTriggerAnimation2']!,
                                          hasBeenTriggered:
                                              hasContainerTriggered2),
                                    if (_model.dropDownValue2 != null &&
                                        _model.dropDownValue2 != '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData('เป้าจำนวนเงิน',
                                                          Icons.attach_money),
                                                      ChipData('เป้าจำนวนคัน',
                                                          Icons.directions_car)
                                                    ],
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                              .choiceChipsTypeValue2 =
                                                          val?.firstOrNull);
                                                      HapticFeedback
                                                          .mediumImpact();
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          Color(0xFF213BFF),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor: Colors.white,
                                                      iconSize: 18.0,
                                                      elevation: 4.0,
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          Colors.white,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFFE3E7ED),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          Color(0xFFE3E7ED),
                                                      iconSize: 18.0,
                                                      elevation: 4.0,
                                                    ),
                                                    chipSpacing: 20.0,
                                                    rowSpacing: 12.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .choiceChipsTypeValue2 !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .choiceChipsTypeValueController2 ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      ['เป้าจำนวนเงิน'],
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 0.0, 8.0),
                                                  child: FlutterFlowChoiceChips(
                                                    options: [
                                                      ChipData(
                                                          'เดือนปัจจุบัน  ',
                                                          Icons
                                                              .arrow_downward_rounded),
                                                      ChipData(
                                                          'เดือนที่แล้ว     ',
                                                          Icons
                                                              .skip_previous_rounded)
                                                    ],
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                              .choiceChipsMonthValue2 =
                                                          val?.firstOrNull);
                                                      HapticFeedback
                                                          .mediumImpact();
                                                    },
                                                    selectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          Color(0xFF213BFF),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor: Colors.white,
                                                      iconSize: 18.0,
                                                      elevation: 4.0,
                                                    ),
                                                    unselectedChipStyle:
                                                        ChipStyle(
                                                      backgroundColor:
                                                          Colors.white,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFFE3E7ED),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      iconColor:
                                                          Color(0xFFE3E7ED),
                                                      iconSize: 18.0,
                                                      elevation: 4.0,
                                                    ),
                                                    chipSpacing: 20.0,
                                                    rowSpacing: 12.0,
                                                    multiselect: false,
                                                    initialized: _model
                                                            .choiceChipsMonthValue2 !=
                                                        null,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    controller: _model
                                                            .choiceChipsMonthValueController2 ??=
                                                        FormFieldController<
                                                            List<String>>(
                                                      ['เดือนปัจจุบัน  '],
                                                    ),
                                                    wrapped: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'rowOnActionTriggerAnimation2']!,
                                        ),
                                      ),
                                  ],
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: true,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                          ),
                          if (_model.choiceChipsMonthValue2 ==
                              'เดือนปัจจุบัน  ')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      functions.showMonthYearWelfareKpiPage(
                                          GetDateTimeAPICall.currentDateYMD(
                                        (_model.getServerDateTime?.jsonBody ??
                                            ''),
                                      ).toString()),
                                      '[Month_Year]',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if (((_model.getEmployeeBudget?.statusCode ?? 200) ==
                                  200) &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer2(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer3TM(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (_model.choiceChipsMonthValue2 ==
                                  'เดือนปัจจุบัน  '))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 5.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    GetEmpTargetBudgetKPIAPICall
                                        .ageOfPositionCM(
                                      (_model.getEmployeeBudget?.jsonBody ??
                                          ''),
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if (((_model.getEmployeeBudget?.statusCode ?? 200) ==
                                  200) &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer2(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer3TM(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (_model.choiceChipsMonthValue2 ==
                                  'เดือนปัจจุบัน  '))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      'พื้นที่ : ${GetEmpTargetBudgetKPIAPICall.areaTypeCM(
                                        (_model.getEmployeeBudget?.jsonBody ??
                                            ''),
                                      ).toString()}',
                                      'พื้นที่ : ...',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if (((_model.getEmployeeBudget?.statusCode ?? 200) ==
                                  200) &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer2(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer3TM(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (_model.choiceChipsMonthValue2 ==
                                  'เดือนปัจจุบัน  '))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      'เกรดพื้นที่ (เป้ารายบุคคล) : ${GetEmpTargetBudgetKPIAPICall.areaGradeCM(
                                        (_model.getEmployeeBudget?.jsonBody ??
                                            ''),
                                      ).toString()}',
                                      'เกรดพื้นที่ (เป้ารายบุคคล) : ...',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if ((_model.choiceChipsTypeValue2 ==
                                  'เป้าจำนวนเงิน') &&
                              (_model.choiceChipsMonthValue2 ==
                                  'เดือนปัจจุบัน  ') &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer3TM(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200))
                            Expanded(
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 5.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: 470.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE9FFEA),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 8.0, 24.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      'รหัสพนักงาน: ${GetEmpTargetBudgetKPIAPICall.employeeIdTM(
                                                        (_model.getEmployeeBudget
                                                                ?.jsonBody ??
                                                            ''),
                                                      )}',
                                                      'รหัสพนักงาน: -',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 300.0,
                                              decoration: BoxDecoration(),
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child:
                                                    custom_widgets.RadialGauge(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  maxValue:
                                                      GetEmpTargetBudgetKPIAPICall
                                                          .targetBudget(
                                                    (_model.getEmployeeBudget
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  value:
                                                      GetEmpTargetBudgetKPIAPICall
                                                          .actual(
                                                    (_model.getEmployeeBudget
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  labelOffset: 15.0,
                                                  axisLabelSize: 10.0,
                                                  totalValueLabelSize: 18.0,
                                                  valueUnitLabelSize: 14.0,
                                                  valueUnitLabelText:
                                                      'จำนวนเงิน',
                                                  totalValueUnitLabelText:
                                                      'บาท',
                                                  endValue1: 0.5,
                                                  startValue2: 0.5,
                                                  endValue2: 0.8,
                                                  startValue3: 0.8,
                                                  color1: Color(0xFFEE4F22),
                                                  color2: Color(0xFFEEC122),
                                                  color3: Color(0xFF7BC722),
                                                  startWidth1: 0.265,
                                                  endWidth1: 0.265,
                                                  startWidth2: 0.265,
                                                  endWidth2: 0.265,
                                                  startWidth3: 0.265,
                                                  endWidth3: 0.265,
                                                  isShowTick: true,
                                                  startWidth4: 0.265,
                                                  endWidth4: 0.265,
                                                  startWidth5: 0.265,
                                                  endWidth5: 0.265,
                                                  color4: Colors.black,
                                                  color5: Colors.black,
                                                  startValue4: 1.0,
                                                  endValue4: 1.0,
                                                  startValue5: 1.0,
                                                  endValue5: 1.0,
                                                  endValue3: 1.0,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.85, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  '*ไม่รวมเป้า ง',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          'ทำได้',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          GetEmpTargetBudgetKPIAPICall
                                                              .actual(
                                                            (_model.getEmployeeBudget
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          '-',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .displaySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          'เป้า',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          GetEmpTargetBudgetKPIAPICall
                                                              .targetBudget(
                                                            (_model.getEmployeeBudget
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          '-',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .displaySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          'สถานะ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .checkMeanBudgetKPI(
                                                                  functions.removeCommaFromNumText(
                                                                      GetEmpTargetBudgetKPIAPICall
                                                                          .actual(
                                                                    (_model.getEmployeeBudget
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )),
                                                                  functions.removeCommaFromNumText(
                                                                      GetEmpTargetBudgetKPIAPICall
                                                                          .targetBudget(
                                                                    (_model.getEmployeeBudget
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ))),
                                                          '-',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if ((_model.choiceChipsTypeValue2 ==
                                  'เป้าจำนวนคัน') &&
                              (_model.choiceChipsMonthValue2 ==
                                  'เดือนปัจจุบัน  ') &&
                              (GetEmpTargetContractKPIAPICall.statusLayer3TM(
                                    (_model.getEmployeeContract?.jsonBody ??
                                        ''),
                                  ) ==
                                  200))
                            Expanded(
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 5.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: 565.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE9FFEA),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 8.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      'รหัสพนักงาน: ${functions.showMatNameInList(GetEmpTargetContractKPIAPICall.employeeIdTM(
                                                            (_model.getEmployeeContract
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList(), 0)}',
                                                      'รหัสพนักงาน: -',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final productTypeListEmployee =
                                                    GetEmpTargetContractKPIAPICall
                                                            .productType(
                                                          (_model.getEmployeeContract
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.toList() ??
                                                        [];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      productTypeListEmployee
                                                          .length,
                                                      (productTypeListEmployeeIndex) {
                                                    final productTypeListEmployeeItem =
                                                        productTypeListEmployee[
                                                            productTypeListEmployeeIndex];
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 180.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            height: 80.0,
                                                            child: custom_widgets
                                                                .LinearGauge(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.9,
                                                              height: 80.0,
                                                              maxValue: functions
                                                                  .getDoubleFromStringList(
                                                                      GetEmpTargetContractKPIAPICall
                                                                          .targetQuantity(
                                                                        (_model.getEmployeeContract?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      productTypeListEmployeeIndex),
                                                              value: functions
                                                                  .getDoubleFromStringList(
                                                                      GetEmpTargetContractKPIAPICall
                                                                          .actual(
                                                                        (_model.getEmployeeContract?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      productTypeListEmployeeIndex),
                                                              interval: 1.0,
                                                              trackThickness:
                                                                  24.0,
                                                              rangeColor: functions.getLinearGaugeColor(
                                                                  FFAppState()
                                                                      .kpiGaugeColorListMain
                                                                      .toList(),
                                                                  productTypeListEmployeeIndex),
                                                              gaugeAnimationMillisec:
                                                                  2000,
                                                              markerAnimationMillisec:
                                                                  1500,
                                                              widgetPointerWidth:
                                                                  40.0,
                                                              widgetPointerHeight:
                                                                  40.0,
                                                              widgetPointerColor:
                                                                  functions.getLinearGaugeColor(
                                                                      FFAppState()
                                                                          .kpiGaugeColorListMain
                                                                          .toList(),
                                                                      productTypeListEmployeeIndex),
                                                              widgetPointerShadowColor:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                functions.getLinearGaugeColor(
                                                                    FFAppState()
                                                                        .kpiGaugeColorList2
                                                                        .toList(),
                                                                    productTypeListEmployeeIndex),
                                                                Color(
                                                                    0xFF93FF41),
                                                              ),
                                                              widgetPointerTextColor:
                                                                  Colors.white,
                                                              widgetPointerText: functions
                                                                  .showMatNameInList(
                                                                      GetEmpTargetContractKPIAPICall
                                                                          .productType(
                                                                        (_model.getEmployeeContract?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      productTypeListEmployeeIndex),
                                                              isHorizontal:
                                                                  true,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        12.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        'ทำได้',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      functions.stringDoubleToStringInt(
                                                                          valueOrDefault<
                                                                              String>(
                                                                        functions.showMatNameInList(
                                                                            GetEmpTargetContractKPIAPICall.actual(
                                                                              (_model.getEmployeeContract?.jsonBody ?? ''),
                                                                            )?.toList(),
                                                                            productTypeListEmployeeIndex),
                                                                        '[actual]',
                                                                      )),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        'เป้า',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      functions.stringDoubleToStringInt(
                                                                          valueOrDefault<
                                                                              String>(
                                                                        functions.showMatNameInList(
                                                                            GetEmpTargetContractKPIAPICall.targetQuantity(
                                                                              (_model.getEmployeeContract?.jsonBody ?? ''),
                                                                            )?.toList(),
                                                                            productTypeListEmployeeIndex),
                                                                        '[target_quantity]',
                                                                      )),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        'สถานะ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      functions.checkMeanBudgetKPI(
                                                                          functions.showMatNameInList(
                                                                              GetEmpTargetContractKPIAPICall.actual(
                                                                                (_model.getEmployeeContract?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              productTypeListEmployeeIndex),
                                                                          functions.showMatNameInList(
                                                                              GetEmpTargetContractKPIAPICall.targetQuantity(
                                                                                (_model.getEmployeeContract?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              productTypeListEmployeeIndex)),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (_model.choiceChipsMonthValue2 ==
                              'เดือนที่แล้ว     ')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      functions.getWelfareKpiDateLastMonth(
                                          GetDateTimeAPICall.currentDateYMD(
                                        (_model.getServerDateTime?.jsonBody ??
                                            ''),
                                      ).toString()),
                                      '[MMYY_Last_Month]',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if (((_model.getEmployeeBudget?.statusCode ?? 200) ==
                                  200) &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer2(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer3LM(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (_model.choiceChipsMonthValue2 ==
                                  'เดือนที่แล้ว     '))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 5.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    GetEmpTargetBudgetKPIAPICall
                                        .ageOfPositionLM(
                                      (_model.getEmployeeBudget?.jsonBody ??
                                          ''),
                                    ).toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if (((_model.getEmployeeBudget?.statusCode ?? 200) ==
                                  200) &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer2(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer3LM(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (_model.choiceChipsMonthValue2 ==
                                  'เดือนที่แล้ว     '))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      'พื้นที่ : ${GetEmpTargetBudgetKPIAPICall.areaTypeLM(
                                        (_model.getEmployeeBudget?.jsonBody ??
                                            ''),
                                      ).toString()}',
                                      'พื้นที่ : ...',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if (((_model.getEmployeeBudget?.statusCode ?? 200) ==
                                  200) &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer2(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer3LM(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200) &&
                              (_model.choiceChipsMonthValue2 ==
                                  'เดือนที่แล้ว     '))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      'เกรดพื้นที่ (เป้ารายบุคคล) : ${GetEmpTargetBudgetKPIAPICall.areaGradeLM(
                                        (_model.getEmployeeBudget?.jsonBody ??
                                            ''),
                                      ).toString()}',
                                      'เกรดพื้นที่ (เป้ารายบุคคล) : ...',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          if ((_model.choiceChipsTypeValue2 ==
                                  'เป้าจำนวนเงิน') &&
                              (_model.choiceChipsMonthValue2 ==
                                  'เดือนที่แล้ว     ') &&
                              (GetEmpTargetBudgetKPIAPICall.statusLayer3LM(
                                    (_model.getEmployeeBudget?.jsonBody ?? ''),
                                  ) ==
                                  200))
                            Expanded(
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 5.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: 470.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE9FFEA),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 8.0, 24.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      'รหัสพนักงาน: ${GetEmpTargetBudgetKPIAPICall.employeeIdLM(
                                                        (_model.getEmployeeBudget
                                                                ?.jsonBody ??
                                                            ''),
                                                      )}',
                                                      'รหัสพนักงาน: -',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 300.0,
                                              decoration: BoxDecoration(),
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child:
                                                    custom_widgets.RadialGauge(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  maxValue:
                                                      GetEmpTargetBudgetKPIAPICall
                                                          .targetBudgetLM(
                                                    (_model.getEmployeeBudget
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  value:
                                                      GetEmpTargetBudgetKPIAPICall
                                                          .actualBudgetLM(
                                                    (_model.getEmployeeBudget
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  labelOffset: 15.0,
                                                  axisLabelSize: 10.0,
                                                  totalValueLabelSize: 18.0,
                                                  valueUnitLabelSize: 14.0,
                                                  valueUnitLabelText:
                                                      'จำนวนเงิน',
                                                  totalValueUnitLabelText:
                                                      'บาท',
                                                  endValue1: 0.5,
                                                  startValue2: 0.5,
                                                  endValue2: 0.8,
                                                  startValue3: 0.8,
                                                  color1: Color(0xFFEE4F22),
                                                  color2: Color(0xFFEEC122),
                                                  color3: Color(0xFF7BC722),
                                                  startWidth1: 0.265,
                                                  endWidth1: 0.265,
                                                  startWidth2: 0.265,
                                                  endWidth2: 0.265,
                                                  startWidth3: 0.265,
                                                  endWidth3: 0.265,
                                                  isShowTick: true,
                                                  startWidth4: 0.265,
                                                  endWidth4: 0.265,
                                                  startWidth5: 0.265,
                                                  endWidth5: 0.265,
                                                  color4: Colors.black,
                                                  color5: Colors.black,
                                                  startValue4: 1.0,
                                                  endValue4: 1.0,
                                                  startValue5: 1.0,
                                                  endValue5: 1.0,
                                                  endValue3: 1.0,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.85, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  '*ไม่รวมเป้า ง',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          'ทำได้',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        GetEmpTargetBudgetKPIAPICall
                                                            .actualBudgetLM(
                                                          (_model.getEmployeeBudget
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .displaySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          'เป้า',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        GetEmpTargetBudgetKPIAPICall
                                                            .targetBudgetLM(
                                                          (_model.getEmployeeBudget
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .displaySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          'สถานะ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .checkMeanBudgetKPI(
                                                                  functions.removeCommaFromNumText(
                                                                      GetEmpTargetBudgetKPIAPICall
                                                                          .actualBudgetLM(
                                                                    (_model.getEmployeeBudget
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )),
                                                                  functions.removeCommaFromNumText(
                                                                      GetEmpTargetBudgetKPIAPICall
                                                                          .targetBudgetLM(
                                                                    (_model.getEmployeeBudget
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ))),
                                                          '-',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if ((_model.choiceChipsTypeValue2 ==
                                  'เป้าจำนวนคัน') &&
                              (_model.choiceChipsMonthValue2 ==
                                  'เดือนที่แล้ว     ') &&
                              (GetEmpTargetContractKPIAPICall.statusLayer3LM(
                                    (_model.getEmployeeContract?.jsonBody ??
                                        ''),
                                  ) ==
                                  200))
                            Expanded(
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 5.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 5.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Container(
                                        width: 100.0,
                                        height: 565.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE9FFEA),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 8.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      'รหัสพนักงาน: ${functions.showMatNameInList(GetEmpTargetContractKPIAPICall.employeeIdLM(
                                                            (_model.getEmployeeContract
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList(), 0)}',
                                                      'รหัสพนักงาน: -',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final productTypeListEmpLM =
                                                    GetEmpTargetContractKPIAPICall
                                                            .productTypeLM(
                                                          (_model.getEmployeeContract
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.toList() ??
                                                        [];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      productTypeListEmpLM
                                                          .length,
                                                      (productTypeListEmpLMIndex) {
                                                    final productTypeListEmpLMItem =
                                                        productTypeListEmpLM[
                                                            productTypeListEmpLMIndex];
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 180.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            height: 80.0,
                                                            child: custom_widgets
                                                                .LinearGauge(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.9,
                                                              height: 80.0,
                                                              maxValue: functions
                                                                  .getDoubleFromStringList(
                                                                      GetEmpTargetContractKPIAPICall
                                                                          .targetQuantityLM(
                                                                        (_model.getEmployeeContract?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      productTypeListEmpLMIndex),
                                                              value: functions
                                                                  .getDoubleFromStringList(
                                                                      GetEmpTargetContractKPIAPICall
                                                                          .actualLM(
                                                                        (_model.getEmployeeContract?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      productTypeListEmpLMIndex),
                                                              interval: 1.0,
                                                              trackThickness:
                                                                  24.0,
                                                              rangeColor: functions.getLinearGaugeColor(
                                                                  FFAppState()
                                                                      .kpiGaugeColorListMain
                                                                      .toList(),
                                                                  productTypeListEmpLMIndex),
                                                              gaugeAnimationMillisec:
                                                                  2000,
                                                              markerAnimationMillisec:
                                                                  1500,
                                                              widgetPointerWidth:
                                                                  40.0,
                                                              widgetPointerHeight:
                                                                  40.0,
                                                              widgetPointerColor:
                                                                  functions.getLinearGaugeColor(
                                                                      FFAppState()
                                                                          .kpiGaugeColorListMain
                                                                          .toList(),
                                                                      productTypeListEmpLMIndex),
                                                              widgetPointerShadowColor:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                functions.getLinearGaugeColor(
                                                                    FFAppState()
                                                                        .kpiGaugeColorList2
                                                                        .toList(),
                                                                    productTypeListEmpLMIndex),
                                                                Color(
                                                                    0xFF93FF41),
                                                              ),
                                                              widgetPointerTextColor:
                                                                  Colors.white,
                                                              widgetPointerText: functions
                                                                  .showMatNameInList(
                                                                      GetEmpTargetContractKPIAPICall
                                                                          .productTypeLM(
                                                                        (_model.getEmployeeContract?.jsonBody ??
                                                                            ''),
                                                                      )?.toList(),
                                                                      productTypeListEmpLMIndex),
                                                              isHorizontal:
                                                                  true,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        12.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        'ทำได้',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      functions.stringDoubleToStringInt(
                                                                          valueOrDefault<
                                                                              String>(
                                                                        functions.showMatNameInList(
                                                                            GetEmpTargetContractKPIAPICall.actualLM(
                                                                              (_model.getEmployeeContract?.jsonBody ?? ''),
                                                                            )?.toList(),
                                                                            productTypeListEmpLMIndex),
                                                                        '[actual]',
                                                                      )),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        'เป้า',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      functions.stringDoubleToStringInt(
                                                                          valueOrDefault<
                                                                              String>(
                                                                        functions.showMatNameInList(
                                                                            GetEmpTargetContractKPIAPICall.targetQuantityLM(
                                                                              (_model.getEmployeeContract?.jsonBody ?? ''),
                                                                            )?.toList(),
                                                                            productTypeListEmpLMIndex),
                                                                        '[target_quantity]',
                                                                      )),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                      child:
                                                                          Text(
                                                                        'สถานะ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      functions.checkMeanBudgetKPI(
                                                                          functions.showMatNameInList(
                                                                              GetEmpTargetContractKPIAPICall.actualLM(
                                                                                (_model.getEmployeeContract?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              productTypeListEmpLMIndex),
                                                                          functions.showMatNameInList(
                                                                              GetEmpTargetContractKPIAPICall.targetQuantityLM(
                                                                                (_model.getEmployeeContract?.jsonBody ?? ''),
                                                                              )?.toList(),
                                                                              productTypeListEmpLMIndex)),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .displaySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (((GetEmpTargetBudgetKPIAPICall.statusLayer3TM(
                                        (_model.getEmployeeBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      404) &&
                                  (GetEmpTargetContractKPIAPICall
                                          .statusLayer3TM(
                                        (_model.getEmployeeContract?.jsonBody ??
                                            ''),
                                      ) ==
                                      404) &&
                                  (_model.choiceChipsMonthValue2 ==
                                      'เดือนปัจจุบัน  ')) ||
                              ((GetEmpTargetBudgetKPIAPICall.statusLayer3LM(
                                        (_model.getEmployeeBudget?.jsonBody ??
                                            ''),
                                      ) ==
                                      404) &&
                                  (GetEmpTargetContractKPIAPICall
                                          .statusLayer3LM(
                                        (_model.getEmployeeContract?.jsonBody ??
                                            ''),
                                      ) ==
                                      404) &&
                                  (_model.choiceChipsMonthValue2 ==
                                      'เดือนที่แล้ว     ')) ||
                              ((GetEmpTargetContractKPIAPICall.statusLayer3TM(
                                        (_model.getEmployeeContract?.jsonBody ??
                                            ''),
                                      ) ==
                                      404) &&
                                  (_model.choiceChipsMonthValue2 ==
                                      'เดือนปัจจุบัน  ') &&
                                  (_model.choiceChipsTypeValue2 ==
                                      'เป้าจำนวนคัน')) ||
                              ((GetEmpTargetContractKPIAPICall.statusLayer3LM(
                                        (_model.getEmployeeContract?.jsonBody ??
                                            ''),
                                      ) ==
                                      404) &&
                                  (_model.choiceChipsMonthValue2 ==
                                      'เดือนที่แล้ว     ') &&
                                  (_model.choiceChipsTypeValue2 ==
                                      'เป้าจำนวนคัน')))
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ไม่พบข้อมูลของเดือนนี้',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
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
                                      Icons.format_list_bulleted,
                                      color: Colors.black,
                                      size: 29.0,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'ประเภทสังกัด',
                                      style: FlutterFlowTheme.of(context)
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
                                    child: FlutterFlowDropDown<String>(
                                      controller: _model
                                              .areaRegionDropDownValueController ??=
                                          FormFieldController<String>(
                                        _model.areaRegionDropDownValue ??= '',
                                      ),
                                      options:
                                          List<String>.from(['เขต', 'ภาค']),
                                      optionLabels: ['เขต', 'ภาค'],
                                      onChanged: (val) async {
                                        setState(() => _model
                                            .areaRegionDropDownValue = val);
                                        HapticFeedback.mediumImpact();
                                      },
                                      width: 180.0,
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'สังกัด...',
                                      fillColor: Colors.white,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 0.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_model.areaRegionDropDownValue != null &&
                              _model.areaRegionDropDownValue != '')
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
                                        Icons.home_work_outlined,
                                        color: Colors.black,
                                        size: 29.0,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'เลือก:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .areaRegionSelectedDropDownValueController ??=
                                            FormFieldController<String>(null),
                                        options: _model
                                                    .areaRegionDropDownValue ==
                                                'เขต'
                                            ? functions.getRegionAreaNameCode(
                                                GetRegionAreaAPICall.areaName(
                                                  (_model.getArea?.jsonBody ??
                                                      ''),
                                                )
                                                    ?.map((e) => e.toString())
                                                    .toList()
                                                    ?.toList(),
                                                GetRegionAreaAPICall.areaCode(
                                                  (_model.getArea?.jsonBody ??
                                                      ''),
                                                )
                                                    ?.map((e) => e.toString())
                                                    .toList()
                                                    ?.toList())
                                            : functions.getRegionAreaNameCode(
                                                GetRegionAreaAPICall.regionName(
                                                  (_model.getRegion?.jsonBody ??
                                                      ''),
                                                )?.toList(),
                                                GetRegionAreaAPICall.regionCode(
                                                  (_model.getRegion?.jsonBody ??
                                                      ''),
                                                )?.toList()),
                                        onChanged: (val) => setState(() => _model
                                                .areaRegionSelectedDropDownValue =
                                            val),
                                        searchHintTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                        searchTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0.0,
                                                ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'เลือกเขต/ภาค...',
                                        searchHintText: 'ค้นหา...',
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 0.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                    if (FFAppState().opsMenuVisible)
                                      Expanded(
                                        flex: 6,
                                        child: Autocomplete<String>(
                                          initialValue: TextEditingValue(),
                                          optionsBuilder: (textEditingValue) {
                                            if (textEditingValue.text == '') {
                                              return const Iterable<
                                                  String>.empty();
                                            }
                                            return (_model.areaRegionDropDownValue ==
                                                        'เขต'
                                                    ? functions
                                                        .getRegionAreaNameCode(
                                                            GetRegionAreaAPICall
                                                                    .areaName(
                                                              (_model.getArea
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                                ?.map((e) => e
                                                                    .toString())
                                                                .toList()
                                                                ?.toList(),
                                                            GetRegionAreaAPICall
                                                                    .areaCode(
                                                              (_model.getArea
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                                ?.map((e) => e
                                                                    .toString())
                                                                .toList()
                                                                ?.toList())
                                                    : functions
                                                        .getRegionAreaNameCode(
                                                            GetRegionAreaAPICall
                                                                .regionName(
                                                              (_model.getRegion
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )?.toList(),
                                                            GetRegionAreaAPICall
                                                                .regionCode(
                                                              (_model.getRegion
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )?.toList()))
                                                .where((option) {
                                              final lowercaseOption =
                                                  option.toLowerCase();
                                              return lowercaseOption.contains(
                                                  textEditingValue.text
                                                      .toLowerCase());
                                            });
                                          },
                                          optionsViewBuilder:
                                              (context, onSelected, options) {
                                            return AutocompleteOptionsList(
                                              textFieldKey:
                                                  _model.branchInputAreaKey,
                                              textController: _model
                                                  .branchInputAreaTextController!,
                                              options: options.toList(),
                                              onSelected: onSelected,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                              textHighlightStyle: TextStyle(),
                                              elevation: 4.0,
                                              optionBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              optionHighlightColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              maxHeight: 200.0,
                                            );
                                          },
                                          onSelected: (String selection) {
                                            setState(() => _model
                                                    .branchInputAreaSelectedOption =
                                                selection);
                                            FocusScope.of(context).unfocus();
                                          },
                                          fieldViewBuilder: (
                                            context,
                                            textEditingController,
                                            focusNode,
                                            onEditingComplete,
                                          ) {
                                            _model.branchInputAreaFocusNode =
                                                focusNode;

                                            _model.branchInputAreaTextController =
                                                textEditingController;
                                            return TextFormField(
                                              key: _model.branchInputAreaKey,
                                              controller: textEditingController,
                                              focusNode: focusNode,
                                              onEditingComplete:
                                                  onEditingComplete,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    'กรอกรหัสสาขา/ชื่อสาขา',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
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
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
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
                                                  .branchInputAreaTextControllerValidator
                                                  .asValidator(context),
                                            );
                                          },
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          Divider(
                            thickness: 1.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Visibility(
                                visible: _model
                                            .areaRegionSelectedDropDownValue !=
                                        null &&
                                    _model.areaRegionSelectedDropDownValue !=
                                        '',
                                child:
                                    FutureBuilder<List<UrlLinkStorageRecord>>(
                                  future: queryUrlLinkStorageRecordOnce(
                                    queryBuilder: (urlLinkStorageRecord) =>
                                        urlLinkStorageRecord.where(
                                      'url_name',
                                      isEqualTo: 'tableau_ceo_url_link',
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
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<UrlLinkStorageRecord>
                                        iconButtonUrlLinkStorageRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final iconButtonUrlLinkStorageRecord =
                                        iconButtonUrlLinkStorageRecordList
                                                .isNotEmpty
                                            ? iconButtonUrlLinkStorageRecordList
                                                .first
                                            : null;
                                    return FlutterFlowIconButton(
                                      borderColor: Colors.black,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor: Color(0xFF213BFF),
                                      icon: Icon(
                                        Icons.search_sharp,
                                        color: Colors.white,
                                        size: 25.0,
                                      ),
                                      onPressed: () async {
                                        HapticFeedback.mediumImpact();
                                        if (!(_model.areaRegionSelectedDropDownValue !=
                                                null &&
                                            _model.areaRegionSelectedDropDownValue !=
                                                '')) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'กรุณาเลือกเขต/ภาค ที่ต้องการจะดูKPI'),
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
                                          return;
                                        }
                                        if (functions
                                            .checkRegionAreaNameCEOWelfare(
                                                (_model.areaRegionDropDownValue ==
                                                            'เขต'
                                                        ? GetRegionAreaAPICall
                                                                .areaCode(
                                                            (_model.getArea
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )
                                                            ?.map((e) =>
                                                                e.toString())
                                                            .toList()
                                                        : GetRegionAreaAPICall
                                                            .regionCode(
                                                            (_model.getRegion
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ))
                                                    ?.toList(),
                                                (_model.areaRegionDropDownValue ==
                                                            'เขต'
                                                        ? functions
                                                            .getRegionAreaNameCode(
                                                                GetRegionAreaAPICall
                                                                        .areaName(
                                                                  (_model.getArea
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                                    ?.map((e) => e
                                                                        .toString())
                                                                    .toList()
                                                                    ?.toList(),
                                                                GetRegionAreaAPICall
                                                                        .areaCode(
                                                                  (_model.getArea
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                                    ?.map((e) => e
                                                                        .toString())
                                                                    .toList()
                                                                    ?.toList())
                                                        : functions
                                                            .getRegionAreaNameCode(
                                                                GetRegionAreaAPICall
                                                                    .regionName(
                                                                  (_model.getRegion
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.toList(),
                                                                GetRegionAreaAPICall
                                                                    .regionCode(
                                                                  (_model.getRegion
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.toList()))
                                                    .toList(),
                                                _model
                                                    .areaRegionSelectedDropDownValue)) {
                                          await actions.openTableauBrowser(
                                            FFAppState().accessToken,
                                            '${iconButtonUrlLinkStorageRecord?.urlLink}${_model.areaRegionDropDownValue}/${functions.getIndexRegionAreaCEOWelfare((_model.areaRegionDropDownValue == 'เขต' ? GetRegionAreaAPICall.areaCode(
                                                (_model.getArea?.jsonBody ??
                                                    ''),
                                              )?.map((e) => e.toString()).toList() : GetRegionAreaAPICall.regionCode(
                                                (_model.getRegion?.jsonBody ??
                                                    ''),
                                              ))?.toList(), (_model.areaRegionDropDownValue == 'เขต' ? functions.getRegionAreaNameCode(GetRegionAreaAPICall.areaName(
                                                  (_model.getArea?.jsonBody ??
                                                      ''),
                                                )?.map((e) => e.toString()).toList()?.toList(), GetRegionAreaAPICall.areaCode(
                                                  (_model.getArea?.jsonBody ??
                                                      ''),
                                                )?.map((e) => e.toString()).toList()?.toList()) : functions.getRegionAreaNameCode(GetRegionAreaAPICall.regionName(
                                                  (_model.getRegion?.jsonBody ??
                                                      ''),
                                                )?.toList(), GetRegionAreaAPICall.regionCode(
                                                  (_model.getRegion?.jsonBody ??
                                                      ''),
                                                )?.toList())).toList(), _model.areaRegionSelectedDropDownValue)}${_model.areaRegionDropDownValue == 'เขต' ? '/KPIareamanager/HomePage' : '/KPI_16727986561710/HomePage'}',
                                            FFAppState()
                                                .isOpenAndroidTableauBrowser,
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  content: Text(
                                                      'ไม่พบ เขต/ภาค ที่คุณเลือก'),
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
                                          return;
                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
