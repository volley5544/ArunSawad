import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
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

  static String routeName = 'SearchEmployeePage';
  static String routePath = 'SearchEmployeePage';

  @override
  State<SearchEmployeePageWidget> createState() =>
      _SearchEmployeePageWidgetState();
}

class _SearchEmployeePageWidgetState extends State<SearchEmployeePageWidget>
    with TickerProviderStateMixin {
  late SearchEmployeePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

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
      unawaited(
        () async {}(),
      );
      _model.apiTrackingUrl = await queryUrlLinkStorageRecordOnce(
        queryBuilder: (urlLinkStorageRecord) => urlLinkStorageRecord.where(
          'url_name',
          isEqualTo: 'tracker_url',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      );

      _model.apiUserOutput = await APIUsersRegionCall.call(
        branchCode: FFAppState().branchCode,
      );

      safeSetState(() {});
      Navigator.pop(context);
    });

    _model.employeeKeywordInputTextController ??= TextEditingController();
    _model.employeeKeywordInputFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 25.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 25.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 25.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 25.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 25.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 25.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: PopScope(
          canPop: false,
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
                  context.goNamed(SuperAppPageWidget.routeName);
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
                      font: GoogleFonts.poppins(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
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
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: TextFormField(
                                    controller: _model
                                        .employeeKeywordInputTextController,
                                    focusNode:
                                        _model.employeeKeywordInputFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'รหัสพนักงาน/ชื่อ/สกุล',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
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
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    textAlign: TextAlign.start,
                                    validator: _model
                                        .employeeKeywordInputTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
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
                                        if (_shouldSetState)
                                          safeSetState(() {});
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
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
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
                                          if (GetAllEmployeeAPICall
                                                  .statusLayer2(
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
                                      safeSetState(() {
                                        _model.dropDownValueController?.reset();
                                        _model.dropDownValue = null;
                                      });
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
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: FlutterFlowDropDown<String>(
                                          controller:
                                              _model.dropDownValueController ??=
                                                  FormFieldController<String>(
                                            _model.dropDownValue ??= '',
                                          ),
                                          options: List<String>.from(
                                              GetAllEmployeeAPICall.employeeId(
                                            (_model.getEmployeeSearched
                                                    ?.jsonBody ??
                                                ''),
                                          )!),
                                          optionLabels:
                                              functions.genDropdownEmployee(
                                                  GetAllEmployeeAPICall
                                                      .fullname(
                                                    (_model.getEmployeeSearched
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.toList(),
                                                  GetAllEmployeeAPICall
                                                      .branchCode(
                                                    (_model.getEmployeeSearched
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.toList(),
                                                  GetAllEmployeeAPICall
                                                      .employeeId(
                                                    (_model.getEmployeeSearched
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.toList())!,
                                          onChanged: (val) => safeSetState(
                                              () => _model.dropDownValue = val),
                                          width: 180.0,
                                          height: 50.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Colors.black,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          hintText: 'พนักงาน...',
                                          fillColor: Colors.white,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 0.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation1']!),
                              Divider(
                                thickness: 1.0,
                              ),
                            ],
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (((_model.getEmployeeSearched?.statusCode ??
                                        200) ==
                                    200) &&
                                (GetAllEmployeeAPICall.statusLayer2(
                                      (_model.getEmployeeSearched?.jsonBody ??
                                          ''),
                                    ) ==
                                    200) &&
                                (_model.dropDownValue != null &&
                                    _model.dropDownValue != ''))
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
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
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
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation2']!),
                            if (((_model.getEmployeeSearched?.statusCode ??
                                        200) ==
                                    200) &&
                                (GetAllEmployeeAPICall.statusLayer2(
                                      (_model.getEmployeeSearched?.jsonBody ??
                                          ''),
                                    ) ==
                                    200) &&
                                (_model.dropDownValue != null &&
                                    _model.dropDownValue != ''))
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
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          '${GetAllEmployeeAPICall.fullname(
                                            (_model.getEmployeeSearched
                                                    ?.jsonBody ??
                                                ''),
                                          )?.elementAtOrNull(functions.getIndexOfSomethingList(GetAllEmployeeAPICall.employeeId(
                                                (_model.getEmployeeSearched
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.toList(), _model.dropDownValue))}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation3']!),
                            if (((_model.getEmployeeSearched?.statusCode ??
                                        200) ==
                                    200) &&
                                (GetAllEmployeeAPICall.statusLayer2(
                                      (_model.getEmployeeSearched?.jsonBody ??
                                          ''),
                                    ) ==
                                    200) &&
                                (_model.dropDownValue != null &&
                                    _model.dropDownValue != ''))
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
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          '${GetAllEmployeeAPICall.workPosition(
                                            (_model.getEmployeeSearched
                                                    ?.jsonBody ??
                                                ''),
                                          )?.elementAtOrNull(functions.getIndexOfSomethingList(GetAllEmployeeAPICall.employeeId(
                                                (_model.getEmployeeSearched
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.toList(), _model.dropDownValue))}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation4']!),
                            if (((_model.getEmployeeSearched?.statusCode ??
                                        200) ==
                                    200) &&
                                (GetAllEmployeeAPICall.statusLayer2(
                                      (_model.getEmployeeSearched?.jsonBody ??
                                          ''),
                                    ) ==
                                    200) &&
                                (_model.dropDownValue != null &&
                                    _model.dropDownValue != ''))
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
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          '${GetAllEmployeeAPICall.branchCode(
                                            (_model.getEmployeeSearched
                                                    ?.jsonBody ??
                                                ''),
                                          )?.elementAtOrNull(functions.getIndexOfSomethingList(GetAllEmployeeAPICall.employeeId(
                                                (_model.getEmployeeSearched
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.toList(), _model.dropDownValue))}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation5']!),
                          ],
                        ),
                        if (((_model.getEmployeeSearched?.statusCode ?? 200) ==
                                200) &&
                            (GetAllEmployeeAPICall.statusLayer2(
                                  (_model.getEmployeeSearched?.jsonBody ?? ''),
                                ) ==
                                200) &&
                            (_model.dropDownValue != null &&
                                _model.dropDownValue != ''))
                          Divider(
                            thickness: 1.0,
                          ),
                        if (((_model.getEmployeeSearched?.statusCode ?? 200) ==
                                200) &&
                            (GetAllEmployeeAPICall.statusLayer2(
                                  (_model.getEmployeeSearched?.jsonBody ?? ''),
                                ) ==
                                200) &&
                            (_model.dropDownValue != null &&
                                _model.dropDownValue != ''))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Container(
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
                                        Icons.date_range_rounded,
                                        color: Colors.black,
                                        size: 29.0,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        'วันที่ Location : ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          final _datePickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: getCurrentTimestamp,
                                            firstDate: DateTime(1900),
                                            lastDate: getCurrentTimestamp,
                                            builder: (context, child) {
                                              return wrapInMaterialDatePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 32.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLarge
                                                                  .fontStyle,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );

                                          if (_datePickedDate != null) {
                                            safeSetState(() {
                                              _model.datePicked = DateTime(
                                                _datePickedDate.year,
                                                _datePickedDate.month,
                                                _datePickedDate.day,
                                              );
                                            });
                                          } else if (_model.datePicked !=
                                              null) {
                                            safeSetState(() {
                                              _model.datePicked =
                                                  getCurrentTimestamp;
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                _model.datePicked != null
                                                    ? functions.showDateBE(
                                                        _model.datePicked
                                                            ?.toString())
                                                    : 'กรุณาเลือกวันที่',
                                                'กรุณาเลือกวันที่',
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent2,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation6']!),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (((_model.getEmployeeSearched?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetAllEmployeeAPICall.statusLayer2(
                                        (_model.getEmployeeSearched?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (_model.dropDownValue != null &&
                                      _model.dropDownValue != ''))
                                Divider(
                                  thickness: 1.0,
                                ),
                              if (((_model.getEmployeeSearched?.statusCode ??
                                          200) ==
                                      200) &&
                                  (GetAllEmployeeAPICall.statusLayer2(
                                        (_model.getEmployeeSearched?.jsonBody ??
                                            ''),
                                      ) ==
                                      200) &&
                                  (_model.dropDownValue != null &&
                                      _model.dropDownValue != '') &&
                                  (_model.datePicked != null))
                                FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    _model.getUserLocations =
                                        await APIUserLocationTrackerCall.call(
                                      employeeId: _model.dropDownValue,
                                      dateTime: functions
                                          .getDateFormat(_model.datePicked),
                                      apiUrl: true
                                          ? _model.apiTrackingUrl?.urlLink
                                          : 'https://9f08-115-31-145-24.ngrok-free.app',
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
                                    if ('${APIUserLocationTrackerCall.code(
                                          (_model.getUserLocations?.jsonBody ??
                                              ''),
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
                                    FFAppState()
                                        .updateEmpProfileLocationSelectedStruct(
                                      (e) => e
                                        ..nameTh =
                                            '${GetAllEmployeeAPICall.fullname(
                                          (_model.getEmployeeSearched
                                                  ?.jsonBody ??
                                              ''),
                                        )?.elementAtOrNull(functions.getIndexOfSomethingList(GetAllEmployeeAPICall.employeeId(
                                                  (_model.getEmployeeSearched
                                                          ?.jsonBody ??
                                                      ''),
                                                )?.toList(), _model.dropDownValue))}'
                                        ..employeeId = '${_model.dropDownValue}'
                                        ..branchCode =
                                            '${GetAllEmployeeAPICall.branchCode(
                                          (_model.getEmployeeSearched
                                                  ?.jsonBody ??
                                              ''),
                                        )?.elementAtOrNull(functions.getIndexOfSomethingList(GetAllEmployeeAPICall.employeeId(
                                                  (_model.getEmployeeSearched
                                                          ?.jsonBody ??
                                                      ''),
                                                )?.toList(), _model.dropDownValue))}'
                                        ..position =
                                            '${GetAllEmployeeAPICall.workPosition(
                                          (_model.getEmployeeSearched
                                                  ?.jsonBody ??
                                              ''),
                                        )?.elementAtOrNull(functions.getIndexOfSomethingList(GetAllEmployeeAPICall.employeeId(
                                                  (_model.getEmployeeSearched
                                                          ?.jsonBody ??
                                                      ''),
                                                )?.toList(), _model.dropDownValue))}'
                                        ..level = '${GetAllEmployeeAPICall.fullname(
                                          (_model.getEmployeeSearched
                                                  ?.jsonBody ??
                                              ''),
                                        )?.elementAtOrNull(functions.getIndexOfSomethingList(GetAllEmployeeAPICall.employeeId(
                                              (_model.getEmployeeSearched
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.toList(), _model.dropDownValue))}',
                                    );
                                    safeSetState(() {});

                                    context.pushNamed(
                                      TrackingEmpPageWidget.routeName,
                                      queryParameters: {
                                        'employeeId': serializeParam(
                                          '${_model.dropDownValue}',
                                          ParamType.String,
                                        ),
                                        'employeeName': serializeParam(
                                          '${GetAllEmployeeAPICall.fullname(
                                            (_model.getEmployeeSearched
                                                    ?.jsonBody ??
                                                ''),
                                          )?.elementAtOrNull(functions.getIndexOfSomethingList(GetAllEmployeeAPICall.employeeId(
                                                (_model.getEmployeeSearched
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.toList(), _model.dropDownValue))}',
                                          ParamType.String,
                                        ),
                                        'employeeBranchCode': serializeParam(
                                          '${GetAllEmployeeAPICall.branchCode(
                                            (_model.getEmployeeSearched
                                                    ?.jsonBody ??
                                                ''),
                                          )?.elementAtOrNull(functions.getIndexOfSomethingList(GetAllEmployeeAPICall.employeeId(
                                                (_model.getEmployeeSearched
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.toList(), _model.dropDownValue))}',
                                          ParamType.String,
                                        ),
                                        'employeePositionName': serializeParam(
                                          '${GetAllEmployeeAPICall.workPosition(
                                            (_model.getEmployeeSearched
                                                    ?.jsonBody ??
                                                ''),
                                          )?.elementAtOrNull(functions.getIndexOfSomethingList(GetAllEmployeeAPICall.employeeId(
                                                (_model.getEmployeeSearched
                                                        ?.jsonBody ??
                                                    ''),
                                              )?.toList(), _model.dropDownValue))}',
                                          ParamType.String,
                                        ),
                                        'selectedDate': serializeParam(
                                          functions
                                              .getDateFormat(_model.datePicked),
                                          ParamType.String,
                                        ),
                                        'data': serializeParam(
                                          APIUserLocationTrackerCall
                                              .dataLayerDate(
                                            (_model.getUserLocations
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          ParamType.DataStruct,
                                          isList: true,
                                        ),
                                        'index': serializeParam(
                                          APIUserLocationTrackerCall
                                                      .dataLayerDate(
                                                (_model.getUserLocations
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                                  .length -
                                              1,
                                          ParamType.int,
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
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
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
                    if (((_model.getEmployeeSearched?.statusCode ?? 200) ==
                            200) &&
                        (GetAllEmployeeAPICall.statusLayer2(
                              (_model.getEmployeeSearched?.jsonBody ?? ''),
                            ) ==
                            200) &&
                        (_model.dropDownValue != null &&
                            _model.dropDownValue != ''))
                      Divider(
                        thickness: 1.0,
                      ),
                  ].addToStart(SizedBox(height: 12.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
