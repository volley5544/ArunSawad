import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/loading_scene_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LeadNotiPageWidget extends StatefulWidget {
  const LeadNotiPageWidget({
    Key? key,
    this.color,
  }) : super(key: key);

  final List<Color>? color;

  @override
  _LeadNotiPageWidgetState createState() => _LeadNotiPageWidgetState();
}

class _LeadNotiPageWidgetState extends State<LeadNotiPageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 90),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 70),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  ApiCallResponse? getLeadDetail;
  bool? checkLatLngLeadDetail;
  UserLogRecord? createdLeadDetailLog;
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: double.infinity,
              child: LoadingSceneWidget(),
            ),
          );
        },
      ).then((value) => setState(() {}));

      checkLatLngLeadDetail = await actions.a8(
        currentUserLocationValue,
      );
      if (!checkLatLngLeadDetail!) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('ระบบ'),
              content: Text('กรุณาเปิดGPS ก่อนทำรายการ'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        context.pop();
        return;
      }
      getLeadDetail = await GetLeadDetailAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
      );
      if (!(getLeadDetail?.succeeded ?? true)) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('ระบบ'),
              content: Text('ข้อมูลไม่ถูกต้องหรือเชื่อมต่อฐานข้อมูลไม่ได้'),
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
      if ((getLeadDetail?.statusCode ?? 200) !=
          GetLeadDetailAPICall.dataStatus(
            (getLeadDetail?.jsonBody ?? ''),
          )) {
        if (GetLeadDetailAPICall.dataMessage(
              (getLeadDetail?.jsonBody ?? ''),
            ).toString() !=
            'Data Not Found') {
          Navigator.pop(context);
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                title: Text('ระบบ'),
                content: Text(GetLeadDetailAPICall.connectionMessage(
                  (getLeadDetail?.jsonBody ?? ''),
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
          return;
        }
        Navigator.pop(context);
        return;
      }
      setState(() => FFAppState().leadID = (GetLeadDetailAPICall.dataLeadID(
            (getLeadDetail?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .toList());
      setState(() => FFAppState().leadCustomerNameList =
              (GetLeadDetailAPICall.dataFirstName(
            (getLeadDetail?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()
                  .toList());
      setState(() => FFAppState().leadCreatedTimeList =
              (GetLeadDetailAPICall.dataCreatedAt(
            (getLeadDetail?.jsonBody ?? ''),
          ) as List)
                  .map<String>((s) => s.toString())
                  .toList()
                  .toList());
      setState(() =>
          FFAppState().leadCallStatus = (GetLeadDetailAPICall.dataCallStatus(
            (getLeadDetail?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .toList());
      setState(() =>
          FFAppState().leadPhoneNumberList = (GetLeadDetailAPICall.dataPhoneNum(
            (getLeadDetail?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .toList());
      setState(() =>
          FFAppState().leadEmployeeID = (GetLeadDetailAPICall.dataEmployeeID(
            (getLeadDetail?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .toList());
      setState(() =>
          FFAppState().leadChannelList = (GetLeadDetailAPICall.dataLeadChannel(
            (getLeadDetail?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .toList());
      setState(() => FFAppState().leadIdCalledInApp = functions
          .checkLeadIDInAppAndLeadID(
              FFAppState().leadIdCalledInApp.toList(),
              FFAppState().leadID.toList(),
              FFAppState().leadCallStatus.toList())
          .toList());
      setState(() =>
          FFAppState().leadBranchCode = (GetLeadDetailAPICall.dataBranchCode(
            (getLeadDetail?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .toList());
      setState(
          () => FFAppState().leadUserLevel = GetLeadDetailAPICall.dataLevel(
                (getLeadDetail?.jsonBody ?? ''),
              ).toString());
      setState(() => FFAppState().leadChannelAmountList = functions
          .setLeadChannelAmount(FFAppState().leadChannelList.toList())
          .toList());

      final userLogCreateData = createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'Lead_Detail',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      );
      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(userLogCreateData);
      createdLeadDetailLog = UserLogRecord.getDocumentFromData(
          userLogCreateData, userLogRecordReference);
      Navigator.pop(context);
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LeadChannelColorRecord>>(
      future: queryLeadChannelColorRecordOnce(
        singleRecord: true,
      ),
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
        List<LeadChannelColorRecord> leadNotiPageLeadChannelColorRecordList =
            snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final leadNotiPageLeadChannelColorRecord =
            leadNotiPageLeadChannelColorRecordList.isNotEmpty
                ? leadNotiPageLeadChannelColorRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0xFFFF6500),
            automaticallyImplyLeading: false,
            leading: Visibility(
              visible: !FFAppState().isFromTimesheetPage,
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: InkWell(
                  onTap: () async {
                    context.goNamed('SuperAppPage');
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Color(0xFBFFFFFF),
                    size: 30,
                  ),
                ),
              ),
            ),
            title: Text(
              'รายชื่อลีด',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [
              Visibility(
                visible: !FFAppState().isFromTimesheetPage,
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                    child: InkWell(
                      onTap: () async {
                        HapticFeedback.mediumImpact();
                        setState(() => FFAppState().leadID = functions
                            .reverseList(FFAppState().leadID.toList())
                            .toList());
                        setState(() => FFAppState().leadCustomerNameList =
                            functions
                                .reverseList(
                                    FFAppState().leadCustomerNameList.toList())
                                .toList());
                        setState(() => FFAppState().leadChannelList = functions
                            .reverseList(FFAppState().leadChannelList.toList())
                            .toList());
                        setState(() => FFAppState().leadCreatedTimeList =
                            functions
                                .reverseList(
                                    FFAppState().leadCreatedTimeList.toList())
                                .toList());
                        setState(() => FFAppState().leadCallStatus = functions
                            .reverseList(FFAppState().leadCallStatus.toList())
                            .toList());
                        setState(() => FFAppState().leadPhoneNumberList =
                            functions
                                .reverseList(
                                    FFAppState().leadPhoneNumberList.toList())
                                .toList());
                        setState(() => FFAppState().leadEmployeeID = functions
                            .reverseList(FFAppState().leadEmployeeID.toList())
                            .toList());
                        setState(() => FFAppState().leadBranchCode = functions
                            .reverseList(FFAppState().leadBranchCode.toList())
                            .toList());
                      },
                      child: FaIcon(
                        FontAwesomeIcons.sortAmountDown,
                        color: Color(0xFBFFFFFF),
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: true,
            elevation: 10,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            child: custom_widgets.ShowDateTime(
                              width: double.infinity,
                              height: 40,
                              currentTime: getCurrentTimestamp,
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: 0,
                          runSpacing: 0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 4, 4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: GridView(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 5,
                                            mainAxisSpacing: 5,
                                            childAspectRatio: 1,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                HapticFeedback.mediumImpact();
                                                setState(() => FFAppState()
                                                        .leadChannelSelected =
                                                    'Lead Survey');
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: functions
                                                      .leadChannelAmountCardColor(
                                                          'Lead Survey',
                                                          leadNotiPageLeadChannelColorRecord!
                                                              .color!
                                                              .toList()),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft:
                                                        Radius.circular(24),
                                                    topRight:
                                                        Radius.circular(0),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 10),
                                                      child: Text(
                                                        'Survey',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 14,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        functions
                                                            .showMatAmountInList(
                                                                FFAppState()
                                                                    .leadChannelAmountList
                                                                    .toList(),
                                                                0)
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                HapticFeedback.mediumImpact();
                                                setState(() => FFAppState()
                                                        .leadChannelSelected =
                                                    'Lead Telesale');
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: functions
                                                      .leadChannelAmountCardColor(
                                                          'Lead Telesale',
                                                          leadNotiPageLeadChannelColorRecord!
                                                              .color!
                                                              .toList()),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(24),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 10),
                                                      child: Text(
                                                        'Telesale',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 14,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        functions
                                                            .showMatAmountInList(
                                                                FFAppState()
                                                                    .leadChannelAmountList
                                                                    .toList(),
                                                                1)
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                HapticFeedback.mediumImpact();
                                                setState(() => FFAppState()
                                                        .leadChannelSelected =
                                                    'Lead Agent');
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: functions
                                                      .leadChannelAmountCardColor(
                                                          'Lead Agent',
                                                          leadNotiPageLeadChannelColorRecord!
                                                              .color!
                                                              .toList()),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(24),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(0),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 10),
                                                      child: Text(
                                                        'Agent',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 14,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        functions
                                                            .showMatAmountInList(
                                                                FFAppState()
                                                                    .leadChannelAmountList
                                                                    .toList(),
                                                                2)
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                HapticFeedback.mediumImpact();
                                                setState(() => FFAppState()
                                                        .leadChannelSelected =
                                                    'Lead GSB');
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: functions
                                                      .leadChannelAmountCardColor(
                                                          'Lead GSB',
                                                          leadNotiPageLeadChannelColorRecord!
                                                              .color!
                                                              .toList()),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    bottomRight:
                                                        Radius.circular(24),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                        Radius.circular(0),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 10),
                                                      child: Text(
                                                        'GSB',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 14,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        functions
                                                            .showMatAmountInList(
                                                                FFAppState()
                                                                    .leadChannelAmountList
                                                                    .toList(),
                                                                3)
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
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
                            InkWell(
                              onTap: () async {
                                HapticFeedback.mediumImpact();
                                setState(() =>
                                    FFAppState().leadChannelSelected = 'All');
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 12, 12, 12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.supervisor_account_rounded,
                                        color: Color(0xFF101213),
                                        size: 44,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 4),
                                        child: Text(
                                          FFAppState().leadID.length.toString(),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: Color(0xFF101213),
                                                fontSize: 32,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        'จำนวนลีด',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF57636C),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation1']!),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.59,
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        final leadList = FFAppState().leadID.toList();
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(leadList.length, (leadListIndex) {
                              final leadListItem = leadList[leadListIndex];
                              return Visibility(
                                visible: (FFAppState().leadChannelSelected ==
                                        functions.showMatNameInList(
                                            FFAppState()
                                                .leadChannelList
                                                .toList(),
                                            leadListIndex)) ||
                                    (FFAppState().leadChannelSelected == 'All'),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 8, 12, 12),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: functions.leadDetailCardColor(
                                          FFAppState().leadCallStatus.toList(),
                                          leadListIndex,
                                          Colors.white,
                                          Color(0xFFE9FFEA),
                                          Color(0xFFFFFFE9),
                                          FFAppState()
                                              .leadIdCalledInApp
                                              .toList(),
                                          functions.showMatNameInList(
                                              FFAppState().leadID.toList(),
                                              leadListIndex)),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x2B202529),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 110,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              functions.leadChannelLabelColor(
                                                  FFAppState()
                                                      .leadChannelList
                                                      .toList(),
                                                  leadNotiPageLeadChannelColorRecord!
                                                      .color!
                                                      .toList(),
                                                  leadListIndex),
                                              FlutterFlowTheme.of(context)
                                                  .textColor,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(12),
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(0),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 4, 0, 4),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        10,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    functions.showMatNameInList(
                                                                        FFAppState()
                                                                            .leadChannelList
                                                                            .toList(),
                                                                        leadListIndex)!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            27,
                                                                        height:
                                                                            27,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFF1F4F8),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .timer_outlined,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          functions.showLeadTimeRemain(functions.leadTimeRemain(
                                                                              FFAppState().leadCreatedTimeList.toList(),
                                                                              getCurrentTimestamp,
                                                                              leadListIndex)),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: valueOrDefault<Color>(
                                                                                  functions.leadTimeRemainTextColor(functions.leadTimeRemain(FFAppState().leadCreatedTimeList.toList(), getCurrentTimestamp, leadListIndex), Colors.black, Color(0xFFFF0000)),
                                                                                  Colors.black,
                                                                                ),
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 35,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          5,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                functions.showMatNameInList(
                                                                    FFAppState()
                                                                        .leadCustomerNameList
                                                                        .toList(),
                                                                    leadListIndex)!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              functions.showLeadIdInList(
                                                                  FFAppState()
                                                                      .leadID
                                                                      .toList(),
                                                                  leadListIndex,
                                                                  FFAppState()
                                                                      .leadBranchCode
                                                                      .toList()),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  if ((FFAppState()
                                                              .leadUserLevel ==
                                                          'HO') ||
                                                      (FFAppState()
                                                              .leadUserLevel ==
                                                          'สาขา'))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 12, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          HapticFeedback
                                                              .mediumImpact();
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'ระบบ'),
                                                                        content:
                                                                            Text('คุณต้องการจะโทรออกหรือไม่?'),
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
                                                                                Text('โทร'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (!confirmDialogResponse) {
                                                            return;
                                                          }
                                                          if (functions.showMatNameInList(
                                                                  FFAppState()
                                                                      .leadCallStatus
                                                                      .toList(),
                                                                  leadListIndex) ==
                                                              'NEW') {
                                                            if (!functions.checkLeadIdCalledInApp(
                                                                FFAppState()
                                                                    .leadIdCalledInApp
                                                                    .toList(),
                                                                functions.showMatNameInList(
                                                                    FFAppState()
                                                                        .leadID
                                                                        .toList(),
                                                                    leadListIndex))) {
                                                              setState(() => FFAppState().addToLeadIdCalledInApp(
                                                                  functions.showMatNameInList(
                                                                      FFAppState()
                                                                          .leadID
                                                                          .toList(),
                                                                      leadListIndex)!));
                                                            }
                                                          }
                                                          await actions.a12(
                                                            functions.showMatNameInList(
                                                                FFAppState()
                                                                    .leadPhoneNumberList
                                                                    .toList(),
                                                                leadListIndex),
                                                          );
                                                        },
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0),
                                                            topRight:
                                                                Radius.circular(
                                                                    12),
                                                          ),
                                                          child: Image.asset(
                                                            'assets/images/favpng_logo-telephone-call-icon.png',
                                                            width: 80,
                                                            height: 80,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if ((FFAppState()
                                                              .leadUserLevel !=
                                                          'HO') &&
                                                      (FFAppState()
                                                              .leadUserLevel !=
                                                          'สาขา'))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 12, 0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12),
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/favpng_logo-telephone-call-icon-black.png',
                                                          width: 80,
                                                          height: 80,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 16, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 0, 0, 0),
                                                      child: Text(
                                                        functions.leadCalledStatusText(
                                                            functions.leadDetailCardColorForStatus(
                                                                FFAppState()
                                                                    .leadCallStatus
                                                                    .toList(),
                                                                leadListIndex,
                                                                FFAppState()
                                                                    .leadIdCalledInApp
                                                                    .toList(),
                                                                functions.showMatNameInList(
                                                                    FFAppState()
                                                                        .leadID
                                                                        .toList(),
                                                                    leadListIndex))),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFFFF0000),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                            'Hm',
                                                            functions.showLeadCreatedTime(
                                                                FFAppState()
                                                                    .leadCreatedTimeList
                                                                    .toList(),
                                                                leadListIndex),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF101213),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                            'd/M/y',
                                                            functions.showLeadCreatedTime(
                                                                FFAppState()
                                                                    .leadCreatedTimeList
                                                                    .toList(),
                                                                leadListIndex),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF101213),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation2']!),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
