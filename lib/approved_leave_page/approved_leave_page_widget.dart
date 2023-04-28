import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene_widget.dart';
import '/components/show_checkin_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'approved_leave_page_model.dart';
export 'approved_leave_page_model.dart';

class ApprovedLeavePageWidget extends StatefulWidget {
  const ApprovedLeavePageWidget({Key? key}) : super(key: key);

  @override
  _ApprovedLeavePageWidgetState createState() =>
      _ApprovedLeavePageWidgetState();
}

class _ApprovedLeavePageWidgetState extends State<ApprovedLeavePageWidget> {
  late ApprovedLeavePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApprovedLeavePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ApprovedLeavePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x00000000),
        context: context,
        builder: (bottomSheetContext) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Padding(
              padding: MediaQuery.of(bottomSheetContext).viewInsets,
              child: LoadingSceneWidget(),
            ),
          );
        },
      ).then((value) => setState(() {}));

      _model.leaveListAprroveAPIOutput = await LeaveListAprroveAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      if ((_model.leaveListAprroveAPIOutput?.statusCode ?? 200) == 200) {
        if (LeaveListAprroveAPICall.infoStatus(
              (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
            ) ==
            200) {
          FFAppState().update(() {
            FFAppState().positionApprove = '1';
          });
          Navigator.pop(context);
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text('ไม่พบข้อมูลการขออนุมัติลา'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          Navigator.pop(context);
          context.pop();
          return;
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด (${(_model.leaveListAprroveAPIOutput?.statusCode ?? 200).toString()})${LeaveListAprroveAPICall.statusLayer1(
                (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
              ).toString().toString()}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        return;
      }
    });
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                context.goNamed('DashboardLeavePage');
              },
              child: Icon(
                Icons.arrow_back,
                color: Color(0xFBFFFFFF),
                size: 30.0,
              ),
            ),
          ),
          title: Text(
            'รายการอนุมัติลา',
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
          child: Builder(
            builder: (context) {
              final leaveIdItem = (LeaveListAprroveAPICall.leaveID(
                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                  ) as List)
                      .map<String>((s) => s.toString())
                      .toList()
                      ?.toList() ??
                  [];
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: leaveIdItem.length,
                itemBuilder: (context, leaveIdItemIndex) {
                  final leaveIdItemItem = leaveIdItem[leaveIdItemIndex];
                  return FutureBuilder<List<UserCustomRecord>>(
                    future: queryUserCustomRecordOnce(
                      queryBuilder: (userCustomRecord) =>
                          userCustomRecord.where('employee_id',
                              isEqualTo: LeaveListAprroveAPICall.empIdBoss2(
                                        (_model.leaveListAprroveAPIOutput
                                                ?.jsonBody ??
                                            ''),
                                      ).toString() !=
                                      ''
                                  ? LeaveListAprroveAPICall.empIdBoss2(
                                      (_model.leaveListAprroveAPIOutput
                                              ?.jsonBody ??
                                          ''),
                                    ).toString()
                                  : null),
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
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        );
                      }
                      List<UserCustomRecord> bottomSheetUserCustomRecordList =
                          snapshot.data!;
                      final bottomSheetUserCustomRecord =
                          bottomSheetUserCustomRecordList.isNotEmpty
                              ? bottomSheetUserCustomRecordList.first
                              : null;
                      return Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FutureBuilder<List<UserCustomRecord>>(
                                    future: queryUserCustomRecordOnce(
                                      queryBuilder: (userCustomRecord) => userCustomRecord.where(
                                          'employee_id',
                                          isEqualTo: functions
                                                      .showMatNameInList(
                                                          functions
                                                              .reverseList((LeaveListAprroveAPICall
                                                                      .empCode(
                                                                (_model.leaveListAprroveAPIOutput
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) as List)
                                                                  .map<String>(
                                                                      (s) => s
                                                                          .toString())
                                                                  .toList()
                                                                  ?.toList())
                                                              .toList(),
                                                          leaveIdItemIndex) !=
                                                  ''
                                              ? functions.showMatNameInList(
                                                  functions
                                                      .reverseList(
                                                          (LeaveListAprroveAPICall
                                                                  .empCode(
                                                        (_model.leaveListAprroveAPIOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList()
                                                              ?.toList())
                                                      .toList(),
                                                  leaveIdItemIndex)
                                              : null),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      List<UserCustomRecord>
                                          containerUserCustomRecordList =
                                          snapshot.data!;
                                      final containerUserCustomRecord =
                                          containerUserCustomRecordList
                                                  .isNotEmpty
                                              ? containerUserCustomRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height:
                                            functions.contrainerChange(380.0),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 10.0),
                                          child: FutureBuilder<
                                              List<FCMTokenRecord>>(
                                            future: queryFCMTokenRecordOnce(
                                              queryBuilder: (fCMTokenRecord) => fCMTokenRecord
                                                  .where('employee_id',
                                                      isEqualTo: functions.showMatNameInList(
                                                                  functions
                                                                      .reverseList((LeaveListAprroveAPICall.empCode(
                                                                        (_model.leaveListAprroveAPIOutput?.jsonBody ??
                                                                            ''),
                                                                      ) as List)
                                                                          .map<String>((s) => s.toString())
                                                                          .toList()
                                                                          ?.toList())
                                                                      .toList(),
                                                                  leaveIdItemIndex) !=
                                                              ''
                                                          ? functions.showMatNameInList(
                                                              functions
                                                                  .reverseList((LeaveListAprroveAPICall.empCode(
                                                                    (_model.leaveListAprroveAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List)
                                                                      .map<String>((s) => s.toString())
                                                                      .toList()
                                                                      ?.toList())
                                                                  .toList(),
                                                              leaveIdItemIndex)
                                                          : null)
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<FCMTokenRecord>
                                                  columnPlusFCMTokenRecordList =
                                                  snapshot.data!;
                                              final columnPlusFCMTokenRecord =
                                                  columnPlusFCMTokenRecordList
                                                          .isNotEmpty
                                                      ? columnPlusFCMTokenRecordList
                                                          .first
                                                      : null;
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  3.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FutureBuilder<
                                                              List<
                                                                  UserCustomRecord>>(
                                                            future:
                                                                queryUserCustomRecordOnce(
                                                              queryBuilder: (userCustomRecord) => userCustomRecord.where(
                                                                  'employee_id',
                                                                  isEqualTo: valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList((LeaveListAprroveAPICall.empCode(
                                                                                      (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                    ) as List)
                                                                                        .map<String>((s) => s.toString())
                                                                                        .toList()
                                                                                        ?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[leave_name]',
                                                                          ) !=
                                                                          ''
                                                                      ? valueOrDefault<
                                                                          String>(
                                                                          functions.showMatNameInList(
                                                                              functions
                                                                                  .reverseList((LeaveListAprroveAPICall.empCode(
                                                                                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()
                                                                                      ?.toList())
                                                                                  .toList(),
                                                                              leaveIdItemIndex),
                                                                          '[leave_name]',
                                                                        )
                                                                      : null),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<UserCustomRecord>
                                                                  imageUserCustomRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              // Return an empty Container when the item does not exist.
                                                              if (snapshot.data!
                                                                  .isEmpty) {
                                                                return Container();
                                                              }
                                                              final imageUserCustomRecord =
                                                                  imageUserCustomRecordList
                                                                          .isNotEmpty
                                                                      ? imageUserCustomRecordList
                                                                          .first
                                                                      : null;
                                                              return ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  imageUserCustomRecord!
                                                                      .imgProfile!,
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
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
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child: SelectionArea(
                                                                        child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        functions.showMatNameInList(
                                                                            functions
                                                                                .reverseList((LeaveListAprroveAPICall.leaveUserName(
                                                                                  (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                ) as List)
                                                                                    .map<String>((s) => s.toString())
                                                                                    .toList()
                                                                                    ?.toList())
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
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    )),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            7.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                child: SelectionArea(
                                                                                    child: Text(
                                                                                  'สถานะ:',
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                )),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              SelectionArea(
                                                                                  child: Text(
                                                                                valueOrDefault<String>(
                                                                                  functions.leaveStatusToText(valueOrDefault<String>(
                                                                                    functions.showMatNameInList(
                                                                                        functions
                                                                                            .reverseList((LeaveListAprroveAPICall.leaveStatus(
                                                                                              (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                            ) as List)
                                                                                                .map<String>((s) => s.toString())
                                                                                                .toList()
                                                                                                ?.toList())
                                                                                            .toList(),
                                                                                        leaveIdItemIndex),
                                                                                    '[leave_name]',
                                                                                  )),
                                                                                  'leave_status',
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 12.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              )),
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
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
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
                                                                SelectionArea(
                                                                    child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions.showMatNameInList(
                                                                        functions
                                                                            .reverseList((LeaveListAprroveAPICall.leaveName(
                                                                              (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()
                                                                                ?.toList())
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
                                                    Row(
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
                                                                    child: Text(
                                                                  'วันที่ทำรายการ:',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            12.0,
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
                                                              SelectionArea(
                                                                  child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.showMatNameInList(
                                                                      functions
                                                                          .reverseList((LeaveListAprroveAPICall.createDate(
                                                                            (_model.leaveListAprroveAPIOutput?.jsonBody ??
                                                                                ''),
                                                                          ) as List)
                                                                              .map<String>((s) => s.toString())
                                                                              .toList()
                                                                              ?.toList())
                                                                          .toList(),
                                                                      leaveIdItemIndex),
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  3.0,
                                                                  0.0,
                                                                  0.0),
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
                                                                          Text(
                                                                    'วันที่ลา:',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
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
                                                                SelectionArea(
                                                                    child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions.showMatNameInList(
                                                                        functions
                                                                            .reverseList((LeaveListAprroveAPICall.leaveDate(
                                                                              (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()
                                                                                ?.toList())
                                                                            .toList(),
                                                                        leaveIdItemIndex),
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
                                                    if (valueOrDefault<String>(
                                                          functions.showMatNameInList(
                                                              functions
                                                                  .reverseList((LeaveListAprroveAPICall.leaveName(
                                                                    (_model.leaveListAprroveAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List)
                                                                      .map<String>((s) => s.toString())
                                                                      .toList()
                                                                      ?.toList())
                                                                  .toList(),
                                                              leaveIdItemIndex),
                                                          '[leave_name]',
                                                        ) !=
                                                        'ลาออก')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
                                                                    0.0,
                                                                    0.0),
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
                                                                            Text(
                                                                      'จำนวนวันที่ลา:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
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
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.showMatNameInList(
                                                                          functions
                                                                              .reverseList((LeaveListAprroveAPICall.leaveCountDay(
                                                                                (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                              ) as List)
                                                                                  .map<String>((s) => s.toString())
                                                                                  .toList()
                                                                                  ?.toList())
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
                                                    if (valueOrDefault<String>(
                                                          functions.showMatNameInList(
                                                              functions
                                                                  .reverseList((LeaveListAprroveAPICall.leaveName(
                                                                    (_model.leaveListAprroveAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List)
                                                                      .map<String>((s) => s.toString())
                                                                      .toList()
                                                                      ?.toList())
                                                                  .toList(),
                                                              leaveIdItemIndex),
                                                          '[leave_name]',
                                                        ) !=
                                                        'ลาออก')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
                                                                    0.0,
                                                                    0.0),
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
                                                                            Text(
                                                                      'ช่วงเวลา:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
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
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.showMatNameInList(
                                                                          functions
                                                                              .reverseList((LeaveListAprroveAPICall.leavePeriod(
                                                                                (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                              ) as List)
                                                                                  .map<String>((s) => s.toString())
                                                                                  .toList()
                                                                                  ?.toList())
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
                                                                  0.0),
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
                                                                          Text(
                                                                    valueOrDefault<String>(
                                                                              functions.showMatNameInList(
                                                                                  functions
                                                                                      .reverseList((LeaveListAprroveAPICall.leaveName(
                                                                                        (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                      ) as List)
                                                                                          .map<String>((s) => s.toString())
                                                                                          .toList()
                                                                                          ?.toList())
                                                                                      .toList(),
                                                                                  leaveIdItemIndex),
                                                                              '[full_name]',
                                                                            ) !=
                                                                            'ลาออก'
                                                                        ? 'เหตุผลการลา:'
                                                                        : 'เหตุผลการลาออก:',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
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
                                                                SelectionArea(
                                                                    child: Text(
                                                                  valueOrDefault<
                                                                              String>(
                                                                            functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList((LeaveListAprroveAPICall.leaveName(
                                                                                      (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                    ) as List)
                                                                                        .map<String>((s) => s.toString())
                                                                                        .toList()
                                                                                        ?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex),
                                                                            '[full_name]',
                                                                          ) !=
                                                                          'ลาออก'
                                                                      ? valueOrDefault<
                                                                          String>(
                                                                          functions.showMatNameInList(
                                                                              functions
                                                                                  .reverseList((LeaveListAprroveAPICall.leaveReason(
                                                                                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()
                                                                                      ?.toList())
                                                                                  .toList(),
                                                                              leaveIdItemIndex),
                                                                          '[full_name]',
                                                                        )
                                                                      : valueOrDefault<
                                                                          String>(
                                                                          functions.showMatNameInList(
                                                                              functions
                                                                                  .reverseList((LeaveListAprroveAPICall.reasonResign(
                                                                                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()
                                                                                      ?.toList())
                                                                                  .toList(),
                                                                              leaveIdItemIndex),
                                                                          '[full_name]',
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
                                                                  0.0),
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
                                                                          Text(
                                                                    'เบอร์ติดต่อ:',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              12.0,
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
                                                                SelectionArea(
                                                                    child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions.showMatNameInList(
                                                                        functions
                                                                            .reverseList((LeaveListAprroveAPICall.userPhoneNumber(
                                                                              (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                            ) as List)
                                                                                .map<String>((s) => s.toString())
                                                                                .toList()
                                                                                ?.toList())
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
                                                    if (valueOrDefault<String>(
                                                          functions.showMatNameInList(
                                                              functions
                                                                  .reverseList((LeaveListAprroveAPICall.leaveDocument(
                                                                    (_model.leaveListAprroveAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List)
                                                                      .map<String>((s) => s.toString())
                                                                      .toList()
                                                                      ?.toList())
                                                                  .toList(),
                                                              leaveIdItemIndex),
                                                          '[leave_name]',
                                                        ) !=
                                                        '-')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
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
                                                                            Text(
                                                                      'ไฟล์เเนบ:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            fontSize:
                                                                                12.0,
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
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .update(
                                                                              () {
                                                                        FFAppState().leaveDocImgPathList = functions
                                                                            .leaveStringImgToImgPathList(valueOrDefault<String>(
                                                                              functions.showMatNameInList(
                                                                                  functions
                                                                                      .reverseList((LeaveListAprroveAPICall.leaveDocument(
                                                                                        (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                      ) as List)
                                                                                          .map<String>((s) => s.toString())
                                                                                          .toList()
                                                                                          ?.toList())
                                                                                      .toList(),
                                                                                  leaveIdItemIndex),
                                                                              '[leave_name]',
                                                                            ))!
                                                                            .toList();
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
                                                                            return AlertDialog(
                                                                              content: Text('ไม่มีรูปภาพ'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        return;
                                                                      }
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        barrierColor:
                                                                            Color(0x00000000),
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (bottomSheetContext) {
                                                                          return GestureDetector(
                                                                            onTap: () =>
                                                                                FocusScope.of(context).requestFocus(_unfocusNode),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                              child: Container(
                                                                                height: double.infinity,
                                                                                child: ShowCheckinImageWidget(
                                                                                  leaveImage: FFAppState().leaveDocImgPathList.toList(),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .attach_file,
                                                                      color: Colors
                                                                          .black,
                                                                      size:
                                                                          18.0,
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
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
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
                                                                          10.0,
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
                                                                      var _shouldSetState =
                                                                          false;
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text('ต้องการอนุมัติลาใช่หรือไม่'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('ไม่'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('ใช่'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                      if (!confirmDialogResponse) {
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }
                                                                      showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        barrierColor:
                                                                            Color(0x00000000),
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (bottomSheetContext) {
                                                                          return GestureDetector(
                                                                            onTap: () =>
                                                                                FocusScope.of(context).requestFocus(_unfocusNode),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                              child: LoadingSceneWidget(),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));

                                                                      _model.leaveFlagApproveAPIOutput =
                                                                          await LeaveFlagApproveAPICall
                                                                              .call(
                                                                        apiUrl:
                                                                            FFAppState().apiURLLocalState,
                                                                        token: FFAppState()
                                                                            .accessToken,
                                                                        leaveId:
                                                                            valueOrDefault<String>(
                                                                          functions.showMatNameInList(
                                                                              functions
                                                                                  .reverseList((LeaveListAprroveAPICall.leaveID(
                                                                                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()
                                                                                      ?.toList())
                                                                                  .toList(),
                                                                              leaveIdItemIndex),
                                                                          '[leave_name]',
                                                                        ),
                                                                        flagApprove:
                                                                            'Y',
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      if ((_model.leaveFlagApproveAPIOutput?.statusCode ??
                                                                              200) ==
                                                                          200) {
                                                                        if (LeaveFlagApproveAPICall.infoStatus(
                                                                              (_model.leaveFlagApproveAPIOutput?.jsonBody ?? ''),
                                                                            ) !=
                                                                            200) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text('พบข้อผิดพลาด (${LeaveFlagApproveAPICall.infoStatus(
                                                                                  (_model.leaveFlagApproveAPIOutput?.jsonBody ?? ''),
                                                                                ).toString()})'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }
                                                                        if (functions.showMatNameInList(
                                                                                functions
                                                                                    .reverseList((LeaveListAprroveAPICall.leaveStatus(
                                                                                      (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                    ) as List)
                                                                                        .map<String>((s) => s.toString())
                                                                                        .toList()
                                                                                        ?.toList())
                                                                                    .toList(),
                                                                                leaveIdItemIndex) ==
                                                                            '1') {
                                                                          if (bottomSheetUserCustomRecord !=
                                                                              null) {
                                                                            final notificationCreateData1 =
                                                                                createNotificationRecordData(
                                                                              notiTime: getCurrentTimestamp,
                                                                              notiTitle: 'แจ้งเตือนพนักงานขอลา',
                                                                              notiBody: 'มีการขอ \"${functions.showMatNameInList(functions.reverseList((LeaveListAprroveAPICall.leaveName(
                                                                                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                  ) as List).map<String>((s) => s.toString()).toList()?.toList()).toList(), leaveIdItemIndex)}\" โดย ${functions.showMatNameInList(functions.reverseList((LeaveListAprroveAPICall.leaveUserName(
                                                                                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                  ) as List).map<String>((s) => s.toString()).toList()?.toList()).toList(), leaveIdItemIndex)}',
                                                                              notiIsRead: false,
                                                                              thisNotiIsRead: false,
                                                                              notiType: 'Leave_Request',
                                                                            );
                                                                            var notificationRecordReference1 =
                                                                                NotificationRecord.createDoc(bottomSheetUserCustomRecord!.reference);
                                                                            await notificationRecordReference1.set(notificationCreateData1);
                                                                            _model.createResignPageNotification =
                                                                                NotificationRecord.getDocumentFromData(notificationCreateData1, notificationRecordReference1);
                                                                            _shouldSetState =
                                                                                true;
                                                                          }
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text('${LeaveFlagApproveAPICall.infoInfo(
                                                                                  (_model.leaveFlagApproveAPIOutput?.jsonBody ?? ''),
                                                                                ).toString()}'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        } else {
                                                                          if (functions.showMatNameInList(
                                                                                  functions
                                                                                      .reverseList((LeaveListAprroveAPICall.leaveStatus(
                                                                                        (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                      ) as List)
                                                                                          .map<String>((s) => s.toString())
                                                                                          .toList()
                                                                                          ?.toList())
                                                                                      .toList(),
                                                                                  leaveIdItemIndex) ==
                                                                              '2') {
                                                                            if (containerUserCustomRecord !=
                                                                                null) {
                                                                              final notificationCreateData2 = createNotificationRecordData(
                                                                                notiTime: getCurrentTimestamp,
                                                                                notiTitle: 'คำขออนุมัติการลา',
                                                                                notiBody: 'คำขอ \'${functions.showMatNameInList(functions.reverseList((LeaveListAprroveAPICall.leaveName(
                                                                                      (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                    ) as List).map<String>((s) => s.toString()).toList()?.toList()).toList(), leaveIdItemIndex)} \' ของคุณ ได้รับการอนุมัติแล้ว',
                                                                                notiIsRead: false,
                                                                                thisNotiIsRead: false,
                                                                                notiType: 'Leave_Request',
                                                                              );
                                                                              var notificationRecordReference2 = NotificationRecord.createDoc(containerUserCustomRecord!.reference);
                                                                              await notificationRecordReference2.set(notificationCreateData2);
                                                                              _model.createResignPageNotificationRequester = NotificationRecord.getDocumentFromData(notificationCreateData2, notificationRecordReference2);
                                                                              _shouldSetState = true;
                                                                            }
                                                                          }
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text('${LeaveFlagApproveAPICall.infoInfo(
                                                                                  (_model.leaveFlagApproveAPIOutput?.jsonBody ?? ''),
                                                                                ).toString()}'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        }

                                                                        Navigator.pop(
                                                                            context);
                                                                        context
                                                                            .pop();
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              content: Text('พบข้อผิดพลาด (${(_model.leaveFlagApproveAPIOutput?.statusCode ?? 200).toString()})'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }

                                                                      context.pushNamed(
                                                                          'ApprovedLeavePage');

                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                    },
                                                                    text:
                                                                        'อนุมัติ',
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .checkCircle,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          100.0,
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
                                                            flex: 1,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      var _shouldSetState =
                                                                          false;
                                                                      var confirmDialogResponse = await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text('ต้องการไม่อนุมัติลาใช่หรือไม่'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('ไม่'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('ใช่'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                      if (!confirmDialogResponse) {
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }
                                                                      showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        barrierColor:
                                                                            Color(0x00000000),
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (bottomSheetContext) {
                                                                          return GestureDetector(
                                                                            onTap: () =>
                                                                                FocusScope.of(context).requestFocus(_unfocusNode),
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                              child: LoadingSceneWidget(),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));

                                                                      _model.leaveFlagApproveAPIOutput2 =
                                                                          await LeaveFlagApproveAPICall
                                                                              .call(
                                                                        apiUrl:
                                                                            FFAppState().apiURLLocalState,
                                                                        token: FFAppState()
                                                                            .accessToken,
                                                                        leaveId:
                                                                            valueOrDefault<String>(
                                                                          functions.showMatNameInList(
                                                                              functions
                                                                                  .reverseList((LeaveListAprroveAPICall.leaveID(
                                                                                    (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()
                                                                                      ?.toList())
                                                                                  .toList(),
                                                                              leaveIdItemIndex),
                                                                          '[leave_name]',
                                                                        ),
                                                                        flagApprove:
                                                                            'N',
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      if ((_model.leaveFlagApproveAPIOutput2?.statusCode ??
                                                                              200) ==
                                                                          200) {
                                                                        if (LeaveFlagApproveAPICall.infoStatus(
                                                                              (_model.leaveFlagApproveAPIOutput2?.jsonBody ?? ''),
                                                                            ) ==
                                                                            200) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text(LeaveFlagApproveAPICall.infoInfo(
                                                                                  (_model.leaveFlagApproveAPIOutput2?.jsonBody ?? ''),
                                                                                ).toString()),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        } else {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text('พบข้อผิดพลาด (${LeaveFlagApproveAPICall.infoStatus(
                                                                                  (_model.leaveFlagApproveAPIOutput2?.jsonBody ?? ''),
                                                                                ).toString()})'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }

                                                                        if (containerUserCustomRecord !=
                                                                            null) {
                                                                          final notificationCreateData =
                                                                              createNotificationRecordData(
                                                                            notiTime:
                                                                                getCurrentTimestamp,
                                                                            notiTitle:
                                                                                'คำขออนุมัติการลา',
                                                                            notiBody: 'คำขอ \"${functions.showMatNameInList(functions.reverseList((LeaveListAprroveAPICall.leaveName(
                                                                                  (_model.leaveListAprroveAPIOutput?.jsonBody ?? ''),
                                                                                ) as List).map<String>((s) => s.toString()).toList()?.toList()).toList(), leaveIdItemIndex)}\" ของคุณ ไม่ได้รับการอนุมัติ',
                                                                            notiIsRead:
                                                                                false,
                                                                            thisNotiIsRead:
                                                                                false,
                                                                            notiType:
                                                                                'Leave_Request',
                                                                          );
                                                                          var notificationRecordReference =
                                                                              NotificationRecord.createDoc(containerUserCustomRecord!.reference);
                                                                          await notificationRecordReference
                                                                              .set(notificationCreateData);
                                                                          _model.createNotApproveNotification = NotificationRecord.getDocumentFromData(
                                                                              notificationCreateData,
                                                                              notificationRecordReference);
                                                                          _shouldSetState =
                                                                              true;
                                                                        }
                                                                        Navigator.pop(
                                                                            context);
                                                                        context
                                                                            .pop();

                                                                        context.pushNamed(
                                                                            'ApprovedLeavePage');
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              content: Text('พบข้อผิดพลาด (${(_model.leaveFlagApproveAPIOutput2?.statusCode ?? 200).toString()})'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                        return;
                                                                      }

                                                                      if (_shouldSetState)
                                                                        setState(
                                                                            () {});
                                                                    },
                                                                    text:
                                                                        'ไม่อนุมัติ',
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .ban,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          105.0,
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
                                                                          0xFFF46506),
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
                                                                            1.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
