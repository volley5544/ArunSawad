import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/collection_page/appbar_follow_up_debt/appbar_follow_up_debt_widget.dart';
import '/components/loading_scene/loading_scene_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'list_name_tab_follow_up_debt_model.dart';
export 'list_name_tab_follow_up_debt_model.dart';

class ListNameTabFollowUpDebtWidget extends StatefulWidget {
  const ListNameTabFollowUpDebtWidget({
    super.key,
    required this.followUpDebtTab,
  });

  final int? followUpDebtTab;

  @override
  State<ListNameTabFollowUpDebtWidget> createState() =>
      _ListNameTabFollowUpDebtWidgetState();
}

class _ListNameTabFollowUpDebtWidgetState
    extends State<ListNameTabFollowUpDebtWidget> {
  late ListNameTabFollowUpDebtModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListNameTabFollowUpDebtModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'listNameTabFollowUpDebt'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().collectionSearchBy = '';
        FFAppState().collectionSearch = '';
        FFAppState().collectionSortBy = '';
      });
      setState(() {
        FFAppState().collectionSortBy = '';
        FFAppState().collectionSearch = '';
        FFAppState().collectionSearchBy = '';
        FFAppState().selectCardList = [];
        FFAppState().collectionListBoolean = [];
        FFAppState().saveCalled = SaveCallStruct.fromSerializableMap(jsonDecode(
            '{\"CONTNO_ID\":\"[]\",\"CONTNO\":\"[]\",\"HISTORY_LEAD_STATUS\":\"[]\",\"HISTORY_REASON_NAME\":\"[]\",\"CREATED_USERID\":\"[]\",\"UPDATED_USERID\":\"[]\",\"ARAPPDATE\":\"[]\",\"ARDESC\":\"[]\",\"USERID\":\"[]\",\"REMGCODE\":\"[]\",\"REMDETCODE\":\"[]\",\"AMOUNT\":\"[]\"}'));
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      wrapWithModel(
                        model: _model.appbarFollowUpDebtModel,
                        updateCallback: () => setState(() {}),
                        child: AppbarFollowUpDebtWidget(),
                      ),
                      Text(
                        () {
                          if (widget.followUpDebtTab == 1) {
                            return 'เตือนก่อนดิว';
                          } else if (widget.followUpDebtTab == 2) {
                            return 'ค้าง 1-3 งวด';
                          } else if (widget.followUpDebtTab == 3) {
                            return 'ค้าง 4-5 งวด';
                          } else if (widget.followUpDebtTab == 4) {
                            return 'ค้าง 6 งวดเป็นต้นไป';
                          } else if (widget.followUpDebtTab == 5) {
                            return 'ค้างด้วยยอดน้อยกว่า 250 บาท';
                          } else if (widget.followUpDebtTab == 6) {
                            return 'โทรชวนปิดปรับ';
                          } else {
                            return '-';
                          }
                        }(),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 4.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(
                                _model.dropDownValue ??= '',
                              ),
                              options: List<String>.from([
                                'name',
                                'lastname',
                                'contractNo',
                                'REGNO',
                                'CUSCOD'
                              ]),
                              optionLabels: [
                                'ชื่อ',
                                'นามสกุล',
                                'เลขที่สัญญา',
                                'เลขทะเบียนรถ',
                                'เลขบัตรประชาชนลูกค้า'
                              ],
                              onChanged: (val) =>
                                  setState(() => _model.dropDownValue = val),
                              width: 150.0,
                              height: 40.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                              hintText: 'ค้นหาโดย',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18.0,
                              ),
                              fillColor: Color(0xFFEBEBED),
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 2.0,
                              borderRadius: 20.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 2.0, 12.0, 2.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 10.0, 0.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller:
                                  _model.sortbyDropdownValueController ??=
                                      FormFieldController<String>(
                                _model.sortbyDropdownValue ??= '',
                              ),
                              options: List<String>.from(['ARNOW', 'DAYOFDUE']),
                              optionLabels: [
                                'เรียง AR จากมากไปน้อย',
                                'เรียงตามวันครบดิว'
                              ],
                              onChanged: (val) async {
                                setState(
                                    () => _model.sortbyDropdownValue = val);
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
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

                                setState(() {
                                  FFAppState().collectionSortBy =
                                      _model.sortbyDropdownValue!;
                                });
                                setState(() =>
                                    _model.listViewPagingController?.refresh());
                                await _model.waitForOnePageForListView();
                                Navigator.pop(context);
                              },
                              width: 170.0,
                              height: 40.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              hintText: 'เรียงข้อมูลโดย',
                              icon: Icon(
                                Icons.filter_alt_outlined,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 24.0,
                              ),
                              fillColor: Color(0xFFEBEBED),
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 2.0,
                              borderRadius: 20.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 5.0, 12.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEBED),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 4.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 1000),
                                  () => setState(() {}),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                  hintText: 'ค้นหา',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
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
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          12.0, 2.0, 12.0, 2.0),
                                  suffixIcon:
                                      _model.textController!.text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.textController?.clear();
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color: Color(0xFF5F6060),
                                                size: 16.0,
                                              ),
                                            )
                                          : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                textAlign: TextAlign.start,
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (!(_model.dropDownValue != null &&
                                      _model.dropDownValue != '')) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(
                                                'กรุณาเลือกประเภทการค้นหา'),
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
                                    return;
                                  }
                                  if (!(_model.textController.text != null &&
                                      _model.textController.text != '')) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            content: Text(() {
                                              if (_model.dropDownValue ==
                                                  'idcard') {
                                                return 'กรุณากรอกเลขบัตรประชาชนลูกค้าที่จะค้นหา';
                                              } else if (_model.dropDownValue ==
                                                  'name') {
                                                return 'กรุณากรอกชื่อลูกค้าที่จะค้นหา';
                                              } else {
                                                return 'กรุณากรอกเลขที่สัญญาที่จะค้นหา';
                                              }
                                            }()),
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

                                  setState(() {
                                    FFAppState().collectionSearchBy =
                                        _model.dropDownValue!;
                                    FFAppState().collectionSearch =
                                        _model.textController.text;
                                  });
                                  setState(() => _model.listViewPagingController
                                      ?.refresh());
                                  Navigator.pop(context);
                                },
                                text: 'ค้นหา',
                                options: FFButtonOptions(
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFF46505),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
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

                                  setState(() {
                                    FFAppState().collectionSearchBy = '';
                                    FFAppState().collectionSearch = '';
                                    FFAppState().collectionSortBy = '';
                                  });
                                  setState(() {
                                    FFAppState().collectionSortBy = '';
                                    FFAppState().collectionSearch = '';
                                    FFAppState().collectionSearchBy = '';
                                    FFAppState().selectCardList = [];
                                    FFAppState().collectionListBoolean = [];
                                    FFAppState().saveCalled = SaveCallStruct
                                        .fromSerializableMap(jsonDecode(
                                            '{\"CONTNO_ID\":\"[]\",\"CONTNO\":\"[]\",\"HISTORY_LEAD_STATUS\":\"[]\",\"HISTORY_REASON_NAME\":\"[]\",\"CREATED_USERID\":\"[]\",\"UPDATED_USERID\":\"[]\",\"ARAPPDATE\":\"[]\",\"ARDESC\":\"[]\",\"USERID\":\"[]\",\"REMGCODE\":\"[]\",\"REMDETCODE\":\"[]\",\"AMOUNT\":\"[]\"}'));
                                  });
                                  setState(() => _model.listViewPagingController
                                      ?.refresh());
                                  setState(() {
                                    _model.textController?.clear();
                                  });
                                  Navigator.pop(context);
                                },
                                text: 'ล้างค่า',
                                options: FFButtonOptions(
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFFFBD00),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 4.0),
                  child: Container(
                    width: double.infinity,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFEBEBED),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'รายชื่อ',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFEBEBED),
                      ),
                      child: RefreshIndicator(
                        color: FlutterFlowTheme.of(context).tertiary,
                        onRefresh: () async {
                          setState(
                              () => _model.listViewPagingController?.refresh());
                          await _model.waitForOnePageForListView();
                        },
                        child: PagedListView<ApiPagingParams, dynamic>(
                          pagingController: _model.setListViewController(
                            (nextPageMarker) => CollectionFollowupDebtCall.call(
                              branchCode: (FFAppState().branchCode == 'HO') ||
                                      (FFAppState().profileRoleName == 'SME') ||
                                      (FFAppState().profileLevel != 'สาขา')
                                  ? ''
                                  : FFAppState().branchCode,
                              dataPage: nextPageMarker.nextPageNumber + 1,
                              pageSize: 30,
                              dataFilter: widget.followUpDebtTab?.toString(),
                              searchBy: FFAppState().collectionSearchBy,
                              search: FFAppState().collectionSearch,
                              sortBy: FFAppState().collectionSortBy,
                              areaCode: (FFAppState().profileLevel == 'เขต') &&
                                      (FFAppState().profileRoleName != 'SME')
                                  ? FFAppState().profileBranch
                                  : '',
                              regionCode: (FFAppState().profileLevel ==
                                          'ภาค') &&
                                      (FFAppState().profileRoleName != 'SME')
                                  ? FFAppState().profileBranch
                                  : '',
                              role: FFAppState().profileRoleName,
                              apiUrl: FFAppState().apiUrlBranchViewCollection,
                            ),
                          ),
                          padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            24.0,
                          ),
                          shrinkWrap: true,
                          reverse: false,
                          scrollDirection: Axis.vertical,
                          builderDelegate: PagedChildBuilderDelegate<dynamic>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
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
                            // Customize what your widget looks like when it's loading another page.
                            newPageProgressIndicatorBuilder: (_) => Center(
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

                            itemBuilder: (context, _, listNameIndex) {
                              final listNameItem = _model
                                  .listViewPagingController!
                                  .itemList![listNameIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'detailListFollowUpDebt',
                                    queryParameters: {
                                      'cusCod': serializeParam(
                                        getJsonField(
                                          listNameItem,
                                          r'''$.CUSCOD''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                      'followupDebtTab': serializeParam(
                                        widget.followUpDebtTab,
                                        ParamType.int,
                                      ),
                                      'name': serializeParam(
                                        getJsonField(
                                          listNameItem,
                                          r'''$.NAME1''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                      'lastName': serializeParam(
                                        getJsonField(
                                          listNameItem,
                                          r'''$.NAME2''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEBEBED),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 70.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Icon(
                                                          Icons.person_outline,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 26.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            '${getJsonField(
                                                              listNameItem,
                                                              r'''$.NAME1''',
                                                            ).toString()} ${getJsonField(
                                                              listNameItem,
                                                              r'''$.NAME2''',
                                                            ).toString()}',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          4.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    'ทะเบียนรถ',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child:
                                                                    AutoSizeText(
                                                                  getJsonField(
                                                                    listNameItem,
                                                                    r'''$.REGNO''',
                                                                  ).toString(),
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Icon(
                                                        Icons
                                                            .chevron_right_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (false)
                  Container(
                    width: 360.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'ไม่พบข้อมูลในระบบ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
              ].addToEnd(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
