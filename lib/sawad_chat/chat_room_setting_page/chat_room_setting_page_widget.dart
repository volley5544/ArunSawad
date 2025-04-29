import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'chat_room_setting_page_model.dart';
export 'chat_room_setting_page_model.dart';

class ChatRoomSettingPageWidget extends StatefulWidget {
  const ChatRoomSettingPageWidget({
    super.key,
    required this.chatRoomDocRef,
  });

  final DocumentReference? chatRoomDocRef;

  static String routeName = 'ChatRoomSettingPage';
  static String routePath = 'chatRoomSettingPage';

  @override
  State<ChatRoomSettingPageWidget> createState() =>
      _ChatRoomSettingPageWidgetState();
}

class _ChatRoomSettingPageWidgetState extends State<ChatRoomSettingPageWidget> {
  late ChatRoomSettingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatRoomSettingPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChatRoomSettingPage'});

    _model.textFieldFocusNode ??= FocusNode();

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

    return StreamBuilder<SawadChatRoomRecord>(
      stream: SawadChatRoomRecord.getDocument(widget!.chatRoomDocRef!),
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

        final chatRoomSettingPageSawadChatRoomRecord = snapshot.data!;

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
                'ตั้งค่าห้องสนทนา',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.poppins(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.exit_to_app_outlined,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    var _shouldSetState = false;
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                content: Text(
                                    'คุณต้องการจะออกจากกลุ่มสนทนา \"${chatRoomSettingPageSawadChatRoomRecord.chatRoomName}\" หรือไม่?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('ยกเลิก'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('ออกกลุ่ม'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ) ??
                        false;
                    if (!confirmDialogResponse) {
                      if (_shouldSetState) safeSetState(() {});
                      return;
                    }
                    _model.myUserIndex = functions.getIndexOfUserCustomDocRef(
                        chatRoomSettingPageSawadChatRoomRecord.usersRef
                            .toList(),
                        FFAppState().userRef);
                    safeSetState(() {});
                    _model.usersEmployeeList =
                        chatRoomSettingPageSawadChatRoomRecord.usersEmplayeeId
                            .toList()
                            .cast<String>();
                    _model.usersRefList = chatRoomSettingPageSawadChatRoomRecord
                        .usersRef
                        .toList()
                        .cast<DocumentReference>();
                    _model.usersNameList =
                        chatRoomSettingPageSawadChatRoomRecord.usersName
                            .toList()
                            .cast<String>();
                    _model.usersDisplayImgList =
                        chatRoomSettingPageSawadChatRoomRecord.usersDisplayImage
                            .toList()
                            .cast<String>();
                    _model.usersDisplayImgBlurHashList =
                        chatRoomSettingPageSawadChatRoomRecord
                            .usersDisplayImageBlurHash
                            .toList()
                            .cast<String>();
                    safeSetState(() {});
                    _model.removeAtIndexFromUsersEmployeeList(
                        _model.myUserIndex!);
                    _model.removeAtIndexFromUsersRefList(_model.myUserIndex!);
                    _model.removeAtIndexFromUsersNameList(_model.myUserIndex!);
                    _model.removeAtIndexFromUsersDisplayImgList(
                        _model.myUserIndex!);
                    _model.removeAtIndexFromUsersDisplayImgBlurHashList(
                        _model.myUserIndex!);
                    safeSetState(() {});

                    var chatMessagesRecordReference =
                        ChatMessagesRecord.createDoc(widget!.chatRoomDocRef!);
                    await chatMessagesRecordReference
                        .set(createChatMessagesRecordData(
                      messageByEmployeeId: FFAppState().employeeID,
                      messageText:
                          '${FFAppState().profileFullName} ออกจากกลุ่มสนทนา',
                      messageType: 'setting',
                      messageTime: getCurrentTimestamp,
                      messageByName: FFAppState().profileFullName,
                    ));
                    _model.createLeaveGroupMessageDoc =
                        ChatMessagesRecord.getDocumentFromData(
                            createChatMessagesRecordData(
                              messageByEmployeeId: FFAppState().employeeID,
                              messageText:
                                  '${FFAppState().profileFullName} ออกจากกลุ่มสนทนา',
                              messageType: 'setting',
                              messageTime: getCurrentTimestamp,
                              messageByName: FFAppState().profileFullName,
                            ),
                            chatMessagesRecordReference);
                    _shouldSetState = true;

                    await widget!.chatRoomDocRef!.update({
                      ...createSawadChatRoomRecordData(
                        lastMessageText:
                            '${FFAppState().profileFullName} ออกจากกลุ่มสนทนา',
                        lastMessageTime: getCurrentTimestamp,
                        lastMessageBy: FFAppState().userRef,
                        lastMessageByEmployeeId: FFAppState().employeeID,
                        lastMessageType: 'setting',
                      ),
                      ...mapToFirestore(
                        {
                          'last_seen_users_ref': functions
                              .generateUserRefList(FFAppState().userRef),
                          'users_ref': _model.usersRefList,
                          'users_emplayee_id': _model.usersEmployeeList,
                          'users_name': _model.usersNameList,
                          'users_display_image': _model.usersDisplayImgList,
                          'users_display_image_blur_hash':
                              _model.usersDisplayImgBlurHashList,
                        },
                      ),
                    });
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return WebViewAware(
                          child: AlertDialog(
                            content: Text(
                                'คุณออกจากกลุ่มสนทนา \"${chatRoomSettingPageSawadChatRoomRecord.chatRoomName}\" แล้ว'),
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

                    context.goNamed(ChatHomePageWidget.routeName);

                    if (_shouldSetState) safeSetState(() {});
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
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.uploadedLocalFile ==
                                                    null ||
                                                (_model.uploadedLocalFile.bytes
                                                        ?.isEmpty ??
                                                    true)) {
                                              return Container(
                                                width: 90.0,
                                                height: 90.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
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
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xFF7A7A7A),
                                                    width: 2.0,
                                                  ),
                                                ),
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
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            FlutterFlowExpandedImageView(
                                                          image: OctoImage(
                                                            placeholderBuilder:
                                                                (_) => SizedBox
                                                                    .expand(
                                                              child: Image(
                                                                image: BlurHashImage(chatRoomSettingPageSawadChatRoomRecord
                                                                        .hasChatRoomDisplayImageBlurHash()
                                                                    ? chatRoomSettingPageSawadChatRoomRecord
                                                                        .chatRoomDisplayImageBlurHash
                                                                    : 'LAPG5SQ^=Sve}itOD=MzYhMx%fTf'),
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            image: NetworkImage(
                                                              chatRoomSettingPageSawadChatRoomRecord
                                                                  .chatRoomDisplayImageUrl,
                                                            ),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: chatRoomSettingPageSawadChatRoomRecord
                                                              .chatRoomDisplayImageUrl,
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: chatRoomSettingPageSawadChatRoomRecord
                                                        .chatRoomDisplayImageUrl,
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      child: OctoImage(
                                                        placeholderBuilder:
                                                            (_) =>
                                                                SizedBox.expand(
                                                          child: Image(
                                                            image: BlurHashImage(chatRoomSettingPageSawadChatRoomRecord
                                                                    .hasChatRoomDisplayImageBlurHash()
                                                                ? chatRoomSettingPageSawadChatRoomRecord
                                                                    .chatRoomDisplayImageBlurHash
                                                                : 'LAPG5SQ^=Sve}itOD=MzYhMx%fTf'),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        image: NetworkImage(
                                                          chatRoomSettingPageSawadChatRoomRecord
                                                              .chatRoomDisplayImageUrl,
                                                        ),
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                width: 90.0,
                                                height: 90.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
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
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xFF7A7A7A),
                                                    width: 2.0,
                                                  ),
                                                ),
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
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            FlutterFlowExpandedImageView(
                                                          image: Image.memory(
                                                            _model.uploadedLocalFile
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag: 'imageTag2',
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: 'imageTag2',
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      child: Image.memory(
                                                        _model.uploadedLocalFile
                                                                .bytes ??
                                                            Uint8List.fromList(
                                                                []),
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      if (_model.isEditState)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.6, 1.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              content: Text(
                                                                  'คุณต้องการจะอัพโหลดรูปห้องการสนทนากลุ่มหรือไม่?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'ยกเลิก'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'ตกลง'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (!confirmDialogResponse) {
                                                return;
                                              }
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                imageQuality: 30,
                                                allowPhoto: true,
                                                includeBlurHash: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                safeSetState(() => _model
                                                    .isDataUploading = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                try {
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();
                                                } finally {
                                                  _model.isDataUploading =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                        .length ==
                                                    selectedMedia.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile =
                                                        selectedUploadedFiles
                                                            .first;
                                                  });
                                                } else {
                                                  safeSetState(() {});
                                                  return;
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: 35.0,
                                              height: 35.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
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
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.camera_alt,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
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
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 16.0),
                                              child: Text(
                                                'ชื่อกลุ่ม :',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController ??=
                                                        TextEditingController(
                                                  text:
                                                      chatRoomSettingPageSawadChatRoomRecord
                                                          .chatRoomName,
                                                ),
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                autofocus: false,
                                                readOnly: !_model.isEditState,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: false,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                  hintText: 'กรอกชื่อกลุ่ม...',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                maxLength: 50,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .textControllerValidator
                                                    .asValidator(context),
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
                        ),
                      ],
                    ),
                  ),
                  if (_model.isEditState)
                    Builder(
                      builder: (context) {
                        if (_model.isEditState) {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 24.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      if (!((_model.uploadedLocalFile != null &&
                                              (_model.uploadedLocalFile.bytes
                                                      ?.isNotEmpty ??
                                                  false)) ||
                                          ((chatRoomSettingPageSawadChatRoomRecord
                                                      .chatRoomName !=
                                                  _model.textController.text) &&
                                              (_model.textController.text !=
                                                  '')))) {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        content: Text(
                                                            'กรุณาอัพโหลดรูปกลุ่ม หรือเปลี่ยนชื่อกลุ่มสนทนาเพื่อบันทึก'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child:
                                                                Text('Confirm'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      content: Text(
                                                          'คุณต้องการบันทึกการแก้ไขข้อมูลห้องสนทนาหรือไม่?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('ยกเลิก'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text('บันทึก'),
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
                                      if (_model.uploadedLocalFile != null &&
                                          (_model.uploadedLocalFile.bytes
                                                  ?.isNotEmpty ??
                                              false)) {
                                        _model.uploadStorageDisplayAction =
                                            await actions
                                                .uploadFileFirebaseStorage(
                                          'ChatRoomDisplayImage',
                                          _model.uploadedLocalFile,
                                        );
                                        _shouldSetState = true;

                                        var chatMessagesRecordReference1 =
                                            ChatMessagesRecord.createDoc(
                                                widget!.chatRoomDocRef!);
                                        await chatMessagesRecordReference1
                                            .set(createChatMessagesRecordData(
                                          messageByEmployeeId:
                                              FFAppState().employeeID,
                                          messageText:
                                              '${FFAppState().profileFullName} ทำการแก้ไขข้อมูลกลุ่มสนทนา',
                                          messageType: 'setting',
                                          messageTime: getCurrentTimestamp,
                                          messageByName:
                                              FFAppState().profileFullName,
                                        ));
                                        _model.createSettingMessageDoc1 =
                                            ChatMessagesRecord.getDocumentFromData(
                                                createChatMessagesRecordData(
                                                  messageByEmployeeId:
                                                      FFAppState().employeeID,
                                                  messageText:
                                                      '${FFAppState().profileFullName} ทำการแก้ไขข้อมูลกลุ่มสนทนา',
                                                  messageType: 'setting',
                                                  messageTime:
                                                      getCurrentTimestamp,
                                                  messageByName: FFAppState()
                                                      .profileFullName,
                                                ),
                                                chatMessagesRecordReference1);
                                        _shouldSetState = true;

                                        await widget!.chatRoomDocRef!.update({
                                          ...createSawadChatRoomRecordData(
                                            chatRoomName:
                                                chatRoomSettingPageSawadChatRoomRecord
                                                            .chatRoomName !=
                                                        _model
                                                            .textController.text
                                                    ? _model.textController.text
                                                    : chatRoomSettingPageSawadChatRoomRecord
                                                        .chatRoomName,
                                            chatRoomDisplayImageUrl: _model
                                                            .uploadedLocalFile !=
                                                        null &&
                                                    (_model
                                                            .uploadedLocalFile
                                                            .bytes
                                                            ?.isNotEmpty ??
                                                        false)
                                                ? functions.stringToImgPath(_model
                                                    .uploadStorageDisplayAction)
                                                : chatRoomSettingPageSawadChatRoomRecord
                                                    .chatRoomDisplayImageUrl,
                                            chatRoomDisplayImageBlurHash: _model
                                                            .uploadedLocalFile !=
                                                        null &&
                                                    (_model
                                                            .uploadedLocalFile
                                                            .bytes
                                                            ?.isNotEmpty ??
                                                        false)
                                                ? _model
                                                    .uploadedLocalFile.blurHash
                                                : chatRoomSettingPageSawadChatRoomRecord
                                                    .chatRoomDisplayImageBlurHash,
                                            lastMessageText:
                                                '${FFAppState().profileFullName} ทำการแก้ไขข้อมูลกลุ่มสนทนา',
                                            lastMessageTime:
                                                getCurrentTimestamp,
                                            lastMessageBy: FFAppState().userRef,
                                            lastMessageByEmployeeId:
                                                FFAppState().employeeID,
                                            lastMessageType: 'setting',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'last_seen_users_ref':
                                                  functions.generateUserRefList(
                                                      FFAppState().userRef),
                                            },
                                          ),
                                        });
                                      } else {
                                        var chatMessagesRecordReference2 =
                                            ChatMessagesRecord.createDoc(
                                                widget!.chatRoomDocRef!);
                                        await chatMessagesRecordReference2
                                            .set(createChatMessagesRecordData(
                                          messageByEmployeeId:
                                              FFAppState().employeeID,
                                          messageText:
                                              '${FFAppState().profileFullName} ทำการแก้ไขข้อมูลกลุ่มสนทนา',
                                          messageType: 'setting',
                                          messageTime: getCurrentTimestamp,
                                          messageByName:
                                              FFAppState().profileFullName,
                                        ));
                                        _model.createSettingMessageDoc2 =
                                            ChatMessagesRecord.getDocumentFromData(
                                                createChatMessagesRecordData(
                                                  messageByEmployeeId:
                                                      FFAppState().employeeID,
                                                  messageText:
                                                      '${FFAppState().profileFullName} ทำการแก้ไขข้อมูลกลุ่มสนทนา',
                                                  messageType: 'setting',
                                                  messageTime:
                                                      getCurrentTimestamp,
                                                  messageByName: FFAppState()
                                                      .profileFullName,
                                                ),
                                                chatMessagesRecordReference2);
                                        _shouldSetState = true;

                                        await widget!.chatRoomDocRef!.update({
                                          ...createSawadChatRoomRecordData(
                                            chatRoomName:
                                                chatRoomSettingPageSawadChatRoomRecord
                                                            .chatRoomName !=
                                                        _model
                                                            .textController.text
                                                    ? _model.textController.text
                                                    : chatRoomSettingPageSawadChatRoomRecord
                                                        .chatRoomName,
                                            chatRoomDisplayImageUrl:
                                                chatRoomSettingPageSawadChatRoomRecord
                                                    .chatRoomDisplayImageUrl,
                                            chatRoomDisplayImageBlurHash:
                                                chatRoomSettingPageSawadChatRoomRecord
                                                    .chatRoomDisplayImageBlurHash,
                                            lastMessageText:
                                                '${FFAppState().profileFullName} ทำการแก้ไขข้อมูลกลุ่มสนทนา',
                                            lastMessageTime:
                                                getCurrentTimestamp,
                                            lastMessageBy: FFAppState().userRef,
                                            lastMessageByEmployeeId:
                                                FFAppState().employeeID,
                                            lastMessageType: 'setting',
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'last_seen_users_ref':
                                                  functions.generateUserRefList(
                                                      FFAppState().userRef),
                                            },
                                          ),
                                        });
                                      }

                                      safeSetState(() {
                                        _model.isDataUploading = false;
                                        _model.uploadedLocalFile =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]));
                                      });

                                      safeSetState(() {
                                        _model.textController?.text =
                                            _model.textController.text;
                                      });
                                      _model.isEditState = false;
                                      safeSetState(() {});
                                      _model.isEditState = false;
                                      safeSetState(() {});
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'เปลี่ยนข้อมูลกลุ่มสนทนาสำเร็จ!'),
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
                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    text: 'บันทึก',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.poppins(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    content: Text(
                                                        'คุณต้องการจะยกเลิกบันทึกการแก้ไขข้อมูลห้องสนทนาหรือไม่?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('ยกเลิก'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('ตกลง'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (!confirmDialogResponse) {
                                      return;
                                    }
                                    safeSetState(() {
                                      _model.isDataUploading = false;
                                      _model.uploadedLocalFile = FFUploadedFile(
                                          bytes: Uint8List.fromList([]));
                                    });

                                    safeSetState(() {
                                      _model.textController?.text =
                                          chatRoomSettingPageSawadChatRoomRecord
                                              .chatRoomName;
                                    });
                                    _model.isEditState = false;
                                    safeSetState(() {});
                                  },
                                  text: 'ยกเลิก',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).error,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ].addToEnd(SizedBox(width: 40.0)),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    _model.isEditState = true;
                                    safeSetState(() {});
                                  },
                                  text: 'แก้ไข',
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFFEDBD00),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ].addToEnd(SizedBox(width: 40.0)),
                            ),
                          );
                        }
                      },
                    ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: ListTile(
                            title: Text(
                              'เชิญผู้สนทนา',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                            trailing: Icon(
                              Icons.person_add_alt,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: ListTile(
                            title: Text(
                              'เชิญผู้สนทนาออก',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                            trailing: Icon(
                              Icons.person_remove,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            tileColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            dense: false,
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
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
