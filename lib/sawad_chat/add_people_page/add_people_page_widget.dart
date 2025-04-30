import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_people_page_model.dart';
export 'add_people_page_model.dart';

class AddPeoplePageWidget extends StatefulWidget {
  const AddPeoplePageWidget({
    super.key,
    required this.chatRoomDocRef,
  });

  final DocumentReference? chatRoomDocRef;

  static String routeName = 'AddPeoplePage';
  static String routePath = 'addPeoplePage';

  @override
  State<AddPeoplePageWidget> createState() => _AddPeoplePageWidgetState();
}

class _AddPeoplePageWidgetState extends State<AddPeoplePageWidget> {
  late AddPeoplePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddPeoplePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddPeoplePage'});
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

        final addPeoplePageSawadChatRoomRecord = snapshot.data!;

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
                'เพิ่มคนเข้ากลุ่มสนทนา',
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
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      fontWeight: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [],
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
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final selectedEmployeeListItem =
                                      _model.selectedEmployeeList.toList();

                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      12.0,
                                      0,
                                      12.0,
                                      0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: selectedEmployeeListItem.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 8.0),
                                    itemBuilder: (context,
                                        selectedEmployeeListItemIndex) {
                                      final selectedEmployeeListItemItem =
                                          selectedEmployeeListItem[
                                              selectedEmployeeListItemIndex];
                                      return Container(
                                        width: 100.0,
                                        height: 100.0,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 5.0),
                                              child: Container(
                                                width: 100.0,
                                                height: 100.0,
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        shape:
                                                            BoxShape.rectangle,
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
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  FlutterFlowExpandedImageView(
                                                                image:
                                                                    OctoImage(
                                                                  placeholderBuilder:
                                                                      (_) => SizedBox
                                                                          .expand(
                                                                    child:
                                                                        Image(
                                                                      image: BlurHashImage(
                                                                          selectedEmployeeListItemItem
                                                                              .userDisplayImageBlurHash),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  image:
                                                                      NetworkImage(
                                                                    selectedEmployeeListItemItem
                                                                        .userDisplayImage,
                                                                  ),
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                                allowRotation:
                                                                    false,
                                                                tag: selectedEmployeeListItemItem
                                                                    .userDisplayImage,
                                                                useHeroAnimation:
                                                                    true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag: selectedEmployeeListItemItem
                                                              .userDisplayImage,
                                                          transitionOnUserGestures:
                                                              true,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: OctoImage(
                                                              placeholderBuilder:
                                                                  (_) => SizedBox
                                                                      .expand(
                                                                child: Image(
                                                                  image: BlurHashImage(
                                                                      selectedEmployeeListItemItem
                                                                          .userDisplayImageBlurHash),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              image:
                                                                  NetworkImage(
                                                                selectedEmployeeListItemItem
                                                                    .userDisplayImage,
                                                              ),
                                                              width: 200.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  4.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Text(
                                                        selectedEmployeeListItemItem
                                                            .fullName,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ]
                                                      .addToStart(
                                                          SizedBox(height: 4.0))
                                                      .addToEnd(SizedBox(
                                                          height: 4.0)),
                                                ),
                                              ),
                                            ),
                                            if (selectedEmployeeListItemIndex !=
                                                0)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
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
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                    content: Text(
                                                                        'ต้องการนำ คุณ${selectedEmployeeListItemItem.fullName} ออกจากการสร้างกลุ่มสนทนาหรือไม่?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'ยกเลิก'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
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
                                                    _model.removeAtIndexFromSelectedEmployeeList(
                                                        selectedEmployeeListItemIndex);
                                                    safeSetState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.close_rounded,
                                                    color: Color(0xFFFF0000),
                                                    size: 24.0,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
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
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.searchBoxTextController',
                                    Duration(milliseconds: 2000),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'ชื่อ,รหัสพนักงาน...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w300,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    suffixIcon: _model.searchBoxTextController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.searchBoxTextController
                                                  ?.clear();
                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              size: 22,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.poppins(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
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
                                      userCustomRecord.where(
                                    'employee_id',
                                    isEqualTo: GetAllEmployeeAPICall.employeeId(
                                      (_model.getEmployee?.jsonBody ?? ''),
                                    )?.elementAtOrNull(employeeListItemIndex),
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
                                  final containerUserCustomRecord =
                                      containerUserCustomRecordList.isNotEmpty
                                          ? containerUserCustomRecordList.first
                                          : null;

                                  return Container(
                                    width: double.infinity,
                                    height: 80.0,
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: (containerUserCustomRecord !=
                                              null) &&
                                          !addPeoplePageSawadChatRoomRecord
                                              .usersEmplayeeId
                                              .contains(GetAllEmployeeAPICall
                                                  .employeeId(
                                            (_model.getEmployee?.jsonBody ??
                                                ''),
                                          )?.elementAtOrNull(
                                                  employeeListItemIndex)),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 2.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            HapticFeedback.mediumImpact();
                                            if (_model.selectedEmployeeList
                                                .map((e) => e.employeeCode)
                                                .toList()
                                                .contains(((GetAllEmployeeAPICall
                                                        .employeeId(
                                                  (_model.getEmployee
                                                          ?.jsonBody ??
                                                      ''),
                                                )!
                                                    .elementAtOrNull(
                                                        employeeListItemIndex))!))) {
                                              return;
                                            }
                                            _model.addToSelectedEmployeeList(
                                                (GetAllEmployeeAPICall.dataJson(
                                              (_model.getEmployee?.jsonBody ??
                                                  ''),
                                            )!
                                                    .elementAtOrNull(
                                                        employeeListItemIndex))!);
                                            safeSetState(() {});
                                            _model
                                                .updateSelectedEmployeeListAtIndex(
                                              _model.selectedEmployeeList
                                                      .length -
                                                  1,
                                              (e) => e
                                                ..userDocRef =
                                                    containerUserCustomRecord
                                                        ?.reference
                                                ..userDisplayImage =
                                                    containerUserCustomRecord
                                                        ?.imgProfile
                                                ..userDisplayImageBlurHash =
                                                    containerUserCustomRecord
                                                                    ?.imgProfileBlurHash !=
                                                                null &&
                                                            containerUserCustomRecord
                                                                    ?.imgProfileBlurHash !=
                                                                ''
                                                        ? containerUserCustomRecord
                                                            ?.imgProfileBlurHash
                                                        : 'LKOp[Mof~qof?bfQRjfQ%MfQIUfQ',
                                            );
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
                                                        Container(
                                                          width: 70.0,
                                                          height: 70.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image:
                                                                        OctoImage(
                                                                      placeholderBuilder:
                                                                          (_) =>
                                                                              SizedBox.expand(
                                                                        child:
                                                                            Image(
                                                                          image: BlurHashImage(containerUserCustomRecord!.hasImgProfileBlurHash()
                                                                              ? containerUserCustomRecord!.imgProfileBlurHash
                                                                              : 'LKOp[Mof~qof?bfQRjfQ%MfQIUfQ'),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      image:
                                                                          NetworkImage(
                                                                        containerUserCustomRecord!
                                                                            .imgProfile,
                                                                      ),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag: containerUserCustomRecord!
                                                                        .imgProfile,
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag: containerUserCustomRecord!
                                                                  .imgProfile,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.0),
                                                                child:
                                                                    OctoImage(
                                                                  placeholderBuilder:
                                                                      (_) => SizedBox
                                                                          .expand(
                                                                    child:
                                                                        Image(
                                                                      image: BlurHashImage(containerUserCustomRecord!
                                                                              .hasImgProfileBlurHash()
                                                                          ? containerUserCustomRecord!
                                                                              .imgProfileBlurHash
                                                                          : 'LKOp[Mof~qof?bfQRjfQ%MfQIUfQ'),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  image:
                                                                      NetworkImage(
                                                                    containerUserCustomRecord!
                                                                        .imgProfile,
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
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                        HapticFeedback
                                                                            .mediumImpact();
                                                                        if (_model
                                                                            .selectedEmployeeList
                                                                            .map((e) =>
                                                                                e.employeeCode)
                                                                            .toList()
                                                                            .contains(((GetAllEmployeeAPICall.employeeId(
                                                                              (_model.getEmployee?.jsonBody ?? ''),
                                                                            )!
                                                                                .elementAtOrNull(employeeListItemIndex))!))) {
                                                                          return;
                                                                        }
                                                                        _model.addToSelectedEmployeeList((GetAllEmployeeAPICall.dataJson(
                                                                          (_model.getEmployee?.jsonBody ??
                                                                              ''),
                                                                        )!
                                                                            .elementAtOrNull(employeeListItemIndex))!);
                                                                        safeSetState(
                                                                            () {});
                                                                        _model
                                                                            .updateSelectedEmployeeListAtIndex(
                                                                          _model.selectedEmployeeList.length -
                                                                              1,
                                                                          (e) => e
                                                                            ..userDocRef =
                                                                                containerUserCustomRecord?.reference
                                                                            ..userDisplayImage =
                                                                                containerUserCustomRecord?.imgProfile
                                                                            ..userDisplayImageBlurHash = containerUserCustomRecord?.imgProfileBlurHash != null && containerUserCustomRecord?.imgProfileBlurHash != '' ? containerUserCustomRecord?.imgProfileBlurHash : 'LKOp[Mof~qof?bfQRjfQ%MfQIUfQ',
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .add_circle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .success,
                                                                        size:
                                                                            40.0,
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
                  if (_model.selectedEmployeeList.length > 0)
                    Container(
                      height: 80.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  _model.usersDisplayImage = [];
                                  _model.usersDisplayImageBlurHash = [];
                                  _model.usersEmplayeeId = [];
                                  _model.usersName = [];
                                  _model.usersRef = [];
                                  _model.combineUsersName = '';
                                  safeSetState(() {});
                                  if (_model.selectedEmployeeList.length <= 0) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณาเลือกพนักงานอย่างน้อย 1 คนเพื่อเพิ่มเข้ากลุ่มสนทนา'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
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
                                  _model.queryChatRoomDoc =
                                      await SawadChatRoomRecord.getDocumentOnce(
                                          widget!.chatRoomDocRef!);
                                  _shouldSetState = true;
                                  _model.usersDisplayImage = _model
                                      .queryChatRoomDoc!.usersDisplayImage
                                      .toList()
                                      .cast<String>();
                                  _model.usersDisplayImageBlurHash = _model
                                      .queryChatRoomDoc!
                                      .usersDisplayImageBlurHash
                                      .toList()
                                      .cast<String>();
                                  _model.usersEmplayeeId = _model
                                      .queryChatRoomDoc!.usersEmplayeeId
                                      .toList()
                                      .cast<String>();
                                  _model.usersName = _model
                                      .queryChatRoomDoc!.usersName
                                      .toList()
                                      .cast<String>();
                                  _model.usersRef = _model
                                      .queryChatRoomDoc!.usersRef
                                      .toList()
                                      .cast<DocumentReference>();
                                  safeSetState(() {});
                                  for (int loop1Index = 0;
                                      loop1Index <= 0;
                                      loop1Index++) {
                                    final currentLoop1Item =
                                        _model.selectedEmployeeList[loop1Index];
                                    _model.addToUsersDisplayImage('123123');
                                    _model.addToUsersDisplayImageBlurHash(
                                        currentLoop1Item);
                                    _model.addToUsersEmplayeeId('2');
                                    _model.addToUsersName('3');
                                    _model.addToUsersRef(FFAppState().userRef!);
                                    _model.combineUsersName =
                                        '${_model.combineUsersName}${loop1Index == (_model.selectedEmployeeList.length - 1) ? '' : ', '}';
                                    safeSetState(() {});
                                  }

                                  var chatMessagesRecordReference =
                                      ChatMessagesRecord.createDoc(
                                          widget!.chatRoomDocRef!);
                                  await chatMessagesRecordReference
                                      .set(createChatMessagesRecordData(
                                    messageText:
                                        '${FFAppState().profileFullName} ได้เพิ่ม ${_model.combineUsersName} เข้ากลุ่มสนทนาแล้ว',
                                    messageTime: getCurrentTimestamp,
                                    messageType: 'setting',
                                    messageByEmployeeId:
                                        FFAppState().employeeID,
                                    messageByName: FFAppState().profileFullName,
                                  ));
                                  _model.createAddPeopleMessageAction =
                                      ChatMessagesRecord.getDocumentFromData(
                                          createChatMessagesRecordData(
                                            messageText:
                                                '${FFAppState().profileFullName} ได้เพิ่ม ${_model.combineUsersName} เข้ากลุ่มสนทนาแล้ว',
                                            messageTime: getCurrentTimestamp,
                                            messageType: 'setting',
                                            messageByEmployeeId:
                                                FFAppState().employeeID,
                                            messageByName:
                                                FFAppState().profileFullName,
                                          ),
                                          chatMessagesRecordReference);
                                  _shouldSetState = true;

                                  await widget!.chatRoomDocRef!.update({
                                    ...createSawadChatRoomRecordData(
                                      lastMessageText:
                                          '${FFAppState().profileFullName} ได้เพิ่มคนเข้ากลุ่มสนทนาแล้ว',
                                      lastMessageTime: _model
                                          .createAddPeopleMessageAction
                                          ?.messageTime,
                                      lastMessageBy: _model
                                          .createAddPeopleMessageAction
                                          ?.messageBy,
                                      lastMessageByEmployeeId: _model
                                          .createAddPeopleMessageAction
                                          ?.messageByEmployeeId,
                                      lastMessageType: _model
                                          .createAddPeopleMessageAction
                                          ?.messageType,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'users_ref': _model.usersRef,
                                        'users_emplayee_id':
                                            _model.usersEmplayeeId,
                                        'users_name': _model.usersName,
                                        'users_display_image_blur_hash':
                                            _model.usersDisplayImageBlurHash,
                                        'users_display_image':
                                            _model.usersDisplayImage,
                                        'last_seen_users_ref':
                                            functions.generateUserRefList(
                                                FFAppState().userRef),
                                      },
                                    ),
                                  });
                                  _model.usersDisplayImage = [];
                                  _model.usersDisplayImageBlurHash = [];
                                  _model.usersEmplayeeId = [];
                                  _model.usersName = [];
                                  _model.usersRef = [];
                                  _model.combineUsersName = '';
                                  safeSetState(() {});
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'เพิ่มคนเข้ากลุ่มสนทนาสำเร็จ!!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  context.safePop();
                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: 'เพิ่มคนเข้ากลุ่มสนทนา',
                                options: FFButtonOptions(
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _model.selectedEmployeeList.length > 2
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).grayIcon,
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ].addToEnd(SizedBox(height: 20.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
