import '../backend/api_requests/api_calls.dart';
import '../components/loading_scene_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeSheetPageWidget extends StatefulWidget {
  const TimeSheetPageWidget({Key? key}) : super(key: key);

  @override
  _TimeSheetPageWidgetState createState() => _TimeSheetPageWidgetState();
}

class _TimeSheetPageWidgetState extends State<TimeSheetPageWidget> {
  ApiCallResponse? checkInTimesheetDetail;
  ApiCallResponse? surveyTimesheetDetail;
  ApiCallResponse? collectionTimesheetDetail;
  ApiCallResponse? marketingTimesheetDetail;
  ApiCallResponse? surveyNPATimesheetDetail;
  ApiCallResponse? checkerTimesheetDetail;
  Completer<ApiCallResponse>? _apiRequestCompleter;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().isFromTimesheetPage = true);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6500),
        automaticallyImplyLeading: false,
        leading: Align(
          alignment: AlignmentDirectional(0, 0),
          child: InkWell(
            onTap: () async {
              context.goNamed('Dashboard');
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        title: Text(
          'Branch View',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 10,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: custom_widgets.ShowDateTime(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.04,
                    currentTime: getCurrentTimestamp,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: FutureBuilder<ApiCallResponse>(
                    future:
                        (_apiRequestCompleter ??= Completer<ApiCallResponse>()
                              ..complete(GetTimesheetAPICall.call(
                                token: FFAppState().accessToken,
                                apiUrl: FFAppState().apiURLLocalState,
                              )))
                            .future,
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      final listViewGetTimesheetAPIResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final timesheetDataList =
                              GetTimesheetAPICall.timesheetData(
                            listViewGetTimesheetAPIResponse.jsonBody,
                          ).toList();
                          return RefreshIndicator(
                            onRefresh: () async {
                              setState(() => _apiRequestCompleter = null);
                              await waitForApiRequestCompleter();
                            },
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: timesheetDataList.length,
                              itemBuilder: (context, timesheetDataListIndex) {
                                final timesheetDataListItem =
                                    timesheetDataList[timesheetDataListIndex];
                                return InkWell(
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingSceneWidget(),
                                          ),
                                        );
                                      },
                                    );
                                    if (functions.showJobType(getJsonField(
                                          timesheetDataListItem,
                                          r'''$.Job_Type''',
                                        ).toString()) ==
                                        'เช็คอิน') {
                                      checkInTimesheetDetail =
                                          await TimesheetDetailAPICall.call(
                                        token: FFAppState().accessToken,
                                        apiUrl: FFAppState().apiURLLocalState,
                                        pageName: 'check-in',
                                        recordId: getJsonField(
                                          timesheetDataListItem,
                                          r'''$.RecordId''',
                                        ).toString(),
                                      );
                                      _shouldSetState = true;

                                      context.pushNamed(
                                        'CheckInPage',
                                        queryParams: {
                                          'recordId': serializeParam(
                                              TimesheetDetailAPICall.recordID(
                                                (checkInTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'coordinate': serializeParam(
                                              functions.showLocationTimesheet(
                                                  getJsonField(
                                                    timesheetDataListItem,
                                                    r'''$.Latitude''',
                                                  ),
                                                  getJsonField(
                                                    timesheetDataListItem,
                                                    r'''$.Longitude''',
                                                  ),
                                                  true),
                                              ParamType.String),
                                          'remark': serializeParam(
                                              TimesheetDetailAPICall.remark(
                                                (checkInTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'clockIn': serializeParam(
                                              functions
                                                  .showClockIn(getJsonField(
                                                timesheetDataListItem,
                                                r'''$.ClockIn''',
                                              ).toString()),
                                              ParamType.DateTime),
                                        }.withoutNulls,
                                      );

                                      Navigator.pop(context);
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    if (functions.showJobType(getJsonField(
                                          timesheetDataListItem,
                                          r'''$.Job_Type''',
                                        ).toString()) ==
                                        'สำรวจลูกค้า') {
                                      surveyTimesheetDetail =
                                          await TimesheetDetailAPICall.call(
                                        token: FFAppState().accessToken,
                                        apiUrl: FFAppState().apiURLLocalState,
                                        pageName: 'survey',
                                        recordId: getJsonField(
                                          timesheetDataListItem,
                                          r'''$.RecordId''',
                                        ).toString(),
                                      );
                                      _shouldSetState = true;

                                      context.pushNamed(
                                        'SurveyPage',
                                        queryParams: {
                                          'recordId': serializeParam(
                                              TimesheetDetailAPICall.recordID(
                                                (surveyTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'idCardNumber': serializeParam(
                                              TimesheetDetailAPICall.citizenID(
                                                (surveyTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'coordinate': serializeParam(
                                              functions.showLocationTimesheet(
                                                  getJsonField(
                                                    timesheetDataListItem,
                                                    r'''$.Latitude''',
                                                  ),
                                                  getJsonField(
                                                    timesheetDataListItem,
                                                    r'''$.Longitude''',
                                                  ),
                                                  true),
                                              ParamType.String),
                                          'customerName': serializeParam(
                                              TimesheetDetailAPICall
                                                  .customerName(
                                                (surveyTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'landmark': serializeParam(
                                              TimesheetDetailAPICall.landmark(
                                                (surveyTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'remark': serializeParam(
                                              TimesheetDetailAPICall.remark(
                                                (surveyTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'description': serializeParam(
                                              TimesheetDetailAPICall
                                                  .description(
                                                (surveyTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'clockIn': serializeParam(
                                              functions
                                                  .showClockIn(getJsonField(
                                                timesheetDataListItem,
                                                r'''$.ClockIn''',
                                              ).toString()),
                                              ParamType.DateTime),
                                        }.withoutNulls,
                                      );

                                      Navigator.pop(context);
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    if (functions.showJobType(getJsonField(
                                          timesheetDataListItem,
                                          r'''$.Job_Type''',
                                        ).toString()) ==
                                        'ติดตามหนี้') {
                                      collectionTimesheetDetail =
                                          await TimesheetDetailAPICall.call(
                                        token: FFAppState().accessToken,
                                        apiUrl: FFAppState().apiURLLocalState,
                                        pageName: 'collection',
                                        recordId: getJsonField(
                                          timesheetDataListItem,
                                          r'''$.RecordId''',
                                        ).toString(),
                                      );
                                      _shouldSetState = true;

                                      context.pushNamed(
                                        'CollectionPage',
                                        queryParams: {
                                          'coordinate': serializeParam(
                                              functions.showLocationTimesheet(
                                                  getJsonField(
                                                    timesheetDataListItem,
                                                    r'''$.Latitude''',
                                                  ),
                                                  getJsonField(
                                                    timesheetDataListItem,
                                                    r'''$.Longitude''',
                                                  ),
                                                  true),
                                              ParamType.String),
                                          'idCardNumber': serializeParam(
                                              TimesheetDetailAPICall.citizenID(
                                                (collectionTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'contNo': serializeParam(
                                              TimesheetDetailAPICall.contNo(
                                                (collectionTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'customerName': serializeParam(
                                              TimesheetDetailAPICall
                                                  .customerName(
                                                (collectionTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'remark': serializeParam(
                                              TimesheetDetailAPICall.remark(
                                                (collectionTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'recordId': serializeParam(
                                              TimesheetDetailAPICall.recordID(
                                                (collectionTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'clockIn': serializeParam(
                                              functions
                                                  .showClockIn(getJsonField(
                                                timesheetDataListItem,
                                                r'''$.ClockIn''',
                                              ).toString()),
                                              ParamType.DateTime),
                                        }.withoutNulls,
                                      );

                                      Navigator.pop(context);
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    if (functions.showJobType(getJsonField(
                                          timesheetDataListItem,
                                          r'''$.Job_Type''',
                                        ).toString()) ==
                                        'ทำการตลาด') {
                                      marketingTimesheetDetail =
                                          await TimesheetDetailAPICall.call(
                                        token: FFAppState().accessToken,
                                        apiUrl: FFAppState().apiURLLocalState,
                                        pageName: 'marketing',
                                        recordId: getJsonField(
                                          timesheetDataListItem,
                                          r'''$.RecordId''',
                                        ).toString(),
                                      );
                                      _shouldSetState = true;

                                      context.pushNamed(
                                        'MarketingPage',
                                        queryParams: {
                                          'coordinate': serializeParam(
                                              functions.showLocationTimesheet(
                                                  getJsonField(
                                                    timesheetDataListItem,
                                                    r'''$.Latitude''',
                                                  ),
                                                  getJsonField(
                                                    timesheetDataListItem,
                                                    r'''$.Longitude''',
                                                  ),
                                                  true),
                                              ParamType.String),
                                          'branchCode': serializeParam(
                                              TimesheetDetailAPICall
                                                  .marketingBranchCode(
                                                (marketingTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'area': serializeParam(
                                              TimesheetDetailAPICall
                                                  .marketingAreaDescription(
                                                (marketingTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'detail': serializeParam(
                                              TimesheetDetailAPICall
                                                  .marketingDetail(
                                                (marketingTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'remark': serializeParam(
                                              TimesheetDetailAPICall
                                                  .marketingRemark(
                                                (marketingTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'recordId': serializeParam(
                                              getJsonField(
                                                timesheetDataListItem,
                                                r'''$.RecordId''',
                                              ).toString(),
                                              ParamType.String),
                                          'clockIn': serializeParam(
                                              functions
                                                  .showClockIn(getJsonField(
                                                timesheetDataListItem,
                                                r'''$.ClockIn''',
                                              ).toString()),
                                              ParamType.DateTime),
                                        }.withoutNulls,
                                      );

                                      Navigator.pop(context);
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    if (functions.showJobType(getJsonField(
                                          timesheetDataListItem,
                                          r'''$.Job_Type''',
                                        ).toString()) ==
                                        'สำรวจ NPA') {
                                      surveyNPATimesheetDetail =
                                          await TimesheetDetailAPICall.call(
                                        token: FFAppState().accessToken,
                                        apiUrl: FFAppState().apiURLLocalState,
                                        pageName: 'survey-npa',
                                        recordId: getJsonField(
                                          timesheetDataListItem,
                                          r'''$.RecordId''',
                                        ).toString(),
                                      );
                                      _shouldSetState = true;

                                      context.pushNamed(
                                        'NPApage',
                                        queryParams: {
                                          'recordId': serializeParam(
                                              TimesheetDetailAPICall.recordID(
                                                (surveyNPATimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'coordinate': serializeParam(
                                              functions.showLocationTimesheet(
                                                  getJsonField(
                                                    timesheetDataListItem,
                                                    r'''$.Latitude''',
                                                  ),
                                                  getJsonField(
                                                    timesheetDataListItem,
                                                    r'''$.Longitude''',
                                                  ),
                                                  true),
                                              ParamType.String),
                                          'assetId': serializeParam(
                                              TimesheetDetailAPICall.assetID(
                                                (surveyNPATimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'remark': serializeParam(
                                              TimesheetDetailAPICall.remark(
                                                (surveyNPATimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'clockIn': serializeParam(
                                              functions
                                                  .showClockIn(getJsonField(
                                                timesheetDataListItem,
                                                r'''$.ClockIn''',
                                              ).toString()),
                                              ParamType.DateTime),
                                        }.withoutNulls,
                                      );

                                      Navigator.pop(context);
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    if (functions.showJobType(getJsonField(
                                          timesheetDataListItem,
                                          r'''$.Job_Type''',
                                        ).toString()) ==
                                        'OPS') {
                                      context.pushNamed('OPSpage');

                                      Navigator.pop(context);
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    if (functions.showJobType(getJsonField(
                                          timesheetDataListItem,
                                          r'''$.Job_Type''',
                                        ).toString()) ==
                                        'ฝ่ายตรวจสอบ') {
                                      checkerTimesheetDetail =
                                          await TimesheetDetailAPICall.call(
                                        token: FFAppState().accessToken,
                                        apiUrl: FFAppState().apiURLLocalState,
                                        pageName: 'checker',
                                        recordId: getJsonField(
                                          timesheetDataListItem,
                                          r'''$.RecordId''',
                                        ).toString(),
                                      );
                                      _shouldSetState = true;

                                      context.pushNamed(
                                        'CheckerPage',
                                        queryParams: {
                                          'recordId': serializeParam(
                                              TimesheetDetailAPICall.recordID(
                                                (checkerTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'coordinate': serializeParam(
                                              functions.showLocationTimesheet(
                                                  getJsonField(
                                                    timesheetDataListItem,
                                                    r'''$.Latitude''',
                                                  ),
                                                  getJsonField(
                                                    timesheetDataListItem,
                                                    r'''$.Longitude''',
                                                  ),
                                                  true),
                                              ParamType.String),
                                          'idCardNumber': serializeParam(
                                              TimesheetDetailAPICall.citizenID(
                                                (checkerTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'contNo': serializeParam(
                                              TimesheetDetailAPICall.contNo(
                                                (checkerTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'customerName': serializeParam(
                                              TimesheetDetailAPICall
                                                  .customerName(
                                                (checkerTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'remark': serializeParam(
                                              TimesheetDetailAPICall.remark(
                                                (checkerTimesheetDetail
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString(),
                                              ParamType.String),
                                          'clockIn': serializeParam(
                                              functions
                                                  .showClockIn(getJsonField(
                                                timesheetDataListItem,
                                                r'''$.ClockIn''',
                                              ).toString()),
                                              ParamType.DateTime),
                                        }.withoutNulls,
                                      );

                                      Navigator.pop(context);
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    Navigator.pop(context);
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('ระบบ'),
                                          content: Text('ไม่มีหน้าที่ตามหา'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) setState(() {});
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      border: Border.all(
                                        color: Color(0x33000000),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 0, 0, 0),
                                                    child: Text(
                                                      functions.showJobType(
                                                          getJsonField(
                                                        timesheetDataListItem,
                                                        r'''$.Job_Type''',
                                                      ).toString()),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFFFF6500),
                                                                fontSize: 20,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, 0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        'Hm',
                                                        functions.showClockIn(
                                                            getJsonField(
                                                          timesheetDataListItem,
                                                          r'''$.ClockIn''',
                                                        ).toString())),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .grayIcon,
                                                          fontSize: 14,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 20, 0),
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .angleRight,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayIcon,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 1, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 0, 0),
                                                  child: Text(
                                                    functions
                                                        .showLocationTimesheet(
                                                            getJsonField(
                                                              timesheetDataListItem,
                                                              r'''$.Latitude''',
                                                            ),
                                                            getJsonField(
                                                              timesheetDataListItem,
                                                              r'''$.Longitude''',
                                                            ),
                                                            false),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14,
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
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
