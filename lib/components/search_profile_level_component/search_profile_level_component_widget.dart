import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_streaming.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:convert';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_profile_level_component_model.dart';
export 'search_profile_level_component_model.dart';

class SearchProfileLevelComponentWidget extends StatefulWidget {
  const SearchProfileLevelComponentWidget({super.key});

  @override
  State<SearchProfileLevelComponentWidget> createState() =>
      _SearchProfileLevelComponentWidgetState();
}

class _SearchProfileLevelComponentWidgetState
    extends State<SearchProfileLevelComponentWidget> {
  late SearchProfileLevelComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchProfileLevelComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x25090F13),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 44.0,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ค้นหาเขต/ภาค ที่ต้องการจะดูข้อมูล',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                'กรุณากรอกข้อมูลเพื่อเลือกพนักงานที่ต้องการจะดูข้อมูล',
                                'กรุณากรอกข้อมูลเพื่อเลือกพนักงานที่ต้องการจะดูข้อมูล',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 24.0,
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.format_list_bulleted,
                                  color: Colors.black,
                                  size: 29.0,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'ประเภทสังกัด',
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
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Builder(
                                  builder: (context) =>
                                      FlutterFlowDropDown<String>(
                                    controller: _model
                                            .areaRegionDropDownValueController ??=
                                        FormFieldController<String>(
                                      _model.areaRegionDropDownValue ??= '',
                                    ),
                                    options: List<String>.from(['ภาค']),
                                    optionLabels: ['ภาค'],
                                    onChanged: (val) async {
                                      safeSetState(() =>
                                          _model.areaRegionDropDownValue = val);
                                      HapticFeedback.mediumImpact();
                                      showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: Container(
                                                height: double.infinity,
                                                child: LoadingSceneWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      _model.getRegion =
                                          await GetRegionAreaAPICall.call(
                                        token: FFAppState().accessToken,
                                        apiUrl: FFAppState().apiURLLocalState,
                                        branchType: 'ภาค',
                                      );

                                      Navigator.pop(context);

                                      safeSetState(() {});
                                    },
                                    width: 180.0,
                                    height: 50.0,
                                    textStyle: FlutterFlowTheme.of(context)
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
                                          color: Colors.black,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'สังกัด...',
                                    fillColor: Colors.white,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 0.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if ((_model.areaRegionDropDownValue != null &&
                              _model.areaRegionDropDownValue != '') &&
                          ('${GetRegionAreaAPICall.statusLayer2(
                                (_model.getRegion?.jsonBody ?? ''),
                              )?.toString()}' ==
                              '200'))
                        Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.home_work_outlined,
                                    color: Colors.black,
                                    size: 29.0,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'เลือก:',
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
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model
                                            .areaRegionSelectedDropDownValueController ??=
                                        FormFieldController<String>(
                                      _model.areaRegionSelectedDropDownValue ??=
                                          '',
                                    ),
                                    options: List<String>.from(
                                        _model.areaRegionDropDownValue == 'เขต'
                                            ? GetRegionAreaAPICall.areaCode(
                                                (_model.getRegion?.jsonBody ??
                                                    ''),
                                              )!
                                                .map((e) => e.toString())
                                                .toList()
                                            : GetRegionAreaAPICall.regionCode(
                                                (_model.getRegion?.jsonBody ??
                                                    ''),
                                              )!),
                                    optionLabels:
                                        _model.areaRegionDropDownValue == 'เขต'
                                            ? functions.getRegionAreaNameCode(
                                                GetRegionAreaAPICall.areaName(
                                                  (_model.getRegion?.jsonBody ??
                                                      ''),
                                                )
                                                    ?.map((e) => e.toString())
                                                    .toList()
                                                    ?.toList(),
                                                GetRegionAreaAPICall.areaCode(
                                                  (_model.getRegion?.jsonBody ??
                                                      ''),
                                                )
                                                    ?.map((e) => e.toString())
                                                    .toList()
                                                    ?.toList())
                                            : functions.getRegionAreaNameCode(
                                                GetRegionAreaAPICall.regionName(
                                                  (_model.getRegion?.jsonBody ??
                                                      ''),
                                                )?.toList(),
                                                GetRegionAreaAPICall.regionCode(
                                                  (_model.getRegion?.jsonBody ??
                                                      ''),
                                                )?.toList()),
                                    onChanged: (val) => safeSetState(() =>
                                        _model.areaRegionSelectedDropDownValue =
                                            val),
                                    searchHintTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                    searchTextStyle:
                                        FlutterFlowTheme.of(context)
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
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                    textStyle: FlutterFlowTheme.of(context)
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
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'เลือกเขต/ภาค...',
                                    searchHintText: 'ค้นหา...',
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 0.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: true,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Divider(
                        thickness: 1.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Visibility(
                            visible: (_model.areaRegionSelectedDropDownValue !=
                                        null &&
                                    _model.areaRegionSelectedDropDownValue !=
                                        '') &&
                                ('${GetRegionAreaAPICall.statusLayer2(
                                      (_model.getRegion?.jsonBody ?? ''),
                                    )?.toString()}' ==
                                    '200'),
                            child: FutureBuilder<List<UrlLinkStorageRecord>>(
                              future: queryUrlLinkStorageRecordOnce(
                                queryBuilder: (urlLinkStorageRecord) =>
                                    urlLinkStorageRecord.where(
                                  'url_name',
                                  isEqualTo: 'tableau_ceo_url_link',
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
                                          FlutterFlowTheme.of(context).tertiary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<UrlLinkStorageRecord>
                                    iconButtonUrlLinkStorageRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final iconButtonUrlLinkStorageRecord =
                                    iconButtonUrlLinkStorageRecordList
                                            .isNotEmpty
                                        ? iconButtonUrlLinkStorageRecordList
                                            .first
                                        : null;

                                return FlutterFlowIconButton(
                                  borderColor: Colors.black,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: Color(0xFF213BFF),
                                  icon: Icon(
                                    Icons.search_sharp,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  onPressed: () async {
                                    HapticFeedback.mediumImpact();
                                    if (!(_model.areaRegionSelectedDropDownValue !=
                                            null &&
                                        _model.areaRegionSelectedDropDownValue !=
                                            '')) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'กรุณาเลือกเขต/ภาค ที่ต้องการจะดูข้อมูล'),
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
                                      return;
                                    }
                                    Navigator.pop(context, <String, String?>{
                                      'level': _model.areaRegionDropDownValue,
                                      'branchCode': _model
                                          .areaRegionSelectedDropDownValue,
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
