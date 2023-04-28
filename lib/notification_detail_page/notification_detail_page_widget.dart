import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'notification_detail_page_model.dart';
export 'notification_detail_page_model.dart';

class NotificationDetailPageWidget extends StatefulWidget {
  const NotificationDetailPageWidget({Key? key}) : super(key: key);

  @override
  _NotificationDetailPageWidgetState createState() =>
      _NotificationDetailPageWidgetState();
}

class _NotificationDetailPageWidgetState
    extends State<NotificationDetailPageWidget> {
  late NotificationDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

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

    return FutureBuilder<List<UserCustomRecord>>(
      future: queryUserCustomRecordOnce(
        queryBuilder: (userCustomRecord) => userCustomRecord.where(
            'employee_id',
            isEqualTo:
                FFAppState().employeeID != '' ? FFAppState().employeeID : null),
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
                        child: PagedListView<DocumentSnapshot<Object?>?,
                            NotificationRecord>(
                          pagingController: () {
                            final Query<Object?> Function(Query<Object?>)
                                queryBuilder = (notificationRecord) =>
                                    notificationRecord.orderBy('noti_time',
                                        descending: true);
                            if (_model.pagingController != null) {
                              final query =
                                  queryBuilder(NotificationRecord.collection());
                              if (query != _model.pagingQuery) {
                                // The query has changed
                                _model.pagingQuery = query;
                                _model.streamSubscriptions
                                    .forEach((s) => s?.cancel());
                                _model.streamSubscriptions.clear();
                                _model.pagingController!.refresh();
                              }
                              return _model.pagingController!;
                            }

                            _model.pagingController =
                                PagingController(firstPageKey: null);
                            _model.pagingQuery =
                                queryBuilder(NotificationRecord.collection());
                            _model.pagingController!
                                .addPageRequestListener((nextPageMarker) {
                              queryNotificationRecordPage(
                                parent: notificationDetailPageUserCustomRecord!
                                    .reference,
                                queryBuilder: (notificationRecord) =>
                                    notificationRecord.orderBy('noti_time',
                                        descending: true),
                                nextPageMarker: nextPageMarker,
                                pageSize: 25,
                                isStream: true,
                              ).then((page) {
                                _model.pagingController!.appendPage(
                                  page.data,
                                  page.nextPageMarker,
                                );
                                final streamSubscription =
                                    page.dataStream?.listen((data) {
                                  data.forEach((item) {
                                    final itemIndexes = _model
                                        .pagingController!.itemList!
                                        .asMap()
                                        .map((k, v) =>
                                            MapEntry(v.reference.id, k));
                                    final index =
                                        itemIndexes[item.reference.id];
                                    final items =
                                        _model.pagingController!.itemList!;
                                    if (index != null) {
                                      items.replaceRange(
                                          index, index + 1, [item]);
                                      _model.pagingController!.itemList = {
                                        for (var item in items)
                                          item.reference: item
                                      }.values.toList();
                                    }
                                  });
                                  setState(() {});
                                });
                                _model.streamSubscriptions
                                    .add(streamSubscription);
                              });
                            });
                            return _model.pagingController!;
                          }(),
                          padding: EdgeInsets.zero,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<NotificationRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),

                            itemBuilder: (context, _, listViewIndex) {
                              final listViewNotificationRecord = _model
                                  .pagingController!.itemList![listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  HapticFeedback.mediumImpact();

                                  final notificationUpdateData =
                                      createNotificationRecordData(
                                    thisNotiIsRead: true,
                                  );
                                  await listViewNotificationRecord.reference
                                      .update(notificationUpdateData);
                                  if (listViewNotificationRecord.notiType ==
                                      'Leave_Request') {
                                    context.goNamed('DashboardLeavePage');

                                    return;
                                  } else {
                                    if (listViewNotificationRecord.notiType ==
                                        'Lead') {
                                      context.goNamed('LeadNotiPage');
                                    }
                                  }
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
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
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  listViewNotificationRecord
                                                      .notiTitle!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFFF6500),
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
                                                    .notiBody!,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 20.0, 0.0),
                                                child: Text(
                                                  dateTimeFormat(
                                                    'Hm',
                                                    listViewNotificationRecord
                                                        .notiTime!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                        fontSize: 14.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 20.0, 0.0),
                                                child: Text(
                                                  dateTimeFormat(
                                                    'd/M/y',
                                                    listViewNotificationRecord
                                                        .notiTime!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
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
