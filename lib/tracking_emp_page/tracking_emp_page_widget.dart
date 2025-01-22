import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
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
    required this.listLatLng,
    required this.employeeId,
    required this.employeeName,
    required this.employeeBranchCode,
    required this.employeePositionName,
    required this.selectedDate,
    required this.listTime,
  });

  final List<LatLng>? listLatLng;
  final String? employeeId;
  final String? employeeName;
  final String? employeeBranchCode;
  final String? employeePositionName;
  final String? selectedDate;
  final List<String>? listTime;

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
      _model.dataDateSelected = widget!.selectedDate;
      safeSetState(() {});
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
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
                                  '${widget!.employeeId}',
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
                                    '${widget!.employeeName} (${widget!.employeeBranchCode})',
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
                                    '${widget!.employeePositionName}',
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
                                child: Text(
                                  '${widget!.listLatLng?.length?.toString()} ที่ (${functions.showDateBE(widget!.selectedDate)})',
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
                        if (responsiveVisibility(
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0,
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
                                            0.0,
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
                                            _model.dataDateSelected =
                                                functions.getDateFormat(
                                                    list30DaysDateTimeListItemItem);
                                            safeSetState(() {});
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(_model
                                                        .dataDateSelected!),
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
                                                      functions.getDateFormat(functions
                                                          .parseStringToDatetime(
                                                              _model
                                                                  .dataDateSelected))
                                                  ? 65.0
                                                  : 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
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
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: custom_widgets.PolylineExample(
                                width: double.infinity,
                                height: double.infinity,
                                locations: widget!.listLatLng,
                                times: widget!.listTime,
                              ),
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
    );
  }
}
