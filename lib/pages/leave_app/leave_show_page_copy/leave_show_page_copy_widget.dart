import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/input_copy2/input_copy2_widget.dart';
import '/components/input_copy2_copy/input_copy2_copy_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/components/show_checkin_image/show_checkin_image_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'leave_show_page_copy_model.dart';
export 'leave_show_page_copy_model.dart';

class LeaveShowPageCopyWidget extends StatefulWidget {
  const LeaveShowPageCopyWidget({super.key});

  @override
  State<LeaveShowPageCopyWidget> createState() =>
      _LeaveShowPageCopyWidgetState();
}

class _LeaveShowPageCopyWidgetState extends State<LeaveShowPageCopyWidget>
    with TickerProviderStateMixin {
  late LeaveShowPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaveShowPageCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LeaveShowPageCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x00000000),
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

      _model.leaveListAPIOutput = await LeaveListAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      if ((_model.leaveListAPIOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.leaveListAPIOutput?.statusCode ?? 200).toString()}'),
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
        return;
      }
      _model.resignListAPIOutput = await ResignListAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      if ((_model.resignListAPIOutput?.statusCode ?? 200) == 200) {
        Navigator.pop(context);
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.resignListAPIOutput?.statusCode ?? 200).toString()}'),
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
        return;
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
              context.goNamed('DashboardLeavePage');
            },
            child: Icon(
              Icons.arrow_back,
              color: Color(0xFBFFFFFF),
              size: 30.0,
            ),
          ),
          title: Text(
            'รายการขออนุมัติลา',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowDropDown<String>(
                controller: _model.monthSelectValueController ??=
                    FormFieldController<String>(
                  _model.monthSelectValue ??=
                      functions.currentTimeToMonthThai(getCurrentTimestamp),
                ),
                options: [
                  'มกราคม',
                  'กุมภาพันธ์',
                  'มีนาคม',
                  'เมษายน',
                  'พฤษภาคม',
                  'มิถุนายน',
                  'กรกฎาคม',
                  'สิงหาคม',
                  'กันยายน',
                  'ตุลาคม',
                  'พฤศจิกายน',
                  'ธันวาคม'
                ],
                onChanged: (val) =>
                    setState(() => _model.monthSelectValue = val),
                width: double.infinity,
                height: 50.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      letterSpacing: 0.0,
                    ),
                hintText: 'กรุณาเลือกเดือนที่ต้องการหา',
                icon: FaIcon(
                  FontAwesomeIcons.solidCalendarAlt,
                ),
                fillColor: Colors.white,
                elevation: 2.0,
                borderColor: Colors.transparent,
                borderWidth: 0.0,
                borderRadius: 0.0,
                margin: EdgeInsetsDirectional.fromSTEB(160.0, 4.0, 12.0, 4.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).black600,
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                        unselectedLabelStyle: TextStyle(),
                        indicatorColor: FlutterFlowTheme.of(context).secondary,
                        tabs: [
                          Tab(
                            text: 'ลา',
                          ),
                          Tab(
                            text: 'ลาออก',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                final leaveIdItem = LeaveListAPICall.leaveID(
                                      (_model.leaveListAPIOutput?.jsonBody ??
                                          ''),
                                    )?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: leaveIdItem.length,
                                  itemBuilder: (context, leaveIdItemIndex) {
                                    final leaveIdItemItem =
                                        leaveIdItem[leaveIdItemIndex];
                                    return Visibility(
                                      visible: functions.checkMonthLeave(
                                              _model.monthSelectValue,
                                              valueOrDefault<String>(
                                                functions.showMatNameInList(
                                                    functions
                                                        .reverseList(
                                                            LeaveListAPICall
                                                                .createDate(
                                                          (_model.leaveListAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.toList())
                                                        .toList(),
                                                    leaveIdItemIndex),
                                                '[leave_name]',
                                              )) ==
                                          true,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 8.0, 8.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height:
                                              functions.contrainerChange(365.0),
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              functions.getResignCardColor(
                                                  functions.showMatNameInList(
                                                      functions
                                                          .reverseList(
                                                              LeaveListAPICall
                                                                  .leaveName(
                                                            (_model.leaveListAPIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList())
                                                          .toList(),
                                                      leaveIdItemIndex),
                                                  Color(0x80C29999)),
                                              Color(0x80C29999),
                                            ),
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
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 5.0),
                                                    child: SelectionArea(
                                                        child: AutoSizeText(
                                                      FFAppState()
                                                          .profileFullName,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    )),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'ประเภทการลา:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.leaveName(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'วันที่ทำรายการ:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.createDate(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'วันที่ลา:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.leaveDate(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'จำนวนวันที่ลา:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.leaveCountDay(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'ช่วงเวลา:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.leavePeriod(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 3.0, 0.0, 3.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'เหตุผลการลา:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.leaveReason(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ).maybeHandleOverflow(
                                                                  maxChars:
                                                                      200),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'ผู้อนุมัติ:',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(LeaveListAPICall.headBefore(
                                                                          (_model.leaveListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    leaveIdItemIndex),
                                                                '[leave_name]',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                            if (valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(LeaveListAPICall.headAfter(
                                                                            (_model.leaveListAPIOutput?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      leaveIdItemIndex),
                                                                  '[leave_name]',
                                                                ) !=
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(LeaveListAPICall.headBefore(
                                                                            (_model.leaveListAPIOutput?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      leaveIdItemIndex),
                                                                  '[leave_name]',
                                                                ))
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(LeaveListAPICall.headAfter(
                                                                            (_model.leaveListAPIOutput?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      leaveIdItemIndex),
                                                                  '[leave_name]',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SelectionArea(
                                                                  child:
                                                                      AutoSizeText(
                                                                'สถานะ:',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              )),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SelectionArea(
                                                                child:
                                                                    AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.leaveStatusToText(
                                                                    valueOrDefault<
                                                                        String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList(LeaveListAPICall.leaveStatus(
                                                                            (_model.leaveListAPIOutput?.jsonBody ??
                                                                                ''),
                                                                          )?.toList())
                                                                          .toList(),
                                                                      leaveIdItemIndex),
                                                                  '[leave_name]',
                                                                )),
                                                                'leave_status',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (valueOrDefault<String>(
                                                      functions
                                                          .showMatNameInList(
                                                              functions
                                                                  .reverseList(
                                                                      LeaveListAPICall
                                                                          .leaveDocument(
                                                                    (_model.leaveListAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?.toList())
                                                                  .toList(),
                                                              leaveIdItemIndex),
                                                      '[leave_name]',
                                                    ) !=
                                                    '-')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 5.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SelectionArea(
                                                                    child:
                                                                        AutoSizeText(
                                                                  'ไฟล์เเนบ:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                            .leaveDocImgPathList =
                                                                        functions
                                                                            .leaveStringImgToImgPathList(valueOrDefault<String>(
                                                                              functions.showMatNameInList(
                                                                                  functions
                                                                                      .reverseList(LeaveListAPICall.leaveDocument(
                                                                                        (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                      )?.toList())
                                                                                      .toList(),
                                                                                  leaveIdItemIndex),
                                                                              '[leave_name]',
                                                                            ))!
                                                                            .toList()
                                                                            .cast<String>();
                                                                  });
                                                                  if (FFAppState()
                                                                          .leaveDocImgPathList
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
                                                                            content:
                                                                                Text('ไม่มีรูปภาพ'),
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
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    barrierColor:
                                                                        Color(
                                                                            0x00000000),
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: double.infinity,
                                                                              child: ShowCheckinImageWidget(
                                                                                leaveImage: FFAppState().leaveDocImgPathList,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .attach_file,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 18.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if ((valueOrDefault<String>(
                                                          functions
                                                              .showMatNameInList(
                                                                  functions
                                                                      .reverseList(
                                                                          LeaveListAPICall
                                                                              .checkEdit(
                                                                        (_model.leaveListAPIOutput?.jsonBody ??
                                                                            ''),
                                                                      )?.toList())
                                                                      .toList(),
                                                                  leaveIdItemIndex),
                                                          '[leave_name]',
                                                        ) ==
                                                        'Y') &&
                                                    (valueOrDefault<String>(
                                                          functions
                                                              .showMatNameInList(
                                                                  functions
                                                                      .reverseList(
                                                                          LeaveListAPICall
                                                                              .leaveStatus(
                                                                        (_model.leaveListAPIOutput?.jsonBody ??
                                                                            ''),
                                                                      )?.toList())
                                                                      .toList(),
                                                                  leaveIdItemIndex),
                                                          '[leave_name]',
                                                        ) !=
                                                        '0'))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    HapticFeedback
                                                                        .mediumImpact();
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState().leaveDocImgPathList = functions
                                                                          .leaveStringImgToImgPathList(valueOrDefault<String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveDocument(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ))!
                                                                          .toList()
                                                                          .cast<String>();
                                                                    });
                                                                    if (functions.showMatNameInList(
                                                                            functions
                                                                                .reverseList(LeaveListAPICall.leaveName(
                                                                                  (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                )?.toList())
                                                                                .toList(),
                                                                            leaveIdItemIndex) ==
                                                                        'ลาออก') {
                                                                      context
                                                                          .goNamed(
                                                                        'AddResignPage',
                                                                        queryParameters:
                                                                            {
                                                                          'isFromDashboard':
                                                                              serializeParam(
                                                                            false,
                                                                            ParamType.bool,
                                                                          ),
                                                                          'phone':
                                                                              serializeParam(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.userPhoneNumber(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            ParamType.String,
                                                                          ),
                                                                          'endDate':
                                                                              serializeParam(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveDate(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            ParamType.String,
                                                                          ),
                                                                          'leaveReason':
                                                                              serializeParam(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveReason(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            ParamType.String,
                                                                          ),
                                                                          'leaveListId':
                                                                              serializeParam(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveID(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      return;
                                                                    }

                                                                    context
                                                                        .goNamed(
                                                                      'EditLeavePage',
                                                                      queryParameters:
                                                                          {
                                                                        'leaveType':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveName(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'leavePeriod':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leavePeriod(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'leaveDay':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveCountDay(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'leaveReason':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveReason(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'leaveListID':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveID(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'leaveDate':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.leaveDate(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'userPhoneNumber':
                                                                            serializeParam(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList(LeaveListAPICall.userPhoneNumber(
                                                                                      (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                    )?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'leaveDocumentOld':
                                                                            serializeParam(
                                                                          FFAppState()
                                                                              .leaveDocImgPathList,
                                                                          ParamType
                                                                              .String,
                                                                          true,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  text: 'แก้ไข',
                                                                  icon: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .edit,
                                                                    size: 22.0,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        130.0,
                                                                    height:
                                                                        40.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Color(
                                                                        0xFF00968A),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    elevation:
                                                                        2.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              // กรณียกเลิก ดักให้กรอกเหตุผลการยกเลิกด้วยก่อนบันทึกข้อมูล
                                                              FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  HapticFeedback
                                                                      .mediumImpact();
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xFFFFE700),
                                                                    barrierColor:
                                                                        Colors
                                                                            .transparent,
                                                                    isDismissible:
                                                                        false,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: MediaQuery.sizeOf(context).height * 0.5,
                                                                              child: InputCopy2Widget(
                                                                                leaveID: valueOrDefault<String>(
                                                                                  functions.showMatNameInList(
                                                                                      functions
                                                                                          .reverseList(LeaveListAPICall.leaveID(
                                                                                            (_model.leaveListAPIOutput?.jsonBody ?? ''),
                                                                                          )?.toList())
                                                                                          .toList(),
                                                                                      leaveIdItemIndex),
                                                                                  '[leave_name]',
                                                                                ),
                                                                                isFromApprovePage: false,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));

                                                                  context.pop();

                                                                  context.pushNamed(
                                                                      'LeaveShowPage');
                                                                },
                                                                text: 'ยกเลิก',
                                                                icon: Icon(
                                                                  Icons.cancel,
                                                                  size: 22.0,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 130.0,
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Color(
                                                                      0xFFB32A33),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                  elevation:
                                                                      2.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ],
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
                              },
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                final resignIdList = ResignListAPICall.leaveID(
                                      (_model.resignListAPIOutput?.jsonBody ??
                                          ''),
                                    )?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: resignIdList.length,
                                  itemBuilder: (context, resignIdListIndex) {
                                    final resignIdListItem =
                                        resignIdList[resignIdListIndex];
                                    return Visibility(
                                      visible: functions.checkMonthLeave(
                                              _model.monthSelectValue,
                                              valueOrDefault<String>(
                                                functions.showMatNameInList(
                                                    functions
                                                        .reverseList(
                                                            ResignListAPICall
                                                                .createDate(
                                                          (_model.resignListAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.toList())
                                                        .toList(),
                                                    resignIdListIndex),
                                                '[leave_name]',
                                              )) ==
                                          true,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 8.0, 8.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          height: 365.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              functions.getResignCardColor(
                                                  functions.showMatNameInList(
                                                      functions
                                                          .reverseList(
                                                              ResignListAPICall
                                                                  .leaveName(
                                                            (_model.resignListAPIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList())
                                                          .toList(),
                                                      resignIdListIndex),
                                                  Color(0x80C29999)),
                                              Color(0x80C29999),
                                            ),
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
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 10.0),
                                            child: FutureBuilder<
                                                List<LeavePageDataRecord>>(
                                              future:
                                                  queryLeavePageDataRecordOnce(
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<LeavePageDataRecord>
                                                    columnPlusLeavePageDataRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final columnPlusLeavePageDataRecord =
                                                    columnPlusLeavePageDataRecordList
                                                            .isNotEmpty
                                                        ? columnPlusLeavePageDataRecordList
                                                            .first
                                                        : null;
                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            FFAppState()
                                                                .profileFullName,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          )),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    15.0,
                                                                    0.0,
                                                                    3.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      'ประเภทการลา:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.showMatNameInList(
                                                                          functions
                                                                              .reverseList(ResignListAPICall.leaveName(
                                                                                (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                              )?.toList())
                                                                              .toList(),
                                                                          resignIdListIndex),
                                                                      '[leave_name]',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
                                                                    0.0,
                                                                    3.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      'วันที่ทำรายการ:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.showMatNameInList(
                                                                          functions
                                                                              .reverseList(ResignListAPICall.createDate(
                                                                                (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                              )?.toList())
                                                                              .toList(),
                                                                          resignIdListIndex),
                                                                      '[leave_name]',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
                                                                    0.0,
                                                                    3.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      'วันที่ลาออก:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.showMatNameInList(
                                                                          functions
                                                                              .reverseList(ResignListAPICall.leaveDateEnd(
                                                                                (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                              )?.toList())
                                                                              .toList(),
                                                                          resignIdListIndex),
                                                                      '[leave_name]',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
                                                                    0.0,
                                                                    3.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      'เหตุผลการลาออก:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.showMatNameInList(
                                                                          functions
                                                                              .reverseList(ResignListAPICall.reasonResign(
                                                                                (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                              )?.toList())
                                                                              .toList(),
                                                                          resignIdListIndex),
                                                                      '[leave_name]',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      'ผู้อนุมัติ:',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.showMatNameInList(
                                                                          functions
                                                                              .reverseList(ResignListAPICall.headBefore(
                                                                                (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                              )?.toList())
                                                                              .toList(),
                                                                          resignIdListIndex),
                                                                      '[leave_name]',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  )),
                                                                  if (valueOrDefault<
                                                                          String>(
                                                                        functions.showMatNameInList(
                                                                            functions
                                                                                .reverseList(ResignListAPICall.headAfter(
                                                                                  (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                )?.toList())
                                                                                .toList(),
                                                                            resignIdListIndex),
                                                                        '[leave_name]',
                                                                      ) !=
                                                                      valueOrDefault<
                                                                          String>(
                                                                        functions.showMatNameInList(
                                                                            functions
                                                                                .reverseList(ResignListAPICall.headBefore(
                                                                                  (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                )?.toList())
                                                                                .toList(),
                                                                            resignIdListIndex),
                                                                        '[leave_name]',
                                                                      ))
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        functions.showMatNameInList(
                                                                            functions
                                                                                .reverseList(ResignListAPICall.headAfter(
                                                                                  (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                )?.toList())
                                                                                .toList(),
                                                                            resignIdListIndex),
                                                                        '[leave_name]',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      'สถานะ:',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.leaveStatusToText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                        functions.showMatNameInList(
                                                                            functions
                                                                                .reverseList(ResignListAPICall.leaveStatus(
                                                                                  (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                )?.toList())
                                                                                .toList(),
                                                                            resignIdListIndex),
                                                                        '[leave_name]',
                                                                      )),
                                                                      'leave_status',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if ((valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(ResignListAPICall.checkEdit(
                                                                          (_model.resignListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    resignIdListIndex),
                                                                '[leave_name]',
                                                              ) ==
                                                              'Y') &&
                                                          (valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(ResignListAPICall.leaveStatus(
                                                                          (_model.resignListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    resignIdListIndex),
                                                                '[leave_name]',
                                                              ) !=
                                                              '0'))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      30.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          HapticFeedback
                                                                              .mediumImpact();

                                                                          context
                                                                              .goNamed(
                                                                            'AddResignPage',
                                                                            queryParameters:
                                                                                {
                                                                              'isFromDashboard': serializeParam(
                                                                                false,
                                                                                ParamType.bool,
                                                                              ),
                                                                              'phone': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.userPhoneNumber(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                              'endDate': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.leaveStartDate(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                              'leaveReason': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.leaveReason(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                              'leaveListId': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.leaveID(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                              'resignReason': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.reasonResign(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                              'resignReasonEtc': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.otherReasonResign(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                              'privince': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.province(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                              'district': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.district(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                              'postCode': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.postCode(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                              'batchRoad': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.address(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                              'willComeBack': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.flagComback(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                              'asset': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.asset(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                              'assetEtc': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.otherAsset(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                              'subdistrict': serializeParam(
                                                                                functions.showMatNameInList(
                                                                                    functions
                                                                                        .reverseList(ResignListAPICall.subDistrict(
                                                                                          (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                        )?.toList())
                                                                                        .toList(),
                                                                                    resignIdListIndex),
                                                                                ParamType.String,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        text:
                                                                            'แก้ไข',
                                                                        icon:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .edit,
                                                                          size:
                                                                              22.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              130.0,
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              Color(0xFF00968A),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Colors.white,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                          elevation:
                                                                              2.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    // กรณียกเลิก ดักให้กรอกเหตุผลการยกเลิกด้วยก่อนบันทึกข้อมูล
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        HapticFeedback
                                                                            .mediumImpact();
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Color(0xFFFFE700),
                                                                          barrierColor:
                                                                              Colors.transparent,
                                                                          isDismissible:
                                                                              false,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return WebViewAware(
                                                                              child: GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: Container(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.5,
                                                                                    child: InputCopy2Widget(
                                                                                      leaveID: valueOrDefault<String>(
                                                                                        functions.showMatNameInList(
                                                                                            functions
                                                                                                .reverseList(ResignListAPICall.leaveID(
                                                                                                  (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                                )?.toList())
                                                                                                .toList(),
                                                                                            resignIdListIndex),
                                                                                        '[leave_name]',
                                                                                      ),
                                                                                      isFromApprovePage: false,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));

                                                                        context
                                                                            .pop();

                                                                        context.pushNamed(
                                                                            'LeaveShowPage');
                                                                      },
                                                                      text:
                                                                          'ยกเลิก',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .cancel,
                                                                        size:
                                                                            22.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            130.0,
                                                                        height:
                                                                            40.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: Color(
                                                                            0xFFB32A33),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Colors.white,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if ((valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(ResignListAPICall.leaveName(
                                                                          (_model.resignListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    resignIdListIndex),
                                                                '[leave_name]',
                                                              ) ==
                                                              'ลาออก') &&
                                                          (valueOrDefault<
                                                                  String>(
                                                                functions.showMatNameInList(
                                                                    functions
                                                                        .reverseList(ResignListAPICall.leaveStatus(
                                                                          (_model.resignListAPIOutput?.jsonBody ??
                                                                              ''),
                                                                        )?.toList())
                                                                        .toList(),
                                                                    resignIdListIndex),
                                                                '[leave_name]',
                                                              ) ==
                                                              '3') &&
                                                          columnPlusLeavePageDataRecord!
                                                              .showSendEmailBtn)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        HapticFeedback
                                                                            .mediumImpact();
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          barrierColor:
                                                                              Color(0xFFFF914C),
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return WebViewAware(
                                                                              child: GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: Container(
                                                                                    height: MediaQuery.sizeOf(context).height * 0.5,
                                                                                    child: InputCopy2CopyWidget(
                                                                                      leaveID: functions.showMatNameInList(
                                                                                          functions
                                                                                              .reverseList(ResignListAPICall.leaveID(
                                                                                                (_model.resignListAPIOutput?.jsonBody ?? ''),
                                                                                              )?.toList())
                                                                                              .toList(),
                                                                                          resignIdListIndex),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                      text:
                                                                          'ขอฟอร์มลาออก',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .send_rounded,
                                                                        size:
                                                                            22.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            180.0,
                                                                        height:
                                                                            40.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: Color(
                                                                            0xFFFFEA00),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Colors.black,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                );
                                              },
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
