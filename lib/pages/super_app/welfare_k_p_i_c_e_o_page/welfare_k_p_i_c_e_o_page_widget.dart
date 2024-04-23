import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'welfare_k_p_i_c_e_o_page_model.dart';
export 'welfare_k_p_i_c_e_o_page_model.dart';

class WelfareKPICEOPageWidget extends StatefulWidget {
  const WelfareKPICEOPageWidget({super.key});

  @override
  State<WelfareKPICEOPageWidget> createState() =>
      _WelfareKPICEOPageWidgetState();
}

class _WelfareKPICEOPageWidgetState extends State<WelfareKPICEOPageWidget> {
  late WelfareKPICEOPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelfareKPICEOPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'WelfareKPICEOPage'});
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
                child: Container(
                  height: double.infinity,
                  child: LoadingSceneWidget(),
                ),
              ),
            ),
          );
        },
      ).then((value) => safeSetState(() {}));

      if (isAndroid) {
        await actions.allowScreenRecordAndroid();
      } else {
        await actions.allowScreenRecordIOS();
      }

      var userLogRecordReference = UserLogRecord.collection.doc();
      await userLogRecordReference.set(createUserLogRecordData(
        employeeId: FFAppState().employeeID,
        action: 'KPI_Welfare',
        actionTime: getCurrentTimestamp,
        userLocation: currentUserLocationValue,
      ));
      _model.createdUserLogWelfareKPI = UserLogRecord.getDocumentFromData(
          createUserLogRecordData(
            employeeId: FFAppState().employeeID,
            action: 'KPI_Welfare',
            actionTime: getCurrentTimestamp,
            userLocation: currentUserLocationValue,
          ),
          userLogRecordReference);
      _model.getServerDateTime = await GetDateTimeAPICall.call(
        apiUrl: FFAppState().apiURLLocalState,
        token: FFAppState().accessToken,
      );
      _model.getArea = await GetRegionAreaAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
        branchType: 'เขต',
      );
      _model.getRegion = await GetRegionAreaAPICall.call(
        token: FFAppState().accessToken,
        apiUrl: FFAppState().apiURLLocalState,
        branchType: 'ภาค',
      );
      Navigator.pop(context);
    });

    _model.branchInputTextController ??= TextEditingController();

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
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: Color(0xFFFF6500),
            automaticallyImplyLeading: false,
            leading: Visibility(
              visible: !FFAppState().isFromTimesheetPage,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.goNamed('SuperAppPage');
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFBFFFFFF),
                  size: 30.0,
                ),
              ),
            ),
            title: Text(
              'ยอดจัดสาขา',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
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
                Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
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
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController1 ??=
                                FormFieldController<String>(null),
                            options: ['สาขา', 'เขต', 'ภาค'],
                            onChanged: (val) async {
                              setState(() => _model.dropDownValue1 = val);
                              HapticFeedback.mediumImpact();
                            },
                            width: 180.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'สังกัด...',
                            fillColor: Colors.white,
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 0.0,
                            borderRadius: 0.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 12.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_model.dropDownValue1 != null &&
                    _model.dropDownValue1 != '')
                  Container(
                    width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
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
                            child: Text(
                              'ค้นหาสาขา:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Autocomplete<String>(
                              initialValue: TextEditingValue(),
                              optionsBuilder: (textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                return (_model.dropDownValue1 == 'เขต'
                                        ? functions.getRegionAreaNameCode(
                                            GetRegionAreaAPICall.areaName(
                                              (_model.getArea?.jsonBody ?? ''),
                                            )
                                                ?.map((e) => e.toString())
                                                .toList()
                                                ?.toList(),
                                            GetRegionAreaAPICall.areaCode(
                                              (_model.getArea?.jsonBody ?? ''),
                                            )
                                                ?.map((e) => e.toString())
                                                .toList()
                                                ?.toList())
                                        : (_model.dropDownValue1 == 'ภาค'
                                            ? functions.getRegionAreaNameCode(
                                                GetRegionAreaAPICall.regionName(
                                                  (_model.getRegion?.jsonBody ??
                                                      ''),
                                                )?.toList(),
                                                GetRegionAreaAPICall.regionCode(
                                                  (_model.getRegion?.jsonBody ??
                                                      ''),
                                                )?.toList())
                                            : FFAppState().materialNameList))
                                    .where((option) {
                                  final lowercaseOption = option.toLowerCase();
                                  return lowercaseOption.contains(
                                      textEditingValue.text.toLowerCase());
                                });
                              },
                              optionsViewBuilder:
                                  (context, onSelected, options) {
                                return AutocompleteOptionsList(
                                  textFieldKey: _model.branchInputKey,
                                  textController:
                                      _model.branchInputTextController!,
                                  options: options.toList(),
                                  onSelected: onSelected,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        letterSpacing: 0.0,
                                      ),
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
                                    .branchInputSelectedOption = selection);
                                FocusScope.of(context).unfocus();
                              },
                              fieldViewBuilder: (
                                context,
                                textEditingController,
                                focusNode,
                                onEditingComplete,
                              ) {
                                _model.branchInputFocusNode = focusNode;

                                _model.branchInputTextController =
                                    textEditingController;
                                return TextFormField(
                                  key: _model.branchInputKey,
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onEditingComplete: onEditingComplete,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'กรอกรหัสสาขา/ชื่อสาขา',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                  textAlign: TextAlign.start,
                                  validator: _model
                                      .branchInputTextControllerValidator
                                      .asValidator(context),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: FlutterFlowIconButton(
                              borderColor: Colors.black,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 35.0,
                              fillColor: Color(0xFF213BFF),
                              icon: Icon(
                                Icons.search_rounded,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              onPressed: () async {
                                var _shouldSetState = false;
                                HapticFeedback.mediumImpact();
                                if (!(_model.branchInputTextController.text !=
                                        null &&
                                    _model.branchInputTextController.text !=
                                        '')) {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                        child: AlertDialog(
                                          content: Text(
                                              'กรุณากรอกรหัสสาขา/ชื่อสาขา ที่ต้องการจะค้นหา'),
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
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                                if (_model.dropDownValue1 == 'สาขา') {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x00000000),
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: double.infinity,
                                              child: LoadingSceneWidget(),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  _model.getBranchSearched =
                                      await GetBranchAPICall.call(
                                    token: FFAppState().accessToken,
                                    branchCode:
                                        _model.branchInputTextController.text,
                                    apiUrl: FFAppState().apiURLLocalState,
                                    type: 'incentive',
                                  );
                                  _shouldSetState = true;
                                  if (!(((_model.getBranchSearched
                                                  ?.statusCode ??
                                              200) ==
                                          200) &&
                                      (GetBranchAPICall.statusLayer2(
                                            (_model.getBranchSearched
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          200))) {
                                    if ((_model.getBranchSearched?.statusCode ??
                                            200) ==
                                        200) {
                                      if (GetBranchAPICall.statusLayer2(
                                            (_model.getBranchSearched
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          404) {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content:
                                                    Text('ไม่พบข้อมูลสาขา'),
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
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                content: Text(
                                                    'พบข้อผิดพลาดLayer2 (${GetBranchAPICall.statusLayer2(
                                                  (_model.getBranchSearched
                                                          ?.jsonBody ??
                                                      ''),
                                                )?.toString()})'),
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
                                      }
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              content: Text(
                                                  'พบข้อผิดพลาดConnection (${(_model.getBranchSearched?.statusCode ?? 200).toString()})'),
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
                                    }
                                  }
                                } else {
                                  if (!functions.checkRegionAreaNameCEOWelfare(
                                      (_model.dropDownValue1 == 'เขต'
                                              ? GetRegionAreaAPICall.areaCode(
                                                  (_model.getArea?.jsonBody ??
                                                      ''),
                                                )
                                                  ?.map((e) => e.toString())
                                                  .toList()
                                              : GetRegionAreaAPICall.regionCode(
                                                  (_model.getRegion?.jsonBody ??
                                                      ''),
                                                ))
                                          ?.toList(),
                                      (_model.dropDownValue1 == 'เขต'
                                              ? functions.getRegionAreaNameCode(
                                                  GetRegionAreaAPICall.areaName(
                                                    (_model.getArea?.jsonBody ??
                                                        ''),
                                                  )
                                                      ?.map((e) => e.toString())
                                                      .toList()
                                                      ?.toList(),
                                                  GetRegionAreaAPICall.areaCode(
                                                    (_model.getArea?.jsonBody ??
                                                        ''),
                                                  )
                                                      ?.map((e) => e.toString())
                                                      .toList()
                                                      ?.toList())
                                              : functions.getRegionAreaNameCode(
                                                  GetRegionAreaAPICall
                                                      .regionName(
                                                    (_model.getRegion
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.toList(),
                                                  GetRegionAreaAPICall
                                                      .regionCode(
                                                    (_model.getRegion
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.toList()))
                                          .toList(),
                                      _model.branchInputTextController.text)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'ไม่พบ เขต/ภาค ที่คุณค้นหา'),
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
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Color(0x00000000),
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: double.infinity,
                                              child: LoadingSceneWidget(),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  _model.getWelfareRegionArea =
                                      await GetWelfareKpiCEOAPICall.call(
                                    token: FFAppState().accessToken,
                                    apiUrl: FFAppState().apiURLLocalState,
                                    branchType: _model.dropDownValue1 == 'เขต'
                                        ? 'area'
                                        : 'region',
                                    branchCode:
                                        functions.getIndexRegionAreaCEOWelfare(
                                            (_model.dropDownValue1 == 'เขต'
                                                    ? GetRegionAreaAPICall
                                                            .areaCode(
                                                        (_model.getArea
                                                                ?.jsonBody ??
                                                            ''),
                                                      )
                                                        ?.map(
                                                            (e) => e.toString())
                                                        .toList()
                                                    : GetRegionAreaAPICall
                                                        .regionCode(
                                                        (_model.getRegion
                                                                ?.jsonBody ??
                                                            ''),
                                                      ))
                                                ?.toList(),
                                            (_model.dropDownValue1 == 'เขต'
                                                    ? functions
                                                        .getRegionAreaNameCode(
                                                            GetRegionAreaAPICall
                                                                    .areaName(
                                                              (_model.getArea
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                                ?.map((e) => e
                                                                    .toString())
                                                                .toList()
                                                                ?.toList(),
                                                            GetRegionAreaAPICall
                                                                    .areaCode(
                                                              (_model.getArea
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                                ?.map((e) => e
                                                                    .toString())
                                                                .toList()
                                                                ?.toList())
                                                    : functions
                                                        .getRegionAreaNameCode(
                                                            GetRegionAreaAPICall
                                                                .regionName(
                                                              (_model.getRegion
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )?.toList(),
                                                            GetRegionAreaAPICall
                                                                .regionCode(
                                                              (_model.getRegion
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )?.toList()))
                                                .toList(),
                                            _model.branchInputTextController
                                                .text),
                                  );
                                  _shouldSetState = true;
                                }

                                Navigator.pop(context);
                                if (_shouldSetState) setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (((_model.getBranchSearched?.statusCode ?? 200) == 200) &&
                    (GetBranchAPICall.statusLayer2(
                          (_model.getBranchSearched?.jsonBody ?? ''),
                        ) ==
                        200) &&
                    (_model.dropDownValue1 == 'สาขา'))
                  Container(
                    width: double.infinity,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.check_circle_outline,
                              color: Colors.black,
                              size: 29.0,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'เลือกสาขา:',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController2 ??=
                                  FormFieldController<String>(
                                _model.dropDownValue2 ??= '',
                              ),
                              options:
                                  List<String>.from(GetBranchAPICall.branchCode(
                                (_model.getBranchSearched?.jsonBody ?? ''),
                              )!),
                              optionLabels: GetBranchAPICall.branchName(
                                (_model.getBranchSearched?.jsonBody ?? ''),
                              )!,
                              onChanged: (val) async {
                                setState(() => _model.dropDownValue2 = val);
                                HapticFeedback.mediumImpact();
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Color(0x00000000),
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: double.infinity,
                                            child: LoadingSceneWidget(),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                _model.getBranchWelfare =
                                    await GetWelfareKpiCEOAPICall.call(
                                  token: FFAppState().accessToken,
                                  apiUrl: FFAppState().apiURLLocalState,
                                  branchCode: _model.dropDownValue2,
                                  branchType: 'branch',
                                );
                                Navigator.pop(context);

                                setState(() {});
                              },
                              width: 180.0,
                              height: 50.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'สาขา...',
                              fillColor: Colors.white,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 0.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 4.0, 12.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData('เดือนปัจจุบัน  ',
                                    Icons.arrow_downward_rounded),
                                ChipData('เดือนที่แล้ว     ',
                                    Icons.skip_previous_rounded)
                              ],
                              onChanged: (val) async {
                                setState(() => _model.choiceChipsMonthValue =
                                    val?.firstOrNull);
                                HapticFeedback.mediumImpact();
                              },
                              selectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFF213BFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor: Colors.white,
                                iconSize: 18.0,
                                elevation: 4.0,
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFE3E7ED),
                                      letterSpacing: 0.0,
                                    ),
                                iconColor: Color(0xFFE3E7ED),
                                iconSize: 18.0,
                                elevation: 4.0,
                              ),
                              chipSpacing: 20.0,
                              rowSpacing: 12.0,
                              multiselect: false,
                              initialized: _model.choiceChipsMonthValue != null,
                              alignment: WrapAlignment.start,
                              controller:
                                  _model.choiceChipsMonthValueController ??=
                                      FormFieldController<List<String>>(
                                ['เดือนปัจจุบัน  '],
                              ),
                              wrapped: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1.0,
                ),
                if (_model.choiceChipsMonthValue == 'เดือนปัจจุบัน  ')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            functions.showMonthYearWelfareKpiPage(
                                GetDateTimeAPICall.currentDateYMD(
                              (_model.getServerDateTime?.jsonBody ?? ''),
                            ).toString()),
                            '[Month_Year]',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                if (_model.choiceChipsMonthValue == 'เดือนที่แล้ว     ')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            functions.getWelfareKpiDateLastMonth(
                                GetDateTimeAPICall.currentDateYMD(
                              (_model.getServerDateTime?.jsonBody ?? ''),
                            ).toString()),
                            '[MMYY_Last_Month]',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                if (((_model.dropDownValue1 == 'สาขา') &&
                        ((_model.getBranchWelfare?.statusCode ?? 200) == 200) &&
                        (_model.choiceChipsMonthValue == 'เดือนปัจจุบัน  ') &&
                        (GetWelfareKpiCEOAPICall.statusLayer2CM(
                              (_model.getBranchWelfare?.jsonBody ?? ''),
                            ) ==
                            200)) ||
                    (((_model.dropDownValue1 == 'เขต') ||
                            (_model.dropDownValue1 == 'ภาค')) &&
                        ((_model.getWelfareRegionArea?.statusCode ?? 200) ==
                            200) &&
                        (_model.choiceChipsMonthValue == 'เดือนปัจจุบัน  ') &&
                        (GetWelfareKpiCEOAPICall.statusLayer2CM(
                              (_model.getWelfareRegionArea?.jsonBody ?? ''),
                            ) ==
                            200)))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 5.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 470.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFE9FFEA),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 8.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      functions.welfareCEOBranchText(
                                          _model.dropDownValue1,
                                          GetWelfareKpiCEOAPICall.regionNameCM(
                                            (_model.getWelfareRegionArea
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          GetWelfareKpiCEOAPICall.areaNameCM(
                                            (_model.getWelfareRegionArea
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          GetWelfareKpiCEOAPICall
                                              .branchDetailCM(
                                            (_model.getBranchWelfare
                                                    ?.jsonBody ??
                                                ''),
                                          )),
                                      'สังกัด...',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 300.0,
                              decoration: BoxDecoration(),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: custom_widgets.RadialGauge(
                                  width: double.infinity,
                                  height: double.infinity,
                                  maxValue: functions.getMaxValueWelfareKpi(
                                      _model.dropDownValue1 == 'สาขา'
                                          ? GetWelfareKpiCEOAPICall
                                              .targetSuccessCM(
                                              (_model.getBranchWelfare
                                                      ?.jsonBody ??
                                                  ''),
                                            )
                                          : GetWelfareKpiCEOAPICall
                                              .targetSuccessCM(
                                              (_model.getWelfareRegionArea
                                                      ?.jsonBody ??
                                                  ''),
                                            )),
                                  value: _model.dropDownValue1 == 'สาขา'
                                      ? GetWelfareKpiCEOAPICall
                                          .successPercentCM(
                                          (_model.getBranchWelfare?.jsonBody ??
                                              ''),
                                        )
                                      : GetWelfareKpiCEOAPICall
                                          .successPercentCM(
                                          (_model.getWelfareRegionArea
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                  labelOffset: 50.0,
                                  axisLabelSize: 10.0,
                                  totalValueLabelSize: 18.0,
                                  valueUnitLabelSize: 14.0,
                                  valueUnitLabelText: 'เปอร์เซ็น',
                                  totalValueUnitLabelText: '%',
                                  endValue1: 0.45,
                                  startValue2: 0.45,
                                  endValue2: 0.5,
                                  startValue3: 0.5,
                                  color1: Color(0xFFEE4F22),
                                  color2: Color(0xFFEEC122),
                                  color3: Color(0xFF7BC722),
                                  startWidth1: 0.265,
                                  endWidth1: 0.265,
                                  startWidth2: 0.265,
                                  endWidth2: 0.265,
                                  startWidth3: 0.265,
                                  endWidth3: 0.265,
                                  isShowTick: false,
                                  startWidth4: 0.265,
                                  endWidth4: 0.265,
                                  startWidth5: 0.265,
                                  endWidth5: 0.265,
                                  color4: Color(0xFF20EEFF),
                                  color5: Color(0xFF0E2BFF),
                                  startValue4: 0.555555555,
                                  endValue4: 0.67,
                                  startValue5: 0.67,
                                  endValue5: 1.0,
                                  endValue3: 0.555555555,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          'ทำได้',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          '${_model.dropDownValue1 == 'สาขา' ? GetWelfareKpiCEOAPICall.successPercentCM(
                                              (_model.getBranchWelfare
                                                      ?.jsonBody ??
                                                  ''),
                                            ) : GetWelfareKpiCEOAPICall.successPercentCM(
                                              (_model.getWelfareRegionArea
                                                      ?.jsonBody ??
                                                  ''),
                                            )}%',
                                          '0%',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          'เป้า',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          '${_model.dropDownValue1 == 'สาขา' ? GetWelfareKpiCEOAPICall.targetSuccessCM(
                                              (_model.getBranchWelfare
                                                      ?.jsonBody ??
                                                  ''),
                                            ) : GetWelfareKpiCEOAPICall.targetSuccessCM(
                                              (_model.getWelfareRegionArea
                                                      ?.jsonBody ??
                                                  ''),
                                            )}%',
                                          '90%',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          'สถานะ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          functions.getKpiWelfareStatusText(
                                              _model.dropDownValue1 == 'สาขา'
                                                  ? GetWelfareKpiCEOAPICall
                                                      .successPercentCM(
                                                      (_model.getBranchWelfare
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                  : GetWelfareKpiCEOAPICall
                                                      .successPercentCM(
                                                      (_model.getWelfareRegionArea
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                              _model.dropDownValue1 == 'สาขา'
                                                  ? GetWelfareKpiCEOAPICall
                                                      .targetSuccessCM(
                                                      (_model.getBranchWelfare
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                  : GetWelfareKpiCEOAPICall
                                                      .targetSuccessCM(
                                                      (_model.getWelfareRegionArea
                                                              ?.jsonBody ??
                                                          ''),
                                                    )),
                                          'ไม่ผ่าน',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: functions
                                                  .getKpiWelfareStatusTextColor(
                                                      _model.dropDownValue1 ==
                                                              'สาขา'
                                                          ? GetWelfareKpiCEOAPICall
                                                              .successPercentCM(
                                                              (_model.getBranchWelfare
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                          : GetWelfareKpiCEOAPICall
                                                              .successPercentCM(
                                                              (_model.getWelfareRegionArea
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                      FFAppState()
                                                          .welfareKpiStatusTextColorList
                                                          .toList(),
                                                      functions.getMaxValueWelfareKpi(_model
                                                                  .dropDownValue1 ==
                                                              'สาขา'
                                                          ? GetWelfareKpiCEOAPICall
                                                              .targetSuccessCM(
                                                              (_model.getBranchWelfare
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                          : GetWelfareKpiCEOAPICall
                                                              .targetSuccessCM(
                                                              (_model.getWelfareRegionArea
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))),
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (((_model.dropDownValue1 == 'สาขา') &&
                        ((_model.getBranchWelfare?.statusCode ?? 200) == 200) &&
                        (_model.choiceChipsMonthValue == 'เดือนที่แล้ว     ') &&
                        (GetWelfareKpiCEOAPICall.statusLayer2LM(
                              (_model.getBranchWelfare?.jsonBody ?? ''),
                            ) ==
                            200)) ||
                    (((_model.dropDownValue1 == 'เขต') ||
                            (_model.dropDownValue1 == 'ภาค')) &&
                        ((_model.getWelfareRegionArea?.statusCode ?? 200) ==
                            200) &&
                        (_model.choiceChipsMonthValue == 'เดือนที่แล้ว     ') &&
                        (GetWelfareKpiCEOAPICall.statusLayer2LM(
                              (_model.getWelfareRegionArea?.jsonBody ?? ''),
                            ) ==
                            200)))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 5.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 470.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFE9FFEA),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 8.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      functions.welfareCEOBranchText(
                                          _model.dropDownValue1,
                                          GetWelfareKpiCEOAPICall.regionNameLM(
                                            (_model.getWelfareRegionArea
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          GetWelfareKpiCEOAPICall.areaNameLM(
                                            (_model.getWelfareRegionArea
                                                    ?.jsonBody ??
                                                ''),
                                          ),
                                          GetWelfareKpiCEOAPICall
                                              .branchDetailLM(
                                            (_model.getBranchWelfare
                                                    ?.jsonBody ??
                                                ''),
                                          )),
                                      'สังกัด...',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 300.0,
                              decoration: BoxDecoration(),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: custom_widgets.RadialGauge(
                                  width: double.infinity,
                                  height: double.infinity,
                                  maxValue: functions.getMaxValueWelfareKpi(
                                      _model.dropDownValue1 == 'สาขา'
                                          ? GetWelfareKpiCEOAPICall
                                              .targetSuccessLM(
                                              (_model.getBranchWelfare
                                                      ?.jsonBody ??
                                                  ''),
                                            )
                                          : GetWelfareKpiCEOAPICall
                                              .targetSuccessLM(
                                              (_model.getWelfareRegionArea
                                                      ?.jsonBody ??
                                                  ''),
                                            )),
                                  value: _model.dropDownValue1 == 'สาขา'
                                      ? GetWelfareKpiCEOAPICall
                                          .successPercentLM(
                                          (_model.getBranchWelfare?.jsonBody ??
                                              ''),
                                        )
                                      : GetWelfareKpiCEOAPICall
                                          .successPercentLM(
                                          (_model.getWelfareRegionArea
                                                  ?.jsonBody ??
                                              ''),
                                        ),
                                  labelOffset: 50.0,
                                  axisLabelSize: 10.0,
                                  totalValueLabelSize: 18.0,
                                  valueUnitLabelSize: 14.0,
                                  valueUnitLabelText: 'เปอร์เซ็น',
                                  totalValueUnitLabelText: '%',
                                  endValue1: 0.45,
                                  startValue2: 0.45,
                                  endValue2: 0.5,
                                  startValue3: 0.5,
                                  color1: Color(0xFFEE4F22),
                                  color2: Color(0xFFEEC122),
                                  color3: Color(0xFF7BC722),
                                  startWidth1: 0.265,
                                  endWidth1: 0.265,
                                  startWidth2: 0.265,
                                  endWidth2: 0.265,
                                  startWidth3: 0.265,
                                  endWidth3: 0.265,
                                  isShowTick: false,
                                  startWidth4: 0.265,
                                  endWidth4: 0.265,
                                  startWidth5: 0.265,
                                  endWidth5: 0.265,
                                  color4: Color(0xFF20EEFF),
                                  color5: Color(0xFF0E2BFF),
                                  startValue4: 0.555555555,
                                  endValue4: 0.67,
                                  startValue5: 0.67,
                                  endValue5: 1.0,
                                  endValue3: 0.555555555,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          'ทำได้',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          '${_model.dropDownValue1 == 'สาขา' ? GetWelfareKpiCEOAPICall.successPercentLM(
                                              (_model.getBranchWelfare
                                                      ?.jsonBody ??
                                                  ''),
                                            ) : GetWelfareKpiCEOAPICall.successPercentLM(
                                              (_model.getWelfareRegionArea
                                                      ?.jsonBody ??
                                                  ''),
                                            )}%',
                                          '0%',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          'เป้า',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          '${_model.dropDownValue1 == 'สาขา' ? GetWelfareKpiCEOAPICall.targetSuccessLM(
                                              (_model.getBranchWelfare
                                                      ?.jsonBody ??
                                                  ''),
                                            ) : GetWelfareKpiCEOAPICall.targetSuccessLM(
                                              (_model.getWelfareRegionArea
                                                      ?.jsonBody ??
                                                  ''),
                                            )}%',
                                          '90%',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          'สถานะ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          functions.getKpiWelfareStatusText(
                                              _model.dropDownValue1 == 'สาขา'
                                                  ? GetWelfareKpiCEOAPICall
                                                      .successPercentLM(
                                                      (_model.getBranchWelfare
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                  : GetWelfareKpiCEOAPICall
                                                      .successPercentLM(
                                                      (_model.getWelfareRegionArea
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                              _model.dropDownValue1 == 'สาขา'
                                                  ? GetWelfareKpiCEOAPICall
                                                      .targetSuccessLM(
                                                      (_model.getBranchWelfare
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                  : GetWelfareKpiCEOAPICall
                                                      .targetSuccessLM(
                                                      (_model.getWelfareRegionArea
                                                              ?.jsonBody ??
                                                          ''),
                                                    )),
                                          'ไม่ผ่าน',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: functions
                                                  .getKpiWelfareStatusTextColor(
                                                      _model.dropDownValue1 ==
                                                              'สาขา'
                                                          ? GetWelfareKpiCEOAPICall
                                                              .successPercentLM(
                                                              (_model.getBranchWelfare
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                          : GetWelfareKpiCEOAPICall
                                                              .successPercentLM(
                                                              (_model.getWelfareRegionArea
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ),
                                                      FFAppState()
                                                          .welfareKpiStatusTextColorList
                                                          .toList(),
                                                      functions.getMaxValueWelfareKpi(_model
                                                                  .dropDownValue1 ==
                                                              'สาขา'
                                                          ? GetWelfareKpiCEOAPICall
                                                              .targetSuccessLM(
                                                              (_model.getBranchWelfare
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )
                                                          : GetWelfareKpiCEOAPICall
                                                              .targetSuccessLM(
                                                              (_model.getWelfareRegionArea
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ))),
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (((GetWelfareKpiCEOAPICall.statusLayer2CM(
                              (_model.getWelfareRegionArea?.jsonBody ?? ''),
                            ) ==
                            404) &&
                        (_model.choiceChipsMonthValue == 'เดือนปัจจุบัน  ') &&
                        ((_model.dropDownValue1 == 'เขต') ||
                            (_model.dropDownValue1 == 'ภาค'))) ||
                    ((GetWelfareKpiCEOAPICall.statusLayer2LM(
                              (_model.getWelfareRegionArea?.jsonBody ?? ''),
                            ) ==
                            404) &&
                        (_model.choiceChipsMonthValue == 'เดือนที่แล้ว     ') &&
                        ((_model.dropDownValue1 == 'เขต') ||
                            (_model.dropDownValue1 == 'ภาค'))) ||
                    ((GetWelfareKpiCEOAPICall.statusLayer2CM(
                              (_model.getBranchWelfare?.jsonBody ?? ''),
                            ) ==
                            404) &&
                        (_model.choiceChipsMonthValue == 'เดือนปัจจุบัน  ') &&
                        (_model.dropDownValue1 == 'สาขา')) ||
                    ((GetWelfareKpiCEOAPICall.statusLayer2LM(
                              (_model.getBranchWelfare?.jsonBody ?? ''),
                            ) ==
                            404) &&
                        (_model.choiceChipsMonthValue == 'เดือนที่แล้ว     ') &&
                        (_model.dropDownValue1 == 'สาขา')))
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ไม่พบข้อมูลของเดือนนี้',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).grayIcon,
                                fontSize: 20.0,
                                letterSpacing: 0.0,
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
