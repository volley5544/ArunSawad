import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'thaipaiboon_page_model.dart';
export 'thaipaiboon_page_model.dart';

class ThaipaiboonPageWidget extends StatefulWidget {
  const ThaipaiboonPageWidget({super.key});

  @override
  State<ThaipaiboonPageWidget> createState() => _ThaipaiboonPageWidgetState();
}

class _ThaipaiboonPageWidgetState extends State<ThaipaiboonPageWidget> {
  late ThaipaiboonPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThaipaiboonPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ThaipaiboonPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Color(0x00000000),
        enableDrag: false,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      _model.checkLatLngThaiPaiboon = await actions.a8(
        currentUserLocationValue,
      );
      if (!_model.checkLatLngThaiPaiboon!) {
        Navigator.pop(context);
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text('กรุณาเปิดGPS ก่อนทำรายการ'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        context.pop();
        return;
      }

      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'Thai_Paiboon',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      ));
      _model.createdUserLogThaiPaiboon = UserLogRecord.getDocumentFromData(
          createUserLogRecordData(
            employeeId: FFAppState().employeeID,
            action: 'Thai_Paiboon',
            actionTime: getCurrentTimestamp,
            userLocation: currentUserLocationValue,
          ),
          userLogRecordReference);
      _model.tpbAPIOutput = await ThaipaiboonAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      if ((_model.tpbAPIOutput?.statusCode ?? 200) != 200) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (status code${(_model.tpbAPIOutput?.statusCode ?? 200).toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        Navigator.pop(context);
        return;
      }
      if (!((ThaipaiboonAPICall.statuslayer2(
                (_model.tpbAPIOutput?.jsonBody ?? ''),
              ) ==
              200) ||
          (ThaipaiboonAPICall.statuslayer2(
                (_model.tpbAPIOutput?.jsonBody ?? ''),
              ) ==
              404))) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (status layer2${ThaipaiboonAPICall.statuslayer2(
                  (_model.tpbAPIOutput?.jsonBody ?? ''),
                )?.toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
        Navigator.pop(context);
        return;
      }
      Navigator.pop(context);
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
                Icons.arrow_back_sharp,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            title: Text(
              'ไทยไพบูลย์ประกันภัย',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 18.0,
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
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Text(
                    'แผนประกันภัยอุบัติเหตุส่วนบุคคล',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                  child: FlutterFlowChoiceChips(
                    options: [
                      ChipData('ครอบครัวสุขใจ X2', Icons.family_restroom),
                      ChipData('อุ่นใจสบายกระเป๋า', Icons.lock),
                      ChipData('พี่วินคุ้มชัวร์', Icons.motorcycle),
                      ChipData('แคมเปญทั้งหมด', FontAwesomeIcons.borderAll)
                    ],
                    onChanged: (val) => setState(
                        () => _model.choiceChipsValue = val?.firstOrNull),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: Color(0xFFFF6500),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      iconColor: Colors.white,
                      iconSize: 18.0,
                      elevation: 4.0,
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor: FlutterFlowTheme.of(context).grayIcon,
                      textStyle:
                          FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFFE3E7ED),
                              ),
                      iconColor: Color(0xFFE3E7ED),
                      iconSize: 18.0,
                      elevation: 4.0,
                    ),
                    chipSpacing: 20.0,
                    rowSpacing: 12.0,
                    multiselect: false,
                    initialized: _model.choiceChipsValue != null,
                    alignment: WrapAlignment.start,
                    controller: _model.choiceChipsValueController ??=
                        FormFieldController<List<String>>(
                      ['ครอบครัวสุขใจ X2'],
                    ),
                    wrapped: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Text(
                    valueOrDefault<String>(
                      _model.choiceChipsValue,
                      '-',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                        ),
                  ),
                ),
                if (((_model.tpbAPIOutput?.statusCode ?? 200) == 200) &&
                    (ThaipaiboonAPICall.statuslayer2(
                          (_model.tpbAPIOutput?.jsonBody ?? ''),
                        ) ==
                        200))
                  Expanded(
                    child: Column(
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: SelectionArea(
                                            child: Text(
                                          'Date',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        )),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: SelectionArea(
                                          child: Text(
                                        'No. of Policy',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 14.0,
                                            ),
                                      )),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: SelectionArea(
                                          child: Text(
                                        'Premiums',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 14.0,
                                            ),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: Color(0x7F000000),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final thaipaiboonlist =
                                  ThaipaiboonAPICall.groupCampaign(
                                        (_model.tpbAPIOutput?.jsonBody ?? ''),
                                      )?.toList() ??
                                      [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: thaipaiboonlist.length,
                                itemBuilder: (context, thaipaiboonlistIndex) {
                                  final thaipaiboonlistItem =
                                      thaipaiboonlist[thaipaiboonlistIndex];
                                  return Visibility(
                                    visible: _model.choiceChipsValue !=
                                            'แคมเปญทั้งหมด'
                                        ? (_model.choiceChipsValue ==
                                            valueOrDefault<String>(
                                              functions.showMatNameInList(
                                                  functions
                                                      .containsWordInString(
                                                          ThaipaiboonAPICall
                                                              .groupCampaign(
                                                        (_model.tpbAPIOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?.toList())
                                                      ?.toList(),
                                                  thaipaiboonlistIndex),
                                              '0',
                                            ))
                                        : true,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // บริษัท
                                              // ตัวอย่าง ประกันภัย-ไทยวิวัฒน์
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    valueOrDefault<String>(
                                                      functions.showMatNameInList(
                                                          ThaipaiboonAPICall.date(
                                                            (_model.tpbAPIOutput
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )?.toList(),
                                                          thaipaiboonlistIndex),
                                                      '0',
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  )),
                                                ),
                                              ),

                                              // ซ่อม
                                              // ตัวอย่าง ซ่อมอู๋
                                              Expanded(
                                                flex: 2,
                                                child: SelectionArea(
                                                    child: Text(
                                                  valueOrDefault<String>(
                                                            functions
                                                                .showMatNameInList(
                                                                    ThaipaiboonAPICall
                                                                        .noOfPolicy(
                                                                      (_model.tpbAPIOutput
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )?.toList(),
                                                                    thaipaiboonlistIndex),
                                                            '0',
                                                          ) ==
                                                          '-'
                                                      ? 'pending'
                                                      : valueOrDefault<String>(
                                                          functions
                                                              .showMatNameInList(
                                                                  ThaipaiboonAPICall
                                                                      .noOfPolicy(
                                                                    (_model.tpbAPIOutput
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?.toList(),
                                                                  thaipaiboonlistIndex),
                                                          '0',
                                                        ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                      ),
                                                )),
                                              ),

                                              // ราคาเบี้ย
                                              // ตัวอย่างเป็นจำนวนเงิน 1,000
                                              Expanded(
                                                flex: 2,
                                                child: SelectionArea(
                                                    child: Text(
                                                  valueOrDefault<String>(
                                                    functions.showMatNameInList(
                                                        ThaipaiboonAPICall
                                                            .premiums(
                                                          (_model.tpbAPIOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.toList(),
                                                        thaipaiboonlistIndex),
                                                    '0',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                      ),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: Color(0x80090F13),
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
                  ),
                if (((_model.tpbAPIOutput?.statusCode ?? 200) == 200) &&
                    (ThaipaiboonAPICall.statuslayer2(
                          (_model.tpbAPIOutput?.jsonBody ?? ''),
                        ) ==
                        404))
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'ไม่พบข้อมูลของเดือนนี้',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color:
                                        FlutterFlowTheme.of(context).grayIcon,
                                    fontSize: 20.0,
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
        ),
      ),
    );
  }
}
