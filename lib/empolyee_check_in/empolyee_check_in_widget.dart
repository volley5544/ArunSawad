import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'empolyee_check_in_model.dart';
export 'empolyee_check_in_model.dart';

class EmpolyeeCheckInWidget extends StatefulWidget {
  const EmpolyeeCheckInWidget({
    Key? key,
    this.location1,
    this.recordId,
    this.coordinate,
    this.remark,
    this.clockIn,
  }) : super(key: key);

  final CityRecord? location1;
  final String? recordId;
  final String? coordinate;
  final String? remark;
  final DateTime? clockIn;

  @override
  _EmpolyeeCheckInWidgetState createState() => _EmpolyeeCheckInWidgetState();
}

class _EmpolyeeCheckInWidgetState extends State<EmpolyeeCheckInWidget>
    with TickerProviderStateMixin {
  late EmpolyeeCheckInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 1400.ms,
          begin: Offset(0.0, 100.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1000.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 300.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1250.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1250.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1250.ms,
          duration: 300.ms,
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmpolyeeCheckInModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EmpolyeeCheckIn'});
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
        builder: (bottomSheetContext) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Padding(
              padding: MediaQuery.of(bottomSheetContext).viewInsets,
              child: LoadingSceneWidget(),
            ),
          );
        },
      ).then((value) => setState(() {}));

      FFAppState().update(() {
        FFAppState().branchLoString = '';
      });
      _model.getDateTimeAPIOutput = await GetDateTimeAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      _model.checkinoutMonthAPIOutput = await CheckinoutThisMonthAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      if (CheckinoutThisMonthAPICall.statusLayer2(
            (_model.checkinoutMonthAPIOutput?.jsonBody ?? ''),
          ) ==
          202) {
        if (CheckinoutThisMonthAPICall.flagCheck(
              (_model.checkinoutMonthAPIOutput?.jsonBody ?? ''),
            ).toString() ==
            '2') {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text('วันนี้คุณลงชื่อครบแล้ว'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          Navigator.pop(context);

          context.goNamed('DashboardCheckin');

          return;
        }
      } else {
        if (CheckinoutThisMonthAPICall.statusLayer2(
              (_model.checkinoutMonthAPIOutput?.jsonBody ?? ''),
            ) ==
            404) {
          FFAppState().update(() {
            FFAppState().flag = '0';
          });
        } else {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${CheckinoutThisMonthAPICall.statusLayer2(
                  (_model.checkinoutMonthAPIOutput?.jsonBody ?? ''),
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
          Navigator.pop(context);
          return;
        }
      }

      if ((_model.getDateTimeAPIOutput?.statusCode ?? 200) == 200) {
        FFAppState().update(() {
          FFAppState().currentTime = GetDateTimeAPICall.currentTime(
            (_model.getDateTimeAPIOutput?.jsonBody ?? ''),
          ).toString();
          FFAppState().currentDate = GetDateTimeAPICall.currentDate(
            (_model.getDateTimeAPIOutput?.jsonBody ?? ''),
          ).toString();
        });
        FFAppState().update(() {
          FFAppState().branchLo = currentUserLocationValue;
          FFAppState().flag = CheckinoutThisMonthAPICall.flagCheck(
            (_model.checkinoutMonthAPIOutput?.jsonBody ?? ''),
          ).toString();
        });
        if (!FFAppState().firstLogin) {
          _model.getLocationOutput = await GetlocationAPICall.call(
            token: FFAppState().accessToken,
            branch: '',
            apiUrl: FFAppState().apiURLLocalState,
          );
        } else {
          Navigator.pop(context);
          return;
        }

        if ((_model.getLocationOutput?.statusCode ?? 200) != 200) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text(
                    'พบข้อผิดพลาด (${(_model.getLocationOutput?.statusCode ?? 200).toString()})'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          Navigator.pop(context);
          return;
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text(
                  'พบข้อผิดพลาด (${(_model.getDateTimeAPIOutput?.statusCode ?? 200).toString()})'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        Navigator.pop(context);
        return;
      }

      if (GetlocationAPICall.statusLayer2(
            (_model.getLocationOutput?.jsonBody ?? ''),
          ) ==
          200) {
        if (GetlocationAPICall.group(
              (_model.getLocationOutput?.jsonBody ?? ''),
            ).toString() ==
            'ทั่วไป') {
          FFAppState().update(() {
            FFAppState().branchGroup = 'ทั่วไป';
            FFAppState().branchList = (GetlocationAPICall.branchName(
              (_model.getLocationOutput?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList();
            FFAppState().brachGroupNew = 'ทั่วไป';
            FFAppState().brachListNew = (GetlocationAPICall.branchName(
              (_model.getLocationOutput?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList();
          });
          FFAppState().update(() {
            FFAppState().branchLat = (GetlocationAPICall.branchLat(
              (_model.getLocationOutput?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList();
            FFAppState().branchLng = (GetlocationAPICall.branchLong(
              (_model.getLocationOutput?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList();
            FFAppState().brachLatNew = (GetlocationAPICall.branchLat(
              (_model.getLocationOutput?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList();
            FFAppState().brachLngNew = (GetlocationAPICall.branchLong(
              (_model.getLocationOutput?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList();
          });
          FFAppState().update(() {
            FFAppState().branchRad = (GetlocationAPICall.branchRadius(
              (_model.getLocationOutput?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList();
            FFAppState().flag = CheckinoutThisMonthAPICall.flagCheck(
              (_model.checkinoutMonthAPIOutput?.jsonBody ?? ''),
            ).toString();
            FFAppState().BrachRadNew = (GetlocationAPICall.branchRadius(
              (_model.getLocationOutput?.jsonBody ?? ''),
            ) as List)
                .map<String>((s) => s.toString())
                .toList()!
                .toList();
          });
        } else {
          FFAppState().update(() {
            FFAppState().branchGroup = 'กลุ่มภาคเขต';
            FFAppState().flag = CheckinoutThisMonthAPICall.flagCheck(
              (_model.checkinoutMonthAPIOutput?.jsonBody ?? ''),
            ).toString();
            FFAppState().brachGroupNew = 'กลุ่มภาคเขต';
          });
        }

        setState(() {
          FFAppState().firstLogin = true;
        });
        Navigator.pop(context);
      } else {
        if (GetlocationAPICall.statusLayer2(
              (_model.getLocationOutput?.jsonBody ?? ''),
            ) ==
            404) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text('พบข้อผิดพลาด (${GetlocationAPICall.statusLayer2(
                  (_model.getLocationOutput?.jsonBody ?? ''),
                ).toString().toString()}) ไม่พบข้อมูล กรุณาติดต่อ HR'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          Navigator.pop(context);
          return;
        }
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('พบข้อผิดพลาด (${GetlocationAPICall.statusLayer2(
                (_model.getLocationOutput?.jsonBody ?? ''),
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
        Navigator.pop(context);
        return;
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.branchFieldController ??= TextEditingController();
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
        ),
      );
    }

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
                Icons.arrow_back,
                color: Colors.white,
                size: 40.0,
              ),
            ),
            title: Text(
              functions.checkInTextBtn(FFAppState().flag),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    HapticFeedback.mediumImpact();
                    final selectedMedia = await selectMedia(
                      maxWidth: 1000.00,
                      maxHeight: 1000.00,
                      imageQuality: 70,
                      multiImage: false,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isDataUploading1 = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];
                      var downloadUrls = <String>[];
                      try {
                        showUploadMessage(
                          context,
                          'Uploading file...',
                          showLoading: true,
                        );
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        _model.isDataUploading1 = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile1 =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl1 = downloadUrls.first;
                        });
                        showUploadMessage(context, 'Success!');
                      } else {
                        setState(() {});
                        showUploadMessage(context, 'Failed to upload data');
                        return;
                      }
                    }

                    if (!(_model.uploadedFileUrl1 != null &&
                        _model.uploadedFileUrl1 != '')) {
                      return;
                    }
                    FFAppState().update(() {
                      FFAppState().imgURLTemp = _model.uploadedFileUrl1;
                    });
                  },
                  child: FaIcon(
                    FontAwesomeIcons.camera,
                    color: Color(0xFBFFFFFF),
                    size: 40.0,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiary400,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.035,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: SelectionArea(
                              child: Text(
                            FFAppState().currentDate,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0,
                                ),
                          )),
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.035,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: SelectionArea(
                              child: Text(
                            FFAppState().currentTime,
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0,
                                ),
                          )),
                        ),
                        Wrap(
                          spacing: 0.0,
                          runSpacing: 0.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Visibility(
                              visible: FFAppState().brachGroupNew == 'ทั่วไป',
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: SelectionArea(
                                            child: Text(
                                          'เลือก:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 16.0,
                                              ),
                                        )),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .branchDropDownValueController ??=
                                              FormFieldController<String>(null),
                                          options: FFAppState()
                                              .brachListNew
                                              .toList(),
                                          onChanged: (val) async {
                                            setState(() => _model
                                                .branchDropDownValue = val);
                                            FFAppState().update(() {
                                              FFAppState().branchLo =
                                                  functions.getLatLngBranch(
                                                      _model
                                                          .branchDropDownValue,
                                                      FFAppState()
                                                          .brachLatNew
                                                          .toList(),
                                                      FFAppState()
                                                          .brachLngNew
                                                          .toList(),
                                                      FFAppState()
                                                          .brachListNew
                                                          .toList());
                                              FFAppState().currentRadius =
                                                  functions.getCurrentRadius(
                                                      _model
                                                          .branchDropDownValue,
                                                      FFAppState()
                                                          .brachListNew
                                                          .toList(),
                                                      FFAppState()
                                                          .BrachRadNew
                                                          .toList());
                                              FFAppState().branchLatDouble =
                                                  functions.getLatLngBranchDouble(
                                                      _model
                                                          .branchDropDownValue,
                                                      FFAppState()
                                                          .brachLatNew
                                                          .toList(),
                                                      FFAppState()
                                                          .brachListNew
                                                          .toList());
                                              FFAppState().branchLngDouble =
                                                  functions.getLatLngBranchDouble(
                                                      _model
                                                          .branchDropDownValue,
                                                      FFAppState()
                                                          .brachLngNew
                                                          .toList(),
                                                      FFAppState()
                                                          .brachListNew
                                                          .toList());
                                            });
                                            FFAppState().update(() {
                                              FFAppState().branchLoString =
                                                  _model.branchDropDownValue!;
                                            });
                                          },
                                          width: 180.0,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.black,
                                                  ),
                                          hintText: 'กรุณาเลือกสาขาที่อยู่',
                                          fillColor: Colors.white,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 0.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        icon: Icon(
                                          Icons.refresh,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Color(0x00000000),
                                            enableDrag: false,
                                            context: context,
                                            builder: (bottomSheetContext) {
                                              return GestureDetector(
                                                onTap: () => FocusScope.of(
                                                        context)
                                                    .requestFocus(_unfocusNode),
                                                child: Padding(
                                                  padding: MediaQuery.of(
                                                          bottomSheetContext)
                                                      .viewInsets,
                                                  child: LoadingSceneWidget(),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));

                                          setState(() {
                                            FFAppState().firstLogin = false;
                                          });
                                          if (!FFAppState().firstLogin) {
                                            _model.getLocationOutput2 =
                                                await GetlocationAPICall.call(
                                              token: FFAppState().accessToken,
                                              branch: '',
                                              apiUrl:
                                                  FFAppState().apiURLLocalState,
                                            );
                                            _shouldSetState = true;
                                          } else {
                                            Navigator.pop(context);
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }

                                          if ((_model.getLocationOutput2
                                                      ?.statusCode ??
                                                  200) !=
                                              200) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'พบข้อผิดพลาด (${(_model.getLocationOutput2?.statusCode ?? 200).toString()})'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            Navigator.pop(context);
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                          if (GetlocationAPICall.statusLayer2(
                                                (_model.getLocationOutput2
                                                        ?.jsonBody ??
                                                    ''),
                                              ) ==
                                              200) {
                                            if (GetlocationAPICall.group(
                                                  (_model.getLocationOutput2
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString() ==
                                                'ทั่วไป') {
                                              FFAppState().update(() {
                                                FFAppState().brachGroupNew =
                                                    'ทั่วไป';
                                                FFAppState().brachListNew =
                                                    (GetlocationAPICall
                                                            .branchName(
                                                  (_model.getLocationOutput2
                                                          ?.jsonBody ??
                                                      ''),
                                                ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()!
                                                        .toList();
                                              });
                                              FFAppState().update(() {
                                                FFAppState().brachLatNew =
                                                    (GetlocationAPICall
                                                            .branchLat(
                                                  (_model.getLocationOutput2
                                                          ?.jsonBody ??
                                                      ''),
                                                ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()!
                                                        .toList();
                                                FFAppState().brachLngNew =
                                                    (GetlocationAPICall
                                                            .branchLong(
                                                  (_model.getLocationOutput2
                                                          ?.jsonBody ??
                                                      ''),
                                                ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()!
                                                        .toList();
                                              });
                                              FFAppState().update(() {
                                                FFAppState().branchRad =
                                                    (GetlocationAPICall
                                                            .branchRadius(
                                                  (_model.getLocationOutput2
                                                          ?.jsonBody ??
                                                      ''),
                                                ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()!
                                                        .toList();
                                              });
                                            } else {
                                              FFAppState().update(() {
                                                FFAppState().brachGroupNew =
                                                    'กลุ่มภาคเขต';
                                              });
                                            }

                                            setState(() {
                                              FFAppState().firstLogin = true;
                                            });
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'โหลดข้อมูลสาขาเรียบร้อย'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            Navigator.pop(context);
                                          } else {
                                            if (GetlocationAPICall.statusLayer2(
                                                  (_model.getLocationOutput2
                                                          ?.jsonBody ??
                                                      ''),
                                                ) ==
                                                404) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'พบข้อผิดพลาด (${GetlocationAPICall.statusLayer2(
                                                      (_model.getLocationOutput2
                                                              ?.jsonBody ??
                                                          ''),
                                                    ).toString()}) ไม่พบข้อมูล กรุณาติดต่อ HR'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              Navigator.pop(context);
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'พบข้อผิดพลาด (${GetlocationAPICall.statusLayer2(
                                                    (_model.getLocationOutput2
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString()})'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            Navigator.pop(context);
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }

                                          if (_shouldSetState) setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible:
                                  FFAppState().brachGroupNew == 'กลุ่มภาคเขต',
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'ค้นหา:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Autocomplete<String>(
                                            initialValue: TextEditingValue(),
                                            optionsBuilder: (textEditingValue) {
                                              if (textEditingValue.text == '') {
                                                return const Iterable<
                                                    String>.empty();
                                              }
                                              return <String>[].where((option) {
                                                final lowercaseOption =
                                                    option.toLowerCase();
                                                return lowercaseOption.contains(
                                                    textEditingValue.text
                                                        .toLowerCase());
                                              });
                                            },
                                            optionsViewBuilder:
                                                (context, onSelected, options) {
                                              return AutocompleteOptionsList(
                                                textFieldKey:
                                                    _model.branchFieldKey,
                                                textController: _model
                                                    .branchFieldController!,
                                                options: options.toList(),
                                                onSelected: onSelected,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                textHighlightStyle: TextStyle(),
                                                elevation: 4.0,
                                                optionBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                optionHighlightColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                maxHeight: 200.0,
                                              );
                                            },
                                            onSelected: (String selection) {
                                              setState(() => _model
                                                      .branchFieldSelectedOption =
                                                  selection);
                                              FocusScope.of(context).unfocus();
                                            },
                                            fieldViewBuilder: (
                                              context,
                                              textEditingController,
                                              focusNode,
                                              onEditingComplete,
                                            ) {
                                              _model.branchFieldController =
                                                  textEditingController;
                                              return TextFormField(
                                                key: _model.branchFieldKey,
                                                controller:
                                                    textEditingController,
                                                focusNode: focusNode,
                                                onEditingComplete:
                                                    onEditingComplete,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'กรุณาใส่สาขาที่อยู่',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 18.0,
                                                        ),
                                                textAlign: TextAlign.start,
                                                validator: _model
                                                    .branchFieldControllerValidator
                                                    .asValidator(context),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 60.0,
                                          icon: Icon(
                                            Icons.search,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            var _shouldSetState = false;
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Color(0x00000000),
                                              context: context,
                                              builder: (bottomSheetContext) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              _unfocusNode),
                                                  child: Padding(
                                                    padding: MediaQuery.of(
                                                            bottomSheetContext)
                                                        .viewInsets,
                                                    child: LoadingSceneWidget(),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));

                                            if (_model.branchFieldController
                                                        .text ==
                                                    null ||
                                                _model.branchFieldController
                                                        .text ==
                                                    '') {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'กรุณากรอกสาขาที่อยู่'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              Navigator.pop(context);
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                            _model.findLocationOutput =
                                                await GetlocationAPICall.call(
                                              token: FFAppState().accessToken,
                                              branch: _model
                                                  .branchFieldController.text,
                                              apiUrl:
                                                  FFAppState().apiURLLocalState,
                                            );
                                            _shouldSetState = true;
                                            if (GetlocationAPICall.statusLayer3(
                                                  (_model.findLocationOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                ) ==
                                                404) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'กรุณาใส่สาขาที่อยู่'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            } else {
                                              if (GetlocationAPICall
                                                      .statusLayer2(
                                                    (_model.findLocationOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  404) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'ไม่พบสาขาที่ท่านกรอก'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              } else {
                                                FFAppState().update(() {
                                                  FFAppState().branchList =
                                                      (GetlocationAPICall
                                                              .branchName(
                                                    (_model.findLocationOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()!
                                                          .toList();
                                                  FFAppState().branchLat =
                                                      (GetlocationAPICall
                                                              .branchLat(
                                                    (_model.findLocationOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()!
                                                          .toList();
                                                  FFAppState().brachListNew =
                                                      (GetlocationAPICall
                                                              .branchName(
                                                    (_model.findLocationOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()!
                                                          .toList();
                                                  FFAppState().brachLatNew =
                                                      (GetlocationAPICall
                                                              .branchLat(
                                                    (_model.findLocationOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()!
                                                          .toList();
                                                });
                                                FFAppState().update(() {
                                                  FFAppState().branchLng =
                                                      (GetlocationAPICall
                                                              .branchLong(
                                                    (_model.findLocationOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()!
                                                          .toList();
                                                  FFAppState().branchRad =
                                                      (GetlocationAPICall
                                                              .branchRadius(
                                                    (_model.findLocationOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()!
                                                          .toList();
                                                  FFAppState().brachLngNew =
                                                      (GetlocationAPICall
                                                              .branchLong(
                                                    (_model.findLocationOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()!
                                                          .toList();
                                                  FFAppState().BrachRadNew =
                                                      (GetlocationAPICall
                                                              .branchRadius(
                                                    (_model.findLocationOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()!
                                                          .toList();
                                                });
                                              }
                                            }

                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'โหลดข้อมูลสาขาเรียบร้อย'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            Navigator.pop(context);
                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible:
                                  FFAppState().brachGroupNew == 'กลุ่มภาคเขต',
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: SelectionArea(
                                            child: Text(
                                          'เลือก:',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 16.0,
                                              ),
                                        )),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController ??=
                                              FormFieldController<String>(null),
                                          options: FFAppState()
                                              .brachListNew
                                              .toList(),
                                          onChanged: (val) async {
                                            setState(() =>
                                                _model.dropDownValue = val);
                                            FFAppState().update(() {
                                              FFAppState().branchLo =
                                                  functions.getLatLngBranch(
                                                      _model.dropDownValue,
                                                      FFAppState()
                                                          .branchLat
                                                          .toList(),
                                                      FFAppState()
                                                          .branchLng
                                                          .toList(),
                                                      FFAppState()
                                                          .branchList
                                                          .toList());
                                              FFAppState().currentRadius =
                                                  functions.getCurrentRadius(
                                                      _model.dropDownValue,
                                                      FFAppState()
                                                          .branchList
                                                          .toList(),
                                                      FFAppState()
                                                          .branchRad
                                                          .toList());
                                              FFAppState().branchLatDouble =
                                                  functions
                                                      .getLatLngBranchDouble(
                                                          _model.dropDownValue,
                                                          FFAppState()
                                                              .branchLat
                                                              .toList(),
                                                          FFAppState()
                                                              .branchList
                                                              .toList());
                                              FFAppState().branchLngDouble =
                                                  functions
                                                      .getLatLngBranchDouble(
                                                          _model.dropDownValue,
                                                          FFAppState()
                                                              .branchLng
                                                              .toList(),
                                                          FFAppState()
                                                              .branchList
                                                              .toList());
                                            });
                                            FFAppState().update(() {
                                              FFAppState().branchLoString =
                                                  _model.dropDownValue!;
                                            });
                                          },
                                          width: 180.0,
                                          height: 50.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.black,
                                                  ),
                                          hintText: 'กรุณาเลือกสาขาที่อยู่',
                                          fillColor: Colors.white,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 0.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: responsiveVisibility(
                                context: context,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 20.0, 10.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 285.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-9.01, -5.1),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      valueOrDefault<String>(
                                                        FFAppState().imgURLTemp,
                                                        'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                      ),
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag: valueOrDefault<String>(
                                                      FFAppState().imgURLTemp,
                                                      'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                    ),
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: valueOrDefault<String>(
                                                FFAppState().imgURLTemp,
                                                'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                              ),
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    FFAppState().imgURLTemp,
                                                    'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                  ),
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (_model.uploadedFileUrl1 != null &&
                                          _model.uploadedFileUrl1 != '')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 20.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  'คุณต้องการจะลบรูปหรือไม่?'),
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
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (!confirmDialogResponse) {
                                                  return;
                                                }
                                                FFAppState().update(() {
                                                  FFAppState().imgURLTemp =
                                                      'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
                                                });
                                              },
                                              child: FaIcon(
                                                FontAwesomeIcons.times,
                                                color: Color(0xFFDE1013),
                                                size: 30.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (FFAppState().imgURLTemp ==
                                          'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Text(
                                              'กรุณากดถ่ายรูปขวาบน',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: responsiveVisibility(
                                context: context,
                                phone: false,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 20.0, 10.0),
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-9.01, -5.1),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      valueOrDefault<String>(
                                                        FFAppState().imgURLTemp,
                                                        'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                      ),
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag: valueOrDefault<String>(
                                                      FFAppState().imgURLTemp,
                                                      'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                    ),
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: valueOrDefault<String>(
                                                FFAppState().imgURLTemp,
                                                'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                              ),
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    FFAppState().imgURLTemp,
                                                    'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74',
                                                  ),
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (_model.uploadedFileUrl1 != null &&
                                          _model.uploadedFileUrl1 != '')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 20.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  'คุณต้องการจะลบรูปหรือไม่?'),
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
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (!confirmDialogResponse) {
                                                  return;
                                                }
                                                FFAppState().update(() {
                                                  FFAppState().imgURLTemp =
                                                      'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
                                                });
                                              },
                                              child: FaIcon(
                                                FontAwesomeIcons.times,
                                                color: Color(0xFFDE1013),
                                                size: 30.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (FFAppState().imgURLTemp ==
                                          'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Text(
                                              'กรุณากดถ่ายรูปขวาบน',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 18.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: custom_widgets.DrawCircleMap(
                                width: double.infinity,
                                height: double.infinity,
                                latitude: FFAppState().branchLatDouble,
                                longitude: FFAppState().branchLngDouble,
                                radiusLo: FFAppState().currentRadius,
                                currentLoLat: valueOrDefault<double>(
                                  functions.currentLatLngDouble(
                                      currentUserLocationValue, true),
                                  0.0,
                                ),
                                currentLoLng: valueOrDefault<double>(
                                  functions.currentLatLngDouble(
                                      currentUserLocationValue, false),
                                  0.0,
                                ),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  100.0, 0.0, 100.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  currentUserLocationValue =
                                      await getCurrentUserLocation(
                                          defaultLocation: LatLng(0.0, 0.0));
                                  var _shouldSetState = false;
                                  HapticFeedback.mediumImpact();
                                  if (!(FFAppState().branchLoString != null &&
                                      FFAppState().branchLoString != '')) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content:
                                              Text('กรุณาเลือกสาขาก่อนบันทึก'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  if (FFAppState().imgURLTemp !=
                                      'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74') {
                                    if (FFAppState().imgURLTemp !=
                                        'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74') {
                                      _model.inCurrentLocation =
                                          await actions.locationCal(
                                        FFAppState().branchLo,
                                        currentUserLocationValue,
                                        FFAppState().currentRadius,
                                      );
                                      _shouldSetState = true;
                                      if (_model.inCurrentLocation != true) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'คุณไม่อยู่ในพื้นที่เช็คอิน'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                                'กรุณาถ่ายรูปก่อนกดเช็คอิน'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'คุณต้องการบันทึกข้อมูลใช่หรือไม่'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('ไม่'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('ใช่'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (!confirmDialogResponse) {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content:
                                              Text('กรุณาถ่ายรูปก่อนกดเช็คอิน'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    final selectedMedia = await selectMedia(
                                      maxWidth: 1000.00,
                                      maxHeight: 1000.00,
                                      imageQuality: 70,
                                      multiImage: false,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading2 = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];
                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading2 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile2 =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl2 =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload data');
                                        return;
                                      }
                                    }

                                    if (!(_model.uploadedFileUrl2 != null &&
                                        _model.uploadedFileUrl2 != '')) {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    FFAppState().update(() {
                                      FFAppState().imgURLTemp =
                                          _model.uploadedFileUrl2;
                                    });
                                    _model.inCurrentLocation2 =
                                        await actions.locationCal(
                                      FFAppState().branchLo,
                                      currentUserLocationValue,
                                      FFAppState().currentRadius,
                                    );
                                    _shouldSetState = true;
                                    if (_model.inCurrentLocation2 != true) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                                'คุณไม่อยู่ในพื้นที่เช็คอิน'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'คุณต้องการบันทึกข้อมูลใช่หรือไม่'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('ไม่'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('ใช่'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (!confirmDialogResponse) {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                  }

                                  _model.checkGPSBeforeSave = await actions.a8(
                                    currentUserLocationValue,
                                  );
                                  _shouldSetState = true;
                                  if (_model.checkGPSBeforeSave!) {
                                    _model.checkinAPIOutput =
                                        await CheckinAPICall.call(
                                      apiUrl: FFAppState().apiURLLocalState,
                                      latitude: functions.userLatitude(
                                          currentUserLocationValue),
                                      longitude: functions.userLongitude(
                                          currentUserLocationValue),
                                      branch: FFAppState().branchLoString,
                                      token: FFAppState().accessToken,
                                      urlImg: _model.uploadedFileUrl1 != null &&
                                              _model.uploadedFileUrl1 != ''
                                          ? functions.imgPathtoString(
                                              _model.uploadedFileUrl1)
                                          : functions.imgPathtoString(
                                              _model.uploadedFileUrl2),
                                    );
                                    _shouldSetState = true;
                                    if ((_model.checkinAPIOutput?.statusCode ??
                                            200) !=
                                        200) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด (${(_model.checkinAPIOutput?.statusCode ?? 200).toString()})'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                    if (CheckinAPICall.statusLayer2(
                                          (_model.checkinAPIOutput?.jsonBody ??
                                              ''),
                                        ) !=
                                        201) {
                                      if (CheckinAPICall.statusLayer2(
                                            (_model.checkinAPIOutput
                                                    ?.jsonBody ??
                                                ''),
                                          ) !=
                                          200) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'พบข้อผิดพลาด (${CheckinAPICall.statusLayer2(
                                                (_model.checkinAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString()})message (${CheckinAPICall.checkinMessage(
                                                (_model.checkinAPIOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString()})'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text(
                                              'กรุณาเปิด GPS แล้วทำรายการอีกครั้ง'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  FFAppState().update(() {
                                    FFAppState().imgURLTemp =
                                        'https://firebasestorage.googleapis.com/v0/b/flut-flow-test.appspot.com/o/blank-profile-picture-gc19a78ed8_1280.png?alt=media&token=4189e142-826e-4b26-b278-914c39bfac74';
                                  });

                                  context.goNamed(
                                    'SuccessCheckinPage',
                                    queryParams: {
                                      'checkinPhoto': serializeParam(
                                        FFAppState().imgURLTemp,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );

                                  if (_shouldSetState) setState(() {});
                                },
                                text:
                                    functions.checkInTextBtn(FFAppState().flag),
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: functions.checkinColorBtn(
                                      FFAppState().flag,
                                      Color(0xFF39EF44),
                                      Color(0xFFF30000)),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation2']!),
                ),
              ],
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
          ),
        ),
      ),
    );
  }
}
