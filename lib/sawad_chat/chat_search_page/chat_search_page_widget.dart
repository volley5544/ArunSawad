import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
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

    return StreamBuilder<List<UserCustomRecord>>(
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
        List<UserCustomRecord> chatSearchPageUserCustomRecordList =
            snapshot.data!;
        final chatSearchPageUserCustomRecord =
            chatSearchPageUserCustomRecordList.isNotEmpty
                ? chatSearchPageUserCustomRecordList.first
                : null;

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
              actions: [
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.group_add,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      GroupChatAddPageWidget.routeName,
                      queryParameters: {
                        'userProfileData': serializeParam(
                          EmployeeSearchDataModelStruct(
                            fullName: FFAppState().profileFullName,
                            employeeCode: FFAppState().employeeID,
                            position: FFAppState().profilePositionName,
                            branchCode: FFAppState().profileBranch,
                            userDocRef: FFAppState().userRef,
                            userDisplayImage:
                                chatSearchPageUserCustomRecord?.imgProfile,
                            userDisplayImageBlurHash:
                                chatSearchPageUserCustomRecord!
                                        .hasImgProfileBlurHash()
                                    ? chatSearchPageUserCustomRecord
                                        ?.imgProfileBlurHash
                                    : 'LKOp[Mof~qof?bfQRjfQ%MfQIUfQ',
                          ),
                          ParamType.DataStruct,
                        ),
                      }.withoutNulls,
                    );
                  },
                ),
              ],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
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
                                      child: Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 2.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              var _shouldSetState = false;
                                              HapticFeedback.mediumImpact();
                                              showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            LoadingSceneWidget(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              _model.loopCountTemp = 0;
                                              safeSetState(() {});
                                              if (!containerUserCustomRecordList
                                                  .elementAtOrNull(
                                                      employeeListItemIndex)!
                                                  .hasEmployeeId()) {
                                                Navigator.pop(context);
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
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
                                              _model.queryMyChatRoom =
                                                  await querySawadChatRoomRecordOnce(
                                                queryBuilder:
                                                    (sawadChatRoomRecord) =>
                                                        sawadChatRoomRecord
                                                            .where(
                                                              'users_ref',
                                                              arrayContains:
                                                                  FFAppState()
                                                                      .userRef,
                                                            )
                                                            .where(
                                                              'chat_room_type',
                                                              isEqualTo:
                                                                  'single',
                                                            ),
                                              );
                                              _shouldSetState = true;
                                              if (functions
                                                  .checkContainsChatRoom(
                                                      _model.queryMyChatRoom
                                                          ?.toList(),
                                                      ((String myEmployeeId,
                                                                  String
                                                                      targetEmployeeId) {
                                                        return [
                                                          myEmployeeId,
                                                          targetEmployeeId
                                                        ];
                                                      }(
                                                              FFAppState()
                                                                  .employeeID,
                                                              (GetAllEmployeeAPICall
                                                                      .employeeId(
                                                                (_model.getEmployee
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!
                                                                  .elementAtOrNull(
                                                                      employeeListItemIndex))!))
                                                          .toList(),
                                                      functions
                                                          .reverseList(((String
                                                                          myEmployeeId,
                                                                      String
                                                                          targetEmployeeId) {
                                                            return [
                                                              myEmployeeId,
                                                              targetEmployeeId
                                                            ];
                                                          }(
                                                                  FFAppState()
                                                                      .employeeID,
                                                                  (GetAllEmployeeAPICall
                                                                          .employeeId(
                                                                    (_model.getEmployee
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                      .elementAtOrNull(
                                                                          employeeListItemIndex))!))
                                                              .toList())
                                                          .toList())!) {
                                                Navigator.pop(context);

                                                context.pushNamed(
                                                  ChattingPageWidget.routeName,
                                                  queryParameters: {
                                                    'chatRoomDocRef':
                                                        serializeParam(
                                                      chatSearchPageUserCustomRecord
                                                          ?.sawadChatRoomRef
                                                          ?.elementAtOrNull(
                                                              employeeListItemIndex),
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'myDisplayImageUrl':
                                                        serializeParam(
                                                      chatSearchPageUserCustomRecord
                                                          ?.imgProfile,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'คุณต้องการจะสร้างห้องสนทนากับ คุณ${GetAllEmployeeAPICall.fullname(
                                                                (_model.getEmployee
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )?.elementAtOrNull(employeeListItemIndex)} หรือไม่?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Confirm'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (!confirmDialogResponse) {
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }

                                              var sawadChatRoomRecordReference =
                                                  SawadChatRoomRecord.collection
                                                      .doc();
                                              await sawadChatRoomRecordReference
                                                  .set({
                                                ...createSawadChatRoomRecordData(
                                                  lastMessageText:
                                                      'เริ่มแชทเลย!',
                                                  lastMessageTime:
                                                      getCurrentTimestamp,
                                                  lastMessageBy:
                                                      FFAppState().userRef,
                                                  lastMessageByEmployeeId:
                                                      FFAppState().employeeID,
                                                  lastMessageType: 'text',
                                                  chatRoomType: 'single',
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'users_ref': functions
                                                        .generateUserRefChatRoom(
                                                            FFAppState()
                                                                .userRef,
                                                            containerUserCustomRecordList
                                                                .elementAtOrNull(
                                                                    employeeListItemIndex)
                                                                ?.reference),
                                                    'users_emplayee_id': (String
                                                                myVar,
                                                            String targetVar) {
                                                      return [myVar, targetVar];
                                                    }(
                                                        FFAppState().employeeID,
                                                        (GetAllEmployeeAPICall
                                                                .employeeId(
                                                          (_model.getEmployee
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                            .elementAtOrNull(
                                                                employeeListItemIndex))!),
                                                    'users_name': (String myVar,
                                                            String targetVar) {
                                                      return [myVar, targetVar];
                                                    }(
                                                        FFAppState()
                                                            .profileFullName,
                                                        (GetAllEmployeeAPICall
                                                                .fullname(
                                                          (_model.getEmployee
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                            .elementAtOrNull(
                                                                employeeListItemIndex))!),
                                                    'users_display_image': functions.listStringToImgPathList(((String
                                                                    myVar,
                                                                String targetVar) {
                                                      return [myVar, targetVar];
                                                    }(
                                                            functions.imgPathtoString(
                                                                chatSearchPageUserCustomRecord
                                                                    ?.imgProfile),
                                                            functions.imgPathtoString(
                                                                containerUserCustomRecordList
                                                                    .elementAtOrNull(
                                                                        employeeListItemIndex)
                                                                    ?.imgProfile)))
                                                        .toList()),
                                                  },
                                                ),
                                              });
                                              _model.createNewChatRoom =
                                                  SawadChatRoomRecord
                                                      .getDocumentFromData({
                                                ...createSawadChatRoomRecordData(
                                                  lastMessageText:
                                                      'เริ่มแชทเลย!',
                                                  lastMessageTime:
                                                      getCurrentTimestamp,
                                                  lastMessageBy:
                                                      FFAppState().userRef,
                                                  lastMessageByEmployeeId:
                                                      FFAppState().employeeID,
                                                  lastMessageType: 'text',
                                                  chatRoomType: 'single',
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'users_ref': functions
                                                        .generateUserRefChatRoom(
                                                            FFAppState()
                                                                .userRef,
                                                            containerUserCustomRecordList
                                                                .elementAtOrNull(
                                                                    employeeListItemIndex)
                                                                ?.reference),
                                                    'users_emplayee_id': (String
                                                                myVar,
                                                            String targetVar) {
                                                      return [myVar, targetVar];
                                                    }(
                                                        FFAppState().employeeID,
                                                        (GetAllEmployeeAPICall
                                                                .employeeId(
                                                          (_model.getEmployee
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                            .elementAtOrNull(
                                                                employeeListItemIndex))!),
                                                    'users_name': (String myVar,
                                                            String targetVar) {
                                                      return [myVar, targetVar];
                                                    }(
                                                        FFAppState()
                                                            .profileFullName,
                                                        (GetAllEmployeeAPICall
                                                                .fullname(
                                                          (_model.getEmployee
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )!
                                                            .elementAtOrNull(
                                                                employeeListItemIndex))!),
                                                    'users_display_image': functions.listStringToImgPathList(((String
                                                                    myVar,
                                                                String targetVar) {
                                                      return [myVar, targetVar];
                                                    }(
                                                            functions.imgPathtoString(
                                                                chatSearchPageUserCustomRecord
                                                                    ?.imgProfile),
                                                            functions.imgPathtoString(
                                                                containerUserCustomRecordList
                                                                    .elementAtOrNull(
                                                                        employeeListItemIndex)
                                                                    ?.imgProfile)))
                                                        .toList()),
                                                  },
                                                ),
                                              }, sawadChatRoomRecordReference);
                                              _shouldSetState = true;
                                              Navigator.pop(context);

                                              context.goNamed(
                                                ChattingPageWidget.routeName,
                                                queryParameters: {
                                                  'chatRoomDocRef':
                                                      serializeParam(
                                                    _model.createNewChatRoom
                                                        ?.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'myDisplayImageUrl':
                                                      serializeParam(
                                                    chatSearchPageUserCustomRecord
                                                        ?.imgProfile,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
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
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 70.0,
                                                            height: 70.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
                                                              child: OctoImage(
                                                                placeholderBuilder:
                                                                    (_) => SizedBox
                                                                        .expand(
                                                                  child: Image(
                                                                    image: BlurHashImage(containerUserCustomRecordList
                                                                            .elementAtOrNull(
                                                                                employeeListItemIndex)!
                                                                            .hasImgProfileBlurHash()
                                                                        ? containerUserCustomRecordList
                                                                            .elementAtOrNull(employeeListItemIndex)!
                                                                            .imgProfileBlurHash
                                                                        : 'LKOp[Mof~qof?bfQRjfQ%MfQIUfQ'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                image:
                                                                    NetworkImage(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    containerUserCustomRecordList
                                                                        .elementAtOrNull(
                                                                            employeeListItemIndex)
                                                                        ?.imgProfile,
                                                                    'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=a4b9142c-c774-492a-a5a4-caa39f16ec3c',
                                                                  ),
                                                                ),
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                fit: BoxFit
                                                                    .cover,
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
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
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
                                                                        color: FlutterFlowTheme.of(context)
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
              ),
            ),
          ),
        );
      },
    );
  }
}
