import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'change_car_location_page_model.dart';
export 'change_car_location_page_model.dart';

class ChangeCarLocationPageWidget extends StatefulWidget {
  const ChangeCarLocationPageWidget({
    super.key,
    required this.step,
    required this.readAccessRoleData,
    required this.saveAccessRoleData,
    required this.userRoleRead,
    required this.userRoleSave,
    required this.fromPage,
    required this.impoundCarParamSet,
    required this.impoundCarStatusId,
    required this.impoundCarStatusCode,
    required this.impoundCarStatusName,
  });

  final String? step;
  final dynamic readAccessRoleData;
  final dynamic saveAccessRoleData;
  final String? userRoleRead;
  final String? userRoleSave;
  final String? fromPage;
  final ImpoundCarParamSetStruct? impoundCarParamSet;
  final String? impoundCarStatusId;
  final String? impoundCarStatusCode;
  final String? impoundCarStatusName;

  @override
  State<ChangeCarLocationPageWidget> createState() =>
      _ChangeCarLocationPageWidgetState();
}

class _ChangeCarLocationPageWidgetState
    extends State<ChangeCarLocationPageWidget> {
  late ChangeCarLocationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeCarLocationPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChangeCarLocationPage'});
    _model.searchTextfieldTextController ??= TextEditingController();
    _model.searchTextfieldFocusNode ??= FocusNode();

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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFFDB771A),
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: AutoSizeText(
            'เลือกสถานที่จอดรถ',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF003063),
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [
            Visibility(
              visible: false,
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.filter_alt,
                  color: Color(0xFF354052),
                  size: 27.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<ImpoundCarMasterRecord>(
            future: ImpoundCarMasterRecord.getDocumentOnce(
                FFAppState().impoundCarMasterDocRef!),
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

              final containerImpoundCarMasterRecord = snapshot.data!;

              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 10.0, 12.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFB3B3B3),
                                ),
                              ),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue ??= '',
                                ),
                                options: List<String>.from(
                                    containerImpoundCarMasterRecord.locateCode),
                                optionLabels:
                                    containerImpoundCarMasterRecord.locateName,
                                onChanged: (val) async {
                                  safeSetState(
                                      () => _model.dropDownValue = val);
                                  var _shouldSetState = false;
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(context).unfocus(),
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

                                  _model.getBranchOutput =
                                      await ImproundCarGetBranchCall.call(
                                    apiUrl: FFAppState().impoundUrlVloan,
                                    token: FFAppState().impoundUrlVloanToken,
                                    locatCode: _model.dropDownValue,
                                  );

                                  _shouldSetState = true;
                                  if ((_model.getBranchOutput?.statusCode ??
                                          200) !=
                                      200) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'พบข้อผิดพลาด Connection(${(_model.getBranchOutput?.statusCode ?? 200).toString()})'),
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
                                  if (ImproundCarGetBranchCall.statusLayer1(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ) !=
                                      '200') {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                '${ImproundCarGetBranchCall.messageLayer1(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )}'),
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
                                  FFAppState().selectedDropdownList = functions
                                      .createFalseListByItemNumber(
                                          false,
                                          ImproundCarGetBranchCall.branchname(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          )?.length)!
                                      .toList()
                                      .cast<bool>();
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if (_shouldSetState) safeSetState(() {});
                                },
                                width: 300.0,
                                height: 56.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'กรุณาเลือกสถานที่จอดรถ....',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 10.0, 12.0, 8.0),
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xFFB3B3B3),
                                ),
                              ),
                              child: Container(
                                width: 200.0,
                                child: TextFormField(
                                  controller:
                                      _model.searchTextfieldTextController,
                                  focusNode: _model.searchTextfieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'กรุณากรอกคีย์เวิร์ด...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    prefixIcon: Icon(
                                      Icons.search_outlined,
                                      size: 24.0,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        letterSpacing: 0.0,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model
                                      .searchTextfieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 2.0,
                          ),
                          if ((_model.dropDownValue != null &&
                                  _model.dropDownValue != '') &&
                              (((_model.getBranchOutput?.statusCode ?? 200) ==
                                      200) &&
                                  (ImproundCarGetBranchCall.statusLayer1(
                                        (_model.getBranchOutput?.jsonBody ??
                                            ''),
                                      ) ==
                                      '200')))
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final branchListItem =
                                      ImproundCarGetBranchCall.branchname(
                                            (_model.getBranchOutput?.jsonBody ??
                                                ''),
                                          )?.toList() ??
                                          [];
                                  if (branchListItem.isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
                                      ),
                                    );
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      12.0,
                                      0,
                                      50.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: branchListItem.length,
                                    itemBuilder:
                                        (context, branchListItemIndex) {
                                      final branchListItemItem =
                                          branchListItem[branchListItemIndex];
                                      return Visibility(
                                        visible: (_model.searchTextfieldTextController
                                                        .text ==
                                                    null ||
                                                _model.searchTextfieldTextController
                                                        .text ==
                                                    '') ||
                                            functions.containWordinStringUrl(
                                                _model
                                                    .searchTextfieldTextController
                                                    .text,
                                                ImproundCarGetBranchCall
                                                    .branchname(
                                                  (_model.getBranchOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )?[branchListItemIndex])!,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 8.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState()
                                                      .selectedDropdownList =
                                                  functions
                                                      .setBoolValueListAtIndex(
                                                          functions
                                                              .createFalseListByItemNumber(
                                                                  false,
                                                                  FFAppState()
                                                                      .selectedDropdownList
                                                                      .length)
                                                              ?.toList(),
                                                          branchListItemIndex)!
                                                      .toList()
                                                      .cast<bool>();
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              height: 40.0,
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
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      flex: 10,
                                                      child: Text(
                                                        '${ImproundCarGetBranchCall.branchname(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?[branchListItemIndex]} (${ImproundCarGetBranchCall.branchcode(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?[branchListItemIndex]})',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Builder(
                                                        builder: (context) {
                                                          if ((List<bool>
                                                                      selectedDropdownList,
                                                                  int index) {
                                                            return selectedDropdownList[
                                                                index];
                                                          }(
                                                              FFAppState()
                                                                  .selectedDropdownList
                                                                  .toList(),
                                                              branchListItemIndex)) {
                                                            return Icon(
                                                              Icons.check_sharp,
                                                              color: Color(
                                                                  0xFF14B401),
                                                              size: 24.0,
                                                            );
                                                          } else {
                                                            return Container(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                            );
                                                          }
                                                        },
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
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (!(_model.dropDownValue != null &&
                                      _model.dropDownValue != '')) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content:
                                                Text('กรุณาเลือกสถานที่จอดรถ'),
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
                                  if (functions.countTrueInBoolList(FFAppState()
                                          .selectedDropdownList
                                          .toList())! <=
                                      0) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content:
                                                Text('กรุณาเลือกสาขาที่จอดรถ'),
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
                                  if (widget!.fromPage != 'takeImages') {
                                    _model.updateCarLocationOutput =
                                        await UploadImagesGoogleDriveGroup
                                            .updateImproundCarCall
                                            .call(
                                      contNo: widget!
                                          .impoundCarParamSet?.improundCONTNO,
                                      improundcarLocatId:
                                          containerImpoundCarMasterRecord
                                                  .impoundCarLocateId[
                                              functions.getIndexOfSomethingList(
                                                  containerImpoundCarMasterRecord
                                                      .locateCode
                                                      .toList(),
                                                  _model.dropDownValue)],
                                      locatName: containerImpoundCarMasterRecord
                                              .locateName[
                                          functions.getIndexOfSomethingList(
                                              containerImpoundCarMasterRecord
                                                  .locateCode
                                                  .toList(),
                                              _model.dropDownValue)],
                                      improundcarSubLocatId:
                                          ImproundCarGetBranchCall.subLocatId(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      null &&
                                                  (ImproundCarGetBranchCall
                                                          .subLocatId(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ))!
                                                      .isNotEmpty
                                              ? ((ImproundCarGetBranchCall
                                                  .subLocatId(
                                                  (_model.getBranchOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )?[functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .selectedDropdownList
                                                      .toList(),
                                                  true)]))
                                              : '',
                                      branchCodeLocat:
                                          ImproundCarGetBranchCall.branchcode(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      null &&
                                                  (ImproundCarGetBranchCall
                                                          .branchcode(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ))!
                                                      .isNotEmpty
                                              ? ((ImproundCarGetBranchCall
                                                  .branchcode(
                                                  (_model.getBranchOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )?[functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .selectedDropdownList
                                                      .toList(),
                                                  true)]))
                                              : '',
                                      branchName:
                                          FFAppState().profileUnitCodeName,
                                      userid: FFAppState().employeeID,
                                      branchNameLocat:
                                          ImproundCarGetBranchCall.branchname(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      null &&
                                                  (ImproundCarGetBranchCall
                                                          .branchname(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ))!
                                                      .isNotEmpty
                                              ? ((ImproundCarGetBranchCall
                                                  .branchname(
                                                  (_model.getBranchOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )?[functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .selectedDropdownList
                                                      .toList(),
                                                  true)]))
                                              : '',
                                      branchCode: FFAppState().profileBranch,
                                      nameTh: FFAppState().profileFullName,
                                      improundcarStatusId:
                                          widget!.impoundCarStatusId,
                                      statusCode: widget!.impoundCarStatusCode,
                                      statusName: widget!.impoundCarStatusName,
                                      address: ImproundCarGetBranchCall.address(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              (ImproundCarGetBranchCall.address(
                                                (_model.getBranchOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ))!
                                                  .isNotEmpty
                                          ? ((ImproundCarGetBranchCall.address(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true)]))
                                          : '',
                                      subDistrict:
                                          ImproundCarGetBranchCall.subdistrict(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      null &&
                                                  (ImproundCarGetBranchCall
                                                          .subdistrict(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ))!
                                                      .isNotEmpty
                                              ? ((ImproundCarGetBranchCall
                                                  .subdistrict(
                                                  (_model.getBranchOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )?[functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .selectedDropdownList
                                                      .toList(),
                                                  true)]))
                                              : '',
                                      district: ImproundCarGetBranchCall
                                                      .district(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              (ImproundCarGetBranchCall
                                                      .district(
                                                (_model.getBranchOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ))!
                                                  .isNotEmpty
                                          ? ((ImproundCarGetBranchCall.district(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true)]))
                                          : '',
                                      province: ImproundCarGetBranchCall
                                                      .province(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              (ImproundCarGetBranchCall
                                                      .province(
                                                (_model.getBranchOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ))!
                                                  .isNotEmpty
                                          ? ((ImproundCarGetBranchCall.province(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true)]))
                                          : '',
                                      postcode: ImproundCarGetBranchCall
                                                      .postcode(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              (ImproundCarGetBranchCall
                                                      .postcode(
                                                (_model.getBranchOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ))!
                                                  .isNotEmpty
                                          ? ((ImproundCarGetBranchCall.postcode(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true)]))
                                          : '',
                                      phoneNumber:
                                          ImproundCarGetBranchCall.phoneNumber(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      null &&
                                                  (ImproundCarGetBranchCall
                                                          .phoneNumber(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ))!
                                                      .isNotEmpty
                                              ? ((ImproundCarGetBranchCall
                                                  .phoneNumber(
                                                  (_model.getBranchOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )?[functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .selectedDropdownList
                                                      .toList(),
                                                  true)]))
                                              : '',
                                      latitude: ImproundCarGetBranchCall
                                                      .latitude(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              (ImproundCarGetBranchCall
                                                      .latitude(
                                                (_model.getBranchOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ))!
                                                  .isNotEmpty
                                          ? ((ImproundCarGetBranchCall.latitude(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true)]))
                                          : '',
                                      longitude:
                                          ImproundCarGetBranchCall.longitude(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      null &&
                                                  (ImproundCarGetBranchCall
                                                          .longitude(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ))!
                                                      .isNotEmpty
                                              ? ((ImproundCarGetBranchCall
                                                  .longitude(
                                                  (_model.getBranchOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )?[functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .selectedDropdownList
                                                      .toList(),
                                                  true)]))
                                              : '',
                                      areaCode: ImproundCarGetBranchCall
                                                      .areacode(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              (ImproundCarGetBranchCall
                                                      .areacode(
                                                (_model.getBranchOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ))!
                                                  .isNotEmpty
                                          ? ((ImproundCarGetBranchCall.areacode(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true)]))
                                          : '',
                                      areaName: ImproundCarGetBranchCall
                                                      .areaname(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) !=
                                                  null &&
                                              (ImproundCarGetBranchCall
                                                      .areaname(
                                                (_model.getBranchOutput
                                                        ?.jsonBody ??
                                                    ''),
                                              ))!
                                                  .isNotEmpty
                                          ? ((ImproundCarGetBranchCall.areaname(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                              FFAppState()
                                                  .selectedDropdownList
                                                  .toList(),
                                              true)]))
                                          : '',
                                      regionCode:
                                          ImproundCarGetBranchCall.regioncode(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      null &&
                                                  (ImproundCarGetBranchCall
                                                          .regioncode(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ))!
                                                      .isNotEmpty
                                              ? ((ImproundCarGetBranchCall
                                                  .regioncode(
                                                  (_model.getBranchOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )?[functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .selectedDropdownList
                                                      .toList(),
                                                  true)]))
                                              : '',
                                      regionName:
                                          ImproundCarGetBranchCall.regionname(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) !=
                                                      null &&
                                                  (ImproundCarGetBranchCall
                                                          .regionname(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  ))!
                                                      .isNotEmpty
                                              ? ((ImproundCarGetBranchCall
                                                  .regionname(
                                                  (_model.getBranchOutput
                                                          ?.jsonBody ??
                                                      ''),
                                                )?[functions.getIndexOfBoolList(
                                                  FFAppState()
                                                      .selectedDropdownList
                                                      .toList(),
                                                  true)]))
                                              : '',
                                      url: FFAppState().improundUrl,
                                    );

                                    _shouldSetState = true;
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  if (widget!.step == 'step4') {
                                    context.pushNamed(
                                      'CustomerCarDeailsStep4',
                                      queryParameters: {
                                        'step': serializeParam(
                                          widget!.step,
                                          ParamType.String,
                                        ),
                                        'readAccessRoleData': serializeParam(
                                          widget!.readAccessRoleData,
                                          ParamType.JSON,
                                        ),
                                        'saveAccessRoleData': serializeParam(
                                          widget!.saveAccessRoleData,
                                          ParamType.JSON,
                                        ),
                                        'userRoleRead': serializeParam(
                                          widget!.userRoleRead,
                                          ParamType.String,
                                        ),
                                        'userRoleSave': serializeParam(
                                          widget!.userRoleSave,
                                          ParamType.String,
                                        ),
                                        'impoundCarParamSet': serializeParam(
                                          widget!.impoundCarParamSet,
                                          ParamType.DataStruct,
                                        ),
                                        'impoundCarLocateParamSet':
                                            serializeParam(
                                          ImpoundCarLocateParamSetStruct(
                                            improundcarLocatId:
                                                containerImpoundCarMasterRecord
                                                        .impoundCarLocateId[
                                                    functions.getIndexOfSomethingList(
                                                        containerImpoundCarMasterRecord
                                                            .locateCode
                                                            .toList(),
                                                        _model.dropDownValue)],
                                            locatName: containerImpoundCarMasterRecord
                                                    .locateName[
                                                functions.getIndexOfSomethingList(
                                                    containerImpoundCarMasterRecord
                                                        .locateCode
                                                        .toList(),
                                                    _model.dropDownValue)],
                                            improundcarSubLocatId:
                                                ImproundCarGetBranchCall
                                                                .subLocatId(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) !=
                                                            null &&
                                                        (ImproundCarGetBranchCall
                                                                .subLocatId(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ))!
                                                            .isNotEmpty
                                                    ? ((ImproundCarGetBranchCall
                                                        .subLocatId(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?[functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .selectedDropdownList
                                                                .toList(),
                                                            true)]))
                                                    : '',
                                            branchNameLocat:
                                                ImproundCarGetBranchCall
                                                    .branchname(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .selectedDropdownList
                                                        .toList(),
                                                    true)],
                                            address: ImproundCarGetBranchCall
                                                            .address(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall
                                                            .address(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? ((ImproundCarGetBranchCall
                                                    .address(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?[functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .selectedDropdownList
                                                            .toList(),
                                                        true)]))
                                                : '',
                                            subDistrict:
                                                ImproundCarGetBranchCall
                                                    .subdistrict(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .selectedDropdownList
                                                        .toList(),
                                                    true)],
                                            district: ImproundCarGetBranchCall
                                                .district(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            province: ImproundCarGetBranchCall
                                                .province(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            postcode: ImproundCarGetBranchCall
                                                .postcode(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            phoneNumber: ImproundCarGetBranchCall
                                                            .phoneNumber(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall
                                                            .phoneNumber(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? ((ImproundCarGetBranchCall
                                                    .phoneNumber(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?[functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .selectedDropdownList
                                                            .toList(),
                                                        true)]))
                                                : '',
                                            latitude: ImproundCarGetBranchCall
                                                .latitude(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            longitude: ImproundCarGetBranchCall
                                                .longitude(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            branchCodeLocat:
                                                ImproundCarGetBranchCall
                                                    .branchcode(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .selectedDropdownList
                                                        .toList(),
                                                    true)],
                                            areaCode: ImproundCarGetBranchCall
                                                .areacode(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            areaName: ImproundCarGetBranchCall
                                                .areaname(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            regionCode: ImproundCarGetBranchCall
                                                .regioncode(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            regionName: ImproundCarGetBranchCall
                                                .regionname(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            locatCode: containerImpoundCarMasterRecord
                                                    .locateCode[
                                                functions.getIndexOfSomethingList(
                                                    containerImpoundCarMasterRecord
                                                        .locateCode
                                                        .toList(),
                                                    _model.dropDownValue)],
                                          ),
                                          ParamType.DataStruct,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    context.pushNamed(
                                      'CustomerCarDeailsStep1',
                                      queryParameters: {
                                        'step': serializeParam(
                                          widget!.step,
                                          ParamType.String,
                                        ),
                                        'readAccessRoleData': serializeParam(
                                          widget!.readAccessRoleData,
                                          ParamType.JSON,
                                        ),
                                        'saveAccessRoleData': serializeParam(
                                          widget!.saveAccessRoleData,
                                          ParamType.JSON,
                                        ),
                                        'userRoleRead': serializeParam(
                                          widget!.userRoleRead,
                                          ParamType.String,
                                        ),
                                        'userRoleSave': serializeParam(
                                          widget!.userRoleSave,
                                          ParamType.String,
                                        ),
                                        'impoundCarParamSet': serializeParam(
                                          widget!.impoundCarParamSet,
                                          ParamType.DataStruct,
                                        ),
                                        'impoundCarLocateParamSet':
                                            serializeParam(
                                          ImpoundCarLocateParamSetStruct(
                                            improundcarLocatId:
                                                containerImpoundCarMasterRecord
                                                        .impoundCarLocateId[
                                                    functions.getIndexOfSomethingList(
                                                        containerImpoundCarMasterRecord
                                                            .locateCode
                                                            .toList(),
                                                        _model.dropDownValue)],
                                            locatName: containerImpoundCarMasterRecord
                                                    .locateName[
                                                functions.getIndexOfSomethingList(
                                                    containerImpoundCarMasterRecord
                                                        .locateCode
                                                        .toList(),
                                                    _model.dropDownValue)],
                                            improundcarSubLocatId:
                                                ImproundCarGetBranchCall
                                                                .subLocatId(
                                                              (_model.getBranchOutput
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            ) !=
                                                            null &&
                                                        (ImproundCarGetBranchCall
                                                                .subLocatId(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ))!
                                                            .isNotEmpty
                                                    ? ((ImproundCarGetBranchCall
                                                        .subLocatId(
                                                        (_model.getBranchOutput
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?[functions
                                                        .getIndexOfBoolList(
                                                            FFAppState()
                                                                .selectedDropdownList
                                                                .toList(),
                                                            true)]))
                                                    : '',
                                            branchNameLocat:
                                                ImproundCarGetBranchCall
                                                    .branchname(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .selectedDropdownList
                                                        .toList(),
                                                    true)],
                                            address: ImproundCarGetBranchCall
                                                            .address(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall
                                                            .address(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? ((ImproundCarGetBranchCall
                                                    .address(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?[functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .selectedDropdownList
                                                            .toList(),
                                                        true)]))
                                                : '',
                                            subDistrict:
                                                ImproundCarGetBranchCall
                                                    .subdistrict(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .selectedDropdownList
                                                        .toList(),
                                                    true)],
                                            district: ImproundCarGetBranchCall
                                                .district(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            province: ImproundCarGetBranchCall
                                                .province(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            postcode: ImproundCarGetBranchCall
                                                .postcode(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            phoneNumber: ImproundCarGetBranchCall
                                                            .phoneNumber(
                                                          (_model.getBranchOutput
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (ImproundCarGetBranchCall
                                                            .phoneNumber(
                                                      (_model.getBranchOutput
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty
                                                ? ((ImproundCarGetBranchCall
                                                    .phoneNumber(
                                                    (_model.getBranchOutput
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?[functions
                                                    .getIndexOfBoolList(
                                                        FFAppState()
                                                            .selectedDropdownList
                                                            .toList(),
                                                        true)]))
                                                : '',
                                            latitude: ImproundCarGetBranchCall
                                                .latitude(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            longitude: ImproundCarGetBranchCall
                                                .longitude(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            branchCodeLocat:
                                                ImproundCarGetBranchCall
                                                    .branchcode(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                    FFAppState()
                                                        .selectedDropdownList
                                                        .toList(),
                                                    true)],
                                            areaCode: ImproundCarGetBranchCall
                                                .areacode(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            areaName: ImproundCarGetBranchCall
                                                .areaname(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            regionCode: ImproundCarGetBranchCall
                                                .regioncode(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            regionName: ImproundCarGetBranchCall
                                                .regionname(
                                              (_model.getBranchOutput
                                                      ?.jsonBody ??
                                                  ''),
                                            )?[functions.getIndexOfBoolList(
                                                FFAppState()
                                                    .selectedDropdownList
                                                    .toList(),
                                                true)],
                                            locatCode: containerImpoundCarMasterRecord
                                                    .locateCode[
                                                functions.getIndexOfSomethingList(
                                                    containerImpoundCarMasterRecord
                                                        .locateCode
                                                        .toList(),
                                                    _model.dropDownValue)],
                                          ),
                                          ParamType.DataStruct,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: widget!.fromPage == 'takeImages'
                                    ? 'ถ่ายรูป'
                                    : 'บันทึก',
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.45,
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFD9761A),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
