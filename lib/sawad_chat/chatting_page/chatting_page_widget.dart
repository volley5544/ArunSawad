import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_chat_component/empty_chat_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chatting_page_model.dart';
export 'chatting_page_model.dart';

class ChattingPageWidget extends StatefulWidget {
  const ChattingPageWidget({
    super.key,
    String? userBProfileImage,
    required this.userBDocRef,
    String? userBName,
    String? userBNickname,
    String? userBEmployeeId,
  })  : this.userBProfileImage = userBProfileImage ??
            'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
        this.userBName = userBName ?? '[name]',
        this.userBNickname = userBNickname ?? '[nickname]',
        this.userBEmployeeId = userBEmployeeId ?? '[employee_id]';

  final String userBProfileImage;
  final DocumentReference? userBDocRef;
  final String userBName;
  final String userBNickname;
  final String userBEmployeeId;

  @override
  State<ChattingPageWidget> createState() => _ChattingPageWidgetState();
}

class _ChattingPageWidgetState extends State<ChattingPageWidget>
    with TickerProviderStateMixin {
  late ChattingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChattingPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChattingPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().timeChatIsVisibleList = functions
            .generateTimeIsVisibleInChatPageList(100)
            .toList()
            .cast<bool>();
      });
      setState(() {
        FFAppState().isSendMessageSuccess = true;
      });
      setState(() {
        FFAppState().chatMessagesTemp = '';
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, -15.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, -15.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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

    return StreamBuilder<List<ChatsRecord>>(
      stream: queryChatsRecord(
        queryBuilder: (chatsRecord) => chatsRecord
            .where(
              'user_a',
              isEqualTo: FFAppState().userRef,
            )
            .where(
              'user_b',
              isEqualTo: widget.userBDocRef,
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
        List<ChatsRecord> chattingPageChatsRecordList = snapshot.data!;
        final chattingPageChatsRecord = chattingPageChatsRecordList.isNotEmpty
            ? chattingPageChatsRecordList.first
            : null;
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
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              title: Text(
                '${widget.userBName} (${widget.userBNickname})',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (chattingPageChatsRecord != null)
                    Expanded(
                      child: StreamBuilder<List<ChatMessagesRecord>>(
                        stream: queryChatMessagesRecord(
                          queryBuilder: (chatMessagesRecord) =>
                              chatMessagesRecord
                                  .where(
                                    'chat',
                                    isEqualTo:
                                        chattingPageChatsRecord?.reference,
                                  )
                                  .orderBy('timestamp', descending: true),
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
                          List<ChatMessagesRecord>
                              listViewChatMessagesRecordList = snapshot.data!;
                          if (listViewChatMessagesRecordList.isEmpty) {
                            return Center(
                              child: EmptyChatComponentWidget(),
                            );
                          }
                          return ListView.separated(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              12.0,
                              0,
                              12.0,
                            ),
                            reverse: true,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewChatMessagesRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewChatMessagesRecord =
                                  listViewChatMessagesRecordList[listViewIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (listViewChatMessagesRecord.user ==
                                      chattingPageChatsRecord?.userB)
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 50.0,
                                              height: 50.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl:
                                                    widget.userBProfileImage,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (FFAppState()
                                                              .timeChatIsVisibleList[
                                                          0]) {
                                                        setState(() {
                                                          FFAppState()
                                                              .updateTimeChatIsVisibleListAtIndex(
                                                            0,
                                                            (_) => false,
                                                          );
                                                        });
                                                      } else {
                                                        setState(() {
                                                          FFAppState()
                                                              .updateTimeChatIsVisibleListAtIndex(
                                                            0,
                                                            (_) => true,
                                                          );
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        minHeight: 40.0,
                                                        maxWidth:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.65,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF3F37FF),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    8.0,
                                                                    12.0,
                                                                    8.0),
                                                        child: Text(
                                                          listViewChatMessagesRecord
                                                              .text,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (valueOrDefault<bool>(
                                                  FFAppState()
                                                          .timeChatIsVisibleList[
                                                      listViewIndex],
                                                  false,
                                                ))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'Hm',
                                                        listViewChatMessagesRecord
                                                            .timestamp!,
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
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'textOnPageLoadAnimation1']!),
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (listViewChatMessagesRecord.user ==
                                      chattingPageChatsRecord?.userA)
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (FFAppState()
                                                            .timeChatIsVisibleList[
                                                        listViewIndex]) {
                                                      setState(() {
                                                        FFAppState()
                                                            .updateTimeChatIsVisibleListAtIndex(
                                                          0,
                                                          (_) => false,
                                                        );
                                                      });
                                                    } else {
                                                      setState(() {
                                                        FFAppState()
                                                            .updateTimeChatIsVisibleListAtIndex(
                                                          0,
                                                          (_) => true,
                                                        );
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      minHeight: 40.0,
                                                      maxWidth:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .width *
                                                              0.65,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  8.0,
                                                                  12.0,
                                                                  8.0),
                                                      child: Text(
                                                        listViewChatMessagesRecord
                                                            .text,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .black600,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (valueOrDefault<bool>(
                                                  FFAppState()
                                                          .timeChatIsVisibleList[
                                                      listViewIndex],
                                                  false,
                                                ))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'Hm',
                                                        listViewChatMessagesRecord
                                                            .timestamp!,
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
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'textOnPageLoadAnimation2']!),
                                                  ),
                                              ],
                                            ),
                                            if ((FFAppState()
                                                        .isSendMessageSuccess ==
                                                    false) &&
                                                (listViewIndex == 0))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 18.0,
                                                  height: 18.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFF0087FF),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (((FFAppState()
                                                            .isSendMessageSuccess ==
                                                        true) &&
                                                    (listViewIndex == 0)) ||
                                                (listViewIndex > 0))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 18.0,
                                                  height: 18.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF0087FF),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Color(0xFF0087FF),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      Icons.check_outlined,
                                                      color: Color(0xFFE3E3E3),
                                                      size: 12.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  StreamBuilder<List<ChatsRecord>>(
                    stream: queryChatsRecord(
                      queryBuilder: (chatsRecord) => chatsRecord
                          .where(
                            'user_a',
                            isEqualTo: widget.userBDocRef,
                          )
                          .where(
                            'user_b',
                            isEqualTo: FFAppState().userRef,
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
                      List<ChatsRecord> rowChatsRecordList = snapshot.data!;
                      final rowChatsRecord = rowChatsRecordList.isNotEmpty
                          ? rowChatsRecordList.first
                          : null;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 16.0),
                              child: Container(
                                width: 100.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 4.0, 12.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'พิมพ์ข้อความที่นี่',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.image_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                          size: 26.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                          size: 26.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var _shouldSetState = false;
                                            if (!(_model.textController.text !=
                                                    null &&
                                                _model.textController.text !=
                                                    '')) {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                            setState(() {
                                              FFAppState()
                                                  .isSendMessageSuccess = false;
                                              FFAppState().chatMessagesTemp =
                                                  _model.textController.text;
                                            });
                                            setState(() {
                                              _model.textController?.clear();
                                            });
                                            if ((chattingPageChatsRecord !=
                                                    null) &&
                                                (rowChatsRecord != null)) {
                                              var chatMessagesRecordReference1 =
                                                  ChatMessagesRecord.collection
                                                      .doc();
                                              await chatMessagesRecordReference1
                                                  .set(
                                                      createChatMessagesRecordData(
                                                text: FFAppState()
                                                    .chatMessagesTemp,
                                                timestamp: getCurrentTimestamp,
                                                chat: chattingPageChatsRecord
                                                    ?.reference,
                                                user: FFAppState().userRef,
                                              ));
                                              _model.createMessageUserA =
                                                  ChatMessagesRecord
                                                      .getDocumentFromData(
                                                          createChatMessagesRecordData(
                                                            text: FFAppState()
                                                                .chatMessagesTemp,
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            chat:
                                                                chattingPageChatsRecord
                                                                    ?.reference,
                                                            user: FFAppState()
                                                                .userRef,
                                                          ),
                                                          chatMessagesRecordReference1);
                                              _shouldSetState = true;
                                              HapticFeedback.mediumImpact();

                                              var chatMessagesRecordReference2 =
                                                  ChatMessagesRecord.collection
                                                      .doc();
                                              await chatMessagesRecordReference2
                                                  .set(
                                                      createChatMessagesRecordData(
                                                text: FFAppState()
                                                    .chatMessagesTemp,
                                                timestamp: getCurrentTimestamp,
                                                chat: rowChatsRecord?.reference,
                                                user: FFAppState().userRef,
                                              ));
                                              _model.createMessageUserB =
                                                  ChatMessagesRecord
                                                      .getDocumentFromData(
                                                          createChatMessagesRecordData(
                                                            text: FFAppState()
                                                                .chatMessagesTemp,
                                                            timestamp:
                                                                getCurrentTimestamp,
                                                            chat: rowChatsRecord
                                                                ?.reference,
                                                            user: FFAppState()
                                                                .userRef,
                                                          ),
                                                          chatMessagesRecordReference2);
                                              _shouldSetState = true;
                                            }

                                            await chattingPageChatsRecord!
                                                .reference
                                                .update({
                                              ...createChatsRecordData(
                                                lastMessage: FFAppState()
                                                    .chatMessagesTemp,
                                                lastMessageTime:
                                                    getCurrentTimestamp,
                                                lastMessageSentBy:
                                                    FFAppState().userRef,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'last_message_seen_by':
                                                      FieldValue.delete(),
                                                },
                                              ),
                                            });

                                            await chattingPageChatsRecord!
                                                .reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'last_message_seen_by':
                                                      FieldValue.arrayUnion([
                                                    FFAppState().userRef
                                                  ]),
                                                },
                                              ),
                                            });

                                            await rowChatsRecord!.reference
                                                .update({
                                              ...createChatsRecordData(
                                                lastMessage: FFAppState()
                                                    .chatMessagesTemp,
                                                lastMessageTime:
                                                    getCurrentTimestamp,
                                                lastMessageSentBy:
                                                    FFAppState().userRef,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'last_message_seen_by':
                                                      FieldValue.delete(),
                                                },
                                              ),
                                            });

                                            await rowChatsRecord!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'last_message_seen_by':
                                                      FieldValue.arrayUnion([
                                                    FFAppState().userRef
                                                  ]),
                                                },
                                              ),
                                            });
                                            setState(() {
                                              FFAppState()
                                                  .isSendMessageSuccess = true;
                                              FFAppState().chatMessagesTemp =
                                                  '';
                                            });
                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          child: Icon(
                                            Icons.send_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                            size: 26.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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
