import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'notification_detail_page_model.dart';
export 'notification_detail_page_model.dart';

class NotificationDetailPageWidget extends StatefulWidget {
  const NotificationDetailPageWidget({super.key});

  @override
  State<NotificationDetailPageWidget> createState() =>
      _NotificationDetailPageWidgetState();
}

class _NotificationDetailPageWidgetState
    extends State<NotificationDetailPageWidget> {
  late NotificationDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationDetailPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NotificationDetailPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getFirebaseUID = await actions.a21();
    });

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

    return FutureBuilder<List<UserCustomRecord>>(
      future: queryUserCustomRecordOnce(
        queryBuilder: (userCustomRecord) => userCustomRecord.where(
          'employee_id',
          isEqualTo:
              FFAppState().employeeID != '' ? FFAppState().employeeID : null,
        ),
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
        List<UserCustomRecord> notificationDetailPageUserCustomRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final notificationDetailPageUserCustomRecord =
            notificationDetailPageUserCustomRecordList.isNotEmpty
                ? notificationDetailPageUserCustomRecordList.first
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
                leading: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed('SuperAppPage');
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                title: Text(
                  'การแจ้งเตือน',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 22.0,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        child: custom_widgets.ShowDateTime(
                          width: double.infinity,
                          height: 40.0,
                          currentTime: getCurrentTimestamp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: FutureBuilder<List<NotificationRecord>>(
                          future: (_model.firestoreRequestCompleter ??=
                                  Completer<List<NotificationRecord>>()
                                    ..complete(queryNotificationRecordOnce(
                                      parent:
                                          notificationDetailPageUserCustomRecord
                                              ?.reference,
                                      queryBuilder: (notificationRecord) =>
                                          notificationRecord.orderBy(
                                              'noti_time',
                                              descending: true),
                                    )))
                              .future,
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
                            List<NotificationRecord>
                                listViewNotificationRecordList = snapshot.data!;
                            return RefreshIndicator(
                              color: FlutterFlowTheme.of(context).tertiary,
                              onRefresh: () async {
                                setState(() =>
                                    _model.firestoreRequestCompleter = null);
                                await _model.waitForFirestoreRequestCompleted();
                              },
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    listViewNotificationRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewNotificationRecord =
                                      listViewNotificationRecordList[
                                          listViewIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var _shouldSetState = false;
                                      HapticFeedback.mediumImpact();

                                      await listViewNotificationRecord.reference
                                          .update(createNotificationRecordData(
                                        thisNotiIsRead: true,
                                      ));
                                      if (listViewNotificationRecord.notiType ==
                                          'Leave_Request') {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: LoadingSceneWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        _model.bossCheckOutputNotipage =
                                            await GetBossAPICall.call(
                                          apiUrl: FFAppState().apiURLLocalState,
                                          token: FFAppState().accessToken,
                                        );
                                        _shouldSetState = true;
                                        setState(() {
                                          FFAppState().bossCheckFlag =
                                              GetBossAPICall.bossCheck(
                                            (_model.bossCheckOutputNotipage
                                                    ?.jsonBody ??
                                                ''),
                                          )!;
                                        });
                                        Navigator.pop(context);

                                        context.goNamed('DashboardLeavePage');

                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        if (listViewNotificationRecord
                                                .notiType ==
                                            'Lead') {
                                          context.goNamed('LeadNotiPage');

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          if (listViewNotificationRecord
                                                  .notiType ==
                                              'insurance') {
                                            context.goNamed('MyProfilePage');
                                          }
                                        }
                                      }

                                      if (_shouldSetState) setState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 92.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          functions.getNotificationCardColor(
                                              Color(0xFFFFECEC),
                                              listViewNotificationRecord
                                                  .thisNotiIsRead),
                                          Color(0xFFFFECEC),
                                        ),
                                        border: Border.all(
                                          color: Color(0x33000000),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      listViewNotificationRecord
                                                          .notiTitle,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color(
                                                                    0xFFFF6500),
                                                                fontSize: 20.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    listViewNotificationRecord
                                                        .notiBody,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'Hm',
                                                        listViewNotificationRecord
                                                            .notiTime!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .grayIcon,
                                                                fontSize: 14.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'd/M/y',
                                                        listViewNotificationRecord
                                                            .notiTime!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .grayIcon,
                                                                fontSize: 14.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                        ),
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
