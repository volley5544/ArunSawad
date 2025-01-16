import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'tracking_emp_page_model.dart';
export 'tracking_emp_page_model.dart';

class TrackingEmpPageWidget extends StatefulWidget {
  const TrackingEmpPageWidget({
    super.key,
    required this.listLatLng,
  });

  final List<LatLng>? listLatLng;

  @override
  State<TrackingEmpPageWidget> createState() => _TrackingEmpPageWidgetState();
}

class _TrackingEmpPageWidgetState extends State<TrackingEmpPageWidget> {
  late TrackingEmpPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackingEmpPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'trackingEmpPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: LoadingSceneWidget(),
              ),
            ),
          );
        },
      );

      _model.apiSearchOutput = await APIUsersRegionCall.call(
        branchCode: 'HO',
      );

      Navigator.pop(context);
    });

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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
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
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 24.0,
                ),
              ),
              title: Text(
                'Tracking employee',
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(null),
                      options: APIUsersRegionCall.fullprofile(
                        (_model.apiSearchOutput?.jsonBody ?? ''),
                      )!,
                      onChanged: (val) =>
                          safeSetState(() => _model.dropDownValue = val),
                      width: 200.0,
                      height: 40.0,
                      searchHintTextStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.0,
                              ),
                      searchTextStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.0,
                              ),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Select...',
                      searchHintText: 'Search...',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: Colors.transparent,
                      borderWidth: 0.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: true,
                      isMultiSelect: false,
                    ),
                  ),
                  Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (kIsWeb) {
                          final _datePickedDate = await showDatePicker(
                            context: context,
                            initialDate: getCurrentTimestamp,
                            firstDate: DateTime(1900),
                            lastDate: getCurrentTimestamp,
                            builder: (context, child) {
                              return wrapInMaterialDatePickerTheme(
                                context,
                                child!,
                                headerBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                headerForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                headerTextStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                pickerBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                pickerForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                selectedDateTimeBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                selectedDateTimeForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                actionButtonForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 24.0,
                              );
                            },
                          );

                          if (_datePickedDate != null) {
                            safeSetState(() {
                              _model.datePicked = DateTime(
                                _datePickedDate.year,
                                _datePickedDate.month,
                                _datePickedDate.day,
                              );
                            });
                          }
                        } else {
                          await DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              safeSetState(() {
                                _model.datePicked = date;
                              });
                            },
                            currentTime: getCurrentTimestamp,
                            minTime: DateTime(0, 0, 0),
                            maxTime: getCurrentTimestamp,
                            locale: LocaleType.values.firstWhere(
                              (l) =>
                                  l.name ==
                                  FFLocalizations.of(context).languageCode,
                              orElse: () => LocaleType.en,
                            ),
                          );
                        }

                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: WebViewAware(
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScope.of(dialogContext).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: LoadingSceneWidget(),
                                ),
                              ),
                            );
                          },
                        );

                        _model.trackerOutput =
                            await APIUserLocationTrackerCall.call();

                        FFAppState().listlocations = functions
                            .makeLatLngList(
                                APIUserLocationTrackerCall.latitude(
                                  (_model.trackerOutput?.jsonBody ?? ''),
                                )?.toList(),
                                APIUserLocationTrackerCall.longitude(
                                  (_model.trackerOutput?.jsonBody ?? ''),
                                )?.toList())!
                            .toList()
                            .cast<LatLng>();
                        safeSetState(() {});
                        Navigator.pop(context);

                        safeSetState(() {});
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            _model.datePicked != null
                                ? dateTimeFormat(
                                    "yMd",
                                    _model.datePicked,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )
                                : 'กรุณาเลือกวันต้องการหมู',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: (_model.trackerOutput?.statusCode ?? 200) == 200,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: custom_widgets.PolylineExample(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          locations: FFAppState().listlocations,
                        ),
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
  }
}
