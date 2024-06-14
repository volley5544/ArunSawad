import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_leave_page_model.dart';
export 'add_leave_page_model.dart';

class AddLeavePageWidget extends StatefulWidget {
  const AddLeavePageWidget({
    super.key,
    this.leaveType,
  });

  final String? leaveType;

  @override
  State<AddLeavePageWidget> createState() => _AddLeavePageWidgetState();
}

class _AddLeavePageWidgetState extends State<AddLeavePageWidget> {
  late AddLeavePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddLeavePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddLeavePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().leaveDaysDouble = 0.5;
      FFAppState().leaveTypeEdit =
          functions.leaveTypeToList1(widget.leaveType)!.toList().cast<String>();
      FFAppState().update(() {});
      _model.getHolidayAPIOutput = await GetHolidayAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
      );
      if ((_model.getHolidayAPIOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.getHolidayAPIOutput?.statusCode ?? 200).toString()})'),
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
    });

    _model.leaveDaysTextController ??= TextEditingController();
    _model.leaveDaysFocusNode ??= FocusNode();

    _model.phoneNumberTextController ??=
        TextEditingController(text: FFAppState().ProfilePhoneNumber);
    _model.phoneNumberFocusNode ??= FocusNode();

    _model.reasonToLeaveTextController ??= TextEditingController();
    _model.reasonToLeaveFocusNode ??= FocusNode();

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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
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
                context.goNamed('LeavePage');
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFBFFFFFF),
                size: 30.0,
              ),
            ),
          ),
          title: Text(
            'ยื่นเรื่องขออนุมัติลา',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 10.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<UserCustomRecord>>(
            future: queryUserCustomRecordOnce(
              queryBuilder: (userCustomRecord) => userCustomRecord.where(
                'employee_id',
                isEqualTo: FFAppState().profileFirstBossEmpID != ''
                    ? FFAppState().profileFirstBossEmpID
                    : null,
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
              List<UserCustomRecord> columnUserCustomRecordList =
                  snapshot.data!;
              final columnUserCustomRecord =
                  columnUserCustomRecordList.isNotEmpty
                      ? columnUserCustomRecordList.first
                      : null;
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FutureBuilder<List<FCMTokenRecord>>(
                    future: queryFCMTokenRecordOnce(
                      queryBuilder: (fCMTokenRecord) => fCMTokenRecord
                          .where(
                            'employee_id',
                            isEqualTo: FFAppState().profileFirstBossEmpID != ''
                                ? FFAppState().profileFirstBossEmpID
                                : null,
                          )
                          .orderBy('created_at', descending: true),
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
                      List<FCMTokenRecord> columnFCMTokenRecordList =
                          snapshot.data!;
                      final columnFCMTokenRecord =
                          columnFCMTokenRecordList.isNotEmpty
                              ? columnFCMTokenRecordList.first
                              : null;
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FutureBuilder<List<LeaveDaysAfterRecord>>(
                              future: queryLeaveDaysAfterRecordOnce(
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
                                          FlutterFlowTheme.of(context).tertiary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<LeaveDaysAfterRecord>
                                    containerLeaveDaysAfterRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final containerLeaveDaysAfterRecord =
                                    containerLeaveDaysAfterRecordList.isNotEmpty
                                        ? containerLeaveDaysAfterRecordList
                                            .first
                                        : null;
                                return Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.858,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF5F5F5),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 0.0, 15.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: SelectionArea(
                                                        child: Text(
                                                      'ประเภทการลา : ${widget.leaveType}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 10.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.35, -0.09),
                                                child: SelectionArea(
                                                    child: Text(
                                                  'วันที่ลาเริ่มต้น  :',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 15.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      if (!(widget.leaveType !=
                                                              null &&
                                                          widget.leaveType !=
                                                              '')) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'กรุณาเลือกประเภทการลาก่อน',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    3000),
                                                            backgroundColor:
                                                                Color(
                                                                    0xB2000000),
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                      if (kIsWeb) {
                                                        final _datePickedDate =
                                                            await showDatePicker(
                                                          context: context,
                                                          initialDate: functions.startLeaveCalendar(
                                                              getCurrentTimestamp,
                                                              functions.leaveTypeToCanLeaveSince(
                                                                  widget
                                                                      .leaveType,
                                                                  containerLeaveDaysAfterRecord
                                                                      ?.leaveListAllowDay
                                                                      ?.toList(),
                                                                  containerLeaveDaysAfterRecord
                                                                      ?.leaveListAllowInt
                                                                      ?.toList())),
                                                          firstDate: functions.startLeaveCalendar(
                                                              getCurrentTimestamp,
                                                              functions.leaveTypeToCanLeaveSince(
                                                                  widget
                                                                      .leaveType,
                                                                  containerLeaveDaysAfterRecord
                                                                      ?.leaveListAllowDay
                                                                      ?.toList(),
                                                                  containerLeaveDaysAfterRecord
                                                                      ?.leaveListAllowInt
                                                                      ?.toList())),
                                                          lastDate:
                                                              DateTime(2050),
                                                        );

                                                        if (_datePickedDate !=
                                                            null) {
                                                          safeSetState(() {
                                                            _model.datePicked =
                                                                DateTime(
                                                              _datePickedDate
                                                                  .year,
                                                              _datePickedDate
                                                                  .month,
                                                              _datePickedDate
                                                                  .day,
                                                            );
                                                          });
                                                        }
                                                      } else {
                                                        await DatePicker
                                                            .showDatePicker(
                                                          context,
                                                          showTitleActions:
                                                              true,
                                                          onConfirm: (date) {
                                                            safeSetState(() {
                                                              _model.datePicked =
                                                                  date;
                                                            });
                                                          },
                                                          currentTime: functions.startLeaveCalendar(
                                                              getCurrentTimestamp,
                                                              functions.leaveTypeToCanLeaveSince(
                                                                  widget
                                                                      .leaveType,
                                                                  containerLeaveDaysAfterRecord
                                                                      ?.leaveListAllowDay
                                                                      ?.toList(),
                                                                  containerLeaveDaysAfterRecord
                                                                      ?.leaveListAllowInt
                                                                      ?.toList())),
                                                          minTime: functions.startLeaveCalendar(
                                                              getCurrentTimestamp,
                                                              functions.leaveTypeToCanLeaveSince(
                                                                  widget
                                                                      .leaveType,
                                                                  containerLeaveDaysAfterRecord
                                                                      ?.leaveListAllowDay
                                                                      ?.toList(),
                                                                  containerLeaveDaysAfterRecord
                                                                      ?.leaveListAllowInt
                                                                      ?.toList())),
                                                          locale: LocaleType
                                                              .values
                                                              .firstWhere(
                                                            (l) =>
                                                                l.name ==
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                            orElse: () =>
                                                                LocaleType.en,
                                                          ),
                                                        );
                                                      }

                                                      if (functions
                                                          .checkSundayDate(_model
                                                              .datePicked)!) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'ไม่สามารถลาวันอาทิตได้ กรุณาเลือกวันใหม่'),
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
                                                        return;
                                                      }
                                                      if (functions
                                                          .checkHolidayDate(
                                                              _model.datePicked,
                                                              GetHolidayAPICall
                                                                      .holidayDate(
                                                                (_model.getHolidayAPIOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                                  ?.map((e) => e
                                                                      .toString())
                                                                  .toList()
                                                                  ?.toList())!) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'ไม่สามารถลาวันหยุดได้ กรุณาเลือกวันใหม่'),
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
                                                        return;
                                                      }
                                                      if (!functions
                                                          .checkYearLeave(_model
                                                              .datePicked)!) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'ไม่สามารถล่วงหน้าปีหน้าได้ กรุณาเลือกวันใหม่'),
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
                                                        return;
                                                      }
                                                      if (widget.leaveType ==
                                                          'ลาป่วย') {
                                                        if (!functions
                                                            .checkSickLeaveIsBeforeCurrentDate(
                                                                getCurrentTimestamp,
                                                                _model
                                                                    .datePicked)!) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      'ไม่สามารถลาป่วยล่วงหน้าได้ กรุณาเลือกวันลาใหม่'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                          return;
                                                        }
                                                      }
                                                    },
                                                    text:
                                                        valueOrDefault<String>(
                                                      dateTimeFormat(
                                                        'd/M/y',
                                                        _model.datePicked,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      'ระบุวันที่',
                                                    ),
                                                    icon: FaIcon(
                                                      FontAwesomeIcons
                                                          .solidCalendarAlt,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 90.0,
                                                      height: 60.0,
                                                      padding:
                                                          EdgeInsets.all(0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF0A0A0A),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFBDBDBD),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 10.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.35, -0.09),
                                                child: SelectionArea(
                                                    child: Text(
                                                  'ช่วงเวลา  :',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 15.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              // 5. ประเภทการลาไหนบ้างที่ลาเต็มวัน ครึ่งวันเช้า ครึ่งวันบ่าย ระบุเวลา ได้
                                              // 	- ลาพักร้อน ลาเต็มวัน
                                              // 	- ลากิจครึ่งวันเช้า/บ่าย
                                              // 	- ลาป่วยครึ่งวันเช้า/บ่าย
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .leaveTimeValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: (widget
                                                                    .leaveType ==
                                                                'ลาป่วย') ||
                                                            (widget.leaveType ==
                                                                'ลากิจ') ||
                                                            (widget.leaveType ==
                                                                'ลาป่วย') ||
                                                            (widget.leaveType ==
                                                                'ลากิจ')
                                                        ? FFAppState()
                                                            .leaveHalfDay
                                                        : FFAppState()
                                                            .leaveFullDay,
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .leaveTimeValue =
                                                            val),
                                                    width: 90.0,
                                                    height: 60.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    hintText: 'กรุณาเลือก...',
                                                    fillColor: Colors.white,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Color(0xFFBDBDBD),
                                                    borderWidth: 2.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsets.all(10.0),
                                                    hidesUnderline: true,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (_model.leaveTimeValue ==
                                            'ลาเต็มวัน')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 10.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.35, -0.09),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'จำนวนวันที่ลา  :',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (_model.leaveTimeValue ==
                                            'ลาเต็มวัน')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                // คำนวณ
                                                // วันลาเริ่มต้น-วันลาสิ้นสุด=จำนวนวันที่ลา
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .leaveDaysTextController,
                                                      focusNode: _model
                                                          .leaveDaysFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.leaveDaysTextController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          if (functions
                                                              .checkLeaveDayNumber(
                                                                  _model
                                                                      .leaveDaysTextController
                                                                      .text)!) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'กรุณากรอกจำนวนเต็ม'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            setState(() {
                                                              _model
                                                                  .leaveDaysTextController
                                                                  ?.clear();
                                                            });
                                                            return;
                                                          } else {
                                                            FFAppState()
                                                                    .leaveDaysDouble =
                                                                double.parse(_model
                                                                    .leaveDaysTextController
                                                                    .text);
                                                            FFAppState()
                                                                .update(() {});
                                                          }

                                                          if ((widget.leaveType ==
                                                                  'ลาพักร้อน') &&
                                                              (FFAppState()
                                                                      .leaveDaysDouble >
                                                                  5.0)) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'ลาพักร้อนติดกันได้ไม่เกิน 5 วัน'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            setState(() {
                                                              _model
                                                                  .leaveDaysTextController
                                                                  ?.clear();
                                                            });
                                                            return;
                                                          }
                                                          if (functions.stringToDouble(
                                                                  _model
                                                                      .leaveDaysTextController
                                                                      .text) <=
                                                              0.0) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'ไม่สามารถใส่ 0 หรือจำนวนติดลบได้กรุณากรอกใหม่'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            setState(() {
                                                              _model
                                                                  .leaveDaysTextController
                                                                  ?.clear();
                                                            });
                                                            return;
                                                          }
                                                        },
                                                      ),
                                                      onFieldSubmitted:
                                                          (_) async {
                                                        FFAppState()
                                                                .allowFileUpload =
                                                            functions.allowFileInput(
                                                                widget
                                                                    .leaveType,
                                                                double.tryParse(
                                                                    _model
                                                                        .leaveDaysTextController
                                                                        .text))!;
                                                        FFAppState()
                                                            .update(() {});
                                                        if (functions
                                                            .checkLeaveDayNumber(
                                                                _model
                                                                    .leaveDaysTextController
                                                                    .text)!) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      'กรุณากรอกจำนวนเต็ม'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                          setState(() {
                                                            _model
                                                                .leaveDaysTextController
                                                                ?.clear();
                                                          });
                                                          return;
                                                        }
                                                        if (functions.stringToDouble(
                                                                _model
                                                                    .leaveDaysTextController
                                                                    .text) <=
                                                            0.0) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      'ไม่สามารถใส่ 0 หรือจำนวนติดลบได้กรุณากรอกใหม่'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                          setState(() {
                                                            _model
                                                                .leaveDaysTextController
                                                                ?.clear();
                                                          });
                                                          return;
                                                        }
                                                      },
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'ใส่จำนวนวันที่ต้องการลา',
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFFF5F5F5),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    24.0,
                                                                    24.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            lineHeight: 1.0,
                                                          ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      validator: _model
                                                          .leaveDaysTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 10.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.35, -0.09),
                                                child: SelectionArea(
                                                    child: Text(
                                                  'เบอร์โทรติดต่อ  :',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 15.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Form(
                                                  key: _model.formKey,
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .phoneNumberTextController,
                                                      focusNode: _model
                                                          .phoneNumberFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'กรุณากรอกเบอร์โทรศัพท์',
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
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFFF5F5F5),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    24.0,
                                                                    24.0),
                                                        prefixIcon: Icon(
                                                          Icons.phone_android,
                                                          color:
                                                              Color(0xFF0A0A0A),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Color(
                                                                0xFF0A0A0A),
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      validator: _model
                                                          .phoneNumberTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 10.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.35, -0.09),
                                                child: SelectionArea(
                                                    child: Text(
                                                  'เหตุผลการลา  :',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 15.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: _model
                                                      .reasonToLeaveTextController,
                                                  focusNode: _model
                                                      .reasonToLeaveFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    hintText: 'กรุณากรอก...',
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0xFFF5F5F5),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                24.0, 0.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  validator: _model
                                                      .reasonToLeaveTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 10.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.35, -0.09),
                                                child: SelectionArea(
                                                    child: Text(
                                                  'เเนบไฟล์การลา  :',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 15.0, 20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              // 4. ประเภทการลาไหนบ้าง ต้องเเนบไฟล์
                                              // 	- ลาป่่วย3 วันต่อเนื่องต้องเเนบใบรับรองเเพทย์
                                              // 	- ลาทำหมันต้องเเนบใบรับรองเเพทย์
                                              // 	- ลาเพื่อรับราชการทหารเเนบใบรับรองเเพทย์
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      final selectedMedia =
                                                          await selectMedia(
                                                        imageQuality: 70,
                                                        mediaSource: MediaSource
                                                            .photoGallery,
                                                        multiImage: true,
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        setState(() => _model
                                                                .isDataUploading =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];

                                                        try {
                                                          showUploadMessage(
                                                            context,
                                                            'Uploading file...',
                                                            showLoading: true,
                                                          );
                                                          selectedUploadedFiles =
                                                              selectedMedia
                                                                  .map((m) =>
                                                                      FFUploadedFile(
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
                                                                      ))
                                                                  .toList();
                                                        } finally {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .hideCurrentSnackBar();
                                                          _model.isDataUploading =
                                                              false;
                                                        }
                                                        if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length) {
                                                          setState(() {
                                                            _model.uploadedLocalFiles =
                                                                selectedUploadedFiles;
                                                          });
                                                          showUploadMessage(
                                                              context,
                                                              'Success!');
                                                        } else {
                                                          setState(() {});
                                                          showUploadMessage(
                                                              context,
                                                              'Failed to upload data');
                                                          return;
                                                        }
                                                      }

                                                      _model.firebaseuploadoutput =
                                                          await actions
                                                              .uploadMultipleFileFirebaseStorage(
                                                        'leave',
                                                        _model
                                                            .uploadedLocalFiles
                                                            .toList(),
                                                      );
                                                      _shouldSetState = true;
                                                      if (!(_model.firebaseuploadoutput !=
                                                              null &&
                                                          (_model.firebaseuploadoutput)!
                                                              .isNotEmpty)) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text(
                                                                    'อัพโหลดรูปไม่สำเร็จ'),
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
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                    },
                                                    text: '[เเนบไฟล์ภาพ]',
                                                    icon: Icon(
                                                      Icons.attach_file,
                                                      size: 15.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 90.0,
                                                      height: 60.0,
                                                      padding:
                                                          EdgeInsets.all(0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFF0A0A0A),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      elevation: 2.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFBDBDBD),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (_model.uploadedLocalFiles.length >
                                            0)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 15.0, 20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Builder(
                                                    builder: (context) {
                                                      final uploadListNum = _model
                                                              .firebaseuploadoutput
                                                              ?.toList() ??
                                                          [];
                                                      return Container(
                                                        width: double.infinity,
                                                        height: 500.0,
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          50.0),
                                                              child: PageView
                                                                  .builder(
                                                                controller: _model
                                                                        .pageViewController ??=
                                                                    PageController(
                                                                        initialPage: max(
                                                                            0,
                                                                            min(0,
                                                                                uploadListNum.length - 1))),
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                itemCount:
                                                                    uploadListNum
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        uploadListNumIndex) {
                                                                  final uploadListNumItem =
                                                                      uploadListNum[
                                                                          uploadListNumIndex];
                                                                  return Image
                                                                      .network(
                                                                    uploadListNumItem,
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                child: smooth_page_indicator
                                                                    .SmoothPageIndicator(
                                                                  controller: _model
                                                                          .pageViewController ??=
                                                                      PageController(
                                                                          initialPage: max(
                                                                              0,
                                                                              min(0, uploadListNum.length - 1))),
                                                                  count:
                                                                      uploadListNum
                                                                          .length,
                                                                  axisDirection:
                                                                      Axis.horizontal,
                                                                  onDotClicked:
                                                                      (i) async {
                                                                    await _model
                                                                        .pageViewController!
                                                                        .animateToPage(
                                                                      i,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              500),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  effect: smooth_page_indicator
                                                                      .ExpandingDotsEffect(
                                                                    expansionFactor:
                                                                        2.0,
                                                                    spacing:
                                                                        8.0,
                                                                    radius:
                                                                        16.0,
                                                                    dotWidth:
                                                                        16.0,
                                                                    dotHeight:
                                                                        16.0,
                                                                    dotColor: Color(
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
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.15,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25.0, 0.0, 25.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        currentUserLocationValue =
                                                            await getCurrentUserLocation(
                                                                defaultLocation:
                                                                    LatLng(0.0,
                                                                        0.0));
                                                        var _shouldSetState =
                                                            false;
                                                        HapticFeedback
                                                            .mediumImpact();
                                                        if (_model.datePicked !=
                                                            null) {
                                                          if (!functions
                                                              .checkYearLeave(_model
                                                                  .datePicked)!) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'ไม่สามารถลาล่วงหน้าปีหน้าได้ กรุณาเลือกวันใหม่'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
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
                                                          if (!(_model.leaveTimeValue !=
                                                                  null &&
                                                              _model.leaveTimeValue !=
                                                                  '')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'กรุณาเลือกช่วงเวลาที่จะลา'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
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
                                                          if (((widget.leaveType ==
                                                                      'ลาป่วย') &&
                                                                  (FFAppState()
                                                                          .leaveDaysDouble >=
                                                                      3.0)) ||
                                                              (widget.leaveType ==
                                                                  'ลาทำหมัน') ||
                                                              (widget.leaveType ==
                                                                  'ลาเพื่อรับราชการทหาร')) {
                                                            if (_model
                                                                    .uploadedLocalFiles
                                                                    .length <=
                                                                0) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      content: Text(
                                                                          'กรุณาอัปโหลดไฟล์รูปภาพ'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
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
                                                          }
                                                          if (functions
                                                              .checkSundayDate(
                                                                  _model
                                                                      .datePicked)!) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'ไม่สามารถลาวันอาทิตได้ กรุณาเลือกวันใหม่'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
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
                                                          if (functions
                                                              .checkHolidayDate(
                                                                  _model
                                                                      .datePicked,
                                                                  GetHolidayAPICall
                                                                          .holidayDate(
                                                                    (_model.getHolidayAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )
                                                                      ?.map((e) =>
                                                                          e.toString())
                                                                      .toList()
                                                                      ?.toList())!) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'ไม่สามารถลาวันหยุดได้ กรุณาเลือกวันใหม่'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
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
                                                          if (!functions
                                                              .checkPhoneNumber10(
                                                                  _model
                                                                      .phoneNumberTextController
                                                                      .text)!) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'เบอร์โทรศัพท์ไม่ถูกต้องกรุณากรอกใหม่'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            setState(() {
                                                              _model
                                                                  .phoneNumberTextController
                                                                  ?.clear();
                                                            });
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                          if (!(false
                                                              ? (_model
                                                                      .firebaseuploadoutput!
                                                                      .length <=
                                                                  5)
                                                              : (_model
                                                                      .uploadedLocalFiles
                                                                      .length <=
                                                                  5))) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'ใส่รูปภาพได้ไม่เกิน 5 รูปกรุณาใส่ใหม่'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
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
                                                          if (widget
                                                                  .leaveType ==
                                                              'ลาป่วย') {
                                                            if (!functions
                                                                .checkSickLeaveIsBeforeCurrentDate(
                                                                    getCurrentTimestamp,
                                                                    _model
                                                                        .datePicked)!) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      content: Text(
                                                                          'ไม่สามารถลาป่วยล่วงหน้าได้ กรุณาเลือกวันลาใหม่'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
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
                                                          }
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  content: Text(
                                                                      'กรุณาเลือกวันเริ่มลา'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
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

                                                        if (_model
                                                                .leaveTimeValue ==
                                                            'ลาเต็มวัน') {
                                                          if (_model.leaveDaysTextController
                                                                      .text !=
                                                                  null &&
                                                              _model.leaveDaysTextController
                                                                      .text !=
                                                                  '') {
                                                            if (functions.stringToDouble(
                                                                    _model
                                                                        .leaveDaysTextController
                                                                        .text) <=
                                                                0.0) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      content: Text(
                                                                          'จำนวนวันลาต้องมากกว่า 0'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
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
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'กรุณากรอกจำนวนวันที่ลา'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
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

                                                          FFAppState()
                                                                  .leaveDaysLocal =
                                                              _model
                                                                  .leaveDaysTextController
                                                                  .text;
                                                          FFAppState()
                                                                  .leaveDaysDouble =
                                                              double.parse(_model
                                                                  .leaveDaysTextController
                                                                  .text);
                                                          FFAppState()
                                                                  .checkAllowLeaveDay =
                                                              functions.allowLeaveDay(
                                                                  widget
                                                                      .leaveType,
                                                                  FFAppState()
                                                                      .totalLeave
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .leaveDaysDouble)!;
                                                          FFAppState()
                                                                  .leaveDayInt =
                                                              int.parse(_model
                                                                  .leaveDaysTextController
                                                                  .text);
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          FFAppState()
                                                                  .leaveDaysLocal =
                                                              '0.5';
                                                          FFAppState()
                                                                  .leaveDaysDouble =
                                                              0.5;
                                                          FFAppState()
                                                                  .checkAllowLeaveDay =
                                                              functions.allowLeaveDay(
                                                                  widget
                                                                      .leaveType,
                                                                  FFAppState()
                                                                      .totalLeave
                                                                      .toList(),
                                                                  FFAppState()
                                                                      .leaveDaysDouble)!;
                                                          FFAppState()
                                                              .leaveDayInt = 0;
                                                          FFAppState()
                                                              .update(() {});
                                                        }

                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        content:
                                                                            Text('ยืนยันการบันทึกข้อมูล'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('ยกเลิก'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('ตกลง'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          if (FFAppState()
                                                                  .checkAllowLeaveDay !=
                                                              true) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'วันลาคุณไม่พอ'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
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
                                                          if (((widget.leaveType ==
                                                                      'ลาป่วย') &&
                                                                  (FFAppState()
                                                                          .leaveDaysDouble >=
                                                                      3.0)) ||
                                                              (widget.leaveType ==
                                                                  'ลาทำหมัน') ||
                                                              (widget.leaveType ==
                                                                  'ลาเพื่อรับราชการทหาร')) {
                                                            if (_model
                                                                    .uploadedLocalFiles
                                                                    .length >
                                                                0) {
                                                              _model.leaveRequestAPIOutput2 =
                                                                  await LeaveRequestFirstAPICall
                                                                      .call(
                                                                leaveDocument: functions.imgPathListToString(functions
                                                                    .imgPathListToStringList(_model
                                                                        .firebaseuploadoutput
                                                                        ?.toList())
                                                                    ?.toList()),
                                                                apiUrl: FFAppState()
                                                                    .apiURLLocalState,
                                                                token: FFAppState()
                                                                    .accessToken,
                                                                leaveId: functions
                                                                    .leaveTypeToLeaveId(
                                                                        widget
                                                                            .leaveType),
                                                                leaveStartDate:
                                                                    functions.startLeaveDayString(
                                                                        _model
                                                                            .datePicked),
                                                                leaveEndDate: functions.endLeaveDayCalString(
                                                                    _model
                                                                        .datePicked,
                                                                    int.tryParse(_model
                                                                        .leaveDaysTextController
                                                                        .text),
                                                                    _model
                                                                        .leaveTimeValue),
                                                                leaveReason: _model.reasonToLeaveTextController.text ==
                                                                            null ||
                                                                        _model.reasonToLeaveTextController.text ==
                                                                            ''
                                                                    ? '-'
                                                                    : _model
                                                                        .reasonToLeaveTextController
                                                                        .text,
                                                                leaveCountDay: ((functions.checkSundayBetween2Day(_model.datePicked, functions.endLeaveCalendarDate(_model.datePicked, FFAppState().leaveDayInt))! >
                                                                                0) ||
                                                                            (functions.checkHoliDayBetween2Day(
                                                                                    _model.datePicked,
                                                                                    functions.endLeaveCalendarDate(_model.datePicked, FFAppState().leaveDayInt),
                                                                                    GetHolidayAPICall.holidayDate(
                                                                                      (_model.getHolidayAPIOutput?.jsonBody ?? ''),
                                                                                    )?.map((e) => e.toString()).toList()?.toList())! >
                                                                                0)) &&
                                                                        ((widget.leaveType != 'ลาอุปสมบท') && (widget.leaveType != 'ลาเพื่อรับราชการทหาร') && (widget.leaveType != 'ลาคลอด'))
                                                                    ? functions.leaveCountMinusSunday(
                                                                        _model.leaveDaysTextController.text,
                                                                        functions.checkSundayBetween2Day(_model.datePicked, functions.endLeaveCalendarDate(_model.datePicked, int.tryParse(_model.leaveDaysTextController.text))),
                                                                        functions.checkHoliDayBetween2Day(
                                                                            _model.datePicked,
                                                                            functions.endLeaveCalendarDate(_model.datePicked, int.tryParse(_model.leaveDaysTextController.text)),
                                                                            GetHolidayAPICall.holidayDate(
                                                                              (_model.getHolidayAPIOutput?.jsonBody ?? ''),
                                                                            )?.map((e) => e.toString()).toList()?.toList()))
                                                                    : functions.leaveTimeToNumber(_model.leaveTimeValue, FFAppState().leaveDaysLocal),
                                                                leavePeriod: _model
                                                                    .leaveTimeValue,
                                                                empTel: _model.phoneNumberTextController.text ==
                                                                            null ||
                                                                        _model.phoneNumberTextController.text ==
                                                                            ''
                                                                    ? '-'
                                                                    : _model
                                                                        .phoneNumberTextController
                                                                        .text,
                                                              );
                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model.leaveRequestAPIOutput2
                                                                          ?.statusCode ??
                                                                      200) ==
                                                                  200) {
                                                                if (LeaveRequestFirstAPICall
                                                                        .infoStatus(
                                                                      (_model.leaveRequestAPIOutput2
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    201) {
                                                                  if (LeaveRequestFirstAPICall
                                                                          .infoStatus(
                                                                        (_model.leaveRequestAPIOutput2?.jsonBody ??
                                                                            ''),
                                                                      ) !=
                                                                      0) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            content:
                                                                                Text('${LeaveRequestFirstAPICall.infoInfo(
                                                                              (_model.leaveRequestAPIOutput2?.jsonBody ?? ''),
                                                                            )}'),
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
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          content:
                                                                              Text('${LeaveRequestFirstAPICall.infoInfo(
                                                                            (_model.leaveRequestAPIOutput2?.jsonBody ??
                                                                                ''),
                                                                          )}'),
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
                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              } else {
                                                                if ((LeaveRequestFirstAPICall
                                                                            .messageLayer1(
                                                                          (_model.leaveRequestAPIOutput2?.jsonBody ??
                                                                              ''),
                                                                        ) ==
                                                                        'The token has been blacklisted') ||
                                                                    (LeaveRequestFirstAPICall
                                                                            .messageLayer1(
                                                                          (_model.leaveRequestAPIOutput2?.jsonBody ??
                                                                              ''),
                                                                        ) ==
                                                                        'Token Signature could not be verified.')) {
                                                                  var userLogRecordReference1 =
                                                                      UserLogRecord
                                                                          .collection
                                                                          .doc();
                                                                  await userLogRecordReference1
                                                                      .set(
                                                                          createUserLogRecordData(
                                                                    employeeId:
                                                                        FFAppState()
                                                                            .employeeID,
                                                                    action:
                                                                        'Logout',
                                                                    actionTime:
                                                                        getCurrentTimestamp,
                                                                    userLocation:
                                                                        currentUserLocationValue,
                                                                  ));
                                                                  _model.createdUserLogLogout123 =
                                                                      UserLogRecord.getDocumentFromData(
                                                                          createUserLogRecordData(
                                                                            employeeId:
                                                                                FFAppState().employeeID,
                                                                            action:
                                                                                'Logout',
                                                                            actionTime:
                                                                                getCurrentTimestamp,
                                                                            userLocation:
                                                                                currentUserLocationValue,
                                                                          ),
                                                                          userLogRecordReference1);
                                                                  _shouldSetState =
                                                                      true;
                                                                  FFAppState()
                                                                          .loginStateFirebase =
                                                                      '[loginStateFirebase]';
                                                                  FFAppState()
                                                                      .deleteAccessToken();
                                                                  FFAppState()
                                                                          .accessToken =
                                                                      'access_token';

                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                      .deleteEmployeeID();
                                                                  FFAppState()
                                                                          .employeeID =
                                                                      'employee_id';

                                                                  FFAppState()
                                                                          .QRCodeLink =
                                                                      'qrcode_link';
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
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

                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                          .isFromSetPinPage =
                                                                      false;
                                                                  FFAppState()
                                                                      .leadChannelColor = [];
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                      .leadChannelList = [];
                                                                  FFAppState()
                                                                          .isFromLoginPage =
                                                                      false;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                      .deletePinCodeAuthen();
                                                                  FFAppState()
                                                                          .pinCodeAuthen =
                                                                      '013972';

                                                                  FFAppState()
                                                                          .isFromAuthenPage =
                                                                      false;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
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

                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                          .inAppViaNotification =
                                                                      true;
                                                                  FFAppState()
                                                                          .isInApp =
                                                                      false;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                          .fcmToken =
                                                                      'fcm_token';
                                                                  FFAppState()
                                                                          .isPassLoginSection =
                                                                      false;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                      .leadID = [];
                                                                  FFAppState()
                                                                      .leadCreatedTimeList = [];
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                      .leadCustomerNameList = [];
                                                                  FFAppState()
                                                                      .leadChannelList = [];
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                      .leadChannelColor = [];
                                                                  FFAppState()
                                                                      .leadCallStatus = [];
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                      .leadPhoneNumberList = [];
                                                                  FFAppState()
                                                                      .leadEmployeeID = [];
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                      .leadChannelLabelColor = [];
                                                                  FFAppState()
                                                                      .deleteLeadIdCalledInApp();
                                                                  FFAppState()
                                                                      .leadIdCalledInApp = [];

                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                      .leadBranchCode = [];
                                                                  FFAppState()
                                                                          .leadUserLevel =
                                                                      'lead_user_level';
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                      .leadChannelAmountList = [];
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  Navigator.pop(
                                                                      context);
                                                                  await actions
                                                                      .a22();

                                                                  context.goNamed(
                                                                      'LoginPage');

                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                } else {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          content:
                                                                              Text(LeaveRequestFirstAPICall.messageLayer1(
                                                                            (_model.leaveRequestAPIOutput2?.jsonBody ??
                                                                                ''),
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
                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              }
                                                            } else {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        AlertDialog(
                                                                      content: Text(
                                                                          'กรุณาอัปโหลดไฟล์รูปภาพ'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () =>
                                                                              Navigator.pop(alertDialogContext),
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
                                                          } else {
                                                            _model.leaveRequestAPIOutput =
                                                                await LeaveRequestFirstAPICall
                                                                    .call(
                                                              leaveDocument: _model
                                                                          .uploadedLocalFiles
                                                                          .length >
                                                                      0
                                                                  ? functions.imgPathListToString(functions
                                                                      .imgPathListToStringList(_model
                                                                          .firebaseuploadoutput
                                                                          ?.toList())
                                                                      ?.toList())
                                                                  : functions
                                                                      .imgPathtoString(
                                                                          '-'),
                                                              apiUrl: FFAppState()
                                                                  .apiURLLocalState,
                                                              token: FFAppState()
                                                                  .accessToken,
                                                              leaveId: functions
                                                                  .leaveTypeToLeaveId(
                                                                      widget
                                                                          .leaveType),
                                                              leaveStartDate: functions
                                                                  .startLeaveDayString(
                                                                      _model
                                                                          .datePicked),
                                                              leaveEndDate: functions.endLeaveDayCalString(
                                                                  _model
                                                                      .datePicked,
                                                                  int.tryParse(_model
                                                                      .leaveDaysTextController
                                                                      .text),
                                                                  _model
                                                                      .leaveTimeValue),
                                                              leaveReason: _model
                                                                              .reasonToLeaveTextController
                                                                              .text ==
                                                                          null ||
                                                                      _model.reasonToLeaveTextController
                                                                              .text ==
                                                                          ''
                                                                  ? '-'
                                                                  : _model
                                                                      .reasonToLeaveTextController
                                                                      .text,
                                                              leaveCountDay: ((functions.checkSundayBetween2Day(_model.datePicked, functions.endLeaveCalendarDate(_model.datePicked, FFAppState().leaveDayInt))! >
                                                                              0) ||
                                                                          (functions.checkHoliDayBetween2Day(
                                                                                  _model.datePicked,
                                                                                  functions.endLeaveCalendarDate(_model.datePicked, FFAppState().leaveDayInt),
                                                                                  GetHolidayAPICall.holidayDate(
                                                                                    (_model.getHolidayAPIOutput?.jsonBody ?? ''),
                                                                                  )?.map((e) => e.toString()).toList()?.toList())! >
                                                                              0)) &&
                                                                      ((widget.leaveType != 'ลาอุปสมบท') && (widget.leaveType != 'ลาเพื่อรับราชการทหาร') && (widget.leaveType != 'ลาคลอด'))
                                                                  ? functions.leaveCountMinusSunday(
                                                                      _model.leaveDaysTextController.text,
                                                                      functions.checkSundayBetween2Day(_model.datePicked, functions.endLeaveCalendarDate(_model.datePicked, int.tryParse(_model.leaveDaysTextController.text))),
                                                                      functions.checkHoliDayBetween2Day(
                                                                          _model.datePicked,
                                                                          functions.endLeaveCalendarDate(_model.datePicked, int.tryParse(_model.leaveDaysTextController.text)),
                                                                          GetHolidayAPICall.holidayDate(
                                                                            (_model.getHolidayAPIOutput?.jsonBody ??
                                                                                ''),
                                                                          )?.map((e) => e.toString()).toList()?.toList()))
                                                                  : functions.leaveTimeToNumber(_model.leaveTimeValue, FFAppState().leaveDaysLocal),
                                                              leavePeriod: _model
                                                                  .leaveTimeValue,
                                                              empTel: _model.phoneNumberTextController
                                                                              .text ==
                                                                          null ||
                                                                      _model.phoneNumberTextController
                                                                              .text ==
                                                                          ''
                                                                  ? '-'
                                                                  : _model
                                                                      .phoneNumberTextController
                                                                      .text,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model.leaveRequestAPIOutput
                                                                        ?.statusCode ??
                                                                    200) ==
                                                                200) {
                                                              if (LeaveRequestFirstAPICall
                                                                      .infoStatus(
                                                                    (_model.leaveRequestAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) !=
                                                                  201) {
                                                                if (LeaveRequestFirstAPICall
                                                                        .infoStatus(
                                                                      (_model.leaveRequestAPIOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) !=
                                                                    0) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          content:
                                                                              Text('${LeaveRequestFirstAPICall.infoInfo(
                                                                            (_model.leaveRequestAPIOutput?.jsonBody ??
                                                                                ''),
                                                                          )}'),
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
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        content:
                                                                            Text('${LeaveRequestFirstAPICall.infoInfo(
                                                                          (_model.leaveRequestAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )}'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                            } else {
                                                              if ((LeaveRequestFirstAPICall
                                                                          .messageLayer1(
                                                                        (_model.leaveRequestAPIOutput?.jsonBody ??
                                                                            ''),
                                                                      ) ==
                                                                      'The token has been blacklisted') ||
                                                                  (LeaveRequestFirstAPICall
                                                                          .messageLayer1(
                                                                        (_model.leaveRequestAPIOutput?.jsonBody ??
                                                                            ''),
                                                                      ) ==
                                                                      'Token Signature could not be verified.')) {
                                                                var userLogRecordReference2 =
                                                                    UserLogRecord
                                                                        .collection
                                                                        .doc();
                                                                await userLogRecordReference2
                                                                    .set(
                                                                        createUserLogRecordData(
                                                                  employeeId:
                                                                      FFAppState()
                                                                          .employeeID,
                                                                  action:
                                                                      'Logout',
                                                                  actionTime:
                                                                      getCurrentTimestamp,
                                                                  userLocation:
                                                                      currentUserLocationValue,
                                                                ));
                                                                _model.createdUserLogLogout5 =
                                                                    UserLogRecord
                                                                        .getDocumentFromData(
                                                                            createUserLogRecordData(
                                                                              employeeId: FFAppState().employeeID,
                                                                              action: 'Logout',
                                                                              actionTime: getCurrentTimestamp,
                                                                              userLocation: currentUserLocationValue,
                                                                            ),
                                                                            userLogRecordReference2);
                                                                _shouldSetState =
                                                                    true;
                                                                FFAppState()
                                                                        .loginStateFirebase =
                                                                    '[loginStateFirebase]';
                                                                FFAppState()
                                                                    .deleteAccessToken();
                                                                FFAppState()
                                                                        .accessToken =
                                                                    'access_token';

                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .deleteEmployeeID();
                                                                FFAppState()
                                                                        .employeeID =
                                                                    'employee_id';

                                                                FFAppState()
                                                                        .QRCodeLink =
                                                                    'qrcode_link';
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
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

                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                        .isFromSetPinPage =
                                                                    false;
                                                                FFAppState()
                                                                    .leadChannelColor = [];
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .leadChannelList = [];
                                                                FFAppState()
                                                                        .isFromLoginPage =
                                                                    false;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .deletePinCodeAuthen();
                                                                FFAppState()
                                                                        .pinCodeAuthen =
                                                                    '013972';

                                                                FFAppState()
                                                                        .isFromAuthenPage =
                                                                    false;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
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

                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                        .inAppViaNotification =
                                                                    true;
                                                                FFAppState()
                                                                        .isInApp =
                                                                    false;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                        .fcmToken =
                                                                    'fcm_token';
                                                                FFAppState()
                                                                        .isPassLoginSection =
                                                                    false;
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .leadID = [];
                                                                FFAppState()
                                                                    .leadCreatedTimeList = [];
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .leadCustomerNameList = [];
                                                                FFAppState()
                                                                    .leadChannelList = [];
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .leadChannelColor = [];
                                                                FFAppState()
                                                                    .leadCallStatus = [];
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .leadPhoneNumberList = [];
                                                                FFAppState()
                                                                    .leadEmployeeID = [];
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .leadChannelLabelColor = [];
                                                                FFAppState()
                                                                    .deleteLeadIdCalledInApp();
                                                                FFAppState()
                                                                    .leadIdCalledInApp = [];

                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .leadBranchCode = [];
                                                                FFAppState()
                                                                        .leadUserLevel =
                                                                    'lead_user_level';
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                FFAppState()
                                                                    .leadChannelAmountList = [];
                                                                FFAppState()
                                                                    .update(
                                                                        () {});
                                                                Navigator.pop(
                                                                    context);
                                                                await actions
                                                                    .a22();

                                                                context.goNamed(
                                                                    'LoginPage');

                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              } else {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        content:
                                                                            Text(LeaveRequestFirstAPICall.messageLayer1(
                                                                          (_model.leaveRequestAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )!),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                            }
                                                          }

                                                          if (columnUserCustomRecord !=
                                                              null) {
                                                            _model.fcmSendNotiFication =
                                                                await SendFCMNotificationAPICall
                                                                    .call(
                                                              to: columnFCMTokenRecord
                                                                  ?.fcmToken,
                                                              notificationJson:
                                                                  getJsonField(
                                                                functions.createNotificationBody(
                                                                    'มีการขอ \"${widget.leaveType}\" โดย ${FFAppState().profileFullName} (${FFAppState().userNickname})',
                                                                    'คำขอลาจากพนักงาน',
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test-flow-l46o23/assets/xqqgm3jn0hu4/leaveimg2.png'),
                                                                r'''$''',
                                                              ),
                                                              dataJson: functions
                                                                  .createNotificationDataBody(
                                                                      'Leave_Request'),
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model.fcmSendNotiFication
                                                                        ?.statusCode ??
                                                                    200) !=
                                                                200) {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'พบข้อผิดพลาดNotification (${(_model.fcmSendNotiFication?.statusCode ?? 200).toString()})',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          3000),
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xB2000000),
                                                                ),
                                                              );
                                                            }

                                                            var notificationRecordReference =
                                                                NotificationRecord
                                                                    .createDoc(
                                                                        columnUserCustomRecord!
                                                                            .reference);
                                                            await notificationRecordReference
                                                                .set(
                                                                    createNotificationRecordData(
                                                              notiTime:
                                                                  getCurrentTimestamp,
                                                              notiTitle:
                                                                  'แจ้งเตือนพนักงานขอลา',
                                                              notiBody:
                                                                  'มีการขอ \'${widget.leaveType}\' โดย ${FFAppState().profileFullName} (${FFAppState().userNickname})',
                                                              notiIsRead: false,
                                                              thisNotiIsRead:
                                                                  false,
                                                              notiType:
                                                                  'Leave_Request',
                                                            ));
                                                            _model.createLeavePageNotification =
                                                                NotificationRecord
                                                                    .getDocumentFromData(
                                                                        createNotificationRecordData(
                                                                          notiTime:
                                                                              getCurrentTimestamp,
                                                                          notiTitle:
                                                                              'แจ้งเตือนพนักงานขอลา',
                                                                          notiBody:
                                                                              'มีการขอ \'${widget.leaveType}\' โดย ${FFAppState().profileFullName} (${FFAppState().userNickname})',
                                                                          notiIsRead:
                                                                              false,
                                                                          thisNotiIsRead:
                                                                              false,
                                                                          notiType:
                                                                              'Leave_Request',
                                                                        ),
                                                                        notificationRecordReference);
                                                            _shouldSetState =
                                                                true;
                                                          }
                                                          if (((widget.leaveType ==
                                                                      'ลาป่วย') &&
                                                                  (FFAppState()
                                                                          .leaveDaysDouble >=
                                                                      3.0)) ||
                                                              (widget.leaveType ==
                                                                  'ลาทำหมัน') ||
                                                              (widget.leaveType ==
                                                                  'ลารับราชการ')) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'บันทึกข้อมูลการลาสำเร็จ  กรุณารอให้หัวหน้าของคุณอนุมัติการลา'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
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
                                                                        'บันทึกข้อมูลการลาสำเร็จ  กรุณารอให้หัวหน้าของคุณอนุมัติการลา'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          }

                                                          FFAppState()
                                                                  .leaveDaysDouble =
                                                              0.5;
                                                          FFAppState()
                                                              .update(() {});
                                                        } else {
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }

                                                        context.goNamed(
                                                            'LeaveShowPage');

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                      text: 'บันทึก',
                                                      options: FFButtonOptions(
                                                        width: 90.0,
                                                        height: 60.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    24.0,
                                                                    24.0),
                                                        color:
                                                            Color(0xFF00968A),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                        elevation: 2.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].addToEnd(SizedBox(height: 100.0)),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
