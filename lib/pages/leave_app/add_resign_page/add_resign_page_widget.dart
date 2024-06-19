import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_resign_page_model.dart';
export 'add_resign_page_model.dart';

class AddResignPageWidget extends StatefulWidget {
  const AddResignPageWidget({
    super.key,
    this.isFromDashboard,
    this.endDate,
    this.resignReason,
    this.resignReasonEtc,
    this.leaveReason,
    this.privince,
    this.district,
    this.postCode,
    this.batchRoad,
    this.phone,
    this.willComeBack,
    this.asset,
    this.assetEtc,
    this.subdistrict,
    this.leaveListId,
  });

  final bool? isFromDashboard;
  final String? endDate;
  final String? resignReason;
  final String? resignReasonEtc;
  final String? leaveReason;
  final String? privince;
  final String? district;
  final String? postCode;
  final String? batchRoad;
  final String? phone;
  final String? willComeBack;
  final String? asset;
  final String? assetEtc;
  final String? subdistrict;
  final String? leaveListId;

  @override
  State<AddResignPageWidget> createState() => _AddResignPageWidgetState();
}

class _AddResignPageWidgetState extends State<AddResignPageWidget> {
  late AddResignPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddResignPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddResignPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.provinceAPIOutput = await GetProvinceAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
      );

      if ((_model.provinceAPIOutput?.statusCode ?? 200) == 200) {
        FFAppState().provName = GetProvinceAPICall.provName(
          (_model.provinceAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().provCode = GetProvinceAPICall.provCode(
          (_model.provinceAPIOutput?.jsonBody ?? ''),
        )!
            .toList()
            .cast<String>();
        FFAppState().update(() {});
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    (_model.provinceAPIOutput?.statusCode ?? 200).toString()),
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

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.reasonToLeaveEtcTextFieldTextController ??= TextEditingController();
    _model.reasonToLeaveEtcTextFieldFocusNode ??= FocusNode();

    _model.reasonToLeaveTextFieldTextController ??= TextEditingController();
    _model.reasonToLeaveTextFieldFocusNode ??= FocusNode();

    _model.batchRoadTextFieldTextController ??= TextEditingController();
    _model.batchRoadTextFieldFocusNode ??= FocusNode();

    _model.phoneNumberTextFieldTextController ??= TextEditingController();
    _model.phoneNumberTextFieldFocusNode ??= FocusNode();

    _model.returnAssetTextFieldTextController ??= TextEditingController();
    _model.returnAssetTextFieldFocusNode ??= FocusNode();

    _model.textController7 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.reasonToLeaveEtcTextField2TextController ??=
        TextEditingController(text: widget.resignReasonEtc);
    _model.reasonToLeaveEtcTextField2FocusNode ??= FocusNode();

    _model.reasonToLeaveTextField2TextController ??=
        TextEditingController(text: widget.leaveReason);
    _model.reasonToLeaveTextField2FocusNode ??= FocusNode();

    _model.batchRoadTextField2TextController ??=
        TextEditingController(text: widget.batchRoad);
    _model.batchRoadTextField2FocusNode ??= FocusNode();

    _model.phoneNumberTextField2TextController ??=
        TextEditingController(text: widget.phone);
    _model.phoneNumberTextField2FocusNode ??= FocusNode();

    _model.returnAssetTextField2TextController ??=
        TextEditingController(text: widget.assetEtc);
    _model.returnAssetTextField2FocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController1?.text = 'ประเภทการลา: ลาออก';
          _model.textController7?.text = 'ลาออก';
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<LeavePageDataRecord>>(
      future: queryLeavePageDataRecordOnce(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
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
        List<LeavePageDataRecord> addResignPageLeavePageDataRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final addResignPageLeavePageDataRecord =
            addResignPageLeavePageDataRecordList.isNotEmpty
                ? addResignPageLeavePageDataRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
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
                  if (!widget.isFromDashboard!) {
                    context.goNamed('LeaveShowPage');

                    return;
                  }

                  context.goNamed('LeavePage');
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFBFFFFFF),
                  size: 30.0,
                ),
              ),
              title: Text(
                'ยื่นเรื่องขออนุมัติลาออก',
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
                      if (widget.isFromDashboard ?? true)
                        FutureBuilder<List<FCMTokenRecord>>(
                          future: queryFCMTokenRecordOnce(
                            queryBuilder: (fCMTokenRecord) => fCMTokenRecord
                                .where(
                                  'employee_id',
                                  isEqualTo:
                                      FFAppState().profileFirstBossEmpID != ''
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
                                  Container(
                                    width: double.infinity,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.75,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 15.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController1,
                                                      focusNode: _model
                                                          .textFieldFocusNode1,
                                                      autofocus: true,
                                                      readOnly: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            '[Some hint text...]',
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
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
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
                                                            width: 1.0,
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
                                                            width: 1.0,
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
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            Color(0xFFF5F5F5),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      validator: _model
                                                          .textController1Validator
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
                                                    20.0, 0.0, 15.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.35, -0.09),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'วันที่ทำงานวันสุดท้าย  :',
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
                                                // วันที่ทำงานวันสุดท้าย : เลือกวันที่ย้อนหลังไม่ได้
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      if (kIsWeb) {
                                                        final _datePickedDate =
                                                            await showDatePicker(
                                                          context: context,
                                                          initialDate: functions
                                                              .startLeaveCalendar(
                                                                  getCurrentTimestamp,
                                                                  7),
                                                          firstDate: functions
                                                              .startLeaveCalendar(
                                                                  getCurrentTimestamp,
                                                                  7),
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
                                                          currentTime: functions
                                                              .startLeaveCalendar(
                                                                  getCurrentTimestamp,
                                                                  7),
                                                          minTime: functions
                                                              .startLeaveCalendar(
                                                                  getCurrentTimestamp,
                                                                  7),
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.35, -0.09),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'เหตุผลที่ตัดสินใจลาออก (ระบุได้มากกว่า 1 ข้อ)  :',
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                250.0, 0.0),
                                                    child:
                                                        FlutterFlowCheckboxGroup(
                                                      options:
                                                          addResignPageLeavePageDataRecord!
                                                              .reasonToLeave
                                                              .toList(),
                                                      onChanged: (val) async {
                                                        setState(() => _model
                                                                .checkboxGroupValues1 =
                                                            val);
                                                        FFAppState()
                                                                .leaveReasonEtcVisible =
                                                            functions.checkEtcInCheckbox(
                                                                _model
                                                                    .checkboxGroupValues1
                                                                    ?.toList())!;
                                                        FFAppState()
                                                            .update(() {});
                                                      },
                                                      controller: _model
                                                              .checkboxGroupValueController1 ??=
                                                          FormFieldController<
                                                              List<String>>(
                                                        [],
                                                      ),
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor: Colors.white,
                                                      checkboxBorderColor:
                                                          Color(0xFF95A1AC),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      initialized: _model
                                                              .checkboxGroupValues1 !=
                                                          null,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (FFAppState()
                                              .leaveReasonEtcVisible)
                                            Container(
                                              width: double.infinity,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 5.0,
                                                                1.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -0.35, -0.09),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            'อื่นๆ  :',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                15.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _model
                                                                .reasonToLeaveEtcTextFieldTextController,
                                                            focusNode: _model
                                                                .reasonToLeaveEtcTextFieldFocusNode,
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'ระบุ...',
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                              fillColor: Color(
                                                                  0xFFF5F5F5),
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
                                                                  color: Color(
                                                                      0xFF0A0A0A),
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                            validator: _model
                                                                .reasonToLeaveEtcTextFieldTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 10.0, 0.0),
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
                                                    'อยากให้บริษัทปรับปรุงการทำงานด้านใดบ้าง  :',
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 10.0,
                                                                0.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .reasonToLeaveTextFieldTextController,
                                                      focusNode: _model
                                                          .reasonToLeaveTextFieldFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        hintText:
                                                            'กรุณากรอก...',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Color(
                                                                      0xFF0A0A0A),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
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
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      validator: _model
                                                          .reasonToLeaveTextFieldTextControllerValidator
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
                                                    20.0, 10.0, 10.0, 0.0),
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
                                                    'ในช่วงที่แจ้งลาออก สามารถติดต่อได้ที่ :',
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
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .provinceDropDownValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: functions
                                                        .sortStringList(
                                                            FFAppState()
                                                                .provName
                                                                .toList())!,
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                              .provinceDropDownValue =
                                                          val);
                                                      var _shouldSetState =
                                                          false;
                                                      showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
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
                                                                child:
                                                                    Container(
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

                                                      _model.districtAPIOutput =
                                                          await GetDistrictAPICall
                                                              .call(
                                                        apiUrl: FFAppState()
                                                            .apiURLLocalState,
                                                        provCode: functions
                                                            .findIndexOfList(
                                                                FFAppState()
                                                                    .provName
                                                                    .toList(),
                                                                FFAppState()
                                                                    .provCode
                                                                    .toList(),
                                                                _model
                                                                    .provinceDropDownValue),
                                                      );

                                                      _shouldSetState = true;
                                                      if ((_model.districtAPIOutput
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) {
                                                        FFAppState().postCode =
                                                            GetDistrictAPICall
                                                                    .postCode(
                                                          (_model.districtAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                                .map((e) => e
                                                                    .toString())
                                                                .toList()
                                                                .cast<String>();
                                                        FFAppState()
                                                                .districtName =
                                                            GetDistrictAPICall
                                                                    .districtName(
                                                          (_model.districtAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                                .map((e) => e
                                                                    .toString())
                                                                .toList()
                                                                .cast<String>();
                                                        FFAppState()
                                                                .districtCode =
                                                            GetDistrictAPICall
                                                                    .districtCode(
                                                          (_model.districtAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                                .map((e) => e
                                                                    .toString())
                                                                .toList()
                                                                .cast<String>();
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        Navigator.pop(context);
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text((_model
                                                                            .districtAPIOutput
                                                                            ?.statusCode ??
                                                                        200)
                                                                    .toString()),
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

                                                      Navigator.pop(context);
                                                      if (_shouldSetState)
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
                                                    hintText:
                                                        'กรุณาเลือกจังหวัด...',
                                                    fillColor: Colors.white,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 0.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 4.0,
                                                                12.0, 4.0),
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
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
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .districtDropDownValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: FFAppState()
                                                        .districtName,
                                                    onChanged: (val) async {
                                                      setState(() => _model
                                                              .districtDropDownValue =
                                                          val);
                                                      var _shouldSetState =
                                                          false;
                                                      showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
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
                                                                child:
                                                                    Container(
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

                                                      _model.subDistrictAPIOutput =
                                                          await GetSubDistrictAPICall
                                                              .call(
                                                        apiUrl: FFAppState()
                                                            .apiURLLocalState,
                                                        districtCode: functions
                                                            .findIndexOfList(
                                                                FFAppState()
                                                                    .districtName
                                                                    .toList(),
                                                                FFAppState()
                                                                    .districtCode
                                                                    .toList(),
                                                                _model
                                                                    .districtDropDownValue),
                                                      );

                                                      _shouldSetState = true;
                                                      if ((_model.subDistrictAPIOutput
                                                                  ?.statusCode ??
                                                              200) ==
                                                          200) {
                                                        FFAppState()
                                                                .subDistrictName =
                                                            GetSubDistrictAPICall
                                                                    .subName(
                                                          (_model.subDistrictAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                                .toList()
                                                                .cast<String>();
                                                        FFAppState()
                                                            .update(() {});
                                                      } else {
                                                        Navigator.pop(context);
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return WebViewAware(
                                                              child:
                                                                  AlertDialog(
                                                                content: Text((_model
                                                                            .subDistrictAPIOutput
                                                                            ?.statusCode ??
                                                                        200)
                                                                    .toString()),
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

                                                      Navigator.pop(context);
                                                      if (_shouldSetState)
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
                                                    hintText:
                                                        'กรุณาเลือกอำเภอ...',
                                                    fillColor: Colors.white,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 0.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 4.0,
                                                                12.0, 4.0),
                                                    disabled: _model
                                                                .provinceDropDownValue ==
                                                            null ||
                                                        _model.provinceDropDownValue ==
                                                            '',
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
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
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .subdistrictDropDownValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: FFAppState()
                                                        .subDistrictName,
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .subdistrictDropDownValue =
                                                            val),
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
                                                    hintText:
                                                        'กรุณาเลือกตำบล...',
                                                    fillColor: Colors.white,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 0.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 4.0,
                                                                12.0, 4.0),
                                                    disabled: _model
                                                                .districtDropDownValue ==
                                                            null ||
                                                        _model.districtDropDownValue ==
                                                            '',
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
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
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .postCodeDropDownValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options:
                                                        FFAppState().postCode,
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .postCodeDropDownValue =
                                                            val),
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
                                                    hintText:
                                                        'กรุณาเลือกรหัสไปรษณีย์...',
                                                    fillColor: Colors.white,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 0.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 4.0,
                                                                12.0, 4.0),
                                                    disabled: _model
                                                                .districtDropDownValue ==
                                                            null ||
                                                        _model.districtDropDownValue ==
                                                            '',
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
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
                                                  child: TextFormField(
                                                    controller: _model
                                                        .batchRoadTextFieldTextController,
                                                    focusNode: _model
                                                        .batchRoadTextFieldFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'ระบุหมู่ที่/ถนน',
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF0A0A0A),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    validator: _model
                                                        .batchRoadTextFieldTextControllerValidator
                                                        .asValidator(context),
                                                  ),
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
                                                  child: TextFormField(
                                                    controller: _model
                                                        .phoneNumberTextFieldTextController,
                                                    focusNode: _model
                                                        .phoneNumberTextFieldFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: 'เบอร์ติดต่อ',
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF0A0A0A),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    validator: _model
                                                        .phoneNumberTextFieldTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 5.0, 10.0, 10.0),
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
                                                    'หากมีโอกาสจะกลับมาร่วมงานกับบริษัทหรือไม่  :',
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
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .chanceToWorkTgtDropDownValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.chanceToWorkTgtDropDownValue ??=
                                                          '',
                                                    ),
                                                    options: List<String>.from(
                                                        ['Y', 'N']),
                                                    optionLabels: [
                                                      'ร่วมงาน',
                                                      'ไม่ร่วมงาน'
                                                    ],
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .chanceToWorkTgtDropDownValue =
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
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 5.0, 1.0, 10.0),
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
                                                    'ทรัพย์สินของบริษัทที่ต้องส่งคืน (ระบุได้มากกว่า 1 ข้อ)  :',
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                250.0, 0.0),
                                                    child:
                                                        FlutterFlowCheckboxGroup(
                                                      options:
                                                          addResignPageLeavePageDataRecord!
                                                              .companyAsset
                                                              .toList(),
                                                      onChanged: (val) async {
                                                        setState(() => _model
                                                                .checkboxGroupValues2 =
                                                            val);
                                                        FFAppState()
                                                                .companyAssetReturnEtcVisible =
                                                            functions.checkEtcInCheckbox(
                                                                _model
                                                                    .checkboxGroupValues2
                                                                    ?.toList())!;
                                                        FFAppState()
                                                            .update(() {});
                                                      },
                                                      controller: _model
                                                              .checkboxGroupValueController2 ??=
                                                          FormFieldController<
                                                              List<String>>(
                                                        [],
                                                      ),
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor: Colors.white,
                                                      checkboxBorderColor:
                                                          Color(0xFF95A1AC),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      initialized: _model
                                                              .checkboxGroupValues2 !=
                                                          null,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (FFAppState()
                                              .companyAssetReturnEtcVisible)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 10.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    SelectionArea(
                                                        child: Text(
                                                      'อื่นๆ  :',
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                          if (FFAppState()
                                              .companyAssetReturnEtcVisible)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 15.0, 120.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: _model
                                                          .returnAssetTextFieldTextController,
                                                      focusNode: _model
                                                          .returnAssetTextFieldFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'ระบุ...',
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
                                                            color: Color(
                                                                0xFF0A0A0A),
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                      validator: _model
                                                          .returnAssetTextFieldTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.15,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  HapticFeedback.mediumImpact();
                                                  if (!(_model.datePicked !=
                                                      null)) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณาเลือกวันลาออก'),
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
                                                  if (_model
                                                          .checkboxGroupValues1!
                                                          .length <=
                                                      0) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณาระบุเหตุผลที่ลาออก'),
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
                                                  if (!(_model.reasonToLeaveTextFieldTextController
                                                              .text !=
                                                          null &&
                                                      _model.reasonToLeaveTextFieldTextController
                                                              .text !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณากรอกข้อปรับปรุงบริษัท'),
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
                                                  if (!(_model.provinceDropDownValue !=
                                                          null &&
                                                      _model.provinceDropDownValue !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณาเลือกจังหวัด'),
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
                                                  if (!(_model.districtDropDownValue !=
                                                          null &&
                                                      _model.districtDropDownValue !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณาเลือกอำเภอ'),
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
                                                  if (!(_model.subdistrictDropDownValue !=
                                                          null &&
                                                      _model.subdistrictDropDownValue !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณาเลือกตำบล'),
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
                                                  if (!(_model.batchRoadTextFieldTextController
                                                              .text !=
                                                          null &&
                                                      _model.batchRoadTextFieldTextController
                                                              .text !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณากรอก หมู่ที่/ถนน'),
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
                                                  if (!(_model.postCodeDropDownValue !=
                                                          null &&
                                                      _model.postCodeDropDownValue !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณาเลือกรหัสไปรษณีย์'),
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
                                                  if (!((_model.phoneNumberTextFieldTextController
                                                                  .text !=
                                                              null &&
                                                          _model.phoneNumberTextFieldTextController
                                                                  .text !=
                                                              '') &&
                                                      functions
                                                          .checkPhoneNumberChar(
                                                              _model
                                                                  .phoneNumberTextFieldTextController
                                                                  .text))) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณากรอกเบอร์โทรติดต่อ 9หลักหรือ10หลัก'),
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
                                                  if (!(_model.chanceToWorkTgtDropDownValue !=
                                                          null &&
                                                      _model.chanceToWorkTgtDropDownValue !=
                                                          '')) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณากเลือกโอกาสกลับมาทำงาน'),
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
                                                  if (_model
                                                          .checkboxGroupValues2!
                                                          .length <=
                                                      0) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'กรุณาระบุทรัพย์สินที่ต้องส่งคืน'),
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
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(
                                                                      'ยืนยันการบันทึกข้อมูล'),
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
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                  FFAppState()
                                                          .reasonToLeaveList =
                                                      _model
                                                          .checkboxGroupValues1!
                                                          .toList()
                                                          .cast<String>();
                                                  FFAppState().assetReturnList =
                                                      _model
                                                          .checkboxGroupValues2!
                                                          .toList()
                                                          .cast<String>();
                                                  FFAppState().update(() {});
                                                  _model.resignAPIOutput =
                                                      await LeaveRequestFirstAPICall
                                                          .call(
                                                    apiUrl: FFAppState()
                                                        .apiURLLocalState,
                                                    token: FFAppState()
                                                        .accessToken,
                                                    leaveId: '9',
                                                    leaveEndDate:
                                                        functions.getDateFormat(
                                                            _model.datePicked),
                                                    empTel: _model
                                                        .phoneNumberTextFieldTextController
                                                        .text,
                                                    leaveReason: _model
                                                        .reasonToLeaveTextFieldTextController
                                                        .text,
                                                    reasonResign: functions
                                                        .combineStringFromList(
                                                            _model
                                                                .checkboxGroupValues1
                                                                ?.toList()),
                                                    otherReasonResign: _model
                                                                    .reasonToLeaveEtcTextFieldTextController
                                                                    .text !=
                                                                null &&
                                                            _model.reasonToLeaveEtcTextFieldTextController
                                                                    .text !=
                                                                ''
                                                        ? _model
                                                            .reasonToLeaveEtcTextFieldTextController
                                                            .text
                                                        : '-',
                                                    willComeBack: _model
                                                        .chanceToWorkTgtDropDownValue,
                                                    address: _model
                                                        .batchRoadTextFieldTextController
                                                        .text,
                                                    province: _model
                                                        .provinceDropDownValue,
                                                    district: _model
                                                        .districtDropDownValue,
                                                    subdistrict: _model
                                                        .subdistrictDropDownValue,
                                                    postcode: _model
                                                        .postCodeDropDownValue,
                                                    asset: functions
                                                        .combineStringFromList(
                                                            _model
                                                                .checkboxGroupValues2
                                                                ?.toList()),
                                                    otherAsset: _model
                                                                    .returnAssetTextFieldTextController
                                                                    .text !=
                                                                null &&
                                                            _model.returnAssetTextFieldTextController
                                                                    .text !=
                                                                ''
                                                        ? _model
                                                            .returnAssetTextFieldTextController
                                                            .text
                                                        : '-',
                                                  );

                                                  _shouldSetState = true;
                                                  if ((_model.resignAPIOutput
                                                              ?.statusCode ??
                                                          200) !=
                                                      200) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'พบข้อผิดพลาดConnection (${(_model.resignAPIOutput?.statusCode ?? 200).toString()})'),
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
                                                  if (!((LeaveRequestFirstAPICall
                                                              .infoStatus(
                                                            (_model.resignAPIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          200) ||
                                                      (LeaveRequestFirstAPICall
                                                              .infoStatus(
                                                            (_model.resignAPIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          201) ||
                                                      (LeaveRequestFirstAPICall
                                                              .infoStatus(
                                                            (_model.resignAPIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ) ==
                                                          404))) {
                                                    if (LeaveRequestFirstAPICall
                                                            .infoStatus(
                                                          (_model.resignAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        0) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  '${LeaveRequestFirstAPICall.infoInfo(
                                                                (_model.resignAPIOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )} (${LeaveRequestFirstAPICall.infoStatus(
                                                                (_model.resignAPIOutput
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
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'ไม่พบข้อมูลกรุณาติดต่อ HR'),
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
                                                            'มีการขอ \"ลาออก\" โดย ${FFAppState().profileFullName} (${FFAppState().userNickname})',
                                                            'คำขอลาจากพนักงาน',
                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/test-flow-l46o23/assets/xqqgm3jn0hu4/leaveimg2.png'),
                                                        r'''$''',
                                                      ),
                                                      dataJson: functions
                                                          .createNotificationDataBody(
                                                              'Leave_Request'),
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.fcmSendNotiFication
                                                                ?.statusCode ??
                                                            200) !=
                                                        200) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'พบข้อผิดพลาดNotification (${(_model.fcmSendNotiFication?.statusCode ?? 200).toString()})',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  3000),
                                                          backgroundColor:
                                                              Color(0xB2000000),
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
                                                          'มีการขอ \'ลาออก\' โดย ${FFAppState().profileFullName} (${FFAppState().userNickname})',
                                                      notiIsRead: false,
                                                      thisNotiIsRead: false,
                                                      notiType: 'Leave_Request',
                                                    ));
                                                    _model.createResignPageNotification =
                                                        NotificationRecord
                                                            .getDocumentFromData(
                                                                createNotificationRecordData(
                                                                  notiTime:
                                                                      getCurrentTimestamp,
                                                                  notiTitle:
                                                                      'แจ้งเตือนพนักงานขอลา',
                                                                  notiBody:
                                                                      'มีการขอ \'ลาออก\' โดย ${FFAppState().profileFullName} (${FFAppState().userNickname})',
                                                                  notiIsRead:
                                                                      false,
                                                                  thisNotiIsRead:
                                                                      false,
                                                                  notiType:
                                                                      'Leave_Request',
                                                                ),
                                                                notificationRecordReference);
                                                    _shouldSetState = true;
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text(
                                                                'not have account'),
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
                                                  }

                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          content: Text(
                                                              '${LeaveRequestFirstAPICall.infoInfo(
                                                            (_model.resignAPIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )}กรุณารอให้หัวหน้าของคุณอนุมัติคำขอของคุณ'),
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

                                                  context
                                                      .goNamed('LeaveShowPage');

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                },
                                                text: 'บันทึก',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 24.0,
                                                              24.0, 24.0),
                                                  color: Color(0xFF00968A),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
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
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      if (!widget.isFromDashboard!)
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.75,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 15.0, 0.0),
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
                                                'ประเภทการลา :',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController7,
                                                  focusNode: _model
                                                      .textFieldFocusNode2,
                                                  autofocus: true,
                                                  readOnly: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        '[Some hint text...]',
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
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  validator: _model
                                                      .textController7Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 15.0, 10.0),
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
                                                'วันที่ทำงานวันสุดท้าย  :',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // วันที่ทำงานวันสุดท้าย : เลือกวันที่ย้อนหลังไม่ได้
                                            Expanded(
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  print(
                                                      'DateLastDayButton2 pressed ...');
                                                },
                                                text: widget.endDate!,
                                                icon: FaIcon(
                                                  FontAwesomeIcons
                                                      .solidCalendarAlt,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 90.0,
                                                  height: 60.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF0A0A0A),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFBDBDBD),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 15.0, 10.0),
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
                                                'เหตุผลที่ตัดสินใจลาออก (ระบุได้มากกว่า 1 ข้อ)  :',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                        0.0, 0.0, 250.0, 0.0),
                                                child: FlutterFlowCheckboxGroup(
                                                  options:
                                                      addResignPageLeavePageDataRecord!
                                                          .reasonToLeave
                                                          .toList(),
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                            .checkboxGroupEditValues =
                                                        val);
                                                    FFAppState()
                                                            .leaveReasonEtcVisible =
                                                        functions.checkEtcInCheckbox(
                                                            _model
                                                                .checkboxGroupEditValues
                                                                ?.toList())!;
                                                    FFAppState().update(() {});
                                                  },
                                                  controller: _model
                                                          .checkboxGroupEditValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    List.from(functions
                                                            .splitStringToList(
                                                                widget
                                                                    .resignReason) ??
                                                        []),
                                                  ),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor: Colors.white,
                                                  checkboxBorderColor:
                                                      Color(0xFF95A1AC),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  initialized: _model
                                                          .checkboxGroupEditValues !=
                                                      null,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (FFAppState().leaveReasonEtcVisible)
                                        Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 5.0, 1.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        'อื่นๆ  :',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      )),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 15.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: _model
                                                            .reasonToLeaveEtcTextField2TextController,
                                                        focusNode: _model
                                                            .reasonToLeaveEtcTextField2FocusNode,
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: 'ระบุ...',
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
                                                              color: Color(
                                                                  0xFF0A0A0A),
                                                              fontSize: 15.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                        validator: _model
                                                            .reasonToLeaveEtcTextField2TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 10.0, 0.0),
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
                                                'อยากให้บริษัทปรับปรุงการทำงานด้านใดบ้าง  :',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 10.0, 0.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .reasonToLeaveTextField2TextController,
                                                  focusNode: _model
                                                      .reasonToLeaveTextField2FocusNode,
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
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF0A0A0A),
                                                          letterSpacing: 0.0,
                                                        ),
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
                                                            .fromSTEB(
                                                                20.0,
                                                                40.0,
                                                                24.0,
                                                                0.0),
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
                                                  maxLines: 4,
                                                  validator: _model
                                                      .reasonToLeaveTextField2TextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 10.0, 0.0),
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
                                                'ในช่วงที่แจ้งลาออก สามารถติดต่อได้ที่ :',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .provinceDropDown2ValueController ??=
                                                    FormFieldController<String>(
                                                  _model.provinceDropDown2Value ??=
                                                      widget.privince,
                                                ),
                                                options: functions
                                                    .sortStringList(FFAppState()
                                                        .provName
                                                        .toList())!,
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                          .provinceDropDown2Value =
                                                      val);
                                                  var _shouldSetState = false;
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

                                                  _model.districtAPIOutput2 =
                                                      await GetDistrictAPICall
                                                          .call(
                                                    apiUrl: FFAppState()
                                                        .apiURLLocalState,
                                                    provCode: functions
                                                        .findIndexOfList(
                                                            FFAppState()
                                                                .provName
                                                                .toList(),
                                                            FFAppState()
                                                                .provCode
                                                                .toList(),
                                                            _model
                                                                .provinceDropDown2Value),
                                                  );

                                                  _shouldSetState = true;
                                                  if ((_model.districtAPIOutput2
                                                              ?.statusCode ??
                                                          200) ==
                                                      200) {
                                                    FFAppState().postCode =
                                                        GetDistrictAPICall
                                                                .postCode(
                                                      (_model.districtAPIOutput2
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .map((e) =>
                                                                e.toString())
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().districtName =
                                                        GetDistrictAPICall
                                                                .districtName(
                                                      (_model.districtAPIOutput2
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .map((e) =>
                                                                e.toString())
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().districtCode =
                                                        GetDistrictAPICall
                                                                .districtCode(
                                                      (_model.districtAPIOutput2
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .map((e) =>
                                                                e.toString())
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().update(() {});
                                                  } else {
                                                    Navigator.pop(context);
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text((_model
                                                                        .districtAPIOutput2
                                                                        ?.statusCode ??
                                                                    200)
                                                                .toString()),
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

                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                },
                                                width: 180.0,
                                                height: 50.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: widget.privince,
                                                fillColor: Colors.white,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 0.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .districtDropDown2ValueController ??=
                                                    FormFieldController<String>(
                                                  _model.districtDropDown2Value ??=
                                                      widget.district,
                                                ),
                                                options:
                                                    FFAppState().districtName,
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                          .districtDropDown2Value =
                                                      val);
                                                  var _shouldSetState = false;
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

                                                  _model.subDistrictAPIOutput2 =
                                                      await GetSubDistrictAPICall
                                                          .call(
                                                    apiUrl: FFAppState()
                                                        .apiURLLocalState,
                                                    districtCode: functions
                                                        .findIndexOfList(
                                                            FFAppState()
                                                                .districtName
                                                                .toList(),
                                                            FFAppState()
                                                                .districtCode
                                                                .toList(),
                                                            _model
                                                                .districtDropDown2Value),
                                                  );

                                                  _shouldSetState = true;
                                                  if ((_model.subDistrictAPIOutput2
                                                              ?.statusCode ??
                                                          200) ==
                                                      200) {
                                                    FFAppState()
                                                            .subDistrictName =
                                                        GetSubDistrictAPICall
                                                                .subName(
                                                      (_model.subDistrictAPIOutput2
                                                              ?.jsonBody ??
                                                          ''),
                                                    )!
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().update(() {});
                                                  } else {
                                                    Navigator.pop(context);
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            content: Text((_model
                                                                        .subDistrictAPIOutput2
                                                                        ?.statusCode ??
                                                                    200)
                                                                .toString()),
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

                                                  Navigator.pop(context);
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                },
                                                width: 180.0,
                                                height: 50.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: widget.district,
                                                fillColor: Colors.white,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 0.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                disabled: _model
                                                            .provinceDropDown2Value ==
                                                        null ||
                                                    _model.provinceDropDown2Value ==
                                                        '',
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .subdistrictDropDown2ValueController ??=
                                                    FormFieldController<String>(
                                                  _model.subdistrictDropDown2Value ??=
                                                      widget.subdistrict,
                                                ),
                                                options: FFAppState()
                                                    .subDistrictName,
                                                onChanged: (val) => setState(() =>
                                                    _model.subdistrictDropDown2Value =
                                                        val),
                                                width: 180.0,
                                                height: 50.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: widget.subdistrict,
                                                fillColor: Colors.white,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 0.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                disabled: _model
                                                            .districtDropDown2Value ==
                                                        null ||
                                                    _model.districtDropDown2Value ==
                                                        '',
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .postCodeDropDown2ValueController ??=
                                                    FormFieldController<String>(
                                                  _model.postCodeDropDown2Value ??=
                                                      widget.postCode,
                                                ),
                                                options: FFAppState().postCode,
                                                onChanged: (val) => setState(() =>
                                                    _model.postCodeDropDown2Value =
                                                        val),
                                                width: 180.0,
                                                height: 50.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: widget.postCode,
                                                fillColor: Colors.white,
                                                elevation: 2.0,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0.0,
                                                borderRadius: 0.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                disabled: _model
                                                            .districtDropDown2Value ==
                                                        null ||
                                                    _model.districtDropDown2Value ==
                                                        '',
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: _model
                                                    .batchRoadTextField2TextController,
                                                focusNode: _model
                                                    .batchRoadTextField2FocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'ระบุหมู่ที่/ถนน',
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Color(0xFFF5F5F5),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 24.0,
                                                              24.0, 24.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF0A0A0A),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                validator: _model
                                                    .batchRoadTextField2TextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: _model
                                                    .phoneNumberTextField2TextController,
                                                focusNode: _model
                                                    .phoneNumberTextField2FocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'เบอร์ติดต่อ',
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Color(0xFFF5F5F5),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 24.0,
                                                              24.0, 24.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF0A0A0A),
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                keyboardType:
                                                    TextInputType.phone,
                                                validator: _model
                                                    .phoneNumberTextField2TextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 5.0, 10.0, 10.0),
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
                                                'หากมีโอกาสจะกลับมาร่วมงานกับบริษัทหรือไม่  :',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 15.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .chanceToWorkTgtDropDown2ValueController ??=
                                                    FormFieldController<String>(
                                                  _model.chanceToWorkTgtDropDown2Value ??=
                                                      widget.willComeBack == 'Y'
                                                          ? 'ร่วมงาน'
                                                          : 'ไม่ร่วมงาน',
                                                ),
                                                options: List<String>.from(
                                                    ['Y', 'N']),
                                                optionLabels: [
                                                  'ร่วมงาน',
                                                  'ไม่ร่วมงาน'
                                                ],
                                                onChanged: (val) => setState(() =>
                                                    _model.chanceToWorkTgtDropDown2Value =
                                                        val),
                                                width: 90.0,
                                                height: 60.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                hintText:
                                                    widget.willComeBack == 'Y'
                                                        ? 'ร่วมงาน'
                                                        : 'ไม่ร่วมงาน',
                                                fillColor: Colors.white,
                                                elevation: 2.0,
                                                borderColor: Color(0xFFBDBDBD),
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                margin: EdgeInsets.all(10.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 5.0, 1.0, 10.0),
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
                                                'ทรัพย์สินของบริษัทที่ต้องส่งคืน (ระบุได้มากกว่า 1 ข้อ)  :',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                        0.0, 0.0, 250.0, 0.0),
                                                child: FlutterFlowCheckboxGroup(
                                                  options:
                                                      addResignPageLeavePageDataRecord!
                                                          .companyAsset
                                                          .toList(),
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                            .checkboxGroupEdit2Values =
                                                        val);
                                                    FFAppState()
                                                            .companyAssetReturnEtcVisible =
                                                        functions.checkEtcInCheckbox(
                                                            _model
                                                                .checkboxGroupEdit2Values
                                                                ?.toList())!;
                                                    FFAppState().update(() {});
                                                  },
                                                  controller: _model
                                                          .checkboxGroupEdit2ValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    List.from(functions
                                                            .splitStringToList(
                                                                widget.asset) ??
                                                        []),
                                                  ),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor: Colors.white,
                                                  checkboxBorderColor:
                                                      Color(0xFF95A1AC),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  initialized: _model
                                                          .checkboxGroupEdit2Values !=
                                                      null,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (FFAppState()
                                          .companyAssetReturnEtcVisible)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 10.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                SelectionArea(
                                                    child: Text(
                                                  'อื่นๆ  :',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      if (FFAppState()
                                          .companyAssetReturnEtcVisible)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 15.0, 120.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: _model
                                                      .returnAssetTextField2TextController,
                                                  focusNode: _model
                                                      .returnAssetTextField2FocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'ระบุ...',
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
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
                                                            .fromSTEB(
                                                                20.0,
                                                                24.0,
                                                                24.0,
                                                                24.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF0A0A0A),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  maxLines: 5,
                                                  validator: _model
                                                      .returnAssetTextField2TextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.15,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              var _shouldSetState = false;
                                              HapticFeedback.mediumImpact();
                                              if (_model
                                                      .checkboxGroupEditValues!
                                                      .length <=
                                                  0) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'กรุณาระบุเหตุผลการลาออก'),
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
                                              if (!(_model.batchRoadTextField2TextController
                                                          .text !=
                                                      null &&
                                                  _model.batchRoadTextField2TextController
                                                          .text !=
                                                      '')) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'กรุณากรอก หมู่ที่/ถนน'),
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
                                              if (!((_model.phoneNumberTextField2TextController
                                                              .text !=
                                                          null &&
                                                      _model.phoneNumberTextField2TextController
                                                              .text !=
                                                          '') &&
                                                  functions.checkPhoneNumberChar(
                                                      _model
                                                          .phoneNumberTextField2TextController
                                                          .text))) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'กรุณากรอกเบอร์โทรติดต่อ 9หลักหรือ10หลัก'),
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
                                              if (_model
                                                      .checkboxGroupEdit2Values!
                                                      .length <=
                                                  0) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'กรุณาระบุทรัพย์สินที่ต้องส่งคืน'),
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
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'ยืนยันการบันทึกข้อมูล'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'ยกเลิก'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
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
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                              _model.resignEditAPIOutput =
                                                  await LeaveEditAPICall.call(
                                                apiUrl: FFAppState()
                                                    .apiURLLocalState,
                                                token: FFAppState().accessToken,
                                                leaveId: '9',
                                                leaveEndDate: functions
                                                    .getDateFormatAPIFromThaiFormat(
                                                        widget.endDate),
                                                empTel: _model
                                                    .phoneNumberTextField2TextController
                                                    .text,
                                                leaveListId: widget.leaveListId,
                                                leaveReason: _model
                                                                .reasonToLeaveTextField2TextController
                                                                .text !=
                                                            null &&
                                                        _model.reasonToLeaveTextField2TextController
                                                                .text !=
                                                            ''
                                                    ? _model
                                                        .reasonToLeaveTextField2TextController
                                                        .text
                                                    : '-',
                                                reasonResign: functions
                                                    .combineStringFromList(_model
                                                        .checkboxGroupEditValues
                                                        ?.toList()),
                                                otherReasonResign: _model
                                                                .reasonToLeaveEtcTextField2TextController
                                                                .text !=
                                                            null &&
                                                        _model.reasonToLeaveEtcTextField2TextController
                                                                .text !=
                                                            ''
                                                    ? _model
                                                        .reasonToLeaveEtcTextField2TextController
                                                        .text
                                                    : '-',
                                                willComeBack:
                                                    _model.chanceToWorkTgtDropDown2Value !=
                                                                null &&
                                                            _model.chanceToWorkTgtDropDown2Value !=
                                                                ''
                                                        ? _model
                                                            .chanceToWorkTgtDropDown2Value
                                                        : widget.willComeBack,
                                                address: _model.batchRoadTextField2TextController
                                                                .text !=
                                                            null &&
                                                        _model.batchRoadTextField2TextController
                                                                .text !=
                                                            ''
                                                    ? _model
                                                        .batchRoadTextField2TextController
                                                        .text
                                                    : widget.batchRoad,
                                                province: _model.provinceDropDown2Value !=
                                                            null &&
                                                        _model.provinceDropDown2Value !=
                                                            ''
                                                    ? _model
                                                        .provinceDropDown2Value
                                                    : widget.privince,
                                                district: _model.districtDropDown2Value !=
                                                            null &&
                                                        _model.districtDropDown2Value !=
                                                            ''
                                                    ? _model
                                                        .districtDropDown2Value
                                                    : widget.district,
                                                subdistrict: _model
                                                                .subdistrictDropDown2Value !=
                                                            null &&
                                                        _model.subdistrictDropDown2Value !=
                                                            ''
                                                    ? _model
                                                        .subdistrictDropDown2Value
                                                    : widget.subdistrict,
                                                postcode: _model.postCodeDropDown2Value !=
                                                            null &&
                                                        _model.postCodeDropDown2Value !=
                                                            ''
                                                    ? _model
                                                        .postCodeDropDown2Value
                                                    : widget.postCode,
                                                asset: functions
                                                    .combineStringFromList(_model
                                                        .checkboxGroupEdit2Values
                                                        ?.toList()),
                                                otherAsset: _model
                                                                .returnAssetTextField2TextController
                                                                .text !=
                                                            null &&
                                                        _model.returnAssetTextField2TextController
                                                                .text !=
                                                            ''
                                                    ? _model
                                                        .returnAssetTextField2TextController
                                                        .text
                                                    : widget.assetEtc,
                                              );

                                              _shouldSetState = true;
                                              if ((_model.resignEditAPIOutput
                                                          ?.statusCode ??
                                                      200) !=
                                                  200) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'พบข้อผิดพลาดConnection (${(_model.resignEditAPIOutput?.statusCode ?? 200).toString()})'),
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
                                              if (!((LeaveEditAPICall
                                                          .infoStatus(
                                                        (_model.resignEditAPIOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      200) ||
                                                  (LeaveEditAPICall.infoStatus(
                                                        (_model.resignEditAPIOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      201) ||
                                                  (LeaveEditAPICall.infoStatus(
                                                        (_model.resignEditAPIOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      404))) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            '${LeaveEditAPICall.infoInfo(
                                                          (_model.resignEditAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )} (${LeaveEditAPICall.infoStatus(
                                                          (_model.resignEditAPIOutput
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
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          LeaveEditAPICall
                                                              .infoInfo(
                                                        (_model.resignEditAPIOutput
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

                                              context.goNamed('LeaveShowPage');

                                              if (_shouldSetState)
                                                setState(() {});
                                            },
                                            text: 'บันทึก',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 60.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 24.0, 24.0, 24.0),
                                              color: Color(0xFF00968A),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
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
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
