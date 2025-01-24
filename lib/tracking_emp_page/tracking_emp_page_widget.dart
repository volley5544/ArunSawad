import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/poly_map_widget_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'tracking_emp_page_model.dart';
export 'tracking_emp_page_model.dart';

class TrackingEmpPageWidget extends StatefulWidget {
  const TrackingEmpPageWidget({
    super.key,
    this.employeeId,
    this.employeeName,
    this.employeeBranchCode,
    this.employeePositionName,
    required this.selectedDate,
    required this.data,
    this.index,
  });

  final String? employeeId;
  final String? employeeName;
  final String? employeeBranchCode;
  final String? employeePositionName;
  final String? selectedDate;
  final List<TrackingEmployeeDateModelStruct>? data;
  final int? index;

  @override
  State<TrackingEmpPageWidget> createState() => _TrackingEmpPageWidgetState();
}

class _TrackingEmpPageWidgetState extends State<TrackingEmpPageWidget>
    with TickerProviderStateMixin {
  late TrackingEmpPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackingEmpPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'trackingEmpPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
                child: Container(
                  height: double.infinity,
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      );

      _model.locationDateData =
          widget!.data!.toList().cast<TrackingEmployeeDateModelStruct>();
      safeSetState(() {});
      _model.dataDateSelected =
          '${_model.locationDateData.elementAtOrNull(widget!.index!)?.date}';
      safeSetState(() {});
      _model.locationByDateData = _model.locationDateData
          .elementAtOrNull(widget!.index!)!
          .data
          .toList()
          .cast<TrackingEmployeeLocationModelStruct>();
      safeSetState(() {});
      FFAppState().polyMapLatLngList = functions
          .makeLatLngList(
              _model.locationByDateData
                  .map((e) => e.latitude)
                  .toList()
                  .toList(),
              _model.locationByDateData
                  .map((e) => e.longitude)
                  .toList()
                  .toList())!
          .toList()
          .cast<LatLng>();
      FFAppState().polyMapTimeList = _model.locationByDateData
          .map((e) => e.times)
          .toList()
          .toList()
          .cast<String>();
      safeSetState(() {});
      Navigator.pop(context);
    });

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
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            drawer: Container(
              width: MediaQuery.sizeOf(context).width * 0.5,
              child: Drawer(
                elevation: 16.0,
                child: WebViewAware(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Visibility(
                      visible: responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 100.0, 0.0, 100.0),
                        child: Container(
                          width: 100.0,
                          height: double.infinity,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final list30DaysDateTimeListItem = functions
                                      .generateLast30DateTimeList(
                                          widget!.selectedDate)
                                      ?.toList() ??
                                  [];

                              return ListView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  8.0,
                                  0,
                                  12.0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: list30DaysDateTimeListItem.length,
                                itemBuilder:
                                    (context, list30DaysDateTimeListItemIndex) {
                                  final list30DaysDateTimeListItemItem =
                                      list30DaysDateTimeListItem[
                                          list30DaysDateTimeListItemIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0,
                                        valueOrDefault<double>(
                                          functions.getDateFormat(
                                                      list30DaysDateTimeListItemItem) ==
                                                  functions.getDateFormat(functions
                                                      .parseStringToDatetime(
                                                          _model
                                                              .dataDateSelected))
                                              ? 8.0
                                              : 4.0,
                                          0.0,
                                        ),
                                        4.0,
                                        valueOrDefault<double>(
                                          functions.getDateFormat(
                                                      list30DaysDateTimeListItemItem) ==
                                                  functions.getDateFormat(functions
                                                      .parseStringToDatetime(
                                                          _model
                                                              .dataDateSelected))
                                              ? 8.0
                                              : 0.0,
                                          0.0,
                                        )),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (!functions.containStringInListString(
                                            _model.locationDateData
                                                .map((e) => e.date)
                                                .toList(),
                                            functions.getDateFormat(
                                                list30DaysDateTimeListItemItem))!) {
                                          return;
                                        }
                                        _model.dataDateSelected =
                                            functions.getDateFormat(
                                                list30DaysDateTimeListItemItem);
                                        safeSetState(() {});
                                        _model.locationByDateData = _model
                                            .locationDateData
                                            .elementAtOrNull(functions
                                                .getIndexOfSomethingList(
                                                    _model.locationDateData
                                                        .map((e) => e.date)
                                                        .toList(),
                                                    functions.getDateFormat(functions
                                                        .parseStringToDatetime(
                                                            list30DaysDateTimeListItemItem
                                                                .toString()))))!
                                            .data
                                            .toList()
                                            .cast<
                                                TrackingEmployeeLocationModelStruct>();
                                        safeSetState(() {});
                                        FFAppState().polyMapLatLngList =
                                            functions
                                                .makeLatLngList(
                                                    _model.locationByDateData
                                                        .map((e) => e.latitude)
                                                        .toList(),
                                                    _model.locationByDateData
                                                        .map((e) => e.longitude)
                                                        .toList())!
                                                .toList()
                                                .cast<LatLng>();
                                        FFAppState().polyMapTimeList = _model
                                            .locationByDateData
                                            .map((e) => e.times)
                                            .toList()
                                            .cast<String>();
                                        safeSetState(() {});
                                        if (scaffoldKey
                                                .currentState!.isDrawerOpen ||
                                            scaffoldKey.currentState!
                                                .isEndDrawerOpen) {
                                          Navigator.pop(context);
                                        }

                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed(
                                          'trackingEmpPage',
                                          queryParameters: {
                                            'data': serializeParam(
                                              widget!.data,
                                              ParamType.DataStruct,
                                              isList: true,
                                            ),
                                            'selectedDate': serializeParam(
                                              widget!.selectedDate,
                                              ParamType.String,
                                            ),
                                            'index': serializeParam(
                                              list30DaysDateTimeListItemIndex,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: functions.getDateFormat(
                                                    list30DaysDateTimeListItemItem) ==
                                                functions.getDateFormat(functions
                                                    .parseStringToDatetime(
                                                        _model
                                                            .dataDateSelected))
                                            ? 5.0
                                            : 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              valueOrDefault<double>(
                                            functions.getDateFormat(
                                                        list30DaysDateTimeListItemItem) ==
                                                    functions.getDateFormat(functions
                                                        .parseStringToDatetime(
                                                            _model
                                                                .dataDateSelected))
                                                ? 12.0
                                                : 0.0,
                                            0.0,
                                          )),
                                        ),
                                        child: Container(
                                          width: 100.0,
                                          height: functions.getDateFormat(
                                                      list30DaysDateTimeListItemItem) ==
                                                  functions.getDateFormat(functions
                                                      .parseStringToDatetime(
                                                          _model
                                                              .dataDateSelected))
                                              ? 65.0
                                              : 40.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              functions.containStringInListString(
                                                      _model.locationDateData
                                                          .map((e) => e.date)
                                                          .toList(),
                                                      functions.getDateFormat(
                                                          list30DaysDateTimeListItemItem))!
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryBackground
                                                  : Color(0xFFDFDFDF),
                                              Color(0xFFDFDFDF),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                valueOrDefault<double>(
                                              functions.getDateFormat(
                                                          list30DaysDateTimeListItemItem) ==
                                                      functions.getDateFormat(functions
                                                          .parseStringToDatetime(
                                                              _model
                                                                  .dataDateSelected))
                                                  ? 12.0
                                                  : 0.0,
                                              0.0,
                                            )),
                                            border: Border.all(
                                              color: functions.getDateFormat(
                                                          list30DaysDateTimeListItemItem) ==
                                                      functions.getDateFormat(functions
                                                          .parseStringToDatetime(
                                                              _model
                                                                  .dataDateSelected))
                                                  ? Color(0xFFFF6500)
                                                  : Colors.transparent,
                                              width: functions.getDateFormat(
                                                          list30DaysDateTimeListItemItem) ==
                                                      functions.getDateFormat(functions
                                                          .parseStringToDatetime(
                                                              _model
                                                                  .dataDateSelected))
                                                  ? 3.0
                                                  : 0.0,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  '${valueOrDefault<String>(
                                                    functions.showDateBE(
                                                        list30DaysDateTimeListItemItem
                                                            .toString()),
                                                    '22/01/68',
                                                  )}',
                                                  '22/01/68',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          valueOrDefault<Color>(
                                                        functions.containStringInListString(
                                                                _model
                                                                    .locationDateData
                                                                    .map((e) =>
                                                                        e.date)
                                                                    .toList(),
                                                                functions
                                                                    .getDateFormat(
                                                                        list30DaysDateTimeListItemItem))!
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText
                                                            : Color(0xFF969696),
                                                        Color(0xFF969696),
                                                      ),
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ],
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
                    ),
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Color(0xFFFF6500),
              automaticallyImplyLeading: false,
              leading: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 24.0,
                ),
              ),
              title: Text(
                'ติดตามLocationพนักงาน',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
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
                                    Icons.grid_3x3,
                                    color: Colors.black,
                                    size: 24.0,
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
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    '${FFAppState().EmpProfileLocationSelected.employeeId}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
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
                                    size: 24.0,
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
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      FFAppState()
                                          .EmpProfileLocationSelected
                                          .nameTh,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!),
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
                                    size: 24.0,
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
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      FFAppState()
                                          .EmpProfileLocationSelected
                                          .position,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation3']!),
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
                                    Icons.location_on_sharp,
                                    color: Colors.black,
                                    size: 24.0,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'จำนวนLocation : ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            '${_model.locationByDateData.length.toString()} ที่ (${functions.showDateBE(_model.dataDateSelected)})',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
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
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                scaffoldKey.currentState!
                                                    .openDrawer();
                                              },
                                              child: Icon(
                                                Icons.update_sharp,
                                                color: Color(0xFFFF6500),
                                                size: 40.0,
                                              ),
                                            ),
                                          ),
                                        if (false)
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed(
                                                'trackingEmpPage',
                                                queryParameters: {
                                                  'data': serializeParam(
                                                    widget!.data,
                                                    ParamType.DataStruct,
                                                    isList: true,
                                                  ),
                                                  'selectedDate':
                                                      serializeParam(
                                                    widget!.selectedDate,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Icon(
                                              Icons.arrow_forward,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation4']!),
                        Divider(
                          thickness: 2.0,
                        ),
                      ].addToStart(SizedBox(height: 8.0)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (false &&
                              responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: 100.0,
                                height: double.infinity,
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final list30DaysDateTimeListItem = functions
                                            .generateLast30DateTimeList(
                                                widget!.selectedDate)
                                            ?.toList() ??
                                        [];

                                    return ListView.builder(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        8.0,
                                        0,
                                        12.0,
                                      ),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          list30DaysDateTimeListItem.length,
                                      itemBuilder: (context,
                                          list30DaysDateTimeListItemIndex) {
                                        final list30DaysDateTimeListItemItem =
                                            list30DaysDateTimeListItem[
                                                list30DaysDateTimeListItemIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0,
                                                  valueOrDefault<double>(
                                                    functions.getDateFormat(
                                                                list30DaysDateTimeListItemItem) ==
                                                            functions.getDateFormat(
                                                                functions
                                                                    .parseStringToDatetime(
                                                                        _model
                                                                            .dataDateSelected))
                                                        ? 8.0
                                                        : 4.0,
                                                    0.0,
                                                  ),
                                                  4.0,
                                                  valueOrDefault<double>(
                                                    functions.getDateFormat(
                                                                list30DaysDateTimeListItemItem) ==
                                                            functions.getDateFormat(
                                                                functions
                                                                    .parseStringToDatetime(
                                                                        _model
                                                                            .dataDateSelected))
                                                        ? 8.0
                                                        : 0.0,
                                                    0.0,
                                                  )),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (!functions
                                                  .containStringInListString(
                                                      _model.locationDateData
                                                          .map((e) => e.date)
                                                          .toList(),
                                                      functions.getDateFormat(
                                                          list30DaysDateTimeListItemItem))!) {
                                                return;
                                              }
                                              _model.dataDateSelected =
                                                  functions.getDateFormat(
                                                      list30DaysDateTimeListItemItem);
                                              safeSetState(() {});
                                              _model.locationByDateData = _model
                                                  .locationDateData
                                                  .elementAtOrNull(functions
                                                      .getIndexOfSomethingList(
                                                          _model
                                                              .locationDateData
                                                              .map(
                                                                  (e) => e.date)
                                                              .toList(),
                                                          functions.getDateFormat(
                                                              functions.parseStringToDatetime(
                                                                  list30DaysDateTimeListItemItem
                                                                      .toString()))))!
                                                  .data
                                                  .toList()
                                                  .cast<
                                                      TrackingEmployeeLocationModelStruct>();
                                              safeSetState(() {});
                                              FFAppState().polyMapLatLngList =
                                                  functions
                                                      .makeLatLngList(
                                                          _model
                                                              .locationByDateData
                                                              .map((e) =>
                                                                  e.latitude)
                                                              .toList(),
                                                          _model
                                                              .locationByDateData
                                                              .map((e) =>
                                                                  e.longitude)
                                                              .toList())!
                                                      .toList()
                                                      .cast<LatLng>();
                                              FFAppState().polyMapTimeList =
                                                  _model.locationByDateData
                                                      .map((e) => e.times)
                                                      .toList()
                                                      .cast<String>();
                                              safeSetState(() {});
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: functions.getDateFormat(
                                                          list30DaysDateTimeListItemItem) ==
                                                      functions.getDateFormat(functions
                                                          .parseStringToDatetime(
                                                              _model
                                                                  .dataDateSelected))
                                                  ? 5.0
                                                  : 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        valueOrDefault<double>(
                                                  functions.getDateFormat(
                                                              list30DaysDateTimeListItemItem) ==
                                                          functions.getDateFormat(
                                                              functions
                                                                  .parseStringToDatetime(
                                                                      _model
                                                                          .dataDateSelected))
                                                      ? 12.0
                                                      : 0.0,
                                                  0.0,
                                                )),
                                              ),
                                              child: Container(
                                                width: 100.0,
                                                height: functions.getDateFormat(
                                                            list30DaysDateTimeListItemItem) ==
                                                        functions.getDateFormat(
                                                            functions
                                                                .parseStringToDatetime(
                                                                    _model
                                                                        .dataDateSelected))
                                                    ? 65.0
                                                    : 40.0,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions.containStringInListString(
                                                            _model
                                                                .locationDateData
                                                                .map((e) =>
                                                                    e.date)
                                                                .toList(),
                                                            functions.getDateFormat(
                                                                list30DaysDateTimeListItemItem))!
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground
                                                        : Color(0xFFDFDFDF),
                                                    Color(0xFFDFDFDF),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                    functions.getDateFormat(
                                                                list30DaysDateTimeListItemItem) ==
                                                            functions.getDateFormat(
                                                                functions
                                                                    .parseStringToDatetime(
                                                                        _model
                                                                            .dataDateSelected))
                                                        ? 12.0
                                                        : 0.0,
                                                    0.0,
                                                  )),
                                                  border: Border.all(
                                                    color: functions.getDateFormat(
                                                                list30DaysDateTimeListItemItem) ==
                                                            functions.getDateFormat(
                                                                functions
                                                                    .parseStringToDatetime(
                                                                        _model
                                                                            .dataDateSelected))
                                                        ? Color(0xFFFF6500)
                                                        : Colors.transparent,
                                                    width: functions.getDateFormat(
                                                                list30DaysDateTimeListItemItem) ==
                                                            functions.getDateFormat(
                                                                functions
                                                                    .parseStringToDatetime(
                                                                        _model
                                                                            .dataDateSelected))
                                                        ? 3.0
                                                        : 0.0,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        '${valueOrDefault<String>(
                                                          functions.showDateBE(
                                                              list30DaysDateTimeListItemItem
                                                                  .toString()),
                                                          '22/01/68',
                                                        )}',
                                                        '22/01/68',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.containStringInListString(
                                                                      _model
                                                                          .locationDateData
                                                                          .map((e) => e
                                                                              .date)
                                                                          .toList(),
                                                                      functions
                                                                          .getDateFormat(
                                                                              list30DaysDateTimeListItemItem))!
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : Color(
                                                                      0xFF969696),
                                                              Color(0xFF969696),
                                                            ),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
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
                            VerticalDivider(
                              thickness: 2.0,
                            ),
                          Expanded(
                            flex: 7,
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: wrapWithModel(
                                model: _model.polyMapWidgetComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: PolyMapWidgetComponentWidget(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ].addToEnd(SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
