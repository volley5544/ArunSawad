import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'chat_search_page_model.dart';
export 'chat_search_page_model.dart';

class ChatSearchPageWidget extends StatefulWidget {
  const ChatSearchPageWidget({super.key});

  static String routeName = 'ChatSearchPage';
  static String routePath = 'chatSearchPage';

  @override
  State<ChatSearchPageWidget> createState() => _ChatSearchPageWidgetState();
}

class _ChatSearchPageWidgetState extends State<ChatSearchPageWidget> {
  late ChatSearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatSearchPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChatSearchPage'});
    _model.searchBoxTextController ??= TextEditingController();
    _model.searchBoxFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
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
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
              size: 30.0,
            ),
          ),
          title: Text(
            'ค้นหาคู่แชท',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<UserCustomRecord>>(
            stream: queryUserCustomRecord(
              queryBuilder: (userCustomRecord) => userCustomRecord.where(
                'employee_id',
                isEqualTo: FFAppState().employeeID,
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
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final columnUserCustomRecord =
                  columnUserCustomRecordList.isNotEmpty
                      ? columnUserCustomRecordList.first
                      : null;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.searchBoxTextController,
                                  focusNode: _model.searchBoxFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'ชื่อ,รหัสพนักงาน...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model
                                      .searchBoxTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.white,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 45.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: FaIcon(
                            FontAwesomeIcons.search,
                            color: Colors.white,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            var _shouldSetState = false;
                            HapticFeedback.mediumImpact();
                            if (!(_model.searchBoxTextController.text != null &&
                                _model.searchBoxTextController.text != '')) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      content: Text(
                                          'กรุณาใส่ชื่อหรือรหัสพนักงานเพื่อค้นหา'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height: double.infinity,
                                        child: LoadingSceneWidget(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            _model.getEmployee =
                                await GetAllEmployeeAPICall.call(
                              token: FFAppState().accessToken,
                              apiUrl: FFAppState().apiURLLocalState,
                              searchKeyname:
                                  _model.searchBoxTextController.text,
                            );

                            _shouldSetState = true;
                            if ((_model.getEmployee?.statusCode ?? 200) !=
                                200) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      content: Text(
                                          'พบข้อผิดพลาดConnection (${(_model.getEmployee?.statusCode ?? 200).toString()})'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }
                            if (GetAllEmployeeAPICall.statusLayer2(
                                  (_model.getEmployee?.jsonBody ?? ''),
                                ) !=
                                200) {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      content: Text(
                                          'พบข้อผิดพลาด (${GetAllEmployeeAPICall.statusLayer2(
                                        (_model.getEmployee?.jsonBody ?? ''),
                                      )?.toString()})'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }
                            Navigator.pop(context);
                            if (_shouldSetState) safeSetState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  if (((_model.getEmployee?.statusCode ?? 200) == 200) &&
                      (GetAllEmployeeAPICall.statusLayer2(
                            (_model.getEmployee?.jsonBody ?? ''),
                          ) ==
                          200))
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final employeeListItem =
                              GetAllEmployeeAPICall.employeeId(
                                    (_model.getEmployee?.jsonBody ?? ''),
                                  )?.toList() ??
                                  [];

                          return ListView.builder(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              12.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: employeeListItem.length,
                            itemBuilder: (context, employeeListItemIndex) {
                              final employeeListItemItem =
                                  employeeListItem[employeeListItemIndex];
                              return StreamBuilder<List<UserCustomRecord>>(
                                stream: queryUserCustomRecord(
                                  queryBuilder: (userCustomRecord) =>
                                      userCustomRecord.whereIn(
                                          'employee_id',
                                          GetAllEmployeeAPICall.employeeId(
                                            (_model.getEmployee?.jsonBody ??
                                                ''),
                                          )),
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
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UserCustomRecord>
                                      containerUserCustomRecordList =
                                      snapshot.data!;

                                  return Container(
                                    width: double.infinity,
                                    height: 80.0,
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: containerUserCustomRecordList
                                              .elementAtOrNull(
                                                  employeeListItemIndex)
                                              ?.hasEmployeeId() ??
                                          true,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 2.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var _shouldSetState = false;
                                            HapticFeedback.mediumImpact();
                                            if (!containerUserCustomRecordList
                                                .elementAtOrNull(
                                                    employeeListItemIndex)!
                                                .hasEmployeeId()) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'ไม่พบบุคคลนี้ในระบบอรุณสวัสดิ์ ไม่สามารถเริ่มแชทได้'),
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
                                                safeSetState(() {});
                                              return;
                                            }
                                            _model.queryChatsUserA =
                                                await queryChatsRecordOnce(
                                              queryBuilder: (chatsRecord) =>
                                                  chatsRecord
                                                      .where(
                                                        'user_a',
                                                        isEqualTo: FFAppState()
                                                            .userRef,
                                                      )
                                                      .where(
                                                        'user_b',
                                                        isEqualTo:
                                                            containerUserCustomRecordList
                                                                .elementAtOrNull(
                                                                    employeeListItemIndex)
                                                                ?.reference,
                                                      ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;
                                            _model.queryChatsUserB =
                                                await queryChatsRecordOnce(
                                              queryBuilder: (chatsRecord) =>
                                                  chatsRecord
                                                      .where(
                                                        'user_a',
                                                        isEqualTo:
                                                            columnUserCustomRecord
                                                                ?.reference,
                                                      )
                                                      .where(
                                                        'user_b',
                                                        isEqualTo: FFAppState()
                                                            .userRef,
                                                      ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;
                                            if (!(_model.queryChatsUserA !=
                                                null)) {
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          child:
                                                              LoadingSceneWidget(),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              var chatsRecordReference1 =
                                                  ChatsRecord.collection.doc();
                                              await chatsRecordReference1
                                                  .set(createChatsRecordData(
                                                userA: FFAppState().userRef,
                                                userB:
                                                    containerUserCustomRecordList
                                                        .elementAtOrNull(
                                                            employeeListItemIndex)
                                                        ?.reference,
                                                userAName: FFAppState()
                                                    .profileFullName,
                                                userANickname:
                                                    FFAppState().userNickname,
                                                userAProfileImage:
                                                    FFAppState().profileImage,
                                                userAEmployeeId:
                                                    FFAppState().employeeID,
                                                userBName: GetAllEmployeeAPICall
                                                    .fullname(
                                                  (_model.getEmployee
                                                          ?.jsonBody ??
                                                      ''),
                                                )?.elementAtOrNull(
                                                    employeeListItemIndex),
                                                userBNickname: 'ชื่อเล่น',
                                                userBEmployeeId:
                                                    GetAllEmployeeAPICall
                                                        .employeeId(
                                                  (_model.getEmployee
                                                          ?.jsonBody ??
                                                      ''),
                                                )?.elementAtOrNull(
                                                        employeeListItemIndex),
                                                userBProfileImage:
                                                    containerUserCustomRecordList
                                                        .elementAtOrNull(
                                                            employeeListItemIndex)
                                                        ?.imgProfile,
                                              ));
                                              _model.createChatsUserA =
                                                  ChatsRecord
                                                      .getDocumentFromData(
                                                          createChatsRecordData(
                                                            userA: FFAppState()
                                                                .userRef,
                                                            userB: containerUserCustomRecordList
                                                                .elementAtOrNull(
                                                                    employeeListItemIndex)
                                                                ?.reference,
                                                            userAName: FFAppState()
                                                                .profileFullName,
                                                            userANickname:
                                                                FFAppState()
                                                                    .userNickname,
                                                            userAProfileImage:
                                                                FFAppState()
                                                                    .profileImage,
                                                            userAEmployeeId:
                                                                FFAppState()
                                                                    .employeeID,
                                                            userBName:
                                                                GetAllEmployeeAPICall
                                                                    .fullname(
                                                              (_model.getEmployee
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )?.elementAtOrNull(
                                                                    employeeListItemIndex),
                                                            userBNickname:
                                                                'ชื่อเล่น',
                                                            userBEmployeeId:
                                                                GetAllEmployeeAPICall
                                                                    .employeeId(
                                                              (_model.getEmployee
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )?.elementAtOrNull(
                                                                    employeeListItemIndex),
                                                            userBProfileImage:
                                                                containerUserCustomRecordList
                                                                    .elementAtOrNull(
                                                                        employeeListItemIndex)
                                                                    ?.imgProfile,
                                                          ),
                                                          chatsRecordReference1);
                                              _shouldSetState = true;
                                              if (!(_model.queryChatsUserB !=
                                                  null)) {
                                                var chatsRecordReference2 =
                                                    ChatsRecord.collection
                                                        .doc();
                                                await chatsRecordReference2
                                                    .set(createChatsRecordData(
                                                  userA: columnUserCustomRecord
                                                      ?.reference,
                                                  userB: FFAppState().userRef,
                                                  userAName:
                                                      GetAllEmployeeAPICall
                                                          .fullname(
                                                    (_model.getEmployee
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.elementAtOrNull(
                                                          employeeListItemIndex),
                                                  userANickname: 'ชื่อเล่น',
                                                  userAProfileImage:
                                                      columnUserCustomRecord
                                                          ?.imgProfile,
                                                  userAEmployeeId:
                                                      GetAllEmployeeAPICall
                                                          .employeeId(
                                                    (_model.getEmployee
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.elementAtOrNull(
                                                          employeeListItemIndex),
                                                  userBName: FFAppState()
                                                      .profileFullName,
                                                  userBNickname:
                                                      FFAppState().userNickname,
                                                  userBEmployeeId:
                                                      FFAppState().employeeID,
                                                  userBProfileImage:
                                                      FFAppState().profileImage,
                                                ));
                                                _model.createChatsUserB =
                                                    ChatsRecord.getDocumentFromData(
                                                        createChatsRecordData(
                                                          userA:
                                                              columnUserCustomRecord
                                                                  ?.reference,
                                                          userB: FFAppState()
                                                              .userRef,
                                                          userAName:
                                                              GetAllEmployeeAPICall
                                                                  .fullname(
                                                            (_model.getEmployee
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.elementAtOrNull(
                                                                  employeeListItemIndex),
                                                          userANickname:
                                                              'ชื่อเล่น',
                                                          userAProfileImage:
                                                              columnUserCustomRecord
                                                                  ?.imgProfile,
                                                          userAEmployeeId:
                                                              GetAllEmployeeAPICall
                                                                  .employeeId(
                                                            (_model.getEmployee
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.elementAtOrNull(
                                                                  employeeListItemIndex),
                                                          userBName: FFAppState()
                                                              .profileFullName,
                                                          userBNickname:
                                                              FFAppState()
                                                                  .userNickname,
                                                          userBEmployeeId:
                                                              FFAppState()
                                                                  .employeeID,
                                                          userBProfileImage:
                                                              FFAppState()
                                                                  .profileImage,
                                                        ),
                                                        chatsRecordReference2);
                                                _shouldSetState = true;
                                              }
                                              Navigator.pop(context);
                                            }

                                            context.pushNamed(
                                              ChattingPageWidget.routeName,
                                              queryParameters: {
                                                'userBProfileImage':
                                                    serializeParam(
                                                  containerUserCustomRecordList
                                                      .elementAtOrNull(
                                                          employeeListItemIndex)
                                                      ?.imgProfile,
                                                  ParamType.String,
                                                ),
                                                'userBDocRef': serializeParam(
                                                  containerUserCustomRecordList
                                                      .elementAtOrNull(
                                                          employeeListItemIndex)
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'userBName': serializeParam(
                                                  GetAllEmployeeAPICall
                                                      .fullname(
                                                    (_model.getEmployee
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.elementAtOrNull(
                                                      employeeListItemIndex),
                                                  ParamType.String,
                                                ),
                                                'userBNickname': serializeParam(
                                                  'ชื่อเล่น',
                                                  ParamType.String,
                                                ),
                                                'userBEmployeeId':
                                                    serializeParam(
                                                  GetAllEmployeeAPICall
                                                      .employeeId(
                                                    (_model.getEmployee
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.elementAtOrNull(
                                                      employeeListItemIndex),
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .rightToLeft,
                                                ),
                                              },
                                            );

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 80.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 0.0,
                                                  color: Color(0xFFDBE2E7),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width: 70.0,
                                                            height: 70.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                CachedNetworkImage(
                                                              fadeInDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              fadeOutDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              imageUrl: containerUserCustomRecordList
                                                                  .elementAtOrNull(
                                                                      employeeListItemIndex)!
                                                                  .imgProfile,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              '${GetAllEmployeeAPICall.fullname(
                                                                                (_model.getEmployee?.jsonBody ?? ''),
                                                                              )?.elementAtOrNull(employeeListItemIndex)} (${GetAllEmployeeAPICall.branchCode(
                                                                                (_model.getEmployee?.jsonBody ?? ''),
                                                                              )?.elementAtOrNull(employeeListItemIndex)})',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              'รหัสพนักงาน : ${GetAllEmployeeAPICall.employeeId(
                                                                                (_model.getEmployee?.jsonBody ?? ''),
                                                                              )?.elementAtOrNull(employeeListItemIndex)}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            (GetAllEmployeeAPICall.workPosition(
                                                                              (_model.getEmployee?.jsonBody ?? ''),
                                                                            )!
                                                                                    .elementAtOrNull(employeeListItemIndex))!
                                                                                .maybeHandleOverflow(
                                                                              maxChars: 50,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .arrow_forward_ios_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
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
