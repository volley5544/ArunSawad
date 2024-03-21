import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_resign_page_copy_model.dart';
export 'add_resign_page_copy_model.dart';

class AddResignPageCopyWidget extends StatefulWidget {
  const AddResignPageCopyWidget({super.key});

  @override
  State<AddResignPageCopyWidget> createState() =>
      _AddResignPageCopyWidgetState();
}

class _AddResignPageCopyWidgetState extends State<AddResignPageCopyWidget> {
  late AddResignPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddResignPageCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddResignPageCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.provinceAPIOutput = await GetProvinceAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
      );
      if ((_model.provinceAPIOutput?.statusCode ?? 200) != 200) {
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
    _model.textFieldFocusNode ??= FocusNode();

    _model.reasonToLeaveEtcTextFieldController ??= TextEditingController();
    _model.reasonToLeaveEtcTextFieldFocusNode ??= FocusNode();

    _model.reasonToLeaveTextFieldController ??= TextEditingController();
    _model.reasonToLeaveTextFieldFocusNode ??= FocusNode();

    _model.provinceInputController ??= TextEditingController();

    _model.districtInputController ??= TextEditingController();

    _model.subdistrictInputController ??= TextEditingController();

    _model.batchRoadTextFieldController ??= TextEditingController();
    _model.batchRoadTextFieldFocusNode ??= FocusNode();

    _model.postCodeTextFieldController ??= TextEditingController();

    _model.phoneNumberTextFieldController ??= TextEditingController();
    _model.phoneNumberTextFieldFocusNode ??= FocusNode();

    _model.returnAssetTextFieldController ??= TextEditingController();
    _model.returnAssetTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController1?.text = 'ลาออก';
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
        List<LeavePageDataRecord> addResignPageCopyLeavePageDataRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final addResignPageCopyLeavePageDataRecord =
            addResignPageCopyLeavePageDataRecordList.isNotEmpty
                ? addResignPageCopyLeavePageDataRecordList.first
                : null;
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
                leading: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
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
                  'ยื่นเรื่องขออนุมัติลาออก',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 10.0,
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.75,
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15.0,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController1,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: '[Some hint text...]',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall,
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
                                                        fontSize: 16.0,
                                                      ),
                                              textAlign: TextAlign.start,
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15.0,
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
                                            onPressed: () async {
                                              if (kIsWeb) {
                                                final _datePickedDate =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate: functions
                                                      .startLeaveCalendar(
                                                          getCurrentTimestamp,
                                                          30),
                                                  firstDate: functions
                                                      .startLeaveCalendar(
                                                          getCurrentTimestamp,
                                                          30),
                                                  lastDate: DateTime(2050),
                                                );

                                                if (_datePickedDate != null) {
                                                  safeSetState(() {
                                                    _model.datePicked =
                                                        DateTime(
                                                      _datePickedDate.year,
                                                      _datePickedDate.month,
                                                      _datePickedDate.day,
                                                    );
                                                  });
                                                }
                                              } else {
                                                await DatePicker.showDatePicker(
                                                  context,
                                                  showTitleActions: true,
                                                  onConfirm: (date) {
                                                    safeSetState(() {
                                                      _model.datePicked = date;
                                                    });
                                                  },
                                                  currentTime: functions
                                                      .startLeaveCalendar(
                                                          getCurrentTimestamp,
                                                          30),
                                                  minTime: functions
                                                      .startLeaveCalendar(
                                                          getCurrentTimestamp,
                                                          30),
                                                  locale: LocaleType.values
                                                      .firstWhere(
                                                    (l) =>
                                                        l.name ==
                                                        FFLocalizations.of(
                                                                context)
                                                            .languageCode,
                                                    orElse: () => LocaleType.en,
                                                  ),
                                                );
                                              }
                                            },
                                            text: valueOrDefault<String>(
                                              dateTimeFormat(
                                                'yMd',
                                                _model.datePicked,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              'ระบุวันที่',
                                            ),
                                            icon: FaIcon(
                                              FontAwesomeIcons.solidCalendarAlt,
                                            ),
                                            options: FFButtonOptions(
                                              width: 90.0,
                                              height: 60.0,
                                              padding: EdgeInsets.all(0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF0A0A0A),
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Color(0xFFBDBDBD),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15.0,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 150.0, 0.0),
                                            child: FlutterFlowCheckboxGroup(
                                              options:
                                                  addResignPageCopyLeavePageDataRecord!
                                                      .reasonToLeave
                                                      .toList(),
                                              onChanged: (val) => setState(() =>
                                                  _model.checkboxGroupValues1 =
                                                      val),
                                              controller: _model
                                                      .checkboxGroupValueController1 ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [],
                                              ),
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              checkColor: Colors.white,
                                              checkboxBorderColor:
                                                  Color(0xFF95A1AC),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              initialized:
                                                  _model.checkboxGroupValues1 !=
                                                      null,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (functions.checkEtcInCheckbox(_model
                                          .checkboxGroupValues1
                                          ?.toList()) ==
                                      true)
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
                                                    'อื่นๆ  :',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 15.0,
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
                                                  child: TextFormField(
                                                    controller: _model
                                                        .reasonToLeaveEtcTextFieldController,
                                                    focusNode: _model
                                                        .reasonToLeaveEtcTextFieldFocusNode,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      hintText: 'ระบุ...',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
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
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    validator: _model
                                                        .reasonToLeaveEtcTextFieldControllerValidator
                                                        .asValidator(context),
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
                                            'เหตุผลการลาออก  :',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15.0,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 10.0, 0.0, 0.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .reasonToLeaveTextFieldController,
                                              focusNode: _model
                                                  .reasonToLeaveTextFieldFocusNode,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                hintText: 'กรุณากรอก...',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF0A0A0A),
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
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
                                                        .fromSTEB(20.0, 40.0,
                                                            24.0, 0.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              textAlign: TextAlign.start,
                                              maxLines: 4,
                                              validator: _model
                                                  .reasonToLeaveTextFieldControllerValidator
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15.0,
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
                                          child: Autocomplete<String>(
                                            initialValue: TextEditingValue(),
                                            optionsBuilder: (textEditingValue) {
                                              if (textEditingValue.text == '') {
                                                return const Iterable<
                                                    String>.empty();
                                              }
                                              return GetProvinceAPICall
                                                      .provName(
                                                (_model.provinceAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
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
                                                    _model.provinceInputKey,
                                                textController: _model
                                                    .provinceInputController!,
                                                options: options.toList(),
                                                onSelected: onSelected,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
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
                                                      .provinceInputSelectedOption =
                                                  selection);
                                              FocusScope.of(context).unfocus();
                                            },
                                            fieldViewBuilder: (
                                              context,
                                              textEditingController,
                                              focusNode,
                                              onEditingComplete,
                                            ) {
                                              _model.provinceInputFocusNode =
                                                  focusNode;

                                              _model.provinceInputController =
                                                  textEditingController;
                                              return TextFormField(
                                                key: _model.provinceInputKey,
                                                controller:
                                                    textEditingController,
                                                focusNode: focusNode,
                                                onEditingComplete:
                                                    onEditingComplete,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.provinceInputController',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    var _shouldSetState = false;
                                                    _model.getDistrictAPIOutput =
                                                        await GetDistrictAPICall
                                                            .call(
                                                      apiUrl: FFAppState()
                                                          .apiURLLocalState,
                                                      provCode: functions
                                                          .findIndexOfList(
                                                              GetProvinceAPICall
                                                                  .provName(
                                                                (_model.provinceAPIOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toList(),
                                                              GetProvinceAPICall
                                                                  .provCode(
                                                                (_model.provinceAPIOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.toList(),
                                                              _model
                                                                  .provinceInputController
                                                                  .text),
                                                    );
                                                    _shouldSetState = true;
                                                    if ((_model.getDistrictAPIOutput
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
                                                                  'พบข้อผิดพลาด (${(_model.getDistrictAPIOutput?.statusCode ?? 200).toString()})'),
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
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'กรุณากรอกจังหวัด',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
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
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                validator: _model
                                                    .provinceInputControllerValidator
                                                    .asValidator(context),
                                              );
                                            },
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
                                          child: Autocomplete<String>(
                                            initialValue: TextEditingValue(),
                                            optionsBuilder: (textEditingValue) {
                                              if (textEditingValue.text == '') {
                                                return const Iterable<
                                                    String>.empty();
                                              }
                                              return GetDistrictAPICall
                                                      .districtName(
                                                (_model.getDistrictAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                                  .map((e) => e.toString())
                                                  .toList()
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
                                                    _model.districtInputKey,
                                                textController: _model
                                                    .districtInputController!,
                                                options: options.toList(),
                                                onSelected: onSelected,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
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
                                                      .districtInputSelectedOption =
                                                  selection);
                                              FocusScope.of(context).unfocus();
                                            },
                                            fieldViewBuilder: (
                                              context,
                                              textEditingController,
                                              focusNode,
                                              onEditingComplete,
                                            ) {
                                              _model.districtInputFocusNode =
                                                  focusNode;

                                              _model.districtInputController =
                                                  textEditingController;
                                              return TextFormField(
                                                key: _model.districtInputKey,
                                                controller:
                                                    textEditingController,
                                                focusNode: focusNode,
                                                onEditingComplete:
                                                    onEditingComplete,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.districtInputController',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    var _shouldSetState = false;
                                                    _model.getSubDistrictAPIOutput =
                                                        await GetSubDistrictAPICall
                                                            .call(
                                                      apiUrl: FFAppState()
                                                          .apiURLLocalState,
                                                      districtCode: functions
                                                          .findIndexOfList(
                                                              GetDistrictAPICall
                                                                      .districtName(
                                                                (_model.getDistrictAPIOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                                  ?.map((e) => e
                                                                      .toString())
                                                                  .toList()
                                                                  ?.toList(),
                                                              GetDistrictAPICall
                                                                      .districtCode(
                                                                (_model.getDistrictAPIOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                                  ?.map((e) => e
                                                                      .toString())
                                                                  .toList()
                                                                  ?.toList(),
                                                              _model
                                                                  .subdistrictInputController
                                                                  .text),
                                                    );
                                                    _shouldSetState = true;
                                                    if ((_model.getSubDistrictAPIOutput
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
                                                                  'พบข้อผิดพลาด (${(_model.getSubDistrictAPIOutput?.statusCode ?? 200).toString()})'),
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
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'กรุณากรอกอำเภอ',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
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
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                validator: _model
                                                    .districtInputControllerValidator
                                                    .asValidator(context),
                                              );
                                            },
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
                                          child: Autocomplete<String>(
                                            initialValue: TextEditingValue(),
                                            optionsBuilder: (textEditingValue) {
                                              if (textEditingValue.text == '') {
                                                return const Iterable<
                                                    String>.empty();
                                              }
                                              return GetSubDistrictAPICall
                                                      .subName(
                                                (_model.getSubDistrictAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
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
                                                    _model.subdistrictInputKey,
                                                textController: _model
                                                    .subdistrictInputController!,
                                                options: options.toList(),
                                                onSelected: onSelected,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
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
                                                      .subdistrictInputSelectedOption =
                                                  selection);
                                              FocusScope.of(context).unfocus();
                                            },
                                            fieldViewBuilder: (
                                              context,
                                              textEditingController,
                                              focusNode,
                                              onEditingComplete,
                                            ) {
                                              _model.subdistrictInputFocusNode =
                                                  focusNode;

                                              _model.subdistrictInputController =
                                                  textEditingController;
                                              return TextFormField(
                                                key: _model.subdistrictInputKey,
                                                controller:
                                                    textEditingController,
                                                focusNode: focusNode,
                                                onEditingComplete:
                                                    onEditingComplete,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'กรุณากรอกตำบล',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
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
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(20.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                validator: _model
                                                    .subdistrictInputControllerValidator
                                                    .asValidator(context),
                                              );
                                            },
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
                                                .batchRoadTextFieldController,
                                            focusNode: _model
                                                .batchRoadTextFieldFocusNode,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'ระบุหมู่ที่/ถนน',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFFF5F5F5),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 24.0,
                                                          24.0, 24.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF0A0A0A),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            validator: _model
                                                .batchRoadTextFieldControllerValidator
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
                                          child: Autocomplete<String>(
                                            initialValue: TextEditingValue(),
                                            optionsBuilder: (textEditingValue) {
                                              if (textEditingValue.text == '') {
                                                return const Iterable<
                                                    String>.empty();
                                              }
                                              return GetDistrictAPICall
                                                      .postCode(
                                                (_model.getDistrictAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                                  .map((e) => e.toString())
                                                  .toList()
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
                                                    _model.postCodeTextFieldKey,
                                                textController: _model
                                                    .postCodeTextFieldController!,
                                                options: options.toList(),
                                                onSelected: onSelected,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
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
                                                      .postCodeTextFieldSelectedOption =
                                                  selection);
                                              FocusScope.of(context).unfocus();
                                            },
                                            fieldViewBuilder: (
                                              context,
                                              textEditingController,
                                              focusNode,
                                              onEditingComplete,
                                            ) {
                                              _model.postCodeTextFieldFocusNode =
                                                  focusNode;

                                              _model.postCodeTextFieldController =
                                                  textEditingController;
                                              return TextFormField(
                                                key:
                                                    _model.postCodeTextFieldKey,
                                                controller:
                                                    textEditingController,
                                                focusNode: focusNode,
                                                onEditingComplete:
                                                    onEditingComplete,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'รหัสไปรษณีย์',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
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
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                validator: _model
                                                    .postCodeTextFieldControllerValidator
                                                    .asValidator(context),
                                              );
                                            },
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
                                                .phoneNumberTextFieldController,
                                            focusNode: _model
                                                .phoneNumberTextFieldFocusNode,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'เบอร์ติดต่อ',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor: Color(0xFFF5F5F5),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 24.0,
                                                          24.0, 24.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF0A0A0A),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            validator: _model
                                                .phoneNumberTextFieldControllerValidator
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15.0,
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
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .chanceToWorkTgtDropDownValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: ['ร่วมงาน', 'ไม่ร่วมงาน'],
                                            onChanged: (val) => setState(() =>
                                                _model.chanceToWorkTgtDropDownValue =
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
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            hintText: 'กรุณาเลือก...',
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 15.0,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 150.0, 0.0),
                                            child: FlutterFlowCheckboxGroup(
                                              options:
                                                  addResignPageCopyLeavePageDataRecord!
                                                      .companyAsset
                                                      .toList(),
                                              onChanged: (val) => setState(() =>
                                                  _model.checkboxGroupValues2 =
                                                      val),
                                              controller: _model
                                                      .checkboxGroupValueController2 ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [],
                                              ),
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              checkColor: Colors.white,
                                              checkboxBorderColor:
                                                  Color(0xFF95A1AC),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              initialized:
                                                  _model.checkboxGroupValues2 !=
                                                      null,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (functions.checkEtcInCheckbox(_model
                                          .checkboxGroupValues1
                                          ?.toList()) ==
                                      true)
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
                                              'อื่นๆ  :',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15.0,
                                                      ),
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (functions.checkEtcInCheckbox(_model
                                          .checkboxGroupValues1
                                          ?.toList()) ==
                                      true)
                                    Container(
                                      width: double.infinity,
                                      height: 200.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                      ),
                                      child: Padding(
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
                                                    .returnAssetTextFieldController,
                                                focusNode: _model
                                                    .returnAssetTextFieldFocusNode,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'ระบุ...',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
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
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                maxLines: 5,
                                                validator: _model
                                                    .returnAssetTextFieldControllerValidator
                                                    .asValidator(context),
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
                          Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (!(_model.datePicked != null)) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'กรุณาเลือกวันลาออก'),
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
                                            if (_model.checkboxGroupValues1!
                                                    .length <=
                                                0) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'กรุณาระบุเหตุผลที่ลาออก'),
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
                                            if (!(_model.provinceInputController
                                                        .text !=
                                                    null &&
                                                _model.provinceInputController
                                                        .text !=
                                                    '')) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'กรุณากรอกจังหวัด'),
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
                                            if (!(_model.districtInputController
                                                        .text !=
                                                    null &&
                                                _model.districtInputController
                                                        .text !=
                                                    '')) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'กรุณากรอกอำเภอ'),
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
                                            if (!(_model.subdistrictInputController
                                                        .text !=
                                                    null &&
                                                _model.subdistrictInputController
                                                        .text !=
                                                    '')) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content:
                                                          Text('กรุณากรอกตำบล'),
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
                                            if (!(_model.batchRoadTextFieldController
                                                        .text !=
                                                    null &&
                                                _model.batchRoadTextFieldController
                                                        .text !=
                                                    '')) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
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
                                              return;
                                            }
                                            if (!(_model.postCodeTextFieldController
                                                        .text !=
                                                    null &&
                                                _model.postCodeTextFieldController
                                                        .text !=
                                                    '')) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'กรุณากรอกรหัสไปรษณีย์'),
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
                                            if (!(_model.phoneNumberTextFieldController
                                                        .text !=
                                                    null &&
                                                _model.phoneNumberTextFieldController
                                                        .text !=
                                                    '')) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'กรุณากรอกเบอร์โทรติดต่อ'),
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
                                            if (!(_model.chanceToWorkTgtDropDownValue !=
                                                    null &&
                                                _model.chanceToWorkTgtDropDownValue !=
                                                    '')) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'กรุณากเลือกโอกาสกลับมาทำงาน'),
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
                                            if (_model.checkboxGroupValues2!
                                                    .length <=
                                                0) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
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
                                              return;
                                            }

                                            context.pushNamed('LeaveShowPage');
                                          },
                                          text: 'บันทึก',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 60.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 24.0, 24.0, 24.0),
                                            color: Color(0xFF00968A),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white,
                                                      fontSize: 15.0,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
