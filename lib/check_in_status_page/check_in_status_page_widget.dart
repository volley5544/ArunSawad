import '/backend/api_requests/api_calls.dart';
import '/components/checkin_status_widget.dart';
import '/components/loading_scene_widget.dart';
import '/components/p_d_f_viewer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'check_in_status_page_model.dart';
export 'check_in_status_page_model.dart';

class CheckInStatusPageWidget extends StatefulWidget {
  const CheckInStatusPageWidget({
    Key? key,
    this.checkinImage,
  }) : super(key: key);

  final String? checkinImage;

  @override
  _CheckInStatusPageWidgetState createState() =>
      _CheckInStatusPageWidgetState();
}

class _CheckInStatusPageWidgetState extends State<CheckInStatusPageWidget> {
  late CheckInStatusPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckInStatusPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CheckInStatusPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x00000000),
        enableDrag: false,
        context: context,
        builder: (bottomSheetContext) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Padding(
              padding: MediaQuery.of(bottomSheetContext).viewInsets,
              child: Container(
                height: double.infinity,
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => setState(() {}));

      _model.getHoliday = await GetHolidayAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
      );
      _model.checkinThisMonthOutput = await CheckinoutThisMonthAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      if ((_model.checkinThisMonthOutput?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด (${(_model.checkinThisMonthOutput?.statusCode ?? 200).toString()})'),
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
      if (!((CheckinoutThisMonthAPICall.statusLayer2(
                (_model.checkinThisMonthOutput?.jsonBody ?? ''),
              ) ==
              200) ||
          (CheckinoutThisMonthAPICall.statusLayer2(
                (_model.checkinThisMonthOutput?.jsonBody ?? ''),
              ) ==
              201) ||
          (CheckinoutThisMonthAPICall.statusLayer2(
                (_model.checkinThisMonthOutput?.jsonBody ?? ''),
              ) ==
              202))) {
        if (CheckinoutThisMonthAPICall.statusLayer2(
              (_model.checkinThisMonthOutput?.jsonBody ?? ''),
            ) ==
            404) {
          Navigator.pop(context);
          return;
        } else {
          Navigator.pop(context);
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดเบื้องหลัง (${CheckinoutThisMonthAPICall.statusLayer2(
                  (_model.checkinThisMonthOutput?.jsonBody ?? ''),
                ).toString().toString()})'),
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
      }
      FFAppState().update(() {
        FFAppState().checkinStatusDate = functions
            .reverseList((CheckinoutThisMonthAPICall.date(
              (_model.checkinThisMonthOutput?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()
                ?.toList())
            .toList();
        FFAppState().checkinStatusTimeIn = functions
            .reverseList((CheckinoutThisMonthAPICall.workInTime(
              (_model.checkinThisMonthOutput?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()
                ?.toList())
            .toList();
      });
      FFAppState().update(() {
        FFAppState().checkinStatusTimeOut = functions
            .reverseList((CheckinoutThisMonthAPICall.workOutTime(
              (_model.checkinThisMonthOutput?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()
                ?.toList())
            .toList();
      });
      _model.checkinLastMonthOutput = await CheckinoutLastMonthAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      if ((_model.checkinLastMonthOutput?.statusCode ?? 200) != 200) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด (${(_model.checkinLastMonthOutput?.statusCode ?? 200).toString()})'),
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
      if (!((CheckinoutLastMonthAPICall.statusLayer2(
                (_model.checkinLastMonthOutput?.jsonBody ?? ''),
              ) ==
              200) ||
          (CheckinoutLastMonthAPICall.statusLayer2(
                (_model.checkinLastMonthOutput?.jsonBody ?? ''),
              ) ==
              201) ||
          (CheckinoutLastMonthAPICall.statusLayer2(
                (_model.checkinLastMonthOutput?.jsonBody ?? ''),
              ) ==
              202))) {
        if (CheckinoutLastMonthAPICall.statusLayer2(
              (_model.checkinLastMonthOutput?.jsonBody ?? ''),
            ) ==
            404) {
          Navigator.pop(context);
          return;
        } else {
          Navigator.pop(context);
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text(
                    'พบข้อผิดพลาดเบื้องหลัง (${CheckinoutLastMonthAPICall.statusLayer2(
                  (_model.checkinLastMonthOutput?.jsonBody ?? ''),
                ).toString().toString()})'),
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
      }
      FFAppState().update(() {
        FFAppState().checkinLastMonthDate = (CheckinoutLastMonthAPICall.date(
          (_model.checkinLastMonthOutput?.jsonBody ?? ''),
        ) as List)
            .map<String>((s) => s.toString())
            .toList()!
            .toList();
        FFAppState().checkinLastMonthTimeIn =
            (CheckinoutLastMonthAPICall.workInTime(
          (_model.checkinLastMonthOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList();
      });
      FFAppState().update(() {
        FFAppState().checkinLastMonthTimeOut =
            (CheckinoutLastMonthAPICall.workOutTime(
          (_model.checkinLastMonthOutput?.jsonBody ?? ''),
        ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList();
      });
      Navigator.pop(context);
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
                context.goNamed('DashboardCheckin');
              },
              child: Icon(
                Icons.arrow_back_sharp,
                color: Colors.white,
                size: 40.0,
              ),
            ),
            title: Text(
              'เวลาเข้างาน - ออกงาน',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
            actions: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      HapticFeedback.mediumImpact();
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Color(0x7F000000),
                        barrierColor: Color(0x00000000),
                        context: context,
                        builder: (bottomSheetContext) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context)
                                .requestFocus(_unfocusNode),
                            child: Padding(
                              padding:
                                  MediaQuery.of(bottomSheetContext).viewInsets,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: CheckinStatusWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: FaIcon(
                      FontAwesomeIcons.exclamationTriangle,
                      color: Colors.white,
                      size: 35.0,
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 10.0,
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: Color(0x00000000),
                      enableDrag: false,
                      context: context,
                      builder: (bottomSheetContext) {
                        return GestureDetector(
                          onTap: () =>
                              FocusScope.of(context).requestFocus(_unfocusNode),
                          child: Padding(
                            padding:
                                MediaQuery.of(bottomSheetContext).viewInsets,
                            child: PDFViewerWidget(
                              pdfUrl:
                                  'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/AnnouncementPDF%2F%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%81%E0%B8%B2%E0%B8%A8%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%AB%E0%B8%A2%E0%B8%B8%E0%B8%94%E0%B8%9B%E0%B8%A3%E0%B8%B0%E0%B8%88%E0%B8%B3%E0%B8%9B%E0%B8%B52566.pdf?alt=media&token=929a429d-dc3c-49c0-92fd-567312f86585',
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                        child: Icon(
                          Icons.read_more,
                          color: Color(0xFFF46506),
                          size: 32.0,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.35, -0.09),
                        child: SelectionArea(
                            child: Text(
                          'ประกาศวันหยุดตามประเพณี ประจำปี  2566',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        )),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          color: Color(0x00000000),
                          child: ExpandableNotifier(
                            initialExpanded: false,
                            child: ExpandablePanel(
                              header: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.asterisk,
                                    color: Color(0xFFFF0000),
                                    size: 10.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.asterisk,
                                      color: Color(0xFFFF0000),
                                      size: 10.0,
                                    ),
                                  ),
                                  Text(
                                    'สาขาที่เวลาทำการพิเศษและสาขาที่มีสองกะ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFFF0000),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ],
                              ),
                              collapsed: Container(
                                width: double.infinity,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Text(
                                  'แตะเพื่ออ่านเพิ่มเติม',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .grayIcon,
                                      ),
                                ),
                              ),
                              expanded: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.0, 0.0),
                                              child: Text(
                                                '- ให้บันทึกเวลาในโปรแกรมอรุณสวัสดิ์ ระบบจะส่งเวลาทำงานไปยังระบบ coach อัตโนมัติ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .black600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Text(
                                                  '- ให้ตรวจสอบเวลางานผ่านระบบ coach อีกครั้งในวันถัดไป',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black600,
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
                              theme: ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            labelColor: FlutterFlowTheme.of(context).primary,
                            labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                            indicatorColor:
                                FlutterFlowTheme.of(context).secondary,
                            tabs: [
                              Tab(
                                text: 'เดือนปัจจุบัน',
                              ),
                              Tab(
                                text: 'เดือนที่แล้ว',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 50.0,
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
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'วันที่',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                        ),
                                                  )),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: SelectionArea(
                                                    child: Text(
                                                  'เข้างาน',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                )),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: SelectionArea(
                                                    child: Text(
                                                  'ออกงาน',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                )),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: SelectionArea(
                                                    child: Text(
                                                  'สถานะ',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final checkinActionStatusList =
                                            FFAppState()
                                                .checkinStatusDate
                                                .toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              checkinActionStatusList.length,
                                          itemBuilder: (context,
                                              checkinActionStatusListIndex) {
                                            final checkinActionStatusListItem =
                                                checkinActionStatusList[
                                                    checkinActionStatusListIndex];
                                            return Container(
                                              width: 100.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: SelectionArea(
                                                          child: AutoSizeText(
                                                        functions.showCheckinDate(
                                                            functions.showMatNameInList(
                                                                FFAppState()
                                                                    .checkinStatusDate
                                                                    .toList(),
                                                                checkinActionStatusListIndex)),
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12.0,
                                                            ),
                                                      )),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: SelectionArea(
                                                        child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        functions.showMatNameInList(
                                                            FFAppState()
                                                                .checkinStatusTimeIn
                                                                .toList(),
                                                            checkinActionStatusListIndex),
                                                        '[time_in]',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12.0,
                                                              ),
                                                    )),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: SelectionArea(
                                                        child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        functions.showMatNameInList(
                                                            FFAppState()
                                                                .checkinStatusTimeOut
                                                                .toList(),
                                                            checkinActionStatusListIndex),
                                                        '[time_out]',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12.0,
                                                              ),
                                                    )),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 12.0,
                                                              height: 12.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: functions
                                                                    .getCheckinStatusColor(
                                                                        functions.showMatNameInList(
                                                                            FFAppState()
                                                                                .checkinStatusTimeIn
                                                                                .toList(),
                                                                            checkinActionStatusListIndex),
                                                                        functions.showMatNameInList(
                                                                            FFAppState()
                                                                                .checkinStatusTimeOut
                                                                                .toList(),
                                                                            checkinActionStatusListIndex),
                                                                        functions.showMatNameInList(
                                                                            FFAppState()
                                                                                .checkinStatusDate
                                                                                .toList(),
                                                                            checkinActionStatusListIndex),
                                                                        FFAppState()
                                                                            .branchCode,
                                                                        FFAppState()
                                                                            .checkinStatusColor
                                                                            .toList(),
                                                                        (GetHolidayAPICall.holidayDate(
                                                                          (_model.getHoliday?.jsonBody ??
                                                                              ''),
                                                                        ) as List)
                                                                            .map<String>((s) => s.toString())
                                                                            .toList()
                                                                            ?.map((e) => e.toString())
                                                                            .toList()
                                                                            ?.toList(),
                                                                        checkinActionStatusListIndex,
                                                                        true),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child:
                                                                SelectionArea(
                                                                    child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.getCheckinStatusText(
                                                                    functions.showMatNameInList(FFAppState().checkinStatusTimeIn.toList(), checkinActionStatusListIndex),
                                                                    functions.showMatNameInList(FFAppState().checkinStatusTimeOut.toList(), checkinActionStatusListIndex),
                                                                    functions.showMatNameInList(FFAppState().checkinStatusDate.toList(), checkinActionStatusListIndex),
                                                                    FFAppState().branchCode,
                                                                    (GetHolidayAPICall.holidayDate(
                                                                      (_model.getHoliday
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) as List)
                                                                        .map<String>((s) => s.toString())
                                                                        .toList()
                                                                        ?.map((e) => e.toString())
                                                                        .toList()
                                                                        ?.toList(),
                                                                    checkinActionStatusListIndex,
                                                                    true,
                                                                    (GetHolidayAPICall.holidayName(
                                                                      (_model.getHoliday
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) as List)
                                                                        .map<String>((s) => s.toString())
                                                                        .toList()
                                                                        ?.map((e) => e.toString())
                                                                        .toList()
                                                                        ?.toList()),
                                                                '[checkin_status]',
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
                                                                  ),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 50.0,
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
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    'วันที่',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                        ),
                                                  )),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: SelectionArea(
                                                    child: Text(
                                                  'เข้างาน',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                )),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: SelectionArea(
                                                    child: Text(
                                                  'ออกงาน',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                )),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: SelectionArea(
                                                    child: Text(
                                                  'สถานะ',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final checkinStatusLMList = FFAppState()
                                            .checkinLastMonthDate
                                            .toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: checkinStatusLMList.length,
                                          itemBuilder: (context,
                                              checkinStatusLMListIndex) {
                                            final checkinStatusLMListItem =
                                                checkinStatusLMList[
                                                    checkinStatusLMListIndex];
                                            return Container(
                                              width: 100.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: SelectionArea(
                                                          child: Text(
                                                        valueOrDefault<String>(
                                                          functions.showCheckinDate(
                                                              functions.showMatNameInList(
                                                                  FFAppState()
                                                                      .checkinLastMonthDate
                                                                      .toList(),
                                                                  checkinStatusLMListIndex)),
                                                          '[date]',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 12.0,
                                                            ),
                                                      )),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: SelectionArea(
                                                        child: Text(
                                                      valueOrDefault<String>(
                                                        functions.showMatNameInList(
                                                            FFAppState()
                                                                .checkinLastMonthTimeIn
                                                                .toList(),
                                                            checkinStatusLMListIndex),
                                                        '[time_in]',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12.0,
                                                              ),
                                                    )),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: SelectionArea(
                                                        child: Text(
                                                      valueOrDefault<String>(
                                                        functions.showMatNameInList(
                                                            FFAppState()
                                                                .checkinLastMonthTimeOut
                                                                .toList(),
                                                            checkinStatusLMListIndex),
                                                        '[time_out]',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12.0,
                                                              ),
                                                    )),
                                                  ),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 12.0,
                                                              height: 12.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  functions.getCheckinStatusColor(
                                                                      functions.showMatNameInList(FFAppState().checkinLastMonthTimeIn.toList(), checkinStatusLMListIndex),
                                                                      functions.showMatNameInList(FFAppState().checkinLastMonthTimeOut.toList(), checkinStatusLMListIndex),
                                                                      functions.showMatNameInList(FFAppState().checkinLastMonthDate.toList(), checkinStatusLMListIndex),
                                                                      FFAppState().branchCode,
                                                                      FFAppState().checkinStatusColor.toList(),
                                                                      (GetHolidayAPICall.holidayDate(
                                                                        (_model.getHoliday?.jsonBody ??
                                                                            ''),
                                                                      ) as List)
                                                                          .map<String>((s) => s.toString())
                                                                          .toList()
                                                                          ?.map((e) => e.toString())
                                                                          .toList()
                                                                          ?.toList(),
                                                                      checkinStatusLMListIndex,
                                                                      false),
                                                                  Color(
                                                                      0xFF9D6969),
                                                                ),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child:
                                                                SelectionArea(
                                                                    child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.getCheckinStatusText(
                                                                    functions.showMatNameInList(FFAppState().checkinLastMonthTimeIn.toList(), checkinStatusLMListIndex),
                                                                    functions.showMatNameInList(FFAppState().checkinLastMonthTimeOut.toList(), checkinStatusLMListIndex),
                                                                    functions.showMatNameInList(FFAppState().checkinLastMonthDate.toList(), checkinStatusLMListIndex),
                                                                    FFAppState().branchCode,
                                                                    (GetHolidayAPICall.holidayDate(
                                                                      (_model.getHoliday
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) as List)
                                                                        .map<String>((s) => s.toString())
                                                                        .toList()
                                                                        ?.map((e) => e.toString())
                                                                        .toList()
                                                                        ?.toList(),
                                                                    checkinStatusLMListIndex,
                                                                    false,
                                                                    (GetHolidayAPICall.holidayName(
                                                                      (_model.getHoliday
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) as List)
                                                                        .map<String>((s) => s.toString())
                                                                        .toList()
                                                                        ?.map((e) => e.toString())
                                                                        .toList()
                                                                        ?.toList()),
                                                                '[checkin_status]',
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
                                                                  ),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
